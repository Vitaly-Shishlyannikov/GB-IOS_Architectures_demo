//
//  TabBarController.swift
//  iOSArchitecturesDemo
//
//  Created by Vitaly_Shishlyannikov on 06/12/2019.
//  Copyright © 2019 ekireev. All rights reserved.
//

import UIKit

final class TabBarController: UITabBarController {
    
    private lazy var configuredNavigationController: UINavigationController = {
        let navVC = UINavigationController()
        navVC.navigationBar.barTintColor = UIColor.varna
        navVC.navigationBar.isTranslucent = false
        navVC.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navVC.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        return navVC
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self as? UITabBarControllerDelegate
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let searchAppTab = SearchModuleBuilder.build()
        searchAppTab.navigationItem.title = "Search iTunes apps"
        let searchAppTabNC = ConfiguredNavigationController()
        searchAppTabNC.viewControllers = [searchAppTab]
        let searchAppTabBarItem = UITabBarItem(title: "apps", image: UIImage(named: "1"), tag: 0)
        searchAppTab.tabBarItem = searchAppTabBarItem
        
        let searchMusicTab = SearchMusicModuleBuilder.build()
        searchMusicTab.navigationItem.title = "Search iTunes music"
        let searchMusicTabNC = ConfiguredNavigationController()
        searchMusicTabNC.viewControllers = [searchMusicTab]
        let searchMusicTabBarItem = UITabBarItem(title: "music", image: UIImage(named: "2"), tag: 1)
        searchMusicTab.tabBarItem = searchMusicTabBarItem
        
        self.viewControllers = [searchAppTabNC, searchMusicTabNC]
    }
}
