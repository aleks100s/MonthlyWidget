//
//  Date+.swift
//  MontghlyWidgetExtension
//
//  Created by Alexander on 29.10.2023.
//

import Foundation

extension Date {
	var weekdayDisplayFormat: String {
		formatted(.dateTime.weekday(.wide))
	}
	
	var dayDisplayFormat: String {
		formatted(.dateTime.day())
	}
}

extension Date {
	enum Month: Int, CaseIterable {
		case january = 1
		case february, march, april,  may, june, july, august, september, october, november, december
	}
	
	init(month: Month) {
		let components = DateComponents(month: month.rawValue, day: Int.random(in: 0 ..< 31))
		self = Calendar.current.date(from: components)!
	}
}
