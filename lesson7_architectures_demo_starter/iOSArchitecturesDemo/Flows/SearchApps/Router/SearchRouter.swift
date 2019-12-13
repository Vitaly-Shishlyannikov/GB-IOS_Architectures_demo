//
//  SearchRouter.swift
//  iOSArchitecturesDemo
//
//  Created by Vitaly_Shishlyannikov on 11/12/2019.
//  Copyright © 2019 ekireev. All rights reserved.
//

import UIKit

protocol SearchRouterInput {
    
    func openDetails(for app: ITunesApp)
    
    func openAppInItunes(_ app: ITunesApp)
}

final class SearchRouter: SearchRouterInput {
    
    weak var viewController: UIViewController?
    
    func openDetails(for app: ITunesApp) {
        
        let appDetailViewController = AppDetailViewController(app: app)
    self.viewController?.navigationController?.pushViewController(appDetailViewController, animated: true)
        
        print(viewController?.navigationController as Any)

    }
    
    func openAppInItunes(_ app: ITunesApp) {
        guard let urlString = app.appUrl, let url = URL(string: urlString) else {return}
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
