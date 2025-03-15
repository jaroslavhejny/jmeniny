//
//  JmeninyWidgetView.swift
//  Jmeniny
//
//  Created by Jaroslav Hejný on 15/03/2025.
//


import WidgetKit
import SwiftUI

struct JmeninyWidgetView: View {
    var entry: JmeninyProvider.Entry

    var body: some View {
        VStack {
            Text("Jmeniny: \(entry.jmeninyData?.name ?? "Není k dispozici")")
                .font(.headline)
                .padding()
            Text("Datum: \(entry.jmeninyData?.date ?? "")")
            Text("\(entry.jmeninyData?.dayInWeek ?? "den") \(entry.jmeninyData?.dayNumber ?? "")")
                .font(.subheadline)
        }
        .widgetURL(URL(string: "your-app-url://")) // Můžeš přidat URL, která otevře aplikaci při kliknutí
        .containerBackground(for: .widget) {
            background(Color.clear)
        }
    }
}

@main
struct JmeninyWidget: Widget {
    let kind: String = "JmeninyWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: JmeninyProvider()) { entry in
            JmeninyWidgetView(entry: entry)
        }
        .configurationDisplayName("Jmeniny Widget")
        .description("Zobrazuje aktuální jmeniny.")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}

#Preview(as: .systemMedium, widget: {
    JmeninyWidget()
}, timeline: {
    JmeninyEntry(date: Date(), jmeninyData: nil)
})
