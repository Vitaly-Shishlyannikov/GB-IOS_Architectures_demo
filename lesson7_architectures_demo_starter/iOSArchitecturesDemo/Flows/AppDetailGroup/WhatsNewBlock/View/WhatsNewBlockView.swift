//
//  WhatsNewBlockView.swift
//  iOSArchitecturesDemo
//
//  Created by Vitaly_Shishlyannikov on 05/12/2019.
//  Copyright © 2019 ekireev. All rights reserved.
//

import UIKit

final class WhatsNewBlockView: UIView {
    
    //MARK: - Subviews
    
    private(set) lazy var whatsNewLabel: UILabel = {
        let label = UILabel()
        label.text = "What's New"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        return label
    }()
    
    private(set) lazy var versionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        return label
    }()
    
    private(set) lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        label.numberOfLines = 3
        return label
    }()
    
    private(set) lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        return label
    }()
    
    private(set) lazy var historyButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Version History", for: .normal)
        button.backgroundColor = .clear
        button.setTitleColor(.blue, for: .normal)
        return button
    }()
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupLayout()
    }
    
    //MARK: - UI
    
    private func setupLayout() {
        self.addSubview(self.whatsNewLabel)
        self.addSubview(self.versionLabel)
        self.addSubview(self.descriptionLabel)
        self.addSubview(self.historyButton)
        self.addSubview(self.dateLabel)
        
        NSLayoutConstraint.activate([
            self.whatsNewLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 12.0),
            self.whatsNewLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16.0),
            
            self.versionLabel.topAnchor.constraint(equalTo: self.whatsNewLabel.bottomAnchor, constant: 12.0),
            self.versionLabel.leftAnchor.constraint(equalTo: self.whatsNewLabel.leftAnchor),
            
            self.descriptionLabel.topAnchor.constraint(equalTo: self.versionLabel.bottomAnchor, constant: 12.0),
            self.descriptionLabel.leftAnchor.constraint(equalTo: self.versionLabel.leftAnchor),
            self.descriptionLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16.0),
            
            self.historyButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 12.0),
            self.historyButton.rightAnchor.constraint(equalTo: self.rightAnchor,    constant: -16.0),
            
            self.dateLabel.topAnchor.constraint(equalTo: self.whatsNewLabel.bottomAnchor, constant: 12.0),
            self.dateLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16.0)
        ])
    }
}
