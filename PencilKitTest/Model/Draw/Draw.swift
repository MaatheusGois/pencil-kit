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
    static func getCollection_01() -> Draws {
        var draws = Draws()
        for index in 1...8 {
            let name = "draw_00\(index)"
            guard let image = UIImage(named: name) else {
                fatalError("Image not found")
            }
            draws.append(Draw(name: name, image: image))
        }
        return draws
    }
}

typealias Draws = [Draw]
