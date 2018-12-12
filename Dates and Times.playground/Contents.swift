import Foundation


// 2 MAIN ROLES
// - PARSING   string/int ---> DATE
// - DISPLAYING  Date -> String  (locale)


let input = "2018-12-10T17:29:50Z"
//  yyyy-MM-dd'T'HH:mm:ssZ   ISO 8601

let formatter = DateFormatter()
formatter.locale = Locale(identifier: "en_US_POSIX")
formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
if let date = formatter.date(from: input) {
    print(date)
    
    let displayFormatter = DateFormatter()
    displayFormatter.locale = Locale(identifier: "de_DE")
    displayFormatter.dateStyle = .short
    print(displayFormatter.string(from: date))
    
}

let input2 = "2018-12-10"
let formatter2 = DateFormatter()
formatter2.dateFormat = "yyyy-MM-dd"
if let date2 = formatter2.date(from: input2) {
    print(date2)
}

let secondsSince1970: TimeInterval = 1544467835.124124
Date(timeIntervalSince1970: secondsSince1970)


struct Issue : Encodable {
    let title: String
    let createdAt: Date
}

let issue = Issue(title: "My issue", createdAt: Date())
let encoder = JSONEncoder()
encoder.outputFormatting = .prettyPrinted

let fullISO8610Formatter = DateFormatter()
fullISO8610Formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
encoder.dateEncodingStrategy = .formatted(fullISO8610Formatter)

let data = try! encoder.encode(issue)
print(String(data: data, encoding: .utf8)!)

