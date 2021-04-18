//
//  LettersViewController.swift
//  KiddieZone
//
//  Created by ASHITHA REEZ on 4/12/21.
//

import UIKit
import AVFoundation

class LettersViewController: UIViewController {

    
    @IBOutlet weak var lettersImgOutlet: UIImageView!
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var AudioBtn: UIButton!
    
    @IBOutlet weak var nextBtn: UIButton!
    
    
    var lettersArr = NSMutableArray()
    var audioPlayer : AVAudioPlayer!
    
    var index :Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        lettersArr = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
        
        
        lettersImgOutlet.image = UIImage(named: lettersArr[index] as! String)
        playSound(soundName: lettersArr[index] as! String)
    }
    

    @IBAction func audioBtnAction(_ sender: Any) {
        playSound(soundName: lettersArr[index] as! String)
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
                lettersImgOutlet.image = UIImage(named: lettersArr[index] as! String)
            }
        }
        
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
    
    @IBAction func nextBtnAction(_ sender: Any) {
        if index < lettersArr.count
        {
            if index == lettersArr.count - 1
            {
                let alert = UIAlertController(title: "Alert", message: "You have reached the last letter", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            else{
                index = index + 1
                lettersImgOutlet.image = UIImage(named: lettersArr[index] as! String)
            }
        }
    }
   
}
