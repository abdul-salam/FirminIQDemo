//
//  DownloadHandler.swift
//  FirminIQDemo
//
//  Created by abdul salam on 22/04/22.
//

import Foundation
import UIKit

class DownloadHandler {
    
    var session: URLSession!
    var downloadedData: Data?
    var downloadTask: URLSessionDownloadTask!
    
    func downloadImageFrom(_ urlString: String, delegateTo: UIViewController) {
        guard let url = URL(string: urlString) else {
            print("This is an invalid URL")
            return
        }
        session = URLSession(configuration: .default, delegate: delegateTo as? URLSessionDelegate, delegateQueue: OperationQueue())
        downloadTask = session.downloadTask(with: url)
        downloadTask.resume()
    }
    
    func pauseDownload() {
        downloadTask.cancel { data in
            self.downloadedData = data
        }
    }
    
    func resumeDownload() {
        if let data = downloadedData {
            session.downloadTask(withResumeData: data).resume()
        }
    }
}


