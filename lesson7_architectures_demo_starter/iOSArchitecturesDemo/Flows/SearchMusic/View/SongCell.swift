//
//  SongCell.swift
//  iOSArchitecturesDemo
//
//  Created by Vitaly_Shishlyannikov on 06/12/2019.
//  Copyright © 2019 ekireev. All rights reserved.
//

import UIKit

final class SongCell: UITableViewCell {
    
    // MARK: - Subviews
    
    private(set) lazy var trackName : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16.0)
        return label
    }()
    
    private(set) lazy var artistName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 13.0)
        return label
    }()
    
    private(set) lazy var collectionName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 12.0)
        return label
    }()
    
    private(set) lazy var collectionImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureUI()
    }
    
    // MARK: - Methods
    
    func configure(with cellModel: SongCellModel) {
        self.trackName.text = cellModel.trackName
        self.artistName.text = cellModel.artistName
        self.collectionName.text = cellModel.collectionName
        self.collectionImage.image = cellModel.collectionImage
    }
    
    // MARK: - UI
    
    override func prepareForReuse() {
        [self.trackName, self.artistName, self.collectionName].forEach { $0.text = nil }
        self.collectionImage.image = nil
    }
    
    private func configureUI() {
        self.addTrackName()
        self.addArtistName()
        self.addCollectionName()
        self.addCollectionImage()
    }
    
    private func addTrackName() {
        self.contentView.addSubview(self.trackName)
        NSLayoutConstraint.activate([
            self.trackName.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8.0),
            self.trackName.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 12.0),
            self.trackName.rightAnchor.constraint(lessThanOrEqualTo: self.contentView.centerXAnchor)
            ])
    }
    
    private func addArtistName() {
        self.contentView.addSubview(self.artistName)
        NSLayoutConstraint.activate([
            self.artistName.topAnchor.constraint(equalTo: self.trackName.bottomAnchor, constant: 4.0),
            self.artistName.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 12.0),
            self.artistName.rightAnchor.constraint(lessThanOrEqualTo: self.contentView.centerXAnchor)
            ])
    }
    
    private func addCollectionName() {
        self.contentView.addSubview(self.collectionName)
        NSLayoutConstraint.activate([
            self.collectionName.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 55.0),
            self.collectionName.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -12.0),
            self.collectionName.leftAnchor.constraint(greaterThanOrEqualTo: self.contentView.centerXAnchor)
            ])
    }
    
    private func addCollectionImage() {
        self.contentView.addSubview(self.collectionImage)
        NSLayoutConstraint.activate([
            self.collectionImage.widthAnchor.constraint(equalToConstant: 40),
            self.collectionImage.heightAnchor.constraint(equalToConstant: 40),
            self.collectionImage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8.0),
            self.collectionImage.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -12.0)
            ])
    }
}
