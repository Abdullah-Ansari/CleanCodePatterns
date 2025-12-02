//
//  DownloadManagerWithSemaphore.swift
//  Swift-Design-Patterns-and-SOLID
//
//  Created by Abdullah Ansari on 02/12/25.
//

import Foundation

final class DownloadManagerWithSemaphore {
    static let shared = DownloadManagerWithSemaphore()
    private var activeDownloads: [String] = []
    /// Semaphore with value 1 ensures only one thread can access the shared resource at once
    private let semaphore = DispatchSemaphore(value: 1)
    
    private init() { }
    
    func startDownloads(_ file: String) {
        semaphore.wait()
        activeDownloads.append(file)
        semaphore.signal()
    }
    
    func getActiveDownloads() -> [String] {
        semaphore.wait()
        let downloads = activeDownloads
        semaphore.signal()
        return downloads
    }
}
