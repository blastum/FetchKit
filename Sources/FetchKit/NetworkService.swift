//
//  NetworkService.swift
//  JBNetKit
//
//  Created by James Blasius on 4/27/25.
//

import Foundation

public final class NetworkService {
    private let session: URLSessionProtocol

    public init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }

    public func fetch<E: Endpoint>(_ endpoint: E) async -> Result<E.Output, Error> {
        do {
            let (data, _) = try await session.data(for: endpoint.urlRequest)
            return Result { try endpoint.decode(data) }
        } catch {
            return .failure(error)
        }
    }
}
