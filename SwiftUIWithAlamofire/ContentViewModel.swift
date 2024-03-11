//
//  ContentViewModel.swift
//  SwiftUIWithAlamofire
//
//  Created by Hakan Hatipoğlu on 11.03.2024.
//

import Foundation
import Alamofire

class ContentViewModel: ObservableObject {
    @Published var todos: [Todo] = []
    func fetchTodos() {
        AF.request("https://jsonplaceholder.typicode.com/todos")
            .responseDecodable(of: [Todo].self) { response in
                switch response.result {
                case .success(let todos):
                    self.todos = todos
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
            }
    }
}
