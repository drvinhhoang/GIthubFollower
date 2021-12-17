//
//  UIViewController+Ext.swift
//  GitHubFlollowers
//
//  Created by VINH HOANG on 12/11/2021.
//

import UIKit
import SafariServices


extension UIViewController {
    
 
    
    func showAlert(title: String, message: String, buttonTitle: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
 
    func presentSafariVC(with url: URL) {
        let safariVC = SFSafariViewController(url: url)
        safariVC.preferredControlTintColor = .systemGreen
        present(safariVC, animated: true)
        
    }
    
    
}


