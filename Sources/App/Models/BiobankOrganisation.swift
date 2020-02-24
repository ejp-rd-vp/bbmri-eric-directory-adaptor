//
//  File.swift
//  
//
//  Created by Esther van Enckevort on 24-02-2020.
//

import Foundation
import MolgenisClient

struct BiobankOrganisation: Entity {
    static var _entityName: String = "eu_bbmri_eric_biobanks"
    
    var _id: String { id }
    
    var _label: String { name }
    
    let id: String
    let name: String
}
