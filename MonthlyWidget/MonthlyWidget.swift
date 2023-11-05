//
//  MonthlyWidget.swift
//  MonthlyWidget
//
//  Created by Alexander on 29.10.2023.
//

import WidgetKit
import SwiftUI

struct MonthlyWidget: Widget {
    let kind: String = "MontghlyWidget"

    var body: some WidgetConfiguration {
		IntentConfiguration(kind: kind, intent: ChangeFontIntent.self, provider: Provider()) { entry in
			MonthlyWidgetEntryView(entry: entry)
				.containerBackgroundForWidget {
					Color.clear
				}
        }
        .configurationDisplayName("Monthly style widget")
        .description("The theme of the widget changes based on month.")
		.supportedFamilies([.systemSmall])
		.contentMarginsDisabled()
    }
}

#Preview(as: .systemSmall) {
	MonthlyWidget()
} timeline: {
	DayEntry(date: Date(month: .january), showFuntFont: true)
	DayEntry(date: Date(month: .february))
	DayEntry(date: Date(month: .march))
	DayEntry(date: Date(month: .april))
	DayEntry(date: Date(month: .may))
	DayEntry(date: Date(month: .june))
	DayEntry(date: Date(month: .july))
	DayEntry(date: Date(month: .august))
	DayEntry(date: Date(month: .september))
	DayEntry(date: Date(month: .october))
	DayEntry(date: Date(month: .november))
	DayEntry(date: Date(month: .december))
}
