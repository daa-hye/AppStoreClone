//
//  TabBarViewController.swift
//  AppStoreClone
//
//  Created by 박다혜 on 11/6/23.
//

import UIKit

final class TabBarViewController: UITabBarController {

    private let todayVC: UIViewController
    private let gameVC: UIViewController
    private let appVC: UIViewController
    private let arcadeVC: UIViewController
    private let searchVC: UIViewController

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        initialSetting()
    }

    init() {

        self.todayVC = TodayViewController()
        self.gameVC = GameViewController()
        self.appVC = AppViewController()
        self.arcadeVC = ArcadeViewController()
        self.searchVC = SearchViewController()

        super.init(nibName: nil, bundle: nil)

    }

    private func initialSetting() {

        todayVC.title = TabType.today.title
        gameVC.title = TabType.game.title
        appVC.title = TabType.app.title
        arcadeVC.title = TabType.arcade.title
        searchVC.title = TabType.search.title

        todayVC.tabBarItem.image = TabType.today.image
        gameVC.tabBarItem.image = TabType.game.image
        appVC.tabBarItem.image = TabType.app.image
        arcadeVC.tabBarItem.image = TabType.arcade.image
        searchVC.tabBarItem.image = TabType.search.image

        let todayNav = {
            let view = UINavigationController(rootViewController: self.todayVC)
            view.navigationBar.prefersLargeTitles = true
            return view
        }()

        let gameNav = {
            let view = UINavigationController(rootViewController: self.gameVC)
            view.navigationBar.prefersLargeTitles = true
            return view
        }()

        let appNav = {
            let view = UINavigationController(rootViewController: self.appVC)
            view.navigationBar.prefersLargeTitles = true
            return view
        }()

        let arcadeNav = {
            let view = UINavigationController(rootViewController: self.arcadeVC)
            view.navigationBar.prefersLargeTitles = true
            return view
        }()

        let searchNav = {
            let view = UINavigationController(rootViewController: self.searchVC)
            view.navigationBar.prefersLargeTitles = true
            return view
        }()

        setViewControllers([todayNav, gameNav, appNav, arcadeNav, searchNav], animated: true)

    }

}

fileprivate enum TabType {

    case today
    case game
    case app
    case arcade
    case search

    var title: String {
        switch self {
        case .today:
            return "투데이"
        case .game:
            return "게임"
        case .app:
            return "앱"
        case .arcade:
            return "Arcade"
        case .search:
            return "검색"
        }
    }

    var image: UIImage {
        switch self {
        case .today:
            return UIImage(systemName: "doc.text.image")!
        case .game:
            return UIImage(systemName: "gamecontroller.fill")!
        case .app:
            return UIImage(systemName: "square.stack.3d.up.fill")!
        case .arcade:
            return UIImage(systemName: "arcade.stick.console.fill")!
        case .search:
            return UIImage(systemName: "magnifyingglass")!
        }
    }

}
