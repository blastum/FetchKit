//
//  TreasuryEndpoint.swift
//  JBNetKit
//
//  Created by James Blasius on 4/27/25.
//

import FetchKit
import Foundation

public enum TreasuryEndpoint: Endpoint {
    case security(id: String)
    case family(id: String)

    public var urlRequest: URLRequest {
        switch self {
        case .security(let id):
            return URLRequest(url: URL(string: "https://api.treasury.gov/security/\(id)")!)
        case .family(let id):
            return URLRequest(url: URL(string: "https://api.treasury.gov/family/\(id)")!)
        }
    }

    public func decode(_ data: Data) throws -> TreasuryResult {
        switch self {
        case .security:
            let security = try JSONDecoder().decode(Security.self, from: data)
            return .security(security)
        case .family:
            let family = try JSONDecoder().decode(Family.self, from: data)
            return .family(family)
        }
    }
}
