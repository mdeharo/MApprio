//
//  Utilities.swift
//  MApprio
//
//  Created by Mario de Haro Serón on 30/1/17.
//  Copyright © 2017 Bersusco. All rights reserved.
//

import UIKit

extension UIViewController: UITextFieldDelegate {
    
    func showMessageWith(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        
        alertController.addAction(action)
        self.present(alertController, animated: true)
    }
    
    func hideKeyboardWhenTappingAround() {
        let tap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:#selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    
}
