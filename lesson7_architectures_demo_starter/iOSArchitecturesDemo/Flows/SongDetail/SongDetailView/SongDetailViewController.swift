//
//  SongDetailViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Vitaly_Shishlyannikov on 12/12/2019.
//  Copyright © 2019 ekireev. All rights reserved.
//

import UIKit

final class SongDetailViewController: UIViewController {
    
    // MARK: - Properties
    
    var song: PlayingSongModel? = nil {
        didSet {
            self.configure()
        }
    }
    
    private var viewModel: SongDetailViewModel
    
    private var songDetailView: SongDetailView {
        return self.view as! SongDetailView
    }
    
    // MARK: - Init
    
    init(viewModel: SongDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle
    
    override func loadView() {
        super.loadView()
        self.view = SongDetailView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.song = self.viewModel.getSong()
        self.bindViewModel()
        self.configure()
       
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.tintColor = UIColor.white;
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    // MARK: - Private
    
    private func configure() {
        
        self.songDetailView.onPlayButtonTap = {[weak self] in
            self?.viewModel.didTapPlayButton()
        }
        self.songDetailView.trackNameLabel.text = self.song?.songTitle
        self.songDetailView.artistNameLabel.text = self.song?.artist
        self.songDetailView.albumImageView.image = self.song?.albumImage
        
        switch song?.playingState {
        case .notStarted?:
            self.songDetailView.progressView.progress = 0
        case .inProgress(let progress)?:
            let progressToShow = round(progress * 100.0) / 100.0
            self.songDetailView.progressView.progress = Float(progressToShow)
        case .none:
            break
        }
    }
    
    private func bindViewModel() {
        
        self.viewModel.songModel.addObserver(self) {[weak self] (song, _) in
            self?.song = song
        }
        
        self.viewModel.error.addObserver(self) {[weak self] (error, _) in
            if let error = error {
                self?.showError(error: error)
            }
        }
    }
    
    func showError(error: Error) {
        let alert = UIAlertController(title: "Error", message: "\(error.localizedDescription)", preferredStyle: .alert)
        let actionOk = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(actionOk)
        self.present(alert, animated: true, completion: nil)
    }
}
