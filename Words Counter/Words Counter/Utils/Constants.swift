//
//  Constants.swift
//  Words Counter
//
//  Created by Vuk on 12.8.22..
//

import SwiftUI

struct Constants {
    
    struct AppConfig {
        static let ContentURL = "https://medium.engineering/how-do-we-use-swiftui-in-the-medium-ios-application-8f7bd95416ce"
    }
    
    struct StringValues {
        static let Title = "Content Parser"
        static let TenthCharacterRequestLabel = "10th character: "
        static let Every10thCharacterRequestLabel = "Every 10th character: "
        static let WordCounterRequestLabel = "Counted words: "
        static let RunButtonLabel = "RUN"
        static let ErrorMessage = "Something went wrong... "
        static let InvalidURL = "Invalid URL"
        static let LoadingLabel = "Loading... "
        
    }
    
    struct Colors {
        static let primary = Color(red: 0.16, green: 0.50, blue: 0.73)
        static let secondary = Color(red: 0.90, green: 0.49, blue: 0.13)
        static let warning = Color(red: 0.75, green: 0.22, blue: 0.17)
    }
    
    struct Sizes {
        static let MaximumTextHeight: CGFloat = 175.0
        static let CornerRadius: CGFloat = 15.0
        
        static let LargePadding: CGFloat = 48.0
        static let MediumPadding: CGFloat = 24.0
    }
}
