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
	
	@Environment(\.showsWidgetContainerBackground) var showsWidgetBackground
	@Environment(\.widgetRenderingMode) var renderingMode
	
	private let funFontName = "Chalkduster"
	
	private var isVibrant: Bool {
		renderingMode == .vibrant
	}
	
	init(entry: DayEntry) {
		self.entry = entry
		self.config = MonthConfig.determineConfig(from: entry.date)
	}

	var body: some View {
		VStack {
			HStack(spacing: 4) {
				Text(config.emojiText)
					.font(.title)
				Text(entry.date.weekdayDisplayFormat)
					.font(entry.showFuntFont ? .custom(funFontName, size: 24) : .title3)
					.fontWeight(.bold)
					.minimumScaleFactor(0.6)
					.foregroundStyle(showsWidgetBackground ? config.weekdayTextColor : .white)
				Spacer()
			}
			.id(entry.date)
			.transition(.push(from: .trailing))
			.animation(.bouncy, value: entry.date)
			
			Text(entry.date.dayDisplayFormat)
				.font(entry.showFuntFont ? .custom(funFontName, size: 80) : .system(size: 80, weight: .heavy))
				.foregroundStyle(showsWidgetBackground ? config.dayTextColor : .white)
				.contentTransition(.numericText())
		}
		.containerBackgroundForWidget {
			ContainerRelativeShape()
				.fill(config.backgroundColor.gradient)
		}
	}
}

