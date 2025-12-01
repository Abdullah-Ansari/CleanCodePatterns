//
//  MySingleton.swift
//  Swift-Design-Patterns-and-SOLID
//
//  Created by Abdullah Ansari on 01/12/25.
//

import Foundation

// static is lazily initialized, And 'shared' is also constant.
// creation of MySingleton is thread safe.
// If more than one thread can access the instance without any race condition.

/*
 '''
     Singleton patterns ensure that only one instance will be created,
     and will be available globally.
 '''
*/

final class MySingleton {
    
    static let shared = MySingleton()
    
    private init() { }
    
    func myMethod() {
        debugPrint("My Singleton class's functionality.")
    }
}
