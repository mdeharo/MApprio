//
//  SignUpViewController.swift
//  MApprio
//
//  Created by Mario de Haro Serón on 26/1/17.
//  Copyright © 2017 Bersusco. All rights reserved.
//

import UIKit
import Parse

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappingAround()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signUpAction(_ sender: AnyObject) {
        
        var username = self.usernameField.text
        var password = self.passwordField.text
        var email = self.emailField.text
        
        let finalEmail = email?.trimmingCharacters(in: CharacterSet.whitespaces)
        // Validate the text fields
        if (username?.characters.count)! < 5 {
            showMessageWith(title: "Invalid", message: "Username must be greater than 5 characters")
            
        } else if (password?.characters.count)! < 8 {
            showMessageWith(title: "Invalid", message: "Password must be greater than 8 characters")
            
        } else if (email?.characters.count)! < 8 {
            showMessageWith(title: "Invalid", message: "Please enter a valid email address")
        } else {
            // Run a spinner to show a task in progress
            activityIndicator.startAnimating()
            
            let newUser = PFUser()
            
            newUser.username = username
            newUser.password = password
            newUser.email = finalEmail
            
            // Sign up the user asynchronously
            newUser.signUpInBackground(block: { (suceed, error) in
                // Stop the spinner
                self.activityIndicator.stopAnimating()
                if ((error) != nil) {
                    self.showMessageWith(title: "Error", message: "\(error)")
                    
                } else {
                    self.showMessageWith(title: "Success", message: "Signed Up")
                    DispatchQueue.main.async {
                        self.dismiss(animated: true, completion: {
                            let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Home")
                            self.present(viewController, animated: true, completion: nil)
                        })
                    }
                }
            })
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
