//
//  File.swift
//  
//
//  Created by Esther van Enckevort on 24-02-2020.
//

import Foundation
import MolgenisClient

struct Diagnosis: Entity {
    static var _entityName: String = "eu_bbmri_eric_disease_types"
    var _id: String { id }
    var _label: String { id }
    let id: String
    
}
