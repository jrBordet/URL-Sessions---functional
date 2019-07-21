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

public func perform<T: APIRequest>(request r: T, retry: Int? = 0, completion: @escaping ResultCompletion<T.Response>) -> URLSessionDataTask {
    let task = URLSession.shared.dataTask(with: r.request) { (data: Data?, response: URLResponse?, error: Error?) in
        guard let data = data else {
            return
        }
        
        print("Attempt \(retry ?? 0)")
        print(r.request.debugDescription)
        
        if let statusCode = HTTPStatusCodes.decode(from: response) {
            dump(statusCode)
            switch statusCode {
            case .Unauthorized, .Ok:
                if let retry = retry, retry > 0 {
                    //perform(request: r, retry: retry - 1, completion: completion)
                    
                    return
                }
                return
            default:
                break
            }
        }
        
        //dump(String.init(data: data, encoding: .utf8))
        
        completion(decode(request: r, data: data))
    }
    
    task.resume()
    
    return task
}

// ResultCompletion<T.Response>
// public typealias ResultCompletion<Value> = (Result<Value>) -> Void

// public func perform<T: APIRequest>(request r: T, retry: Int? = 0, completion: @escaping ResultCompletion<T.Response>) -> URLSessionDataTask {


public func performCurrying<T: APIRequest>(request r: T) -> (Int) -> Result<Wiki> {
    return { (retry: Int) in
        return Result.success(Wiki(name: "",
                                   wordmark: "",
                                   desc: ""))
    }
}


/*
 func add(a: Int) -> (Int) -> Int {
     return { b in
     a + b
     }
 }
 */
