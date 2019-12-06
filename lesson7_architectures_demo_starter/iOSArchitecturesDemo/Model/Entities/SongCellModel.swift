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
        
        var image = UIImage()
        let url = URL(string: model.artworkURL!)
        if let data = try? Data(contentsOf: url!) {
                image = UIImage(data: data)!
            }
        
        
        return SongCellModel(trackName: model.trackName,
                            artistName: model.artistName,
                            collectionName: model.collectionName,
                            collectionImage: image)
    }
}

