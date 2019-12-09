//
//  WhatsNewBlockViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Vitaly_Shishlyannikov on 05/12/2019.
//  Copyright © 2019 ekireev. All rights reserved.
//

import UIKit

final class WhatsNewBlockViewController: UIViewController {
    
    // MARK: - Properties
    
    private let app: ITunesApp
    
    private var whatsNewBlockView: WhatsNewBlockView {
        return self.view as! WhatsNewBlockView
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
        self.view = WhatsNewBlockView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fillData()
    }
    
    // MARK: - Private
    
    private func fillData() {
        self.whatsNewBlockView.versionLabel.text = app.version
        self.whatsNewBlockView.descriptionLabel.text = app.releaseNotes
        self.whatsNewBlockView.dateLabel.text = app.getDateInterval()
    }
}
