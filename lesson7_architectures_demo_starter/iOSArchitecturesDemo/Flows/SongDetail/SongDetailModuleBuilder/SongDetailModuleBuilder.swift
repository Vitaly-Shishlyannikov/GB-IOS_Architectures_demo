//
//  SongDetailModuleBuilder.swift
//  iOSArchitecturesDemo
//
//  Created by Vitaly_Shishlyannikov on 13/12/2019.
//  Copyright © 2019 ekireev. All rights reserved.
//

import UIKit

final class SongDetailModuleBuilder {
    
    static func build(with song: ITunesSong) -> UIViewController {
        let playingSongService = FakePlaySongService()
        let viewModel = SongDetailViewModel(song: song, playingSongService: playingSongService)
        let viewController = SongDetailViewController(viewModel: viewModel)
        viewModel.viewController = viewController
        return viewController
    }
}
