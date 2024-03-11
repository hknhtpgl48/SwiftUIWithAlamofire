//
//  User.swift
//  SwiftUIWithAlamofire
//
//  Created by Hakan Hatipoğlu on 11.03.2024.
//

import Foundation

struct User: Codable, Identifiable {
    let id: Int
    let name: String
    let email: String
}
