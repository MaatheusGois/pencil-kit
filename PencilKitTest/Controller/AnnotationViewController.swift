//
//  AnnotationViewController.swift
//  PencilKitTest
//
//  Created by Matheus Silva on 08/04/20.
//  Copyright © 2020 Matheus Gois. All rights reserved.
//

import UIKit
import PencilKit

class AnnotationViewController: UIViewController, PKToolPickerObserver {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var canvasView: PKCanvasView!
    @IBOutlet weak var pencilFingerBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var saveBarButtonItem: UIBarButtonItem!
    lazy var canvasDelegate = CanvasDelegate(imageView: imageView, view: view)
    
    var originalPhoto = UIImage(named: "test")
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        canvasView.isOpaque = false
        canvasView.backgroundColor = .clear
        canvasView.overrideUserInterfaceStyle = .light
        canvasView.bouncesZoom = false
        canvasView.delegate = self
        canvasView.maximumZoomScale = 4
        
        
        if let window = parent?.view.window, let toolPicker = PKToolPicker.shared(for: window) {
            toolPicker.setVisible(true, forFirstResponder: canvasView)
            toolPicker.addObserver(canvasView)
            toolPicker.addObserver(self)
            canvasView.becomeFirstResponder()
        }
        
        pencilFingerBarButtonItem.title = "Finger"
        navigationItem.leftItemsSupplementBackButton = true
        navigationItem.rightBarButtonItems = [saveBarButtonItem, pencilFingerBarButtonItem]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    /// Hide the home indicator, as it will affect latency.
    override var prefersHomeIndicatorAutoHidden: Bool {
        return true
    }

    @IBAction func gogglePencilFingerDrawing(_ sender: Any) {
        canvasView.allowsFingerDrawing.toggle()
        pencilFingerBarButtonItem.title = canvasView.allowsFingerDrawing ? "Finger" : "Pencil"
    }
    
    @IBAction func save(_ sender: Any) {
        guard let originalPhoto = originalPhoto else { return }
        
        let annotationImage =  canvasView.drawing.image(from: imageView.bounds, scale: 1.0)
        let combinedImage = originalPhoto.mergeWith(topImage: annotationImage)
        
        guard let combinedImageJpegData = combinedImage.jpegData(compressionQuality: 1.0) else { return }
        
        print(combinedImageJpegData)
    }
}



extension AnnotationViewController: PKCanvasViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        let offsetX: CGFloat = max((scrollView.bounds.size.width - scrollView.contentSize.width) * 0.5, 0.0)
        let offsetY: CGFloat = max((scrollView.bounds.size.height - scrollView.contentSize.height) * 0.5, 0.0)
        imageView.frame.size = CGSize(width: self.view.bounds.width * scrollView.zoomScale, height: self.view.bounds.height * scrollView.zoomScale)
        imageView.center = CGPoint(x: scrollView.contentSize.width * 0.5 + offsetX, y: scrollView.contentSize.height * 0.5 + offsetY)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("here")
    }
}
