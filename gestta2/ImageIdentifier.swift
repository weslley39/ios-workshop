//
//  ImagesIdentifiers.swift
//  starter-kit
//  gestta2
//
//  Created by Weslley Neri on 20/06/15.
//  Copyright © 2017 Weslley Neri. All rights reserved.
//

import Foundation
import UIKit
import RSStarterKit

enum ImageIdentifier: String, RSCustomIdentifier {
    
    case defaultImage = "default_image"
    case iconAlrt = "ic_alert"
    
}

extension ImageIdentifier {
    
    func getImage() -> UIImage {
        return UIImage(withImageIdentifier: self)
    }
    
}
