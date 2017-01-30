//
//  LoginViewController.swift
//  MApprio
//
//  Created by Mario de Haro Serón on 26/1/17.
//  Copyright © 2017 Bersusco. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappingAround()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func unwindToLogInScreen(segue:UIStoryboardSegue) {
    }
    
    @IBAction func loginAction(sender: AnyObject) {
        var username = self.usernameField.text
        var password = self.passwordField.text
        
        // Validate the text fields
        // TODO: Deeper validation
        if (username?.characters.count)! < 5 {
            showMessageWith(title: "Invalid", message: "Username must be greater than 5 characters")
            
        } else if (password?.characters.count)! < 8 {
            showMessageWith(title: "Invalid", message: "Password must be greater than 8 characters")
        } else {
            // Run a spinner to show a task in progress
            activityIndicator.startAnimating()
            
            // Send a request to login
            PFUser.logInWithUsername(inBackground: username!, password: password!, block: { (user, error) in
                
                // Stop the spinner
                self.activityIndicator.stopAnimating()
                
                if ((user) != nil) {
                    self.showMessageWith(title: "Success", message: "Logged In")
                    DispatchQueue.main.async {
                        
                        self.dismiss(animated: true, completion: {
                            let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Home")
                            self.present(viewController, animated: true, completion: nil)
                        })
                    }
                    
                } else {
                    self.showMessageWith(title: "Error", message: "\(error)")
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
