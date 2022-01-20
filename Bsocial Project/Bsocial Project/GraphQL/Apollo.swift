//
//  Apollo.swift
//  Bsocial Project
//
//  Created by Rachit Prajapati on 20/01/22.
//

import Foundation
import Apollo

final class Network {
    static let shared = Network()
    private let url = "https://api.joinb.social/graphql"
    private(set) lazy var apollo = ApolloClient(url: URL(string: url)!)
}
