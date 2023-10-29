//
//  Provider.swift
//  MonthlyWidgetExtension
//
//  Created by Alexander on 29.10.2023.
//

import WidgetKit

struct Provider: TimelineProvider {
	func placeholder(in context: Context) -> DayEntry {
		DayEntry(date: Date())
	}

	func getSnapshot(in context: Context, completion: @escaping (DayEntry) -> ()) {
		let entry = DayEntry(date: Date())
		completion(entry)
	}

	func getTimeline(in context: Context, completion: @escaping (Timeline<DayEntry>) -> ()) {
		var entries: [DayEntry] = []
		
		let currentDate = Date()
		for dayOffset in 0 ..< 7 {
			let entryDate = Calendar.current.date(byAdding: .day, value: dayOffset, to: currentDate)!
			let startOfDate = Calendar.current.startOfDay(for: entryDate)
			let entry = DayEntry(date: startOfDate)
			entries.append(entry)
		}

		let timeline = Timeline(entries: entries, policy: .atEnd)
		completion(timeline)
	}
}
