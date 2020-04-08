//
//  MainController.swift
//  PencilKitTest
//
//  Created by Matheus Silva on 07/04/20.
//  Copyright © 2020 Matheus Gois. All rights reserved.
//

import UIKit

class MainController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var collection_01: Draws {
        return Draws.getCollection_01()
    }
    
    private lazy var collectionViewDataSource =
        MainCollectionDataSource(draws: collection_01,
                                 collectionView: collectionView)
    
    private lazy var collectionViewDelegate =
        MainCollectionDelegate(viewController: self,
                               draws: collection_01)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    private func setUp() {
        setUpCollection()
    }
    
    private func setUpCollection() {
        collectionView.delegate = collectionViewDelegate
        collectionView.dataSource = collectionViewDataSource
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let view = segue.destination as? DrawController,
            let draw = sender as? Draw {
            view.draw = draw
        }
    }
}
