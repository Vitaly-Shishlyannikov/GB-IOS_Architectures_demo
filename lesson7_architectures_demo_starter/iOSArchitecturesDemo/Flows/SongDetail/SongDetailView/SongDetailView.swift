//
//  SongDetailView.swift
//  iOSArchitecturesDemo
//
//  Created by Vitaly_Shishlyannikov on 12/12/2019.
//  Copyright © 2019 ekireev. All rights reserved.
//

import UIKit

final class SongDetailView: UIView {
    
    var onPlayButtonTap: (()->Void)?
    
    // MARK: - Subviews
    
//    let throbber = UIActivityIndicatorView(style: .gray)
    
    private(set) lazy var trackNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.textAlignment = .center
        return label
    }()
    
    private(set) lazy var artistNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        label.textAlignment = .center
        return label
    }()
    
    private(set) lazy var progressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.progressViewStyle = .bar
        progressView.trackTintColor = .gray
        progressView.tintColor = .blue
        
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
    }()
    
    private(set) lazy var albumImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private(set) lazy var playButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        button.setTitle("PLAY", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    @objc func buttonAction(sender: UIButton!) {
        let btnsendtag: UIButton = sender
        if btnsendtag.tag == 1 {
            self.onPlayButtonTap?()
        }
    }
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupLayout()
    }
    
    // MARK: - UI
    
    private func setupLayout() {
        self.playButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.playButton.tag = 1
        
        self.backgroundColor = .white
        self.addSubview(self.trackNameLabel)
        self.addSubview(self.artistNameLabel)
        self.addSubview(self.albumImageView)
        self.addSubview(self.progressView)
        self.addSubview(self.playButton)
        self.setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            self.albumImageView.widthAnchor.constraint(equalToConstant: 100.0),
            self.albumImageView.heightAnchor.constraint(equalToConstant: 100.0),
            self.albumImageView.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            self.albumImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20.0),

            self.trackNameLabel.topAnchor.constraint(equalTo: self.albumImageView.bottomAnchor, constant: 15.0),
            self.trackNameLabel.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 10),
            self.trackNameLabel.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -10.0),

            self.artistNameLabel.topAnchor.constraint(equalTo: self.trackNameLabel.bottomAnchor, constant: 15.0),
            self.artistNameLabel.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 10.0),
            self.artistNameLabel.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -10.0),

            self.playButton.topAnchor.constraint(equalTo: self.artistNameLabel.bottomAnchor, constant: 15.0),
            self.playButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            self.playButton.widthAnchor.constraint(equalToConstant: 70.0),

            self.progressView.topAnchor.constraint(equalTo: self.playButton.bottomAnchor, constant: 30.0),
            self.progressView.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            self.progressView.widthAnchor.constraint(equalToConstant: 200.0),
            self.progressView.heightAnchor.constraint(equalToConstant: 15.0)
            ])
    }
}
