@_exported import Foundation


public protocol APIRequest { //: Encodable {
    associatedtype Response: Decodable
    
    /// Endpoint for this request (the last part of the URL)
    var resourceName: String { get }
    
    var request: URLRequest { get }
}

public func decode<T: APIRequest>(request r: T, data: Data) -> Result<T.Response> {
    do {
        let result = try JSONDecoder.init().decode(T.Response.self, from: data)
        return .success(result)
    } catch let error {
        return .failure(error)
    }
}
