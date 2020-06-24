//
//  ViewController.swift
//  LXODTestApp
//
//  Created by william on 2020/6/12.
//  Copyright © 2020 william. All rights reserved.
//

import UIKit

import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var openBox: UIButton!
    @IBOutlet weak var startGPS: UIButton!
    @IBOutlet weak var startLight: UIButton!
    @IBOutlet weak var startEng: UIButton!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var labelCh: UILabel!
    @IBOutlet weak var labelEng: UILabel!
    @IBOutlet weak var videoLayer: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logo.layer.cornerRadius = logo.frame.size.width/2
        logo.clipsToBounds = true
        logo.layer.borderColor = UIColor.white.cgColor
        logo.layer.borderWidth = 4
        playVideo()
    }
    
    func playVideo(){
        guard let path = Bundle.main.path(forResource: "BMW", ofType: "mp4")else{
            return
        }
        
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.bounds
        playerLayer.videoGravity = .resizeAspectFill
        self.videoLayer.layer.addSublayer(playerLayer)
        
        player.play()
        
        videoLayer.bringSubviewToFront(openBox)
        videoLayer.bringSubviewToFront(startGPS)
        videoLayer.bringSubviewToFront(startLight)
        videoLayer.bringSubviewToFront(startEng)
        videoLayer.bringSubviewToFront(logo)
        videoLayer.bringSubviewToFront(labelCh)
        videoLayer.bringSubviewToFront(labelEng)
        videoLayer.bringSubviewToFront(videoLayer)

    }


}

