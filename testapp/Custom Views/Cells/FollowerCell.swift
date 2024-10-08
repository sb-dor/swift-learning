//
//  FollowerCell.swift
//  testapp
//
//  Created by Avaz on 24/09/24.
//

import UIKit

class FollowerCell: UICollectionViewCell {
    
    static let reuseId = "FollowerCell"
    let avatartImageView = GFAvatarImageView(frame: .zero)
    let userNameLabel = GFTitleLabel(textAlignment: .center, fontSize: 16)
    let padding : CGFloat = 8
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureAvatartImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(follower: Follower?) {
        userNameLabel.text = follower?.login
        avatartImageView.downloadImage(urlString: follower?.avatarUrl)
    }
    
    private func configureAvatartImageView() {
        avatartImageView.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(avatartImageView)
        addSubview(userNameLabel)
        
        NSLayoutConstraint.activate([
            avatartImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            avatartImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            avatartImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            avatartImageView.widthAnchor.constraint(equalToConstant: contentView.bounds.width),
            avatartImageView.heightAnchor.constraint(equalToConstant: contentView.bounds.height - 40), // Keep the image view square
            
            userNameLabel.topAnchor.constraint(equalTo: avatartImageView.bottomAnchor, constant: 10),
            userNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            userNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            userNameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
