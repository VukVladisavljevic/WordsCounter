//
//  ParsingService.swift
//  Words Counter
//
//  Created by Vuk on 12.8.22..
//

import Foundation

protocol ParsingService {
    func fetchTenthCharacter(content: String) -> String
    func fetchEveryTenthCharacter(content: String) -> String
    func countWords(content: String) -> String
}

class ParsingServiceImpl : ParsingService {
    
    var lookupCharacterIndex = 10
    
    func fetchTenthCharacter(content: String) -> String {
        let strWithoutWhitespaces = content.clearedWhitespaces
        let index = strWithoutWhitespaces.index(strWithoutWhitespaces.startIndex, offsetBy: lookupCharacterIndex-1)
        return String(strWithoutWhitespaces[index])
    }
    
    func fetchEveryTenthCharacter(content: String) -> String {
        let listSeparator = ", "
        var resultsList = [Character]()
        let charactersList = Array(content.clearedWhitespaces)
        
        // Starting with first nth character
        for i in stride(from: lookupCharacterIndex-1, to: charactersList.count-1, by: lookupCharacterIndex) {
            if i > charactersList.count {
                break
            } else {
                resultsList.append(charactersList[i])
            }
            
        }

        let stringArray = resultsList.map { String($0) }
        return stringArray.joined(separator: listSeparator)
    }
    
    func countWords(content: String) -> String {
        var formattedOutput = ""
        var counts: [String: Int] = [:]
        
        let wordsList = content.components(separatedBy: .whitespaces)
        wordsList.forEach { counts[$0.lowercased(), default: 0] += 1 }
        
        let sortedDict = counts.sorted { $0.1 > $1.1}
        sortedDict.forEach { formattedOutput += "\($0): \($1)\n" }
        
        return formattedOutput
    }
    
    
}
