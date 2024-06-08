//
//  NativeAdCollectionViewCell.swift
//
//  Created by Madhu on 07/06/24.
//

import UIKit
import GoogleMobileAds

class NativeAdCollectionViewCell: UICollectionViewCell {

    var nativeAdView: CustomNativeAdView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupNativeAdView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupNativeAdView()
    }

    private func setupNativeAdView() {
        nativeAdView = CustomNativeAdView()
        nativeAdView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nativeAdView)

        NSLayoutConstraint.activate([
            nativeAdView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nativeAdView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            nativeAdView.topAnchor.constraint(equalTo: contentView.topAnchor),
            nativeAdView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        self.contentView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 20).isActive = true
        self.contentView.layer.cornerRadius = 10.0
        self.contentView.clipsToBounds = true
    }

    func populateWithAd(nativeAd: GADNativeAd) {
        nativeAdView.nativeAd = nativeAd
        (nativeAdView.headlineView as? UILabel)?.text = nativeAd.headline
        (nativeAdView.callToActionView as? UIButton)?.setTitle(nativeAd.callToAction, for: .normal)
        (nativeAdView.iconView as? UIImageView)?.image = nativeAd.icon?.image
        
        let aspectRatio = CGFloat(nativeAd.mediaContent.aspectRatio)
        let mediaHeight = nativeAdView.mediaViewOptional.frame.width * aspectRatio
        
        for constraint in nativeAdView.mediaViewOptional.constraints {
            if constraint.firstAttribute == .height {
                constraint.constant = mediaHeight
                break
            }
        }
        nativeAdView.mediaView?.mediaContent = nativeAd.mediaContent

        (nativeAdView.bodyView as? UILabel)?.text = nativeAd.body
        
    }
}
