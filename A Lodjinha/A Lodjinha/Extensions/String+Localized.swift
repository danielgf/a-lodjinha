//
//  String+.swift
//  Viperit
//
//  Created by Ferran on 16/11/2016.
//  Copyright © 2016 Ferran Abelló. All rights reserved.
//

import Foundation

extension String {
    var first: String {
        return String(prefix(1))
    }
    var uppercasedFirst: String {
        return first.uppercased() + String(dropFirst())
    }
    
    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
    
    var html2AttributedString: NSAttributedString? {
        return Data(utf8).html2AttributedString
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
}

func safeString(_ value: Any?) -> String {
    guard let text = value else { return "" }
    return String(describing: text)
}
