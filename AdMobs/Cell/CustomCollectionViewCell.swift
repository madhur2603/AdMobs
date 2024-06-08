//
//  CustomCollectionViewCell.swift
//  AdMobs
//
//  Created by iOS on 08/06/24.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

        // UI elements
        let profileImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.layer.cornerRadius = 20
            imageView.clipsToBounds = true
            // Customize profile image view if needed
            return imageView
        }()
        
        let usernameLabel: UILabel = {
            let label = UILabel()
            // Customize username label if needed
            return label
        }()
        
        let postImageView: UIImageView = {
            let imageView = UIImageView()
            // Customize post image view if needed
            return imageView
        }()
        
        // Add more UI elements as needed
        
        // Override initializer
        override init(frame: CGRect) {
            super.init(frame: frame)
            self.contentView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 20).isActive = true
            self.contentView.layer.cornerRadius = 10.0
            self.contentView.clipsToBounds = true
            setupViews()
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            setupViews()
        }
        
        // Setup UI elements
        private func setupViews() {
            // Add and configure UI elements
            addSubview(profileImageView)
            addSubview(usernameLabel)
            addSubview(postImageView)
            
            // Example Auto Layout
            profileImageView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
                profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
                profileImageView.widthAnchor.constraint(equalToConstant: 40),
                profileImageView.heightAnchor.constraint(equalToConstant: 40)
            ])
            
            usernameLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                usernameLabel.topAnchor.constraint(equalTo: profileImageView.topAnchor),
                usernameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 8),
                usernameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
                // Add more constraints as needed
            ])
            
            postImageView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                postImageView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 8),
                postImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
                postImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
                postImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 8)
                // Add more constraints as needed
            ])
        }
    }


