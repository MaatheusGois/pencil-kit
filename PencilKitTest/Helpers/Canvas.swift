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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    convenience init(view: UIView) {
        self.init(frame: view.frame)
        self.view = view
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setUp() {
        bouncesZoom = true
        bounces = true
        allowsFingerDrawing = true
        isRulerActive = false
        backgroundColor = .clear
        isOpaque = false
        contraints()
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

extension Canvas: PKCanvasViewDelegate {
    func canvasViewDidEndUsingTool(_ canvasView: PKCanvasView) {
        print("here")
    }
}
