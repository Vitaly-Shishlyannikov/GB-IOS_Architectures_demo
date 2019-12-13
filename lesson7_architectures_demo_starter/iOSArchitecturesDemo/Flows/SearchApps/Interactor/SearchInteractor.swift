//
//  SearchInteractor.swift
//  iOSArchitecturesDemo
//
//  Created by Vitaly_Shishlyannikov on 11/12/2019.
//  Copyright © 2019 ekireev. All rights reserved.
//

import UIKit
import Alamofire

protocol SearchInteractorInput {
    func requestApps(with query: String, completion: @escaping (Result<[ITunesApp]>) -> Void)
}

final class SearchInteractor: SearchInteractorInput {
    
    private let searchService = ITunesSearchService()
    
    func requestApps(with query: String, completion: @escaping (Result<[ITunesApp]>) -> Void) {
        self.searchService.getApps(forQuery: query, then: completion)
    }
}
