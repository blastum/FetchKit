//
//  Endpoint.swift
//  JBNetKit
//
//  Created by James Blasius on 4/27/25.
//

import Foundation

public protocol Endpoint {
    associatedtype Output

    var urlRequest: URLRequest { get }
    func decode(_ data: Data) throws -> Output
}
