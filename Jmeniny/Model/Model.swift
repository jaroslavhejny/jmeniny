import Foundation

public struct ApiResponse: Codable {
    public let date: String
    public let dayNumber: String
    public let dayInWeek: String
    public let monthNumber: String
    public let month: MonthStructure // Toto je definováno ve struktuře MonthStructure
    public let year: String
    public let name: String
    public let isHoliday: Bool
    public let holidayName: String?

    public init(date: String, dayNumber: String, dayInWeek: String, monthNumber: String, month: MonthStructure, year: String, name: String, isHoliday: Bool, holidayName: String?) {
        self.date = date
        self.dayNumber = dayNumber
        self.dayInWeek = dayInWeek
        self.monthNumber = monthNumber
        self.month = month
        self.year = year
        self.name = name
        self.isHoliday = isHoliday
        self.holidayName = holidayName
    }
}

public struct MonthStructure: Codable {
    public let nominative: String
    public let genitive: String

    public init(nominative: String, genitive: String) {
        self.nominative = nominative
        self.genitive = genitive
    }
}
