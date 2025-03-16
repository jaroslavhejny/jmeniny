//
//  ContentView.swift
//  Jmeniny
//
//  Created by Jaroslav Hejný on 15/03/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = NameViewModel()
    var body: some View {
        VStack {
            Text("\(viewModel.jmeniny?.dayNumber ?? ""). \(viewModel.jmeniny?.month.genitive ?? "") ")
            Text(viewModel.jmeniny?.name ?? "NIKDO")
                .font(.largeTitle)
                .frame(minWidth: 200)
                .padding()
                .background(Color.gray)
                .cornerRadius(20)
            Text(viewModel.jmeniny?.dayInWeek ?? "sobota")
                         
        }
        
        
        .onAppear(){
            viewModel.fetchName()
        }
    }
        
}

#Preview {
    ContentView()
}
