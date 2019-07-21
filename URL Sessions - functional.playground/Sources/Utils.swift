import XCTest

// NB: `@_exported` will make foundation available in our playgrounds
@_exported import Foundation

@discardableResult
public func assertEqual<A: Equatable>(_ lhs: A, _ rhs: A) -> String {
    return lhs == rhs ? "✅" : "❌"
}

@discardableResult
public func assertEqual<A: Equatable, B: Equatable>(_ lhs: (A, B), _ rhs: (A, B)) -> String {
    return lhs == rhs ? "✅" : "❌"
}

public var __: Void {
    print("--")
}

precedencegroup ForwardApplication {
    associativity: left
    higherThan: AdditionPrecedence
}

infix operator |>: ForwardApplication
public func |> <A, B>(x: A, f: (A) -> B) -> B {
    return f(x)
}

precedencegroup ForwardComposition {
    associativity: left
    //higherThan: ForwardApplication
    higherThan: EffectfulComposition
}

precedencegroup EffectfulComposition {
    associativity: left
    higherThan: ForwardApplication
    //lowerThan: ForwardComposition
}

infix operator >>>: ForwardComposition
public func >>> <A, B, C>(
    f: @escaping (A) -> B,
    g: @escaping (B) -> C
    ) -> ((A) -> C) {
    
    return { a in
        g(f(a))
    }
}

infix operator >=>: EffectfulComposition

public func >=> <A, B, C>(
    _ f: @escaping (A) -> (B, [String]),
    _ g: @escaping (B) -> (C, [String])
    ) -> ((A) -> (C, [String])) {
    
    return { a in
        let (b, logs) = f(a)
        let (c, moreLogs) = g(b)
        return (c, logs + moreLogs)
    }
}

public func >=> <A, B, C>(
    _ f: @escaping (A) -> B?,
    _ g: @escaping (B) -> C?
    ) -> ((A) -> C?) {
    
    return { a in
        if let b = f(a) {
            let c = g(b)
            return c
        }
        
        return nil
    }
}

public func incr(_ x: Int) -> Int {
    return x + 1
}

public func square(_ x: Int) -> Int {
    return x * x
}

