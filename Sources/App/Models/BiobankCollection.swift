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
    let diagnosisAvailable: [Diagnosis]
    let biobank: BiobankOrganisation
    let country: Country
    let numberOfDonors: Int?
    
    private enum CodingKeys: String, CodingKey {
        case id, name, diagnosisAvailable = "diagnosis_available", biobank, country, numberOfDonors = "number_of_donors"
    }
}
