/*
 * Copyright (C) 2017 Dmitry Belousov
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

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
