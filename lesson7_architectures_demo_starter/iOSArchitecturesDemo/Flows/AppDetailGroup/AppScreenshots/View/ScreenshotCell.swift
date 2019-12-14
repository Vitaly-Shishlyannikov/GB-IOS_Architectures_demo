//
//  ScreenshotCell.swift
//  iOSArchitecturesDemo
//
//  Created by Vitaly_Shishlyannikov on 06/12/2019.
//  Copyright © 2019 ekireev. All rights reserved.
//

import UIKit

final class ScreenshotCell: UICollectionViewCell {
    
    // MARK: - Subviews
    
    private(set) lazy var screenshotImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        self.configureUI()
    }
    
    // MARK: - Methods
    
    func setImage(with image: UIImage) {
        self.screenshotImage.image = image
    }
    
    // MARK: - UI
    
    override func prepareForReuse() {
        self.screenshotImage.image = nil
    }
    
    private func configureUI() {
        self.addScreenshotImage()
    }
    
    private func addScreenshotImage() {
        self.contentView.addSubview(self.screenshotImage)
        NSLayoutConstraint.activate([
            self.screenshotImage.widthAnchor.constraint(equalToConstant: 40),
            self.screenshotImage.heightAnchor.constraint(equalToConstant: 40),
            self.screenshotImage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8.0),
            self.screenshotImage.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -12.0)
            ])
    }
}
