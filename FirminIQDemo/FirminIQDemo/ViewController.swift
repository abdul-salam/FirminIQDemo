//
//  ViewController.swift
//  FirminIQDemo
//
//  Created by abdul salam on 22/04/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var thirdImageView: UIImageView!
    @IBOutlet weak var fourthImageView: UIImageView!
    @IBOutlet weak var firstProgressView: UIProgressView!
    @IBOutlet weak var secondProgressView: UIProgressView!
    @IBOutlet weak var thirdProgressView: UIProgressView!
    @IBOutlet weak var fourthProgressView: UIProgressView!
    @IBOutlet weak var downloadToggle: UISegmentedControl!
    @IBOutlet weak var downloadButton: UIButton!
    
    let viewModel = ViewModel(handler: DownloadHandler())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        downloadButton.tag = 100
    }
    
    @IBAction func startDownloadAction(_ sender: UIButton) {
        switch downloadButton.tag {
        case 100:
            startDownload()
        case 101:
            pauseDownload()
        case 102:
            resumeDownload()
        default:
            break
        }
    }
    
    //Method to handle image download
    private func startDownload() {
        downloadButton.tag = 101
        downloadButton.setTitle("Pause", for: .normal)
        downloadToggle.isUserInteractionEnabled = false
        if downloadToggle.selectedSegmentIndex == 0 {
            viewModel.downloadImageAt(0, delegateTo: self)
        } else {
            viewModel.downloadAsynchronously(delegateTo: self)
        }
    }
    
    //Method to handle pause download
    private func pauseDownload() {
        downloadButton.tag = 102
        downloadButton.setTitle("Resume", for: .normal)
        viewModel.pauseDownload()
    }
    
    //Method to handle resume download
    private func resumeDownload() {
        downloadButton.tag = 101
        downloadButton.setTitle("Pause", for: .normal)
        viewModel.resumeDownload()
    }
    
    //Method to handle finished download UI
    func finishedDownload() {
        downloadButton.tag = 103
        downloadButton.setTitle("Finish", for:  .normal)
        downloadButton.isUserInteractionEnabled = false
    }
}

