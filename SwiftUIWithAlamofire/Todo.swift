//
//  Todo.swift
//  SwiftUIWithAlamofire
//
//  Created by Hakan Hatipoğlu on 11.03.2024.
//

import Foundation

struct Todo: Codable, Identifiable {
    let id: Int
    let title: String
    let completed: Bool
}
