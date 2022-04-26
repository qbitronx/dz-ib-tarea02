//
//  DeleteStudentSceneInputs.swift
//  DZIntranet
//
//  Created by Christian Valdivia on 26/04/22.
//

import Foundation

struct DeleteStudentSceneInputs {
    
    lazy var txtSearch: Input.Text = {
        
        let message = """
                        
        Ingrese el dato por cual usted desea buscar al alumno, puede buscar por:
        
        (*) - DNI
        (*) - Nombre
        (*) - Apellido
        
        """
        
        return Input.Text(message: message,
                   errorMessage: "El dato de búsqueda es incorrecto",
                   minLength: 1)
    }()
    
    lazy var txtQuestion: Input.Text = {
        
        let message = """

        Desea eliminar al Alumno(a)?:
        S - Si
        N - No
        
        """
        
        return Input.Text(message: message, errorMessage: "Respuesta incorrecta", minLength: 1, maxLength: 1)
    }()
}
