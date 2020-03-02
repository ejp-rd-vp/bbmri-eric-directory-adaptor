import Vapor
import MolgenisClient

public func routes(_ router: Router) throws {
    let catalog = Environment.get("directoryURL") ?? "https://directory.bbmri-eric.eu/"
    guard let url = URL(string: catalog) else { fatalError("Failed to configure remote endpoint. Set directoryURL.")}
    let local = Environment.get("localURL") ?? "http://localhost:8080/"
    guard let localURL = URL(string: local) else { fatalError("Failed to configure local endpoint. Set localURL.")}
    
    let molgenis = try MolgenisClient(baseURL: url)
    let controller = DCATController(client: molgenis, directoryURL: url, localURL: localURL)
    router.get("/dataset", String.parameter, use: controller.dataset)
    router.get("/catalog", use: controller.catalog)
}
