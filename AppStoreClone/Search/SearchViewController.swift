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

    private let disposeBag = DisposeBag()

    private var data: [AppInfo] = []
    private lazy var items = BehaviorSubject(value: data)

    private let searchBar = {
        let view = UISearchBar()
        view.placeholder = "게임, 앱, 스토리 등"
        view.backgroundImage = UIImage()
        return view
    }()

    private let tableView: UITableView = {
       let view = UITableView()
        view.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.identifier)
        view.backgroundColor = .white
        view.rowHeight = 180
        view.separatorStyle = .none
       return view
     }()

//    lazy var collectionView = {
//        let view = UICollectionView(frame: .zero, collectionViewLayout: basicLayout())
//        return view
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        bind()
    }

    private func bind() {

        items
            .bind(to: tableView.rx.items(cellIdentifier: SearchTableViewCell.identifier, cellType: SearchTableViewCell.self)) { (row, element, cell) in

                cell.appNameLabel.text = element.trackName
                cell.appIconImageView.kf.setImage(with: URL(string: element.artworkUrl512))
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

        searchBar.rx.searchButtonClicked
            .withLatestFrom(searchBar.rx.text.orEmpty){ _, text in
                return text
            }
            .observe(on: MainScheduler.instance)
            .subscribe(with: self) { owner, text in
                let request = APIManager
                    .request(text)
                    .share()

                request
                    .subscribe(with: self) { owner, result in
                        owner.data.append(contentsOf: result.results)
                        owner.items.onNext(owner.data)

                    }
                    .disposed(by: owner.disposeBag)
            }
            .disposed(by: disposeBag)

    }

    override func configureHierarchy() {
        view.addSubview(searchBar)
    }

    override func setLayout() {
        searchBar.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
        }
    }

}

extension SearchViewController {

    private func basicLayout() -> UICollectionViewCompositionalLayout {

        let layout = UICollectionViewCompositionalLayout { (section, layoutEnvironment) -> NSCollectionLayoutSection? in

            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))

            let item = NSCollectionLayoutItem(layoutSize: itemSize)

            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.5))

            let group: NSCollectionLayoutGroup

            if #available(iOS 16.0, *) {
                group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 1)
            } else {
                group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
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
