//
//  Date+Extensions.swift
//  whatsapp-clone
//
//  Created by Radu Petrisel on 23.04.2024.
//

import Foundation

extension Date {
    var chatHeader: String {
        if Calendar.current.isDateInToday(self) {
            return "Today"
        }
        
        if Calendar.current.isDateInYesterday(self) {
            return "Yesterday"
        }
        
        return formatted(date: .numeric, time: .omitted)
    }
}
