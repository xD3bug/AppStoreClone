//
//  AppFullscreenDescriptionCell.swift
//  AppStoreClone
//
//  Created by Аслан on 03.04.2020.
//  Copyright © 2020 Doka.fun. All rights reserved.
//

import UIKit

class AppFullscreenDescriptionCell: UITableViewCell {
    
    lazy var descLabel: UILabel = {
        let label = UILabel()
        label.attributedText = makeText(firstPart: "Assassin’s Creed Rebellion", secondPart: " is the official mobile Strategy-RPG of the Assassin's Creed universe.\n\nExclusively developed for mobile, a new version of the Animus allows us to experience memories from the past and play with different Assassins simultaneously. Gather powerful Assassins in a single Brotherhood and unite against the Templars and the opression raging in Spain.")
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(descLabel)
        descLabel.fillSuperview(padding: .init(top: 0, left: 16, bottom: 0, right: 16))
    }
    
    func makeText(firstPart: String, secondPart: String) -> NSAttributedString {
        var plainTextAttributes = [NSAttributedString.Key: AnyObject]()
        plainTextAttributes[.font] = UIFont.systemFont(ofSize: 18, weight: .regular)
        
        var grayTextAttributes = [NSAttributedString.Key: AnyObject]()
        grayTextAttributes[.font] = UIFont.systemFont(ofSize: 18, weight: .regular)
        grayTextAttributes[.foregroundColor] = UIColor.lightGray
        
        let text = NSMutableAttributedString(string: "\(firstPart)", attributes: plainTextAttributes)
        text.append(NSMutableAttributedString(string: " \(secondPart)", attributes: grayTextAttributes))
        
        return text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
