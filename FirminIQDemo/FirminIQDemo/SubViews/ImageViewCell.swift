//
//  ImageViewCell.swift
//  FirminIQDemo
//
//  Created by abdul salam on 22/04/22.
//

import UIKit

class ImageViewCell: UICollectionViewCell {
    
    private var imageView = UIImageView()
    private var progressView = UIProgressView()
    
    static let cellIdentifier = "ImageCell"
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        initializeUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initializeUI() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        addSubview(progressView)
        progressView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
        progressView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        progressView.translatesAutoresizingMaskIntoConstraints = false
    }
}
