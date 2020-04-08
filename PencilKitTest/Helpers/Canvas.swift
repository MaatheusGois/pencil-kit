//
//  Pencil.swift
//  PencilKitTest
//
//  Created by Matheus Silva on 07/04/20.
//  Copyright © 2020 Matheus Gois. All rights reserved.
//

import PencilKit

class Canvas: PKCanvasView {
    weak var view: UIView!
    weak var imageView: UIImageView!
    lazy var canvasDelegate = CanvasDelegate(imageView: imageView, view: view)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(view: UIView, imageView: UIImageView) {
        self.init(frame: view.frame)
        self.view = view
        self.imageView = imageView
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setUp() {
//        minimumZoomScale = 1
//        maximumZoomScale = 5
//        bouncesZoom = false
        
        allowsFingerDrawing = true
        isRulerActive = false
        backgroundColor = .clear
        isOpaque = false
        contraints()
        
        self.delegate = canvasDelegate
    }
    
    func contraints() {
        DispatchQueue.main.async {
            self.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                self.topAnchor.constraint(equalTo: self.view.topAnchor),
                self.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
                self.rightAnchor.constraint(equalTo: self.view.rightAnchor),
                self.leftAnchor.constraint(equalTo: self.view.leftAnchor)
            ])
        }
    }
}

class CanvasDelegate: NSObject, PKCanvasViewDelegate {
    var imageView: UIImageView!
    weak var view: UIView!
    
    init(imageView: UIImageView, view: UIView) {
        self.imageView = imageView
        self.view = view
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        
        let offsetX: CGFloat = max((scrollView.bounds.size.width - scrollView.contentSize.width) * 0.5, 0.0)
        let offsetY: CGFloat = max((scrollView.bounds.size.height - scrollView.contentSize.height) * 0.5, 0.0)
//        imageView.frame.size = CGSize(width: self.view.bounds.width * scrollView.zoomScale, height: self.view.bounds.height * scrollView.zoomScale)
        
        imageView.center = CGPoint(x: scrollView.contentSize.width * 0.5 + offsetX, y: scrollView.contentSize.height * 0.5 + offsetY)
    }
    
}
