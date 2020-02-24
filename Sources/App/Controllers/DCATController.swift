//
//  DCATController.swift
//  App
//
//  Created by David van Enckevort on 01/08/2019.
//

import Foundation
import Vapor
import MolgenisClient
import Combine

class DCATController {
    func catalog(_ req: Request) throws -> Vapor.Future<Catalog> {
        let promise = req.eventLoop.newPromise(of: Catalog.self)
        var datasets = [URL]()
        let location = Location(city: "Graz", country: "AT")
        let publisher = Publisher(name: "BBMRI-ERIC", location: location)
        client.get(with: Subscribers.Sink<BiobankCollection, Error>(receiveCompletion: {  (completion) in
            switch completion {
            case .failure(let error):
                promise.fail(error: error)
            case.finished:
                let catalog = Catalog(id: self.directoryURL, datasets: datasets, publisher: publisher)
                promise.succeed(result: catalog)
            }
        }) { (collection) in
            let url = self.localURL.appendingPathComponent("dataset").appendingPathComponent(collection.id)
            datasets.append(url)
        })
        return promise.futureResult
    }

    func dataset(_ req: Request) throws -> Vapor.Future<Dataset> {
        
        let promise = req.eventLoop.newPromise(of: Dataset.self)
        let id = try req.parameters.next(String.self)
        client.get(id: id, with: Subscribers.Sink<BiobankCollection, Error>(receiveCompletion: {(_) in}) {
            (collection) in
            let id = self.directoryURL.appendingPathComponent("/api/v2/eu_bbmri_eric_collections").appendingPathComponent(collection.id)
            var themes = [Theme]()
            let publisher = Publisher(name: collection.biobank._label, location: <#T##Location#>)
            let numberOfPatiens = collection.
            let dataset = Dataset(id: url, name: collection.name, theme: themes, publisher: <#T##Publisher#>, numberOfPatients: <#T##Int#>)
        })
        return promise.futureResult
    }

    init(client: MolgenisClient, directoryURL: URL, localURL: URL) {
        self.client = client
        self.directoryURL = directoryURL
        self.localURL = localURL
    }

    private let directoryURL: URL
    private let client: MolgenisClient
    private let localURL: URL
}
