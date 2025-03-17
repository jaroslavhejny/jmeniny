//
//  ContentView.swift
//  Jmeniny
//
//  Created by Jaroslav Hejný on 15/03/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = NameViewModel()
    @State private var lastUpdated: String?
    var body: some View {
        ScrollView {
            VStack {
                Text("\(viewModel.jmeniny?.dayNumber ?? ""). \(viewModel.jmeniny?.month.genitive ?? "") ")
                Text(viewModel.jmeniny?.name ?? "NIKDO")
                    .font(.largeTitle)
                    .frame(minWidth: 200)
                    .padding()
                    .background(Color(red: 0.2706, green: 0.5765, blue: 0.8157, opacity: 1.0))
                    .cornerRadius(20)
                Text(viewModel.jmeniny?.dayInWeek ?? "sobota")
                Text(self.lastUpdated ?? "")
            }
            .padding(300)
            .background(Color(red: 0.2, green: 0.76, blue: 0.365, opacity: 0.3))
        }
        .frame(height: nil)
        .onAppear {
            viewModel.fetchName()
            self.lastUpdated = Date.now.formatted(date: .omitted, time: .shortened)
        }
        .refreshable {
            viewModel.fetchName()
            self.lastUpdated = Date.now.formatted(date: .omitted, time: .shortened)
            
            UserDefaults(suiteName: "group.cz.jaroslavhejny.jmeniny")?.set(Date.now.formatted(date: .omitted, time: .shortened), forKey: "lastRefresh")
        }
    }
        
}

#Preview {
    ContentView()
}
