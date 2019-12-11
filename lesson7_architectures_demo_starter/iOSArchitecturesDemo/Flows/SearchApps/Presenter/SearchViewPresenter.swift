//
//  SearchViewPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by Vitaly_Shishlyannikov on 05/12/2019.
//  Copyright © 2019 ekireev. All rights reserved.
//

import UIKit

protocol SearchViewInput: class {
    
    var searchResults: [ITunesApp] {get set}
    func showError(error: Error)
    func showNoResults()
    func hideNoResults()
    func startThrobber()
    func stopThrobber()
}

protocol searchViewOutput: class {
    
    func viewDidSearch(with query: String)
    func viewDidSelectApp(_ app: ITunesApp)
}

final class SearchPresenter {
    
    let interactor: SearchInteractor
    
    let router: SearchRouter
    
    weak var viewInput: (UIViewController & SearchViewInput)?
    
    init(interactor: SearchInteractorInput, router: SearchRouterInput) {
        self.interactor = interactor as! SearchInteractor
        self.router = router as! SearchRouter
    }
    
    private func requestApps(with query: String) {
        self.interactor.requestApps(with: query) { [weak self] result in
            guard let self = self else { return }
            self.viewInput?.stopThrobber()
            result
                .withValue { apps in
                    guard !apps.isEmpty else {
                        self.viewInput?.searchResults = []
                        self.viewInput?.showNoResults()
                        return
                    }
                    self.viewInput?.hideNoResults()
                    self.viewInput?.searchResults = apps
                }
                .withError {
                    self.viewInput?.showError(error: $0)
            }
        }
    }
    
    private func openAppDetails(with app: ITunesApp) {
        let appDetaillViewController = AppDetailViewController(app: app)
        self.viewInput?.navigationController?.pushViewController(appDetaillViewController, animated: true)
    }
}

extension SearchPresenter: searchViewOutput {
    func viewDidSearch(with query: String) {
        self.viewInput?.startThrobber()
        self.requestApps(with: query)
    }
    
    func viewDidSelectApp(_ app: ITunesApp) {
        self.router.openDetails(for: app)
    }
}
