//
//  ParserViewModel.swift
//  Words Counter
//
//  Created by Vuk on 12.8.22..
//

import Foundation

class ParserViewModel :  ObservableObject {
    
    // By using protocols instead of concrete implementations testing would be easier (e.g. assigning mock implementations)
    var networkService: NetworkService
    var parsingService: ParsingService
    
    // This constructor would be used for Dependency Injection
    init(network: NetworkService, parser: ParsingService) {
        networkService = network
        parsingService = parser
    }
    
    @Published var tenthCharText = ""
    @Published var eachTenthCharText = ""
    @Published var wordsCounterText = ""
    @Published var infoText = ""
    
    func updateData() async {
        Task {
            do {
                // UI updating should be done on Main thread, otherwise there will be unexpected behavior
                DispatchQueue.main.async {
                    self.infoText = Constants.StringValues.LoadingLabel
                }
                
                let contents = try await networkService.fetchContents()
                
                // Heavy work should be offloaded to background threads,
                // .userInitiated because the work is of relatively high priority (but still not for Main thread)
                DispatchQueue.global(qos: .userInitiated).async {
                    let tenthChar = self.parsingService.fetchTenthCharacter(content: contents)
                    
                    DispatchQueue.main.async {
                        self.tenthCharText = tenthChar
                        
                        // Removing error message if request was succesfull
                        self.infoText = ""
                    }
                }
                
                // Calls are done with separate blocks instead of within the same one so that UI is updated for each label as parsing finishes
                // instead of being blocked by others
                DispatchQueue.global(qos: .userInitiated).async {
                    let eachTenthCharArray = self.parsingService.fetchEveryTenthCharacter(content: contents)

                    DispatchQueue.main.async {
                        self.eachTenthCharText = eachTenthCharArray
                    }
                }
                
                DispatchQueue.global(qos: .userInitiated).async {
                    let wordsCountSorted = self.parsingService.countWords(content: contents)

                    DispatchQueue.main.async {
                        self.wordsCounterText = wordsCountSorted
                    }
                }

            } catch {
                DispatchQueue.main.async {
                    self.wordsCounterText = ""
                    self.tenthCharText = ""
                    self.eachTenthCharText = ""
                    self.infoText = Constants.StringValues.ErrorMessage

                }
            }
            
        }
    }
}
