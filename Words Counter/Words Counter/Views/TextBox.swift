//
//  TextBox.swift
//  Words Counter
//
//  Created by Vuk on 12.8.22..
//

import Foundation
import SwiftUI

struct TextBox: View {
    
    @Binding var value: String
    
    var body: some View {
        // Unfortunately, I wasn't able to make TextEditor read-only
        // but it seemed like a better solution because by using it instead of Text
        // I was able to make each Text subview scrollable on it's own
        ScrollView {
            Text(value)
                .foregroundColor(.black)
                .font(.body)
                .fixedSize(horizontal: false, vertical: true)
        }
        .frame(minHeight: Constants.Sizes.MaximumTextHeight, maxHeight: Constants.Sizes.MaximumTextHeight)

    }
}
