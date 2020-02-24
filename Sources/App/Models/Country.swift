//
//  File.swift
//  
//
//  Created by Esther van Enckevort on 24-02-2020.
//

import Foundation
import MolgenisClient

struct Country: Entity {
    static var _entityName: String = "eu_bbmri_eric_countries"
    
    var _id: String { id }
    
    var _label: String { name }
    
    let name: String
    let id: String
}
