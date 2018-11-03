//
//  TrueImageCollectionViewCell.swift
//  ImageGallery
//
//  Created by Anti on 11/1/18.
//  Copyright © 2018 Anti. All rights reserved.
//

import UIKit

class TrueImageCollectionViewCell: UICollectionViewCell
{

    //var imageView: TrueImageView?
    
    var testImageView: TrueImageView? {
        didSet {
            let imageView = testImageView!
            
            //let center = CGPoint(x: bounds.midX, y: bounds.midY)
            
            resizeImage()

            imageView.center = centerPoint
            
            addSubview(imageView)
        }
    }
    
    //@IBOutlet weak var imageView: TrueImageView!
    
    
    func resizeImage() {
        if let imageView = testImageView {
            let size = CGSize(width: imageView.bounds.size.width*resizeConstant, height: imageView.bounds.size.height*resizeConstant)
            imageView.frame = CGRect(origin: CGPoint.zero, size: size)
        }
    }
    var resizeConstant: CGFloat {
        get {
            if widthRatio.isLess(than: heightRatio) {
                return widthRatio
            } else {
                return heightRatio
            }
        }
    }
//    var imageAspectRatio: CGFloat? {
//        get {
//            if let imageView = testImageView {
//                return imageView.bounds.size.width / imageView.bounds.size.height
//            }
//            return nil
//        }
//    }
    var widthRatio: CGFloat {
        get {
            if let imageView = testImageView {
                let imageWidth = imageView.bounds.size.width
                if bounds.width.isLess(than: imageWidth) {
                    return bounds.width / imageWidth
                }
            }
            return CGFloat(1.0)
        }
    }
    var heightRatio: CGFloat {
        get {
            if let imageView = testImageView {
                let imageHeight = imageView.bounds.size.height
                if bounds.height.isLess(than: imageHeight) {
                    return bounds.height / imageHeight
                }
            }
            return CGFloat(1.0)
        }
    }
    

    
    var centerPoint: CGPoint {
        get {
            return CGPoint(x: bounds.midX, y: bounds.midY)
        }
    }
    
}
