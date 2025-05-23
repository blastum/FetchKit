//
//  NetworkService.swift
//  FetchKit
//
//  Created by James Blasius on 4/27/25.
//

import Foundation

// MARK: - NetworkServiceProtocol

public protocol NetworkServiceProtocol {
    func fetch<E: Endpoint>(_ endpoint: E) async -> Result<E.Output, E.Failure>
}

// MARK: - NetworkService

public final class NetworkService: NetworkServiceProtocol {
    private let session: URLSessionProtocol

    public init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }

    public func fetch<E: Endpoint>(_ endpoint: E) async -> Result<E.Output, E.Failure> {
        let result = await session.data(for: endpoint.urlRequest)
        return endpoint.decode(result)
    }
}
