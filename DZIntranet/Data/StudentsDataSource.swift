//
//  StudentsDataSource.swift
//  DZIntranet
//
//  Created by Kenyi Rodriguez on 19/04/22.
//  Add deleteStudent fucntion by Christian Valdivia on 26/04/22
//

import Foundation

struct StudentsDataSource {
    
    static var shared = StudentsDataSource()
    
    private var data = [
        Student(name: "Kenyi", lastName: "Rodriguez", address: "Calle sin fin 666", document: Student.Document(type: .dni, number: "87654321")),
        Student(name: "Fernando", lastName: "Mateo", address: "Calle los olvidados", document: Student.Document(type: .dni, number: "67854321")),
        Student(name: "Daniel", lastName: "Garcia", address: "Calle los charros", document: Student.Document(type: .ce, number: "4567890123"))
    ]
    
    mutating func insert(_ student: Student) {
        self.data.append(student)
    }
    
    mutating func getAll() -> [Student] {
        self.data
    }
    
    mutating func getAllSortedByFullName() -> [Student] {
        self.data.sorted(by: { $0.fullName < $1.fullName })
    }
    
    mutating func searchByKey(_ searchKey: String) -> Student? {
        return self.data.first { student in
            
            let textToSearch = searchKey.lowercased()
            let fullName = student.fullName.lowercased()
            let document = student.document.number.lowercased()
            
            return document.contains(textToSearch) || fullName.contains(textToSearch)
        }
    }
    
    mutating func deleteStudent(_ student: Student) {
        self.data.removeAll(where: {$0 == student})
    }
   

}
