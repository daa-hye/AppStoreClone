//
//  BaseViewController.swift
//  AppStoreClone
//
//  Created by 박다혜 on 11/6/23.
//

import UIKit
import SnapKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        configureHierarchy()
        setLayout()
    }

    func configureHierarchy() {}
    func setLayout() {}

}
