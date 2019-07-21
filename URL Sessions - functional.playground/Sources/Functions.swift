@_exported import Foundation

public func urlRequest(of url: URL?) -> URLRequest {
    return URLRequest.init(url: url!)
}

//public func urlRequest() -> (URL?) -> URLRequest {
//    return { url in
//        URLRequest.init(url: url!)
//    }
//}

public func getQueryStringComponents(url: String) -> [NSURLQueryItem]? {
    guard let urlComponents = NSURLComponents(string: url),
        let queryItems = urlComponents.queryItems as [NSURLQueryItem]? else {
            return nil
    }
    
    return queryItems
}

public func getSkip(items: [NSURLQueryItem]?) -> String? {
    return items?.filter { $0.name == "skip" }.first?.value
}

public func getParameter(_ items: [NSURLQueryItem]?, p: String) -> String? {
    return items?.filter { $0.name == p }.first?.value
}

public func map(s: String) -> Int? {
    return Int(s)
}

public func map(s: String) -> (Int, String) {
    return (Int(s) ?? 0, s)
}
