//
//  ContentView.swift
//  SwiftUIWithAlamofire
//
//  Created by Hakan Hatipoğlu on 10.03.2024.
//

import SwiftUI
import Alamofire

struct ContentView: View {
    @State var users = [User]()
    @State var todos = [Todo]()
    var body: some View {
        NavigationStack {
            List(todos) { todo in
                HStack {
                    Text("\(todo.id)")
                        .padding()
                        .foregroundStyle(.white)
                        .background(.gray)
                        .clipShape(Circle())
                    VStack(alignment: .leading) {
                        Text(todo.title)
                            .font(.headline)
                        if todo.completed {
                            Image(systemName: "checkmark.circle.fill")
                                .font(.largeTitle)
                                .background(.green)
                                .foregroundStyle(.white)
                        }
                    }
                }
            }
            .onAppear(perform: loadDataWithURLSession)
            .navigationTitle("Todos")
        }
    }
    
    func loadDataWithAlamofire() {
        AF.request("https://jsonplaceholder.typicode.com/users")
            .responseDecodable(of: [User].self) { response in
                guard let users = response.value else { return }
                self.users = users
            }
    }
    
    func loadDataWithURLSession() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode([Todo].self, from: data)
                DispatchQueue.main.async {
                    self.todos = decodedData
                }
            } catch {
                print(error)
            }
            
        }.resume()
    }
}


#Preview {
    ContentView()
}
