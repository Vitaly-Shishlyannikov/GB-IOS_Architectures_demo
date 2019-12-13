//
//  PlayingSongService.swift
//  iOSArchitecturesDemo
//
//  Created by Vitaly_Shishlyannikov on 12/12/2019.
//  Copyright © 2019 ekireev. All rights reserved.
//

import Foundation

protocol PlayingSongsServiceInterface: class {
    var playingSong: PlayingSong? {get}
    var onProgressUpdate: (() -> Void)? {get set}
    func startPlaySong(_ song: ITunesSong)
}

final class PlayingSong {
    
    enum PlayState {
        case notStarted
        case inProgress(progress: Double)
    }
    
    let song: ITunesSong
    
    var playState: PlayState = .notStarted
    
    init(song: ITunesSong) {
        self.song = song
    }
}

final class FakePlaySongService: PlayingSongsServiceInterface {
    
    // MARK: - PlaySongServiceInterface
    
    private(set) var playingSong: PlayingSong?
    
    var onProgressUpdate: (() -> Void)?
    
    func startPlaySong(_ song: ITunesSong) {
        
        let playingSong = PlayingSong(song: song)
        
        self.playingSong = playingSong
        
        self.startTimer(for: playingSong)
    }
    
    // MARK: - Init

    // MARK: - Private properties
    
    private var timers: [Timer] = []
        
    // MARK: - Private
    
    private func startTimer(for playingSong: PlayingSong) {
        
        let timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) {[weak self] timer in
            switch playingSong.playState {
            case .notStarted:
                playingSong.playState = .inProgress(progress: 0.05)
            case .inProgress(let progress):
                let newProgress = progress + 0.05
                if newProgress >= 1 {
                    playingSong.playState = .notStarted
                    self?.invalidateTimer(timer)
                } else {
                    playingSong.playState = .inProgress(progress: progress + 0.05)
                }
            }
            self?.onProgressUpdate?()
        }
        RunLoop.main.add(timer, forMode: .common)
        self.timers.append(timer)
    }
    
    private func invalidateTimer(_ timer: Timer) {
        timer.invalidate()
        self.timers.removeAll { $0 === timer }
    }
}
