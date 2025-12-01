//
//  DownloadManager.swift
//  Swift-Design-Patterns-and-SOLID
//
//  Created by Abdullah Ansari on 01/12/25.
//

import Foundation

/// Race Condition - Two or more threads access the same variable at the same time, and at least one of them writes

final class DownloadManager {
    static let shared = DownloadManager()
    
    private init() { }
    
    // activeDownloads is a shared mutable variable.
    // If multiple threads try to update this value at the same time,
    // the final result may become incorrect.
    //
    // Example:
    // Thread 1 reads: 0
    // Thread 2 reads: 0
    // Thread 1 writes: 1
    // Thread 2 writes: 1
    //
    // Expected result = 2
    // Actual result   = 1
    //
    // This is called a **race condition**.
    // Race condition = unpredictable/incorrect value due to concurrent access.
    private var activeDownloads = 0
    
    func startDownload() {
        activeDownloads += 1 // race condition
    }
    
    func finishDownload() {
        activeDownloads -= 1 // race condition
    }
    
    func currentCount() -> Int {
        return activeDownloads
    }
}
