//
//  MockURLSession.swift
//  FetchKit
//
//  Created by James Blasius on 4/27/25.
//

import FetchKit
import Foundation

final class MockURLSession: URLSessionProtocol {
    typealias Handler = (URLRequest) -> Result<(Data, URLResponse), Error>

    private let handler: Handler

    init(handler: @escaping Handler) {
        self.handler = handler
    }

    func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        switch handler(request) {
        case .success(let result):
            return result
        case .failure(let error):
            throw error
        }
    }
}
