//
//  SearchResultCell.swift
//  AppStoreClone
//
//  Created by Аслан on 02/10/2019.
//  Copyright © 2019 Doka.fun. All rights reserved.
//

import UIKit

class SearchResultCell: UICollectionViewCell {
    
    var appResult: Result! {
        didSet {
            nameLabel.text = appResult.trackName
            categoryLabel.text = appResult.primaryGenreName
            raitingsLabel.text = "Rating: \(appResult.averageUserRating ?? 0)"
            
            appIconImageView.sd_setImage(with: URL(string: appResult.artworkUrl100))
            
            screenShot1ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls[0]))
            
            if appResult.screenshotUrls.count > 1 {
                screenShot2ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls[1]))
            }
            
            if appResult.screenshotUrls.count > 2 {
                screenShot3ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls[2]))
            }
        }
    }
    
    let appIconImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .red
        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 64).isActive = true
        iv.layer.cornerRadius = 12
        iv.clipsToBounds = true
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "App name"
        return label
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Photo & Video"
        return label
    }()
    
    let raitingsLabel: UILabel = {
        let label = UILabel()
        label.text = "9.26M"
        return label
    }()
    
    let getButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("GET", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.backgroundColor = .darkGray
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        button.layer.cornerRadius = 16
        return button
    }()
    
    lazy var screenShot1ImageView = self.createScreenShotImages()
    lazy var screenShot2ImageView = self.createScreenShotImages()
    lazy var screenShot3ImageView = self.createScreenShotImages()
    
    func createScreenShotImages() -> UIImageView {
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        imageView.contentMode = .scaleAspectFill
        return imageView
    }
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        //backgroundColor = .yellow
        
        // Horizontal StackView
        let infoTopStackView = UIStackView(arrangedSubviews: [
            appIconImageView,
            VerticalStackView(arrangedSubviews: [
                nameLabel, categoryLabel, raitingsLabel
            ]),
            getButton
        ])
        
        infoTopStackView.spacing = 12
        infoTopStackView.alignment = .center
        
        let screenShotsStackView = UIStackView(arrangedSubviews: [
            screenShot1ImageView, screenShot2ImageView, screenShot3ImageView
        ])
        screenShotsStackView.axis = .horizontal
        screenShotsStackView.spacing = 12
        screenShotsStackView.distribution = .fillEqually
        
        let overallStackView =  VerticalStackView(arrangedSubviews: [
            infoTopStackView, screenShotsStackView
        ], spacing: 16)
        
        addSubview(overallStackView)
        overallStackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
