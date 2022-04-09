//
//  ContentView.swift
//  GrazerTestCode
//
//  Created by Atli Saevar on 8.4.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            LoginView()
                .navigationTitle("Login screen")
        }
    }
}

struct LoginView: View {
    var body: some View {
        NavigationLink {
            UserListView()
                .navigationTitle("Users")
        } label: {
            Text("Login")
        }
    }
}

struct UserListView: View {
    @State var users: [User] = []

    var body: some View {
        List(users) { user in
            Text(user.name)
        }
        .onAppear {
            Api().fetchUsers { userResponse in
                self.users = userResponse.data.users
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
    }
}
