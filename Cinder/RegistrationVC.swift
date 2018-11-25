//
//  RegistrationVC.swift
//  Cinder
//
//  Created by Mazen Alotaibi on 11/21/18.
//  Copyright © 2018 Mazen Alotaibi. All rights reserved.
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseAuth
import FirebaseDatabase
class RegistrationVC: UIViewController {
    @IBOutlet weak var PetName: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUp(_ sender: Any) {
        let email = emailField.text
        let password = passwordField.text
        if email != "" && password != "" {
            Auth.auth().createUser(withEmail: email!, password: password!) { (authResult, error) in
                guard let user = authResult?.user else { return }
                let userdata = [
                    
                    "petName": self.PetName.text,
                    "email": self.emailField.text
                ]
                let values = [user.uid: userdata]
               // Database.database().reference().child("users").setValue(values)
                Database.database().reference().child("users").updateChildValues(values)
               // upValue(values)
            }
            let alert1 = UIAlertController(title: "Registration", message: "Succeed!", preferredStyle: .alert)
            alert1.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                self.performSegue(withIdentifier: "SignInPage", sender: action)
                }))
            self.present(alert1, animated: true, completion: nil)
            
        }else{
            let alert = UIAlertController(title: "Missing field", message: "Fill all fields", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                switch action.style{
                case .default:
                    print("default")
                    
                case .cancel:
                    print("cancel")
                    
                case .destructive:
                    print("destructive")
                    
                    
                }}))
            self.present(alert, animated: true, completion: nil)
        }


            // Email and Password where not filled in
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


