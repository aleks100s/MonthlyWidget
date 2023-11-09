//
//  ChangeFontIntent.swift
//  MonthlyWidgetExtension
//
//  Created by Alexander on 09.11.2023.
//

import AppIntents

struct ChangeFontIntent: AppIntent, WidgetConfigurationIntent {
	static let title: LocalizedStringResource = "Fun Font"
	static let description: IntentDescription? = "Switch to a fun font"
	
	@Parameter(title: "Fun Font")
	var funFont: Bool
}
