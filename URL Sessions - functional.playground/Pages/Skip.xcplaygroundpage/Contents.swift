//: [Previous](@previous)

import Foundation

let fSkip =
    "www.localhost.it?a=1&b=ciao&skip=5"
        |> getQueryStringComponents
        >>> getSkip
        >=> map

fSkip

let url = "https://community.fandom.com/api/v1/Wikis/List?expand=1" |> URL.init(string:)

url! |> urlRequest(of:)
