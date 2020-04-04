//
//  TodayCell.swift
//  AppStoreClone
//
//  Created by Аслан on 03.04.2020.
//  Copyright © 2020 Doka.fun. All rights reserved.
//

import UIKit

class TodayCell: UICollectionViewCell {
    
    var todayItem: TodayItem? {
        didSet {
            guard let todayItem = self.todayItem else { return }
            titleLabel.text = todayItem.title
            subtitleLabel.text = todayItem.subtitle
            imageView.image = UIImage(named: todayItem.imageName)
            descLabel.text = todayItem.description
        }
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Assassin’s Creed Rebellion"
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "An Heroic Adventure RPG Game"
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descLabel: UILabel = {
        let label = UILabel()
        label.text = "Play Mobile Animus's new Helix Rift Event. Travel to the Caribbean on a search for Spanish gold during the golden age of piracy."
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let imageView: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "assasin"))
        iv.layer.cornerRadius = 12
        iv.clipsToBounds = true
        iv.contentMode = .scaleToFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupUI()
    }
    
    fileprivate func setupUI() {
        layer.cornerRadius = 16
        clipsToBounds = true
        
        let imageContainerView = UIView()
        imageContainerView.addSubview(imageView)
        imageView.centerInSuperview(size: .init(width: 340, height: 240))
        
        let stackView = VerticalStackView(arrangedSubviews: [
            titleLabel, subtitleLabel, imageContainerView, descLabel
        ], spacing: 8)
        
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 44, left: 16, bottom: 24, right: 16))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
