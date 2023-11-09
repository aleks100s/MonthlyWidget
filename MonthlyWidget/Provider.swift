//
//  Provider.swift
//  MonthlyWidgetExtension
//
//  Created by Alexander on 29.10.2023.
//

import WidgetKit

struct Provider: AppIntentTimelineProvider {
	func placeholder(in context: Context) -> DayEntry {
		DayEntry(date: Date())
	}
	
	func snapshot(for configuration: ChangeFontIntent, in context: Context) async -> DayEntry {
		DayEntry(date: Date())
	}
	
	func timeline(for configuration: ChangeFontIntent, in context: Context) async -> Timeline<DayEntry> {
		var entries: [DayEntry] = []
		
		let showFuntFont = configuration.funFont
		
		let currentDate = Date()
		for dayOffset in 0 ..< 7 {
			let entryDate = Calendar.current.date(byAdding: .day, value: dayOffset, to: currentDate)!
			let startOfDate = Calendar.current.startOfDay(for: entryDate)
			let entry = DayEntry(date: startOfDate, showFuntFont: showFuntFont)
			entries.append(entry)
		}

		let timeline = Timeline(entries: entries, policy: .atEnd)
		return timeline
	}
}
