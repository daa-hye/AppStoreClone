//
//  SearchViewController.swift
//  AppStoreClone
//
//  Created by 박다혜 on 11/6/23.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher

final class SearchViewController: BaseViewController {

    let viewModel = SearchViewModel()

    private let disposeBag = DisposeBag()

    private let searchBar = {
        let view = UISearchBar()
        view.placeholder = "게임, 앱, 스토리 등"
        view.backgroundImage = UIImage()
        return view
    }()

    lazy var collectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: basicLayout())
        view.showsHorizontalScrollIndicator = false
        view.alwaysBounceHorizontal = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: SearchCollectionViewCell.identifier)
        bind()
    }

    private func bind() {

        let input = SearchViewModel.Input(searchButtonTapped: searchBar.rx.searchButtonClicked.asObservable(),
                                          searchQuery: searchBar.rx.text.orEmpty.asObservable())

        let output = viewModel.transform(input)

        output.items
            .bind(to: collectionView.rx.items(cellIdentifier: SearchCollectionViewCell.identifier, cellType: SearchCollectionViewCell.self)) { (row, element, cell) in

                cell.titleLabel.text = element.trackName
                cell.iconImageView.kf.setImage(with: URL(string: element.artworkUrl512)!)
                cell.ratingLabel.text = "ddddd"
                cell.genreLabel.text = element.primaryGenreName
                cell.sellerLabel.text = element.sellerName

                cell.firstScreenshotImageView.kf.setImage(with: URL(string: element.screenshotUrls[0])!)
                cell.secondScreenshotImageView.kf.setImage(with: URL(string: element.screenshotUrls[1])!)
                cell.thirdScreenshotImageView.kf.setImage(with: URL(string: element.screenshotUrls[2])!)

            }
            .disposed(by: disposeBag)

        collectionView.rx.itemSelected
            .subscribe(with: self) { owner, indexPath in
                owner.navigationController?.pushViewController(DetailViewController(), animated: true)
            }
            .disposed(by: disposeBag)

        searchBar.rx.textDidBeginEditing
            .bind(with: self) { owner, _ in
                owner.searchBar.rx.showsCancelButton.onNext(true)
                owner.navigationController?.rx.isNavigationBarHidden.onNext(true)
            }
            .disposed(by: disposeBag)

        searchBar.rx.textDidEndEditing
            .bind(with: self) { owner, _ in
                owner.searchBar.rx.showsCancelButton.onNext(false)
                owner.navigationController?.rx.isNavigationBarHidden.onNext(false)
            }
            .disposed(by: disposeBag)

    }

    override func configureHierarchy() {
        view.addSubview(searchBar)
        view.addSubview(collectionView)
    }

    override func setLayout() {
        searchBar.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
        }

        collectionView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }

}

extension SearchViewController {

    private func basicLayout() -> UICollectionViewCompositionalLayout {

        let layout = UICollectionViewCompositionalLayout { (section, layoutEnvironment) -> NSCollectionLayoutSection? in

            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))

            let item = NSCollectionLayoutItem(layoutSize: itemSize)

            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.5))

            let group: NSCollectionLayoutGroup

            if #available(iOS 16.0, *) {
                group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
            } else {
                group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 1)
            }

            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
            section.contentInsets = NSDirectionalEdgeInsets(top: 24, leading: 16, bottom: 24, trailing: 16)
            section.interGroupSpacing = 8

            return section
        }

        return layout
    }

}
