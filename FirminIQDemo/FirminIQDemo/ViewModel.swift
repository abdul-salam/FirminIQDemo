//
//  ViewModel.swift
//  FirminIQDemo
//
//  Created by abdul salam on 22/04/22.
//

import Foundation
import UIKit

class ViewModel {
    let dataSourceArray = ["https://cdn.wallpapersafari.com/36/6/WCkZue.png",
                           "https://www.iliketowastemytime.com/sites/default/files/hamburg-germany-nicolas-kamp-hd-wallpaper_0.jpg",
                           "https://images.hdqwalls.com/download/drift-transformers-5-the-last-knight-qu-5120x2880.jpg",
                           "https://survarium.com/sites/default/files/calendars/survarium-wallpaper-calendar-february-2016-en-2560x1440.png"]
    private let downloadHandler: DownloadHandler
    
    init(handler: DownloadHandler) {
        self.downloadHandler = handler
    }
    
    func downloadImageAt(_ index: Int = 0, delegateTo: UIViewController) {
        if dataSourceArray.indices.contains(index) {
            downloadHandler.downloadImageFrom(dataSourceArray[index], delegateTo: delegateTo)
        }
    }
    
    func downloadAsynchronously(delegateTo: UIViewController) {
        for eachUrl in dataSourceArray {
            downloadHandler.downloadImageFrom(eachUrl, delegateTo: delegateTo)
        }
    }
    
    func pauseDownload() {
        downloadHandler.pauseDownload()
    }
    
    func resumeDownload() {
        downloadHandler.resumeDownload()
    }
}
