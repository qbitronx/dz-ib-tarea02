//
//  Student.swift
//  DZIntranet
//
//  Created by Kenyi Rodriguez on 19/04/22.
//

import Foundation

struct Student {
    let name: String
    let lastName: String
    let address: String
    let document: Document

    var fullName: String {
        "\(self.lastName), \(self.name)".lowercased().capitalized
    }
    
    var placeholder: String {
        let placeName = self.name.prefix(1).uppercased()
        let placeLastName = self.lastName.prefix(1).uppercased()
        return placeName + placeLastName
    }
}

extension Student {
    struct Document : Equatable {
        let type: DocumentType
        let number: String
        
        static func ==(d1: Document, d2: Document) -> Bool {
            let areEqual = d1.type == d2.type && d1.number == d2.number
            return areEqual
        }
    }
    
}

extension Student : Equatable {}
  
func ==(s1: Student, s2: Student) -> Bool {
    let areEqual = s1.name == s2.name && s1.lastName == s2.lastName && s1.document == s2.document
        return areEqual
}

