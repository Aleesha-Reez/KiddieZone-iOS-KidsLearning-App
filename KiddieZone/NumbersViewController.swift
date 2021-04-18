//
//  NumbersViewController.swift
//  KiddieZone
//
//  Created by ASHITHA REEZ on 4/13/21.
//

import UIKit
import AVFoundation

class NumbersViewController: UIViewController {

    
    @IBOutlet weak var numbersImgOutlet: UIImageView!
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var audioBtn: UIButton!
    
    var numArr = NSMutableArray()
    var audioPlayer : AVAudioPlayer!
    
    var index :Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        numArr = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
        
        
        numbersImgOutlet.image = UIImage(named: numArr[index] as! String)
        playSound(soundName: numArr[index] as! String)
    }
    
    func playSound(soundName: String)
    {
        let coinSound = NSURL(fileURLWithPath: Bundle.main.path(forResource: soundName, ofType: "wav")!)
        do{
            audioPlayer = try AVAudioPlayer(contentsOf:coinSound as URL)
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        }
        catch{
            print("Error getting audio file")
        }
        
       /* let pathToSound = Bundle.main.path(forResource: soundName, ofType: "wav")
        let url = URL(fileURLWithPath: pathToSound)
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "wav") else { return }
        
            do {
                try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
                try AVAudioSession.sharedInstance().setActive(true)
                audioPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
                guard let audioPlayer = audioPlayer else { return }

                audioPlayer.play()
            }catch let error{
                print(error.localizedDescription)
            }*/
    }
    
    @IBAction func backBtnAction(_ sender: Any) {
        if index >= 0
        {
            if index == 0
            {
                let alert = UIAlertController(title: "Alert", message: "You are now at the beginning of the letters", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            else{
                index = index - 1
                numbersImgOutlet.image = UIImage(named: numArr[index] as! String)
            }
        }
    }
    
    @IBAction func audioBtnAction(_ sender: Any) {
        playSound(soundName: numArr[index] as! String)
    }
    
   
    @IBAction func nextBtnAction(_ sender: Any) {
        if index < numArr.count
        {
            if index == numArr.count - 1
            {
                let alert = UIAlertController(title: "Alert", message: "You have reached the last letter", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            else{
                index = index + 1
                numbersImgOutlet.image = UIImage(named: numArr[index] as! String)
            }
        }
    }
    
}
