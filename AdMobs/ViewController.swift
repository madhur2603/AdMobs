//
//  ViewController.swift
//  AdMobs
//
//  Created by Madhu on 08/06/24.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController {
    

    @IBOutlet weak var collectionView: UICollectionView!

    let adUnitID = "ca-app-pub-3940256099942544/3986624511"
    let adFrequency = 3
    var nativeAdLoader: GADAdLoader!
    var nativeAds: [GADNativeAd] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(NativeAdCollectionViewCell.self, forCellWithReuseIdentifier: "NativeAdCell")
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "CustomCell")
        loadNativeAds()
        self.view.backgroundColor = .black
    }

    func loadNativeAds() {
        let adLoaderOptions = GADMultipleAdsAdLoaderOptions()
        adLoaderOptions.numberOfAds = 7

        nativeAdLoader = GADAdLoader(adUnitID: adUnitID, rootViewController: self,
                                     adTypes: [.native], options: [adLoaderOptions])
        nativeAdLoader.delegate = self
        nativeAdLoader.load(GADRequest())
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count + nativeAds.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item % adFrequency == adFrequency - 1 && nativeAds.count > 0 {
            let adIndex = indexPath.item / adFrequency
            if adIndex < nativeAds.count {
                let nativeAd = nativeAds[adIndex]
                let adCell = collectionView.dequeueReusableCell(withReuseIdentifier: "NativeAdCell", for: indexPath) as! NativeAdCollectionViewCell
                adCell.populateWithAd(nativeAd: nativeAd)
                return adCell
            }
        }

        let itemIndex = indexPath.item - indexPath.item / adFrequency
        let indexValue = items[itemIndex]
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCollectionViewCell
         cell.backgroundColor = .lightGray
        cell.usernameLabel.text = indexValue.name
        cell.profileImageView.image = indexValue.image
        cell.postImageView.image = indexValue.post
         return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item % adFrequency == adFrequency - 1 {
            return CGSize(width: collectionView.bounds.width, height: 250)
        } else {
            return CGSize(width: collectionView.bounds.width, height: 400)
        }
    }
}

extension ViewController: GADNativeAdLoaderDelegate {
    func adLoader(_ adLoader: GADAdLoader, didReceive nativeAd: GADNativeAd) {
        nativeAds.append(nativeAd)
        collectionView.reloadData()
    }
    
    func adLoader(_ adLoader: GADAdLoader, didFailToReceiveAdWithError error: any Error) { }
}
