//
//  DownloadManagerWtihSerialQueue.swift
//  Swift-Design-Patterns-and-SOLID
//
//  Created by Abdullah Ansari on 01/12/25.
//

import Foundation

// Can prevent the data race condition through the serial queue.

final class DownloadManagerWtihSerialQueue {
    
    static let shared = DownloadManagerWtihSerialQueue()
    private init() { }
    
    private let queue = DispatchQueue(label: "com.download.manager.serial")
    private var activeDownloads: [String] = []
    
    func startDownload(_ file: String) {
        queue.async {
            self.activeDownloads.append(file)
        }
    }
    
    func getActiveDownloads(_ completion: @escaping ([String]) -> ()){
        queue.async {
            /// activeDownloads is private inside this class only
            /// not sharing the actual memory location
            /// instead sending the new copy.
            let snapshot = self.activeDownloads
            completion(snapshot)
        }
    }
}
