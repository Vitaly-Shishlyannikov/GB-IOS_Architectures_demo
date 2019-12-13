//
//  AppDetailViewController.swift
//  iOSArchitecturesDemo
//
//  Created by ekireev on 20.02.2018.
//  Copyright © 2018 ekireev. All rights reserved.
//

import UIKit

final class AppDetailViewController: UIViewController {
    
    var app: ITunesApp
    
    lazy var headerViewController = AppDetailHeaderViewController(app: self.app)
    lazy var whatsNewBlockViewController = WhatsNewBlockViewController(app: self.app)
    lazy var screenShotsViewController = AppScreenshotsViewController(app: self.app)
    
     // MARK: - Init
    
    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
    }
    
    // MARK: - Private
    
    private func configureUI() {
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.tintColor = UIColor.white;
        self.navigationItem.largeTitleDisplayMode = .never
        self.addHeaderViewController()
        self.addWhatsNewBlockViewController()
        self.addScreenshotsViewController()
        self.addDescriptionViewController()
    }
    
    private func addHeaderViewController() {
        self.addChild(self.headerViewController)
        self.view.addSubview(self.headerViewController.view)
        self.headerViewController.didMove(toParent: self)
        
        self.headerViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.headerViewController.view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.headerViewController.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.headerViewController.view.rightAnchor.constraint(equalTo: self.view.rightAnchor)
            ])
    }
    
    private func addWhatsNewBlockViewController() {
        self.addChild(self.whatsNewBlockViewController)
        self.view.addSubview(self.whatsNewBlockViewController.view)
        self.whatsNewBlockViewController.didMove(toParent: self)
    self.whatsNewBlockViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.whatsNewBlockViewController.view.topAnchor.constraint(equalTo: self.headerViewController.view.bottomAnchor, constant: 16.0),
            self.whatsNewBlockViewController.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.whatsNewBlockViewController.view.rightAnchor.constraint(equalTo: self.view.rightAnchor)
                ])
    }
    
    private func addScreenshotsViewController() {
        self.addChild(self.screenShotsViewController)
        self.view.addSubview(self.screenShotsViewController.view)
        self.screenShotsViewController.didMove(toParent: self)
        self.screenShotsViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.screenShotsViewController.view.topAnchor.constraint(equalTo: self.whatsNewBlockViewController.view.bottomAnchor, constant: 16.0),
            self.screenShotsViewController.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.screenShotsViewController.view.rightAnchor.constraint(equalTo: self.view.rightAnchor)
            ])
    }
    
    private func addDescriptionViewController() {
        let descriptionViewController = UIViewController()
        
        self.addChild(descriptionViewController)
        self.view.addSubview(descriptionViewController.view)
        descriptionViewController.didMove(toParent: self)
        
        descriptionViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionViewController.view.topAnchor.constraint(equalTo: self.headerViewController.view.bottomAnchor),
            descriptionViewController.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            descriptionViewController.view.rightAnchor.constraint(equalTo: self.view.rightAnchor)
            ])
        descriptionViewController.view.heightAnchor.constraint(equalToConstant: 250.0)
    }
}
