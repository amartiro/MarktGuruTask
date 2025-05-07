//
//  NetworkError.swift
//  MarktGuruTask
//
//  Created by Artak Martirosyan on 05.05.25.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case requestFailed(Int)
    case decodingError(Error)
    case unknown(Error)
}
