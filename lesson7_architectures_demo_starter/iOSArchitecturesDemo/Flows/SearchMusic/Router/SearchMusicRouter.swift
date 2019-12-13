//
//  SearchMusicRouter.swift
//  iOSArchitecturesDemo
//
//  Created by Vitaly_Shishlyannikov on 12/12/2019.
//  Copyright © 2019 ekireev. All rights reserved.
//

import UIKit

protocol SearchMusicRouterInput {
    
    func openSongDetails(for song: ITunesSong)
}

final class SearchMusicRouter: SearchMusicRouterInput {
    
    weak var viewController: UIViewController?
    
    func openSongDetails(for song: ITunesSong) {
        
        let songDetailViewController = SongDetailModuleBuilder.build(with: song)
    self.viewController?.navigationController?.pushViewController(songDetailViewController, animated: true)
    }
}
