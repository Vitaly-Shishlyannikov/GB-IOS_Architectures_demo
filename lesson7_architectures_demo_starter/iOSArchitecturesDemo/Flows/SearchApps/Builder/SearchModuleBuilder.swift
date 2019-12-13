//
//  SearchModuleBuilder.swift
//  iOSArchitecturesDemo
//
//  Created by Vitaly_Shishlyannikov on 05/12/2019.
//  Copyright © 2019 ekireev. All rights reserved.
//

import UIKit

final class SearchModuleBuilder {
    
    static func build() -> (UIViewController & SearchViewInput) {
        
        let router = SearchRouter()
        let interactor = SearchInteractor()
        let presenter = SearchPresenter(interactor: interactor, router: router)
        let viewController = SearchViewController(presenter: presenter)
        
        presenter.viewInput = viewController
        router.viewController = viewController
        
        return viewController
    }
}

