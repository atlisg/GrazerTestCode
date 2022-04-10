//
//  Data.swift
//  GrazerTestCode
//
//  Created by Atli Saevar on 9.4.2022.
//

import Foundation

class Api {
    func requestToken(completionHandler: @escaping (LoginResponse) -> Void) {
        let params = ["email": "asd@asd.es",
                      "password": "1234"] as Dictionary<String, String>
        
        var request = URLRequest(url: URL(string: "https://grazer-test.herokuapp.com/v1/auth/login")!)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
            guard let data = data else { return }
            let loginData: LoginResponse = try! JSONDecoder().decode(LoginResponse.self, from: data)
                
            completionHandler(loginData)
        })
        
        task.resume()
    }
    
    func fetchUsers(completionHandler: @escaping (UserResponse) -> Void) {
        requestToken { (loginData) in
            guard let token = loginData.auth.data.token else { return }

            var request = URLRequest(url: URL(string: "https://grazer-test.herokuapp.com/v1/users")!)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            
            let task = URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
                guard let data = data else { return }
                let userData: UserResponse = try! JSONDecoder().decode(UserResponse.self, from: data)
                    
                completionHandler(userData)
            })
            
            task.resume()
        }
    }
}
