//
//  TreasuryEndpoint.swift
//  FetchKit
//
//  Created by James Blasius on 4/27/25.
//

import FetchKit
import Foundation

public enum TreasuryEndpoint: Endpoint {
    public typealias Output = TreasuryResult
    public typealias Failure = Error

    case security(id: String)
    case family(id: String)

    public var urlRequest: URLRequest {
        switch self {
        case let .security(id):
            return URLRequest(url: URL(string: "https://api.treasury.gov/security/\(id)")!)
        case let .family(id):
            return URLRequest(url: URL(string: "https://api.treasury.gov/family/\(id)")!)
        }
    }

    public func decode(_ result: Result<(Data, URLResponse), any Error>) ->
        Result<TreasuryResult, any Failure> {
        switch result {
        case let .success((data, _)):
            do {
                let security = try JSONDecoder().decode(Security.self, from: data)
                return .success(.security(security))
            } catch {
                return .failure(error)
            }
        case let .failure(error):
            return .failure(error)
        }
    }
}
