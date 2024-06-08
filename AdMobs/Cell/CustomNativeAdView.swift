//
//  CustomNativeAdView.swift
//
//  Created by Madhu on 07/06/24.
//

import UIKit
import GoogleMobileAds

class CustomNativeAdView: GADNativeAdView {

    let headlineLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let advertiserLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let callToActionButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        return button
    }()
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 30
        return imageView
    }()
    
    let mediaViewOptional: GADMediaView = {
        let view = GADMediaView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let bodyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        addSubview(headlineLabel)
        addSubview(bodyLabel)
        addSubview(callToActionButton)
        addSubview(iconImageView)
        addSubview(mediaViewOptional)
        addSubview(advertiserLabel)
        
        // Assign GADNativeAdView properties to UI elements
        self.headlineView = headlineLabel
        self.bodyView = bodyLabel
        self.callToActionView = callToActionButton
        self.iconView = iconImageView
        self.mediaView = mediaViewOptional
//        self.advertiserView = advertiserLabel
        
        // Setup constraints
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            iconImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            iconImageView.widthAnchor.constraint(equalToConstant: 60),
            iconImageView.heightAnchor.constraint(equalToConstant: 60),
            
            headlineLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8),
            headlineLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            headlineLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            
            mediaViewOptional.leadingAnchor.constraint(equalTo: leadingAnchor),
            mediaViewOptional.trailingAnchor.constraint(equalTo: trailingAnchor),
            mediaViewOptional.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 8),
            mediaViewOptional.heightAnchor.constraint(equalTo: mediaViewOptional.widthAnchor, multiplier: 9.0/16.0),
        
            bodyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            bodyLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            bodyLabel.topAnchor.constraint(equalTo: mediaViewOptional.bottomAnchor, constant: 8),
            
            callToActionButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            callToActionButton.topAnchor.constraint(equalTo: bodyLabel.bottomAnchor, constant: 8),
            callToActionButton.widthAnchor.constraint(equalToConstant: 100),
            callToActionButton.heightAnchor.constraint(equalToConstant: 40),
            
            advertiserLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            advertiserLabel.topAnchor.constraint(equalTo: callToActionButton.bottomAnchor, constant: 8),
            advertiserLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
}
