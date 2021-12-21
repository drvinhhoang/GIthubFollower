//
//  UserInfoVC.swift
//  GIthubFollower
//
//  Created by VINH HOANG on 17/12/2021.
//

import UIKit
import SafariServices

class UserInfoVC: UIViewController {
    
    static let segueIdentifier = "showUserInfoVC"
    var url = ""
    
    @IBOutlet weak var followers: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var bio: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var userInfoImage: UIImageView!
    
    
    @IBOutlet weak var button: UIButton!
    @IBAction func showProfileButton(_ sender: UIButton) {
        presentSafariVC(with: URL(string: url)!)
    }
    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUserInfo()
        configureUI()
    
    }
    
    func configureUI() {
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
        navigationController?.navigationBar.topItem?.title = ""
        navigationController?.navigationBar.tintColor = UIColor(named: "Button")
        userInfoImage.layoutIfNeeded()
        userInfoImage.layer.cornerRadius = 5.0
        userInfoImage.layer.masksToBounds = true
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }

    func getUserInfo() {
        NetworkManager.shared.getUserInfo(for: username) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let user):
                self.configureUI(for: user)
               
            case .failure(let error):
                DispatchQueue.main.async {
                    self.showAlert(title: "Something went wrong", message: error.rawValue, buttonTitle: "Ok")

                }
            }
        }
    }
    
    func configureUI(for user: User) {
        
        DispatchQueue.main.async {
            self.name.text      = user.login
            self.location.text  = "Location: " + (user.location ?? "")
            self.followers.text =  "Followers: "+String(user.followers)
            self.bio.text       = "Bio: " + (user.bio ?? "N/A")
            self.url = user.htmlUrl
        }
        
        NetworkManager.shared.downloadImage(from: user.avatarUrl) {[weak self] uiImage in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.userInfoImage.image = uiImage
            }
        }
    }

}
