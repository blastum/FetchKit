//
//  TreasuryResult.swift
//  FetchKit
//
//  Created by James Blasius on 4/27/25.
//

import Foundation

// MARK: - Security

public struct Security: Codable, Equatable {
    public let id: String
    public let name: String
}

// MARK: - Family

public struct Family: Codable, Equatable {
    public let id: String
    public let description: String
}

// MARK: - TreasuryResult

public enum TreasuryResult {
    case security(Security)
    case family(Family)
}
