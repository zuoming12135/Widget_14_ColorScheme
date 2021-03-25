//
//  MSWidget.swift
//  MSWidget
//
//  Created by Michael_Zuo on 2021/3/23.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
    
        let currentDate = Date()
        
        let session = URLSession.shared
        let url = URL(string: "https://")
        guard let u = url else { return  }
        var request = URLRequest(url: u)
        request.httpMethod = "GET"
        request.timeoutInterval = 20
        let dataTask = session.dataTask(with: request) { (data, response, error) in
        // 处理请求回来的数据
            let entry = SimpleEntry(date: currentDate, configuration: configuration,response: data)
            let timeline = Timeline(entries: [entry], policy: .never)
            
            completion(timeline)
        }
        dataTask.resume()
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
    let response : Any
}

struct MSWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        Page1()
    }
}

@main
struct MSWidget: Widget {
    let kind: String = "MSWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            MSWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemMedium])
    }
}

struct MSWidget_Previews: PreviewProvider {
    static var previews: some View {
        MSWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
