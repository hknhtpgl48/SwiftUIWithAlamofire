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
    var body: some View {
        NavigationStack {
            List(users) { user in
                HStack {
                    Text("\(user.id)")
                        .padding()
                        .foregroundStyle(.white)
                        .background(.gray)
                        .clipShape(Circle())
                    VStack(alignment: .leading) {
                        Text(user.name)
                            .font(.headline)
                        Text(user.email)
                            .font(.subheadline  )
                    }
                }
            }
            .onAppear(perform: loadData)
            .navigationTitle("Users")
        }
    }
    
    func loadData() {
        AF.request("https://jsonplaceholder.typicode.com/users")
            .responseDecodable(of: [User].self) { response in
                guard let users = response.value else { return }
                self.users = users
            }
    }
}


#Preview {
    ContentView()
}
