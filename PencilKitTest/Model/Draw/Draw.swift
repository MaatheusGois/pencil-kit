//
//  Draw.swift
//  PencilKitTest
//
//  Created by Matheus Silva on 07/04/20.
//  Copyright © 2020 Matheus Gois. All rights reserved.
//

import UIKit


struct Draw {
    let name: String
    let image: UIImage
}

extension Draws {
    static func getExamples() -> Draws {
        guard let imageTest = UIImage(named: "test") else {
            fatalError("Image not found")
        }
        return [
            Draw(name: "test", image: imageTest),
            Draw(name: "test", image: imageTest),
            Draw(name: "test", image: imageTest),
            Draw(name: "test", image: imageTest),
            Draw(name: "test", image: imageTest),
            Draw(name: "test", image: imageTest),
            Draw(name: "test", image: imageTest),
            Draw(name: "test", image: imageTest),
            Draw(name: "test", image: imageTest),
            Draw(name: "test", image: imageTest),
            Draw(name: "test", image: imageTest),
            Draw(name: "test", image: imageTest),
        ]
    }
}

typealias Draws = [Draw]
