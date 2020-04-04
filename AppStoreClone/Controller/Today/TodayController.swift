//
//  TodayController.swift
//  AppStoreClone
//
//  Created by Аслан on 02/10/2019.
//  Copyright © 2019 Doka.fun. All rights reserved.

// #colorLiteral(red: 0.9724567533, green: 0.9726156592, blue: 0.9724228978, alpha: 1)

import UIKit

class TodayController: BaseCollectionViewController, UICollectionViewDelegateFlowLayout {

    let todayCellId = "todayCellId"
    
    let items = [
        TodayItem.init(title: "Assassin’s Creed Rebellion", subtitle: "An Heroic Adventure RPG Game", description: "Play Mobile Animus's new Helix Rift Event. Travel to the Caribbean on a search for Spanish gold during the golden age of piracy.", fullDescription: " is the official mobile Strategy-RPG of the Assassin's Creed universe.\n\nExclusively developed for mobile, a new version of the Animus allows us to experience memories from the past and play with different Assassins simultaneously. Gather powerful Assassins in a single Brotherhood and unite against the Templars and the opression raging in Spain.", imageName: "assasin"),
        TodayItem.init(title: "Subway Surfers", subtitle: "Join the endless running fun!", description: "Help Jake, Tricky & Fresh escape from the grumpy Inspector and his dog.", fullDescription: "World Tour goes to beautiful Iceland\n- Surf through chilling ice caves and scorching volcanoes\n- Boost your Surfer crew with Bjarki, the strong explorer\n- Unlock Bjarki’s Fisher Outfit and surf the splashing Big Blue board\n- Collect hidden Easter eggs on the decorated tracks to earn prizes", imageName: "subway")
    ]
    
    var startingFrame: CGRect?
    var appFullScreenController: AppFullscreenController?
    
    var topConstraint: NSLayoutConstraint?
    var leadingConstraint: NSLayoutConstraint?
    var widthConstraint: NSLayoutConstraint?
    var heightConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        
        collectionView.backgroundColor = .lightGray
        collectionView.register(TodayCell.self, forCellWithReuseIdentifier: todayCellId)
    }
    
    @objc func handleViewRemove() {

        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            
            self.appFullScreenController?.tableView.contentOffset = .zero
            
            guard let startingFrame = self.startingFrame else { return }
            
            self.topConstraint?.constant = startingFrame.origin.y
            self.leadingConstraint?.constant = startingFrame.origin.x
            self.widthConstraint?.constant = startingFrame.width
            self.heightConstraint?.constant = startingFrame.height
            self.view.layoutIfNeeded()
            
            self.tabBarController?.tabBar.isHidden = false
        }, completion: { _ in
            guard let appFullScreenController = self.appFullScreenController else { return }
            appFullScreenController.view.removeFromSuperview()
            appFullScreenController.removeFromParent()
        })
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // Save reference to controller to remove it later
        let appFullScreenController = AppFullscreenController()
        appFullScreenController.todayItem = items[indexPath.item]
        
        appFullScreenController.dismissHandler = {
            self.handleViewRemove()
        }
        
        guard let fullscreenView = appFullScreenController.view else { return }
        
        collectionView.addSubview(fullscreenView)
        
        addChild(appFullScreenController)
        self.appFullScreenController = appFullScreenController
        
        // Get the cell
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        
        // Cell frame absolute coordinate
        guard let startingFrame = cell.superview?.convert(cell.frame, to: nil) else { return }
        
        self.startingFrame = startingFrame
       
        // Auto layout constraint animation
        fullscreenView.translatesAutoresizingMaskIntoConstraints = false
        topConstraint = fullscreenView.topAnchor.constraint(equalTo: view.topAnchor, constant: startingFrame.origin.y)
        leadingConstraint = fullscreenView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: startingFrame.origin.x)
        widthConstraint = fullscreenView.widthAnchor.constraint(equalToConstant: startingFrame.width)
        heightConstraint = fullscreenView.heightAnchor.constraint(equalToConstant: startingFrame.height)
        
        [topConstraint, leadingConstraint, widthConstraint, heightConstraint].forEach({$0?.isActive = true})
        self.view.layoutIfNeeded()
        
        fullscreenView.layer.cornerRadius = 16
        fullscreenView.clipsToBounds = true
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            
            self.topConstraint?.constant = 0
            self.leadingConstraint?.constant = 0
            self.widthConstraint?.constant = self.view.frame.width
            self.heightConstraint?.constant = self.view.frame.height
            
            self.view.layoutIfNeeded()
            self.tabBarController?.tabBar.isHidden = true
        }, completion: nil)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: todayCellId, for: indexPath) as! TodayCell
        cell.todayItem = items[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 44, height: 450)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 32, left: 0, bottom: 32, right: 0)
    }
}

