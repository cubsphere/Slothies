//
//  SlothCreationViewController.swift
//  Slothies
//
//  Created by Lucas Miranda Lin on 13/05/19.
//  Copyright © 2019 Slothies Inc. All rights reserved.
//

import UIKit

class SlothCreationViewController: UIViewController {
    
    var player: Player? = nil
    var room: RoomGroup? = nil
    var index: Int? = nil
    var sex: Sex? = nil
    
    @IBOutlet weak var CreateSlothyButton: UIButton!
    
    @IBOutlet weak var SlothyNameField: UITextField!
    
    @IBOutlet weak var SlothySprite: UIImageView!
    
    @IBAction func MaleSlothyButton(_ sender: UIButton) {
        SlothySprite.image = UIImage(named: "Male Slothy Idle")
        sex = .male
        
    }
    
    @IBAction func FemaleSlothyButton(_ sender: UIButton) {
        SlothySprite.image = UIImage(named: "Slothy Sleeping")
        sex = .female
    }
    
    
    @IBAction func CreateSlothyButton(_ sender: UIButton) {
        if let slothyName = SlothyNameField.text as String? {
            if let slothySex = self.sex as Sex? {
                let maybeRoom = NetworkHandler.singleton.requestCreateSloth(room: room!, player: player!, name: slothyName, sex: slothySex, index: index!)
                if let roomy = maybeRoom {
                    room = roomy
                    performSegue(withIdentifier: "ToGameScreen", sender: self)
                } else {
                    //do something to warn the user
                }
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CreateSlothyButton.layer.cornerRadius = 10
        CreateSlothyButton.layer.masksToBounds = true
    }
    
    func receiveData (player: Player, group: RoomGroup, index: Int) {
        self.player = player
        self.room = group
        self.index = index
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let game = segue.destination as? GameViewController {
            game.receiveData(room: room!, player: player!)
        }
    }

}