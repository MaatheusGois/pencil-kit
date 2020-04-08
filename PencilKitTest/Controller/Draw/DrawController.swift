//
//  ViewController.swift
//  PencilKitTest
//
//  Created by Matheus Silva on 07/04/20.
//  Copyright © 2020 Matheus Gois. All rights reserved.
//

import UIKit
import PencilKit

class DrawController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    lazy var canvasView: Canvas = Canvas(view: view)
    var draw: Draw?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    func setUp() {
        setUpView()
        setupImage()
    }
    
    func setUpView() {
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.addSubview(canvasView)
    }
    
    func setupImage() {
        if let image = draw?.image {
            canvasView.addSubview(imageView)
            imageView.image = image
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setUpCanvas()
    }
    
    func setUpCanvas() {
        guard let window = view.window, let toolPiker = PKToolPicker.shared(for: window) else {
            return
        }
        toolPiker.setVisible(true, forFirstResponder: canvasView)
        toolPiker.addObserver(canvasView)
        canvasView.becomeFirstResponder()
    }
}

