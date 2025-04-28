//
//  NetworkServiceTests.swift
//  JBNetKit
//
//  Created by James Blasius on 4/27/25.
//

import FetchKit
import Foundation
import Testing

@Suite
struct NetworkServiceTests {
    @Test
    func fetchSecuritySuccess() async throws {
        let session = MockURLSession { _ in
            let data = """
            { "id": "S1", "name": "Treasury Security" }
            """.data(using: .utf8)!
            return .success((data, URLResponse()))
        }
        let service = NetworkService(session: session)
        let endpoint = TreasuryEndpoint.security(id: "S1")

        let result = await service.fetch(endpoint)

        switch try result.get() {
        case .security(let security):
            #expect(security.id == "S1")
            #expect(security.name == "Treasury Security")
        case .family:
            #expect(Bool(false), "Expected security, got family")
        }
    }

    @Test
    func fetchFamilySuccess() async throws {
        let session = MockURLSession { _ in
            let data = """
            { "id": "F1", "description": "Family Group" }
            """.data(using: .utf8)!
            return .success((data, URLResponse()))
        }
        let service = NetworkService(session: session)
        let endpoint = TreasuryEndpoint.family(id: "F1")

        let result = await service.fetch(endpoint)

        switch try result.get() {
        case .family(let family):
            #expect(family.id == "F1")
            #expect(family.description == "Family Group")
        case .security:
            #expect(Bool(false), "Expected family, got security")
        }
    }
}
