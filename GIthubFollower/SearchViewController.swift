//
//  ViewController.swift
//  GIthubFollower
//
//  Created by VINH HOANG on 17/12/2021.
//

import UIKit

class SearchVC: UIViewController {

    @IBOutlet weak var searchTextfield: UITextField!
    var isUsernameEntered: Bool { !searchTextfield.text!.isEmpty}

    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextfield.delegate = self
        searchTextfield.autocorrectionType = .no
        createDismissKeyboardTapGesture()
    }
    
    func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
    }

    @IBAction func getFollowerTapped(_ sender: UIButton) {
        guard isUsernameEntered else {
            showAlert(title: "Username missing", message: "Please enter username.", buttonTitle: "OK")
            return
        }
        performSegue(withIdentifier: FollowerListVC.segueIdentifier, sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == FollowerListVC.segueIdentifier {
            guard let followerListVC = segue.destination as? FollowerListVC else  { return }
            followerListVC.userName = searchTextfield.text
        }
    }
}

extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard isUsernameEntered else {
            showAlert(title: "Username missing", message: "Please enter username.", buttonTitle: "OK")
            return false
        }
        performSegue(withIdentifier: FollowerListVC.segueIdentifier, sender: nil)
        return true
    }
  
}
