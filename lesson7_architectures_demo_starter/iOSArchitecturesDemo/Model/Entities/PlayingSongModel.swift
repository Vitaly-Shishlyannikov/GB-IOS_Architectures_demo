//
//  PlayingSongModel.swift
//  iOSArchitecturesDemo
//
//  Created by Vitaly_Shishlyannikov on 12/12/2019.
//  Copyright © 2019 ekireev. All rights reserved.
//

import UIKit

struct PlayingSongModel {
    let songTitle: String
    let artist: String?
    let albumTitle: String?
    let albumImage: UIImage?
    let playingState: PlayingSong.PlayState
}
