//
//  SongDetailViewModel.swift
//  iOSArchitecturesDemo
//
//  Created by Vitaly_Shishlyannikov on 12/12/2019.
//  Copyright © 2019 ekireev. All rights reserved.
//

import UIKit

final class SongDetailViewModel {
    
    // MARK: - Observable properties
    
    let songModel = Observable<PlayingSongModel?>(nil)
    let isPlaying = Observable<Bool>(false)
    let error = Observable<Error?>(nil)
    
    // MARK: - Properties
    
    weak var viewController: UIViewController?
    
    private var song: ITunesSong
    
    private let playingSongService: PlayingSongsServiceInterface
    
    private let imageDownloader = ImageDownloader()
    
    // MARK: - Init
    
    init(song: ITunesSong, playingSongService: PlayingSongsServiceInterface) {
        self.playingSongService = playingSongService
        self.song = song
        self.songModel.value = self.viewModel()
        playingSongService.onProgressUpdate = {[weak self] in
            guard let self = self else { return }
            self.songModel.value = self.viewModel()
        }
    }
    
    // MARK: - ViewModel methods
    
    func didTapPlayButton() {
        self.playingSongService.startPlaySong(self.song)
    }
    
    func getSong() -> PlayingSongModel {
        return self.viewModel()
    }
    
    // MARK: - Private
    
    private func viewModel() -> PlayingSongModel {
        
        let playingSong = self.playingSongService.playingSong ?? PlayingSong(song: self.song)
        
        let image = self.loadImage(playingSong: playingSong)
        
        return PlayingSongModel(songTitle: playingSong.song.trackName,
                                artist: playingSong.song.artistName,
                                albumTitle: playingSong.song.collectionName,
                                albumImage: image,
                                playingState: playingSong.playState )
    }
    
    private func loadImage(playingSong: PlayingSong) -> UIImage {
        guard let songUrl = playingSong.song.artworkURL,
            let url = URL(string: songUrl) else {return UIImage()}
        
        guard let data = try? Data(contentsOf: url),
            let image = UIImage(data: data) else {return UIImage()}
        
        return image
    }
}
