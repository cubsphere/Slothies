//
//  SlothyStoreViewController.swift
//  Slothies
//
//  Created by Guilherme Augusto Campos de Melo on 28/05/19.
//  Copyright © 2019 Slothies Inc. All rights reserved.
//

import UIKit

class SlothyStoreViewController: UIViewController, GameDataUpdateable {
    
    func completionUpdateInterface(room: RoomGroup?, err: String?) {
        if let room = room {
            self.room!.copyFrom(room: room)
        }
    }
    
    
    @IBOutlet weak var debugButton: UIButton!
    @IBOutlet weak var debug0: UIButton!
    @IBOutlet weak var debug1: UIButton!
    @IBOutlet weak var debug2: UIButton!
    @IBOutlet weak var debug3: UIButton!
    var debugClicked = false
    var room:RoomGroup?
    var player:Player?
    var debugClikedCount = 1
    
    @IBAction func DebugButtonsReveal(_ sender: UIButton) {
        
        
        if(debugClikedCount >= 7){
            debug0.isHidden = false
            debug1.isHidden = false
            debug2.isHidden = false
            debug3.isHidden = false
            debugClicked = true
            debugClikedCount = 1
        }
        else{
            debug0.isHidden = true
            debug1.isHidden = true
            debug2.isHidden = true
            debug3.isHidden = true
            debugClicked = false
            debugClikedCount += 1
        }
    }
    
    @IBAction func DebugWipeRoom(_ sender: UIButton) {
        print("Debugging wipe room")
        NetworkHandler.singleton.wipeRoom(room: room!) { (room:RoomGroup?,err: String?) in }
        
        
    }
    @IBAction func DebugJumpDate(_ sender: UIButton) {
        print("Debugging jump date")
        NetworkHandler.singleton.jumpToPastDate(room: room!, timeInterval: 14400) { (room:RoomGroup?, err: String?) in
            if let err = err{
                print(err)
            }else if let room = room{
                self.room!.copyFrom(room: room)
                print("sucess jump date")
            }
        }
    }
    
    @IBAction func DebugFakeExercise(_ sender: UIButton) {
        print("Debugging fake exercise")
        NetworkHandler.singleton.fakeExercise(room: room!, player: player!, fakeSteps: 1000, fakeDistance: 500) { (room:RoomGroup?, err:String?) in
            if let err = err{
                print(err)
            }else if let room = room{
                self.room!.copyFrom(room: room)
                print("sucess fake exercise")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkHandler.listenerDispatch = self
        DispatchQueue.main.async {
            self.debug0.layer.cornerRadius = 5
            self.debug1.layer.cornerRadius = 5
            self.debug2.layer.cornerRadius = 5
            self.debug3.layer.cornerRadius = 5
        }
    }
    
    func receiveData(room: RoomGroup, player: Player) {
        self.room = room
        self.player = player
    }
}
