//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player : AVAudioPlayer?
    
    
    @IBAction func keyTouched(_ sender: UIButton) {
        let nameList = ["C", "D", "E", "F", "G", "A", "B"]
        let soundName = nameList[sender.tag]
        playSound(soundName)
        UIView.animate(withDuration: 0.1) {
            sender.alpha = 0.5
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            UIView.animate(withDuration: 0.1) {
                 sender.alpha = 1.0
           }
        }
    }
    
    func playSound(_ name: String){
        guard let url = Bundle.main.url(forResource: name, withExtension: "wav") else {
            return
        }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        }catch let error {
            print(error.localizedDescription)
        }
    }

    

}

