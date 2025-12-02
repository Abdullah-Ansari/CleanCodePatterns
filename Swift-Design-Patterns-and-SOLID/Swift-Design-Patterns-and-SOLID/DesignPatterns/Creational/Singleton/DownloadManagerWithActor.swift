//
//  DownloadManagerWithActor.swift
//  Swift-Design-Patterns-and-SOLID
//
//  Created by Abdullah Ansari on 02/12/25.
//

import Foundation

actor DownloadManagerWithActor {
    static let shared = DownloadManagerWithActor()
    
    private init() { }
    
    private var activeDownloads: [String] = []
    
    func startDownload(_ file: String) {
        activeDownloads.append(file)
        print("Started: \(file)")
    }
    
    func getActiveDownload() -> [String] {
        return activeDownloads
    }
}
