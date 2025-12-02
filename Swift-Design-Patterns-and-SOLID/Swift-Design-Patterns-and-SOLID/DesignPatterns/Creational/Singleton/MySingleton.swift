//
//  MySingleton.swift
//  Swift-Design-Patterns-and-SOLID
//
//  Created by Abdullah Ansari on 01/12/25.
//

import Foundation

// `static let shared` is lazily initialized.
// Swift guarantees that static initialization is thread-safe.
// So only one instance of MySingleton is ever created,
// even if multiple threads access `shared` at the same time.
// After initialization, all threads access the same global instance.


final class MySingleton {

    // `static let` is lazily initialized and thread-safe by Swift runtime.
    // Only one instance of MySingleton will ever be created.
    static let shared = MySingleton()
    
    // Private initializer prevents creating new instances from outside.
    private init() { }

    func myMethod() {
        debugPrint("My Singleton class's functionality.")
    }
}
