//
//  ContentView.swift
//  SwiftUIWithAlamofire
//
//  Created by Hakan Hatipoğlu on 10.03.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    var body: some View {
        NavigationStack {
            List(viewModel.filteredTodos) { todo in
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
            .onAppear(perform: viewModel.fetchTodos)
            .searchable(text: $viewModel.searchText)
            .overlay {
                if viewModel.filteredTodos.isEmpty {
                    // Default version
                    // ContentUnavailableView.search(text: viewModel.searchText)
                    ContentUnavailableView(label: {
                        Label("No Todos", systemImage: "tray.fill")
                            .bold()
                            .foregroundStyle(.red)
                    }, description: {
                        Text("Please check todo's title")
                    })
                }
            }
            .navigationTitle("Todos")
        }
    }

}


#Preview {
    ContentView()
}
