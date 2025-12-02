//
//  DownloadManagerWithBarrier.swift
//  Swift-Design-Patterns-and-SOLID
//
//  Created by Abdullah Ansari on 02/12/25.
//

import Foundation

final class DownloadManagerWithBarrier {
    static let shared = DownloadManagerWithBarrier()
    private var activeDownloads: [String] = []
    private let queue = DispatchQueue(label: "com.download.manager.concurrent", attributes: .concurrent)
    
    private init() { }
    
    func startDownload(_ file: String) {
        queue.async(flags: .barrier) {
            // Write exclusive
            self.activeDownloads.append(file)
        }
    }
    
    func getActiveDownloads(completion: @escaping ([String]) -> ()) {
        queue.async {
            let downloads = self.activeDownloads
            completion(downloads)
        }
    }
    
}
