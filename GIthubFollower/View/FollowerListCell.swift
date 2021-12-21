//
//  FollowerListCell.swift
//  GIthubFollower
//
//  Created by VINH HOANG on 17/12/2021.
//

import UIKit

class FollowerListCell: UICollectionViewCell {
    
    let cache = NetworkManager.shared.cache

    @IBOutlet weak var cellImageView: UIImageView!
    
    @IBOutlet weak var cellLabel: UILabel!
    
    static let reuseID = String(describing: FollowerListCell.self)
    
    func set(follower: Follower) {
        cellLabel.text = follower.login
        NetworkManager.shared.downloadImage(from: follower.avatarUrl) {[weak self] uiImage in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.cellImageView.image = uiImage
            }
        }
    }
   
   
   
    

    
}
