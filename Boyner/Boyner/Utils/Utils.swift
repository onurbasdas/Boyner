//
//  Utils.swift
//  Boyner
//
//  Created by Onur Başdaş on 16.10.2023.
//

import UIKit

class Utils {
    
    static let shared = Utils()
    
    lazy var iso8601DateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    
    func getDate(label: UILabel, dateStr: String) {
        if let date = Utils.shared.iso8601DateFormatter.date(from: dateStr) {
            let timeFormatter = DateFormatter()
            timeFormatter.dateFormat = "HH:mm:ss"
            label.text = timeFormatter.string(from: date)
        }
    }
    
    func addToReadList(withTitle title: String) {
        var readList = UserDefaults.standard.array(forKey: "ReadList") ?? []
        readList.append(title)
        UserDefaults.standard.set(readList, forKey: "ReadList")
    }
    
    func removeFromReadList(withTitle title: String) {
        if var readList = UserDefaults.standard.array(forKey: "ReadList") as? [String] {
            if let index = readList.firstIndex(of: title) {
                readList.remove(at: index)
                UserDefaults.standard.set(readList, forKey: "ReadList")
            }
        }
    }
    
    func getReadList() -> [String] {
        return UserDefaults.standard.array(forKey: "ReadList") as? [String] ?? []
    }
    
    func userIsInReadList(withTitle title: String) -> Bool {
        let readList = UserDefaults.standard.stringArray(forKey: "ReadList") ?? []
        return readList.contains(title)
    }
    
    func addOrRemove(withTitle title: String) {
        if getReadList().contains(title) {
            removeFromReadList(withTitle: title)
        } else {
            addOrRemove(withTitle: title)
        }
        
    }
}
