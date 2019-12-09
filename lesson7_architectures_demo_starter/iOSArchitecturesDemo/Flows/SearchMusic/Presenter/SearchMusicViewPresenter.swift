//
//  SearchMusicViewPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by Vitaly_Shishlyannikov on 06/12/2019.
//  Copyright © 2019 ekireev. All rights reserved.
//

import UIKit

protocol SearchMusicViewInput: class {
    
    var searchResults: [ITunesSong] {get set}
    func showError(error: Error)
    func showNoResults()
    func hideNoResults()
    func startThrobber()
    func stopThrobber()
}

protocol SearchMusicViewOutput: class {
    
    func viewDidSearch(with query: String)
}

final class SearchMusicPresenter {
    
    weak var viewInput: (UIViewController & SearchMusicViewInput)?
    
    private let searchService = ITunesSearchService()
    
    private let imageDownloader = ImageDownloader()
    
    private func requestSongs(with query: String) {
        self.searchService.getSongs(forQuery: query) { [weak self] result in
            guard let self = self else { return }
            self.viewInput?.stopThrobber()
            result
                .withValue { songs in
                    guard !songs.isEmpty else {
                        self.viewInput?.searchResults = []
                        self.viewInput?.showNoResults()
                        return
                    }
                    self.viewInput?.hideNoResults()
                    self.viewInput?.searchResults = songs
                }
                .withError {
                    self.viewInput?.showError(error: $0)
            }
        }
    }
}

extension SearchMusicPresenter: SearchMusicViewOutput {
    
    func viewDidSearch(with query: String) {
        self.viewInput?.startThrobber()
        self.requestSongs(with: query)
    }
}

