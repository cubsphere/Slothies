//
//  LoginViewController.swift
//  Slothies
//
//  Created by Lucas Miranda Lin on 14/05/19.
//  Copyright © 2019 Slothies Inc. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var EnterUsernameField: UITextField!
    
    @IBOutlet weak var EnterPasswordField: UITextField!
    
    @IBOutlet weak var LoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        LoginButton.layer.cornerRadius = 10
        LoginButton.layer.masksToBounds = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButton(_ sender: Any) {
        if let username = self.EnterUsernameField.text as? String {
            if let password = self.EnterPasswordField.text as? String {
                let player = Player(username: username, password: password)
                
                accounts.append(player)
                dump(accounts)
            }
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
