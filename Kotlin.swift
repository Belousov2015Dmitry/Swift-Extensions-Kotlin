import Foundation



protocol Kotlin {}

extension NSObject : Kotlin {}
extension Int : Kotlin {}
extension Float : Kotlin {}
extension Double : Kotlin {}
extension String : Kotlin {}
//etc



extension Kotlin
{
    @inline(__always) func lets<R>(block: @escaping (Self) -> (R)) -> R {
        return block(self)
    }
    
    @inline(__always) func also(block: @escaping (Self) -> Void) -> Self {
        block(self)
        return self
    }
    
    @inline(__always) func takeIf(predicat: @escaping (Self) -> Bool) -> Self? {
        return predicat(self) ? self : nil
    }
    
    @inline(__always) func takeUnless(predicat: @escaping (Self) -> Bool) -> Self? {
        return predicat(self) ? nil : self
    }
}



extension Int
{
    @inline(__always) func repeatAction(action: @escaping (Int) -> Void ) {
        for index in 0..<self {
            action(index)
        }
    }
}
