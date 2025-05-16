//
//  Date+Extension.swift
//  Trackme
//
//  Created by Liam Arbuckle on 16/5/2025.
//

import Foundation

extension Date {
    
    /// Converts the date's month to a full month name (e.g., "May").
    func monthToString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "LLLL"
        return formatter.string(from: self)
    }
    
    /// Converts the date to a string using the provided date format.
    func toString(format: String) -> String {
        let formatter = DateFormatter()
        formatter.calendar = Calendar.current
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    /// Returns the date for yesterday.
    var yesterday: Date {
        Calendar.current.date(byAdding: .day, value: -1, to: self)!
    }
    
    /// Returns the date for tomorrow.
    var tomorrow: Date {
        Calendar.current.date(byAdding: .day, value: 1, to: self)!
    }

    /// Checks if the date is equal to another date with the specified granularity.
    private func isEqual(to date: Date, toGranularity component: Calendar.Component, in calendar: Calendar = .current) -> Bool {
        var customCalendar = Calendar(identifier: .gregorian)
        customCalendar.firstWeekday = 2 // Monday as first weekday
        return customCalendar.isDate(self, equalTo: date, toGranularity: component)
    }

    /// Checks if two dates fall within the same week.
    func isInSameWeek(as date: Date) -> Bool {
        isEqual(to: date, toGranularity: .weekOfYear)
    }

    /// Checks if two dates are on the same day.
    func isInSameDay(as date: Date) -> Bool {
        isEqual(to: date, toGranularity: .day)
    }
}
