//
//  listViewController.swift
//  Cinder
//
//  Created by Mazen Alotaibi on 11/26/18.
//  Copyright © 2018 Mazen Alotaibi. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class listViewController: UIViewController {
    //var DatabaseRefer: DatabaseReference
    var ref: DatabaseReference?
    var handle: DatabaseHandle?
    @IBOutlet weak var petNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
//
        let userID = Auth.auth().currentUser
        //print("Current user ID is" + userID)
        
        ref = Database.database().reference()
        
        ref?.child("users").child((userID?.uid)!).observeSingleEvent(of: .value, with: { (snapshot) in
        
        let userDict = snapshot.value as! [String:Any]
            print(userDict["petName"] as! String)
            let displayname = userDict["petName"] as! String
            self.petNameLabel.text = "Hi \(displayname)"
        
        })
        
        

    }

        // Do any additional setup after loading the view.

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


}
