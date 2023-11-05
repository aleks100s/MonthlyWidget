//
//  Provider.swift
//  MonthlyWidgetExtension
//
//  Created by Alexander on 29.10.2023.
//

import WidgetKit

struct Provider: IntentTimelineProvider {
	func placeholder(in context: Context) -> DayEntry {
		DayEntry(date: Date())
	}

	func getSnapshot(for configuration: ChangeFontIntent, in context: Context, completion: @escaping (DayEntry) -> ()) {
		let entry = DayEntry(date: Date())
		completion(entry)
	}

	func getTimeline(for configuration: ChangeFontIntent, in context: Context, completion: @escaping (Timeline<DayEntry>) -> ()) {
		var entries: [DayEntry] = []
		
		let showFuntFont = configuration.funFont == 1
		
		let currentDate = Date()
		for dayOffset in 0 ..< 7 {
			let entryDate = Calendar.current.date(byAdding: .day, value: dayOffset, to: currentDate)!
			let startOfDate = Calendar.current.startOfDay(for: entryDate)
			let entry = DayEntry(date: startOfDate, showFuntFont: showFuntFont)
			entries.append(entry)
		}

		let timeline = Timeline(entries: entries, policy: .atEnd)
		completion(timeline)
	}
}
