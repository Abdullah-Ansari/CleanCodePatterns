//
//  DownloadManagerWithLock.swift
//  Swift-Design-Patterns-and-SOLID
//
//  Created by Abdullah Ansari on 02/12/25.
//

import Foundation

final class DownloadManagerWtihLock {
    static let shared = DownloadManagerWtihLock()
    private var activeDownloads: [String] = []
    private var lock = NSLock()
    
    private init() { }
    
    func startDownload(_ file: String) {
        lock.lock()
        activeDownloads.append(file)
        lock.unlock()
    }
    
    func getActiveDownloads() -> [String] {
        lock.lock()
        let downloads = activeDownloads
        lock.unlock()
        return downloads
    }
}
