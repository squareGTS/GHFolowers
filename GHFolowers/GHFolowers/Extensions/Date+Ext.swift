//
//  Date+Ext.swift
//  GHFolowers
//
//  Created by Maxim Bekmetov on 19.09.2022.
//

import Foundation

extension Date {

//    func convertToMonthYearFormat() -> String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "MMM yyyy"
//        return dateFormatter.string(from: self)
//    }

    func convertToMonthYearFormat() -> String {
        return formatted(.dateTime.month().year())
    }
}
