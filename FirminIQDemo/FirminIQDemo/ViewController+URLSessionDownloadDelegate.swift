//
//  ViewController+URLSessionDownloadDelegate.swift
//  FirminIQDemo
//
//  Created by abdul salam on 22/04/22.
//

import Foundation
import UIKit

extension ViewController: URLSessionDownloadDelegate {
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        guard let data = try? Data(contentsOf: location) else {
            print("The data could not be loaded")
            return
        }
        let image = UIImage(data: data)
        let downloadImageIndex = self.viewModel.dataSourceArray.firstIndex(of: downloadTask.originalRequest?.url?.absoluteString ?? "")
        
        DispatchQueue.main.async {
            switch downloadImageIndex {
            case 0:
                self.firstImageView.image = image
            case 1:
                self.secondImageView.image = image
            case 2:
                self.thirdImageView.image = image
            case 3:
                self.fourthImageView.image = image
            default:
                break
            }
            
            //For Synchronous download - If index < 3, download next image from array
            if self.downloadToggle.selectedSegmentIndex == 0 && downloadImageIndex ?? 0 < 3 {
                self.viewModel.downloadImageAt((downloadImageIndex ?? 0) + 1, delegateTo: self)
            }
            
            if self.firstImageView.image != nil && self.secondImageView.image != nil && self.thirdImageView.image != nil && self.fourthImageView.image != nil {
                self.finishedDownload()
            }
        }
    }
    
    //To set the progress view
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let progress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
        let downloadImageIndex = self.viewModel.dataSourceArray.firstIndex(of: downloadTask.originalRequest?.url?.absoluteString ?? "")
        
        DispatchQueue.main.async {
            switch downloadImageIndex {
            case 0:
                self.firstProgressView.progress = progress
            case 1:
                self.secondProgressView.progress = progress
            case 2:
                self.thirdProgressView.progress = progress
            case 3:
                self.fourthProgressView.progress = progress
            default:
                break
            }
        }
    }
}
