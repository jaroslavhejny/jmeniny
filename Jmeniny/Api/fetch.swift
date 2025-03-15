//
//  fetch.swift
//  Jmeniny
//
//  Created by Jaroslav Hejný on 15/03/2025.
//

import Foundation

class NameViewModel: ObservableObject {
    @Published var jmeniny: ApiResponse?

    func fetchName() {
        guard let url = URL(string: "https://svatkyapi.cz/api/day") else {return}
        URLSession.shared.dataTask(with: url) { data, response, error in
                    guard let data = data else { return }
            do {
                self.jmeniny = try JSONDecoder().decode(ApiResponse.self, from: data)
                UserDefaults(suiteName: "group.cz.jaroslavhejny.jmeniny")?.set(data, forKey: "jmeninyData")
            } catch {
                print("❌ Chyba dekódování JSONu:", error)
            }
                }.resume()
    }
}
