//
//  DeleteStudentScene.swift
//  DZIntranet
//
//  Created by Christian Valdivia on 26/04/22.
//

import Foundation

class DeleteStudentScene: Scene {
    
    var inputs = DeleteStudentSceneInputs()
    
    override func drawView() {
        super.drawView()
        self.deleteStudent()
    }
    
    private func getSearchKey() -> Student? {
        let searchKey = self.inputs.txtSearch.getInput()
        guard let student = StudentsDataSource.shared.searchByKey(searchKey) else {
            print("\nNo se encontraron resultado para: \(searchKey)")
            return nil
        }
        return student
    }
    
    private func showStudent(_ student: Student) {
        
        let content = """
        
        Nombre: \(student.name)
        Apellido: \(student.lastName)
        Dirección: \(student.address)
        \(student.document.type.information.name): \(student.document.number)
        
        """
        
        print(content)
    }
    
    private func deleteStudent() {
        if let studentFound = getSearchKey() {
            self.showStudent(studentFound)
               
            var answer = self.inputs.txtQuestion.getInput().uppercased()
            
            if answer == "S" {
                StudentsDataSource.shared.deleteStudent(studentFound)
                print(" Alumno(a) eliminado...")
            } else if answer == "N" {
                print(" Alumno(a) NO eliminado...")
            } else {
                answer = self.inputs.txtQuestion.getInput()
            }
        }
           
        self.backScene()
    }
}
