//
//  ImagesIdentifiers.swift
//  starter-kit
//  gestta
//
//  Created by Marcus Costa on 19/06/17.
//  Copyright © 2017 redspark. All rights reserved.
//

import Foundation
import UIKit
import RSStarterKit

enum ImageIdentifier: String, RSCustomIdentifier {
    
    case defaultImage = "default_image"
    
}

extension ImageIdentifier {
    
    func getImage() -> UIImage {
        return UIImage(withImageIdentifier: self)
    }
    
}
