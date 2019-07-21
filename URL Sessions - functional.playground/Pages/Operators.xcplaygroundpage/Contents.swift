import UIKit

import Foundation
import PlaygroundSupport

// If this 404s, replace with a URL to any other large file
/// https://sj-solutions.s3-eu-west-1.amazonaws.com/434159/stage/bundles/app/assets/images/home-firenzerock.jpg

/// "https://speed.hetzner.de/1GB.bin"

let bigFile = URL(string: "https://sj-solutions.s3-eu-west-1.amazonaws.com/434159/stage/bundles/app/assets/images/home-firenzerock.jpg")!
let wikiList = URL(string: "https://community.fandom.com/api/v1/Wikis/List?expand=1")!

//URL(string: "https://community.fandom.com/api/v1/Wikis/List?expand=1") |> URLRequest.init(url:)


//task01.resume()

//let myTask = URLSession.shared.dataTask(with: wikiList) { (data, response, error) in
//    print("data:", data as Any)
//    print("response:", response as Any)
//    print("error:", error as Any)
//
////    guard let data = data else {
////        return
////    }
//
//    //dump(String.init(data: data, encoding: .utf8))
//}
//
//myTask.resume()

// Cancel download after a few seconds
//DispatchQueue.main.asyncAfter(deadline: .now() + 30) {
//     myTask.cancel()
//}

PlaygroundPage.current.needsIndefiniteExecution = true
