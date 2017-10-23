//
//  LoginViewViewController.swift
//  FirebaseCloudMessagingTest
//
//  Created by Pang on 2017. 10. 23..
//  Copyright © 2017년 HwangByungJo. All rights reserved.
//

import UIKit
import Firebase

class LoginViewViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()        
    }
    
    @IBAction func loginDidTouch(_ sender: AnyObject) {
        
        if nameField?.text != "" { // 1
            Auth.auth().signInAnonymously(completion: { (user, error) in // 2
                if let err = error { // 3
                    print(err.localizedDescription)
                    return
                }
                self.performSegue(withIdentifier: "LoginToChat", sender: nil) // 4
            })
        }
    }
 
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        let navVc = segue.destination as! UINavigationController // 1
        let channelVc = navVc.viewControllers.first as! ChannelListViewController // 2        
        channelVc.senderDisplayName = nameField?.text // 3
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
