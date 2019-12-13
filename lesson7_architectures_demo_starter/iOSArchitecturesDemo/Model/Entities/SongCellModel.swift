//
//  SongCellModel.swift
//  iOSArchitecturesDemo
//
//  Created by Vitaly_Shishlyannikov on 06/12/2019.
//  Copyright © 2019 ekireev. All rights reserved.
//

import UIKit

struct SongCellModel {
    let trackName: String
    let artistName: String?
    let collectionName: String?
    let collectionImage: UIImage?
}

final class SongCellModelFactory {
    
    static let imageDownloader = ImageDownloader()
    
    static func cellModel(from model: ITunesSong) -> SongCellModel {
        
        let image = self.loadImage(model: model)
        
        return SongCellModel(trackName: model.trackName,
                            artistName: model.artistName,
                            collectionName: model.collectionName,
                            collectionImage: image)
    }
    
    static func loadImage(model: ITunesSong) -> UIImage {
        guard let songUrl = model.artworkURL,
              let url = URL(string: songUrl) else {return UIImage()}
        
        guard let data = try? Data(contentsOf: url),
              let image = UIImage(data: data) else {return UIImage()}
        
        return image
    }
}

