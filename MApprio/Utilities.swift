//
//  Utilities.swift
//  MApprio
//
//  Created by Mario de Haro Serón on 30/1/17.
//  Copyright © 2017 Bersusco. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showMessageWith(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        
        alertController.addAction(action)
        self.present(alertController, animated: true)
    }
    
}
