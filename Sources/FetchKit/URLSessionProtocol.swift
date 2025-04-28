//
//  URLSessionProtocol.swift
//  JBNetKit
//
//  Created by James Blasius on 4/27/25.
//

import Foundation

public protocol URLSessionProtocol {
    func data(for request: URLRequest) async throws -> (Data, URLResponse)
}

extension URLSession: URLSessionProtocol { }
