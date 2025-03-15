//
//  NameViewModel.swift
//  Jmeniny
//
//  Created by Jaroslav Hejný on 15/03/2025.
//


import SwiftUI

class NameViewModel: ObservableObject {
    @Published var jmeniny: ApiResponse?

    func fetchName() {
        // Zde získej data z API (nebo jiného zdroje) a ulož je do UserDefaults
        let apiResponse = ApiResponse(date: "2025-03-15", dayNumber: "15", dayInWeek: "sobota", monthNumber: "3", month: MonthStructure(nominative: "březen", genitive: "března"), year: "2025", name: "Ida", isHoliday: false, holidayName: nil)
        
        if let encoded = try? JSONEncoder().encode(apiResponse) {
            UserDefaults(suiteName: "group.cz.jaroslavhejny.jmeniny")?.set(encoded, forKey: "jmeninyData")
        }
    }
}

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
