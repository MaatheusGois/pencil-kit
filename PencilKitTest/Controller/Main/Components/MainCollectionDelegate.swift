//
//  MainCollectionDelegate.swift
//  PencilKitTest
//
//  Created by Matheus Silva on 07/04/20.
//  Copyright © 2020 Matheus Gois. All rights reserved.
//

import UIKit

class MainCollectionDelegate: NSObject, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    weak var viewController: UIViewController!
    private var draws: Draws
    
    init(viewController: UIViewController, draws: Draws) {
        self.viewController = viewController
        self.draws = draws
    }
    
    internal func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewController?.performSegue(withIdentifier: "toDraw", sender: draws[indexPath.row])
    }
    
    internal func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthDefault = Double(collectionView.frame.width)/2 - 5
        let height: Double = widthDefault
        let width: Double = widthDefault
        return CGSize(width: width, height: height)
    }
}
