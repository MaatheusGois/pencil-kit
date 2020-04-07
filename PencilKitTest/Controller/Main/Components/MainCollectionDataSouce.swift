//
//  MainCollectionDataSouce.swift
//  PencilKitTest
//
//  Created by Matheus Silva on 07/04/20.
//  Copyright © 2020 Matheus Gois. All rights reserved.
//

import UIKit

class MainCollectionDataSource: NSObject, UICollectionViewDataSource {
    private var draws: Draws
    
    init(draws: Draws) {
        self.draws = draws
    }
    
    convenience init(draws: Draws, collectionView: UICollectionView) {
        self.init(draws: draws)
        self.register(collectionView: collectionView)
    }
    
    internal func register(collectionView: UICollectionView) {
        let cell = UINib(nibName: "MainDrawViewCell", bundle: nil)
        collectionView.register(cell, forCellWithReuseIdentifier: "MainDrawViewCell")
    }
    
    internal func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.draws.count
    }
    
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainDrawViewCell",
                                                         for: indexPath) as? MainDrawViewCell {
            let draw = draws[indexPath.row]
            DispatchQueue.main.async {
                cell.imageView.image = draw.image
            }
            return cell
        }
        return UICollectionViewCell()
    }
}
