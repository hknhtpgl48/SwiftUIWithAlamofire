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
    @Published var searchText = ""
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

    var filteredTodos: [Todo] {
        guard !searchText.isEmpty else { return self.todos }
        return todos.filter { todo in
            todo.title.lowercased().contains(searchText.lowercased())
        }
    }
}
