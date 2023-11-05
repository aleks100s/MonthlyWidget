//
//  MonthlyWidgetEntryView.swift
//  MonthlyWidgetExtension
//
//  Created by Alexander on 29.10.2023.
//

import SwiftUI

struct MonthlyWidgetEntryView: View {
	let entry: DayEntry
	let config: MonthConfig
	
	private let funFontName = "Chalkduster"
	
	init(entry: DayEntry) {
		self.entry = entry
		self.config = MonthConfig.determineConfig(from: entry.date)
	}

	var body: some View {
		ZStack {
			ContainerRelativeShape()
				.fill(config.backgroundColor.gradient)
			
			VStack {
				HStack(spacing: 4) {
					Text(config.emojiText)
						.font(.title)
					Text(entry.date.weekdayDisplayFormat)
						.font(entry.showFuntFont ? .custom(funFontName, size: 24) : .title3)
						.fontWeight(.bold)
						.minimumScaleFactor(0.6)
						.foregroundStyle(config.weekdayTextColor)
					Spacer()
				}
				
				Text(entry.date.dayDisplayFormat)
					.font(entry.showFuntFont ? .custom(funFontName, size: 80) : .system(size: 80, weight: .heavy))
					.foregroundStyle(config.dayTextColor)
			}
			.padding()
		}
	}
}

