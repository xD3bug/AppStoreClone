//
//  VerticalStackView.swift
//  AppStoreClone
//
//  Created by Аслан on 05/10/2019.
//  Copyright © 2019 Doka.fun. All rights reserved.
//

import UIKit

class VerticalStackView: UIStackView {

    init(arrangedSubviews: [UIView], spacing: CGFloat = 0) {
        super.init(frame: .zero)
        arrangedSubviews.forEach( {addArrangedSubview($0)} )
        self.spacing = spacing
        self.axis = .vertical
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
