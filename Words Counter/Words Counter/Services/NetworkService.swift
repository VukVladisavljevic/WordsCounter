//
//  NetworkService.swift
//  Words Counter
//
//  Created by Vuk on 12.8.22..
//

import Foundation

protocol NetworkService {
    func fetchContents() async throws -> String
}

class NetworkServiceImpl : NetworkService {
    func fetchContents() async throws -> String {
        guard let url = URL(string: Constants.AppConfig.ContentURL) else {
            throw Constants.StringValues.InvalidURL
        }

        return try String(contentsOf: url)
    }
}
