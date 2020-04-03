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
    
    @objc func handleRedViewRemove(gesture: UITapGestureRecognizer) {

        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            
            self.appFullScreenController?.tableView.scrollRectToVisible(.zero, animated: true)
            
            guard let startingFrame = self.startingFrame else { return }
            
            self.topConstraint?.constant = startingFrame.origin.y
            self.leadingConstraint?.constant = startingFrame.origin.x
            self.widthConstraint?.constant = startingFrame.width
            self.heightConstraint?.constant = startingFrame.height
            self.view.layoutIfNeeded()
            
            self.tabBarController?.tabBar.isHidden = false
        }, completion: { _ in
            gesture.view?.removeFromSuperview()
            
            guard let appFullScreenController = self.appFullScreenController else { return }
            appFullScreenController.removeFromParent()
        })
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // Save reference to controller to remove it later
        let appFullScreenController = AppFullscreenController()
        
        guard let appFullscreenControllerView = appFullScreenController.view else { return }
        appFullscreenControllerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleRedViewRemove)))
        
        collectionView.addSubview(appFullscreenControllerView)
        
        addChild(appFullScreenController)
        self.appFullScreenController = appFullScreenController
        
        // Get the cell
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        
        // Cell frame absolute coordinate
        guard let startingFrame = cell.superview?.convert(cell.frame, to: nil) else { return }
        
        self.startingFrame = startingFrame
       
        // Auto layout constraint animation
        appFullscreenControllerView.translatesAutoresizingMaskIntoConstraints = false
        topConstraint = appFullscreenControllerView.topAnchor.constraint(equalTo: view.topAnchor, constant: startingFrame.origin.y)
        leadingConstraint = appFullscreenControllerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: startingFrame.origin.x)
        widthConstraint = appFullscreenControllerView.widthAnchor.constraint(equalToConstant: startingFrame.width)
        heightConstraint = appFullscreenControllerView.heightAnchor.constraint(equalToConstant: startingFrame.height)
        
        [topConstraint, leadingConstraint, widthConstraint, heightConstraint].forEach({$0?.isActive = true})
        self.view.layoutIfNeeded()
        
        appFullscreenControllerView.layer.cornerRadius = 16
        appFullscreenControllerView.clipsToBounds = true
        
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
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: todayCellId, for: indexPath) as! TodayCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 44, height: 400)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 32, left: 0, bottom: 32, right: 0)
    }
}

