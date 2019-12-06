//
//  ITunesSong.swift
//  iOSArchitecturesDemo
//
//  Created by ekireev on 19.02.2018.
//  Copyright © 2018 ekireev. All rights reserved.
//

import UIKit

public struct ITunesSong: Codable {
    
    public var trackName: String
    public var artistName: String?
    public var collectionName: String?
    public var artworkURL: String?
    
    // MARK: - Codable
    
    private enum CodingKeys: String, CodingKey {
        case trackName = "trackName"
        case artistName = "artistName"
        case collectionName = "collectionName"
        case artworkURL = "artworkUrl100"
    }
    
    // MARK: - Init
    
    internal init(trackName: String,
                  artistName: String?,
                  collectionName: String?,
                  artworkURL: String?) {
        self.trackName = trackName
        self.artistName = artistName
        self.collectionName = collectionName
        self.artworkURL = artworkURL
    }
}
