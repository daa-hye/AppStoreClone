//
//  SearchViewController.swift
//  AppStoreClone
//
//  Created by 박다혜 on 11/6/23.
//

import UIKit

final class SearchViewController: BaseViewController {

    let searchBar = {
        let view = UISearchBar()
        view.placeholder = "게임, 앱, 스토리 등"
        view.backgroundImage = UIImage()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
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
