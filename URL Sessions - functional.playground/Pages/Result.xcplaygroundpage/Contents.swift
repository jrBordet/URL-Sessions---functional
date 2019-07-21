import Foundation
import PlaygroundSupport


public struct WikiRequest: APIRequest {
    public typealias Response = WikiList
    
    public var resourceName: String = "/Wikis/List?expand=1"
    
    public var request: URLRequest {
        return URLRequest(url: URL(string: "https://community.fandom.com/api/v1\(resourceName)")!)
    }
}


let task = perform(request: WikiRequest(), retry: 3) { result in
    switch result {
    case let .failure(e):
        print("❌ Error")
        dump(e)
    case let .success(content):
        dump(content.items.first!)
    }
}

//let wiki = WikiRequest() |> performCurrying(retry: 3)

//
//switch wiki {
//case let .failure(error):
//    dump(error)
//case let .success(context):
//    dump(context)
//}

WikiRequest() |> performCurrying { result in
    print("currying")
    switch result {
    case let .failure(e):
        print("❌ Error")
        dump(e)
    case let .success(content):
        dump(content.items.first!)
    }
}

performCurrying { r in
    switch r {
    case let .failure(e):
        print("❌ Error")
        dump(e)
    case let .success(content):
        dump(content.items.first!)
    }
}(WikiRequest())

func add(a: Int) -> (Int) -> Int {
    return { b in
        a + b
    }
}

1 |> add(a: 3)


[0, 1, 2, 3].map { $0 |> add(a: 1) >>> add(a: 1) }


PlaygroundPage.current.needsIndefiniteExecution = true








































/*
 
 public func performWithRetry<T: APIRequest>(request r: T, completion: @escaping ResultCompletion<T.Response>) {
 var retry = 0
 
 while retry < 3 {
 print("Attempt\(retry)")
 
 let task = perform(request: r, retry: retry, completion: completion)
 
 retry = retry + 1
 
 task.resume()
 }
 
 return
 }
 
 public func perform<T: APIRequest>(request r: T, retry: Int, completion: @escaping ResultCompletion<T.Response>) -> URLSessionDataTask {
 let task = URLSession.shared.dataTask(with: r.request) { (data: Data?, response: URLResponse?, error: Error?) in
 guard let data = data else {
 return
 }
 
 //(response as HTTPURLResponse).statusCode
 //dump(String.init(data: data, encoding: .utf8))
 
 do {
 let result = try JSONDecoder.init().decode(T.Response.self, from: data)
 completion(.success(result))
 } catch let error {
 completion(.failure(error))
 fatalError(error.localizedDescription)
 }
 }
 
 return task
 }
 
 struct WikiRequest: APIRequest {
 typealias Response = WikiList
 
 var resourceName: String = "/Wikis/List?expand=1"
 
 var request = URLRequest(url: URL(string: "https://community.fandom.com/api/v1/Wikis/List?expand=1")!)
 }
 
 performWithRetry(request: WikiRequest()) { result in
 switch result {
 case let .failure(e):
 print("❌ Error")
 dump(e)
 case let .success(content):
 dump(content.items.first!)
 }
 }
 
 */






/*
 
 func performRequest(of url: URLRequest, completion: @escaping ResultCompletion<Any>) -> URLSessionTask {
 return URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
 guard let data = data else {
 return
 }
 
 do {
 let result = try JSONDecoder.init().decode(WikiList.self, from: data)
 completion(.success(result))
 } catch let error {
 completion(.failure(error))
 fatalError(error.localizedDescription)
 }
 }
 }
 
 let task = performRequest(of: request) { result in
 switch result {
 case let .failure(error):
 dump(error.localizedDescription)
 case let .success(content):
 dump(content)
 }
 }
 
 task.resume()
 
 */




/*
 
 func performRequest(of url: URLRequest, completion: @escaping (Codable) -> ()) -> URLSessionTask {
 return URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
 guard let data = data else {
 return
 }
 
 do {
 let result = try JSONDecoder.init().decode(WikiList.self, from: data)
 //dump(result.items.first)
 completion(result)
 } catch let error {
 fatalError(error.localizedDescription)
 }
 }
 }
 
 */



/*
 
 func performRequest(of url: URLRequest, completion: @escaping (Codable) -> ()) -> URLSessionTask {
 return URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
 guard let data = data else {
 return
 }
 
 //dump(String.init(data: data, encoding: .utf8))
 
 do {
 let result = try JSONDecoder.init().decode(WikiList.self, from: data)
 //dump(result.items.first)
 completion(result)
 } catch let error {
 fatalError(error.localizedDescription)
 }
 }
 }
 
 let task = performRequest(of: request) { list in
 dump(list)
 }
 
 task.resume()
 
 */






/*
 let task = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
 guard let data = data else {
 return
 }
 
 //dump(String.init(data: data, encoding: .utf8))
 
 do {
 let result = try JSONDecoder.init().decode(WikiList.self, from: data)
 dump(result.items.first)
 } catch let error {
 fatalError(error.localizedDescription)
 }
 }
 */


//
//func task(of request: URLRequest) -> URLSessionDataTask {
//    return URLSession.shared.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) in
//        guard let data = data else {
//            return
//        }
//
//        dump(String.init(data: data, encoding: .utf8))
//    })
//}
//
//func taskCompletionHandler(of request: URLRequest, completion: @escaping ((Data?, URLResponse?, Error?) -> Void)) {
//    URLSession.shared.dataTask(with: request,
//                               completionHandler: completion)
//}
