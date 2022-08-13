//
//  ContentView.swift
//  Words Counter
//
//  Created by Vuk on 12.8.22..
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ParserViewModel(network: NetworkServiceImpl(), parser: ParsingServiceImpl())
    
    var body: some View {
        NavigationView {
            ScrollView([.vertical]) {
                VStack(alignment: .leading) {
                    Group {
                        Text(Constants.StringValues.TenthCharacterRequestLabel)
                            .bold()
                        viewModel.tenthCharText == "" ? Text(" ") : Text(viewModel.tenthCharText)
                        Divider()
                        Text(Constants.StringValues.Every10thCharacterRequestLabel)
                            .bold()
                        TextBox(value: $viewModel.eachTenthCharText)
                        Divider()
                        Text(Constants.StringValues.WordCounterRequestLabel)
                            .bold()
                        TextBox(value: $viewModel.wordsCounterText)
                        Divider()
                            .padding(.bottom, Constants.Sizes.MediumPadding)
                    }
                    viewModel.infoText == "" ? Text(" ") : Text(viewModel.infoText)
                            .bold()
                            .foregroundColor(Constants.Colors.warning)
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            Task {
                                await viewModel.updateData()
                            }
                        }){
                            Text(Constants.StringValues.RunButtonLabel)
                            .bold()
                            .padding(Constants.Sizes.MediumPadding)
                            .foregroundColor(Color.black)
                            .background(Color.orange)
                            .cornerRadius(Constants.Sizes.CornerRadius)
                        }
                        Spacer()
                    }
                    .padding(.top, Constants.Sizes.MediumPadding)

                }.padding(Constants.Sizes.MediumPadding)
            .navigationBarTitle(Constants.StringValues.Title)
            }
            .background(Constants.Colors.primary)
        }
    }
}
 

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice(PreviewDevice(rawValue: "iPhone 13"))
    }
}
