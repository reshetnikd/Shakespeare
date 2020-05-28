//
//  PlayData.swift
//  Shakespeare
//
//  Created by Dmitry Reshetnik on 28.05.2020.
//  Copyright © 2020 Dmitry Reshetnik. All rights reserved.
//

import Foundation

class PlayData {
    var allWords = [String]()
    var wordCounts: NSCountedSet!
    private(set) var filteredWords = [String]()
    
    init() {
        if let path = Bundle.main.path(forResource: "plays", ofType: "txt") {
            if let plays = try? String(contentsOfFile: path) {
                allWords = plays.components(separatedBy: CharacterSet.alphanumerics.inverted)
                allWords = allWords.filter { $0 != "" }
                
                wordCounts = NSCountedSet(array: allWords)
                let sorted = wordCounts.allObjects.sorted { wordCounts.count(for: $0) > wordCounts.count(for: $1) }
                allWords = sorted as! [String]
            }
        }
    }
    
    func applyFilter(_ filter: (String) -> Bool) {
        filteredWords = allWords.filter(filter)
    }
    
    func applyUserFilter(_ input: String) {
        if let userNumber = Int(input) {
            applyFilter { self.wordCounts.count(for: $0) >= userNumber }
        } else {
            applyFilter { $0.range(of: input, options: .caseInsensitive) != nil }
        }
    }
}
