//
//  Extensions.swift
//  Words Counter
//
//  Created by Vuk on 12.8.22..
//

extension String {
    
    // Extension for removal of whitespaces so they don't interfere with results
    var clearedWhitespaces: String {
        return components(separatedBy: .whitespaces).joined()
    }
}


extension String: Error {}
