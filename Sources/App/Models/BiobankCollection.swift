//
//  Collection.swift
//  App
//
//  Created by David van Enckevort on 01/08/2019.
//

import Foundation
import MolgenisClient

struct BiobankCollection: Entity {
    static var _entityName = "eu_bbmri_eric_collections"
    
    var _id: String { id }
    var _label: String { name }
    
    let id: String
    let name: String
    let diagnosis_available: [Diagnosis]
    let biobank: BiobankOrganisation
}
