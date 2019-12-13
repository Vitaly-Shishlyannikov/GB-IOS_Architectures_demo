//
//  AppScreenshotsViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Vitaly_Shishlyannikov on 06/12/2019.
//  Copyright © 2019 ekireev. All rights reserved.
//

import UIKit

final class AppScreenshotsViewController: UIViewController {

    // MARK: - Properties
    
    private let app: ITunesApp

    private var appScreenshotsView: AppScreenshotsView {
        return self.view as! AppScreenshotsView
    }
    
    private let imageDownloader = ImageDownloader()
    
    private struct Constants {
        static let reuseIdentifier = "reuseId"
    }
    
    // MARK: - Init
    
    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle
    
    override func loadView() {
        super.loadView()
        self.view = AppScreenshotsView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.appScreenshotsView.collectionView.register(ScreenshotCell.self, forCellWithReuseIdentifier: Constants.reuseIdentifier)
        
        self.appScreenshotsView.collectionView.delegate = self
        self.appScreenshotsView.collectionView.dataSource = self
    }
    
    // MARK: - Private
    
}

//MARK: - UICollectionViewDataSource

extension AppScreenshotsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.app.screenshotUrls.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.reuseIdentifier, for: indexPath) as? ScreenshotCell else {return UICollectionViewCell()}
        
        let url = self.app.screenshotUrls[indexPath.row]
        self.imageDownloader.getImage(fromUrl: url) {(image, _) in
            if let image = image {
                cell.setImage(with: image)
            }
        }
        return cell
    }
}

extension AppScreenshotsViewController: UICollectionViewDelegate {
    
//    func collectionView(_ collectionView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        collectionView.deselectRow(at: indexPath, animated: true)
//        let app = searchResults[indexPath.row]
//        self.presenter.viewDidSelectApp(app)
//    }
}


