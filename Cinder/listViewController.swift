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
    override func viewDidLoad() {
        super.viewDidLoad()
        let currentUser = Auth.auth().currentUser
        print("your here\n")
        print(currentUser!.uid)
        //print(currentUser.petnam)
      
        let userID : String = (Auth.auth().currentUser?.uid)!
        print("Current user ID is" + userID)
        
        ref = Database.database().reference()
        
        ref?.child("users").observeSingleEvent(of: .value, with: { (snapshot) in
        
        let userDict = snapshot.value as! [String: Any]
            print(userDict)
        let name = userDict["petName"] as? String
            //let email = userDict["email"] as! String
            //print("your email: \(email) .........,,,,,,,,,,.....")
            print("your pet name: \(name) ..............")
        })
        
        
//        Database.database().reference().child("user").child(userID).observeSingleEvent(of: .value, with: {(snapshot) in
//            //print(snapshot.value)
//            guard snapshot.value as? [String:Any] != nil else{return}
//
//            let va = snapshot.value as! [String:Any]
//            print(va["petName"] as! String)
//
//            //let userEmail = (snapshot.value as! NSDictionary)["addedByUser"] as! String
//            print("above is the pet name>>>>>>>>>>")
//
//
//        })
        //let va = snapshot
            //let name = (snapshot.value )
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
