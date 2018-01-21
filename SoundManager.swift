//
//  SoundManager.swift
//  Quiz
//
//  Created by Osama Ahmed on 20/01/2018.
//  Copyright © 2018 Osama Ahmed. All rights reserved.
//

import Foundation
import AVFoundation /* IMPORT THE AVFOUNDATION TO ENABLE LOADING AND PLAYING OF SOUNDS */


/* CLASS WHICH HAS THE BLUEPRINT FOR LOADING AND PLAYING SOUNDS */
class SoundManager {
    
    var fileName: String? /* STRING TO SPECIFY THE NAME OF THE FILE */
    
    
    /* INIT FUNCTION TO SET THE FILENAME WHICH IS PASSED FROM THE VIEW CONTROLLER CLASS */
    init(FileName: String) {
        fileName = FileName
    }
    
    var player: AVAudioPlayer? /* CREATE PLAYER OF TYPE AVAUDIOPLAYER */
    
    /* FUNCTION WHICH PLAYS THE SOUND USING THE FILENAME WHICH IS PASSED FROM VIEW CONTROLLER CLASS */
    func playSound() {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "wav") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
            
            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
