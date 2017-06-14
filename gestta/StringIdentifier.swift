//
//  StringIdentifier.swift
//  gestta
//
//  Created by Weslley Neri on 13/06/15.
//  Copyright © 2017 Weslley Neri. All rights reserved.
//

import Foundation

enum StringIdentifier: String {
    case loginLabelName
}

extension String {
    init(identifier: StringIdentifier) {
        self.init(NSLocalizedString(identifier.rawValue, comment: ""))!
    }
}
