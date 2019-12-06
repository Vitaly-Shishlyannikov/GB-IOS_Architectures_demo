//
//  SearchMusicModuleBuilder.swift
//  iOSArchitecturesDemo
//
//  Created by Vitaly_Shishlyannikov on 06/12/2019.
//  Copyright © 2019 ekireev. All rights reserved.
//

import UIKit

final class SearchMusicModuleBuilder {
    
    static func build() -> (UIViewController & SearchMusicViewInput) {
        
        let presenter = SearchMusicPresenter()
        let viewController = SearchMusicViewController(presenter: presenter)
        presenter.viewInput = viewController
        return viewController
    }
}
