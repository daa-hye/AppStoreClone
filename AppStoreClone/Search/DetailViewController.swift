//
//  DetailViewController.swift
//  AppStoreClone
//
//  Created by 박다혜 on 11/7/23.
//

import UIKit
import RxSwift
import RxCocoa

class DetailViewController: BaseViewController {

    let viewModel: DetailViewModel

    let disposeBag = DisposeBag()

    init(_ viewModel: DetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    let scrollView = {
//        let view = UIScrollView()
//        view.showsHorizontalScrollIndicator = false
//        return view
//    }()
//
//    let titleView = {
//        let view = UIView()
//        return view
//    }()
//
//    let infoView = {
//        let view = UIView()
//        return view
//    }()
//
//    let versionView = {
//        let view = UIView()
//        return view
//    }()
//
//    let screenshotView = {
//        let view = UICollectionView()
//        return view
//    }()
//
//    let descriptionView = {
//        let view = UIView()
//        return view
//    }()

    let titleLabel = {
        let label = UILabel()
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }

    override func configureHierarchy() {
//        view.addSubview(scrollView)
//        scrollView.addSubview(titleView)
//        scrollView.addSubview(infoView)
//        scrollView.addSubview(versionView)
//        scrollView.addSubview(screenshotView)
//        scrollView.addSubview(descriptionView)
        view.addSubview(titleLabel)
    }

    override func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }

    func bind() {
        viewModel.data
            .bind(with: self, onNext: { owner, data in
                owner.titleLabel.rx.text.onNext(data.trackName)
            })
            .disposed(by: disposeBag)
    }

    

}
