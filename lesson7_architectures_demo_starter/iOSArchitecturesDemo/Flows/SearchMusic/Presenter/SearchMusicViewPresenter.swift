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
    
    let interactor: SearchMusicInteractorInput
    
    let router: SearchMusicRouterInput
    
    weak var viewInput: (UIViewController & SearchMusicViewInput)?
    
    private let imageDownloader = ImageDownloader()
    
    init(interactor: SearchMusicInteractorInput, router: SearchMusicRouterInput) {
        self.interactor = interactor
        self.router = router
    }
    
    private func requestSongs(with query: String) {
        self.interactor.requestSongs(with: query) { [weak self] result in
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

