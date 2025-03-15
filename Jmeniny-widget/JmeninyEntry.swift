import WidgetKit
import SwiftUI

struct JmeninyEntry: TimelineEntry {
    let date: Date
    let jmeninyData: ApiResponse?
    // Přidej relevanci jako vlastnost (pokud ji chceš využít)
    var relevance: TimelineEntryRelevance? = TimelineEntryRelevance(score: 1) // správně bez ()
}

struct JmeninyProvider: TimelineProvider {
    
    // Placeholder, co widget zobrazuje, než se data načtou
    func placeholder(in context: Context) -> JmeninyEntry {
        JmeninyEntry(date: Date(), jmeninyData: nil)
    }
    
    // Získání snapshotu pro widget
    func getSnapshot(in context: Context, completion: @escaping (JmeninyEntry) -> Void) {
        let entry = JmeninyEntry(date: Date(), jmeninyData: loadFromUserDefaults())
        completion(entry)
    }
    
    // Získání timeline pro widget
    func getTimeline(in context: Context, completion: @escaping (Timeline<JmeninyEntry>) -> Void) {
        let entry = JmeninyEntry(date: Date(), jmeninyData: loadFromUserDefaults())
        let timeline = Timeline(entries: [entry], policy: .after(Date().addingTimeInterval(3600))) // obnoví za hodinu
        completion(timeline)
    }
    
    // Funkce pro načítání dat z UserDefaults
    private func loadFromUserDefaults() -> ApiResponse? {
        if let data = UserDefaults(suiteName: "group.cz.jaroslavhejny.jmeniny")?.data(forKey: "jmeninyData"),
           let decoded = try? JSONDecoder().decode(ApiResponse.self, from: data) {
            print(decoded)
            return decoded
        }
        return nil
    }
}


