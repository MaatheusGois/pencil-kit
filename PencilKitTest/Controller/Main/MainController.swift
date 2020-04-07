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
    
    private var drawsTest: Draws {
        return Draws.getExamples()
    }
    
    private lazy var collectionViewDataSource = MainCollectionDataSource(draws: drawsTest,
                                                                         collectionView: collectionView)
    private lazy var collectionViewDelegate = MainCollectionDelegate(viewController: self,
                                                             draws: drawsTest)
    
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
