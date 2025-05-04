//
//  Endpoint.swift
//  FetchKit
//
//  Created by James Blasius on 4/27/25.
//

import Foundation

public protocol Endpoint {
    associatedtype Output
    associatedtype Failure: Error

    var urlRequest: URLRequest { get }
    func decode(_ result: Result<(Data, URLResponse), any Error>) -> Result<Output, Failure>
}
