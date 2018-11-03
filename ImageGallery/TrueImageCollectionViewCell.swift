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
    
//    var trueImage: UIImage? {
//        didSet {
//            let size = trueImage?.size ?? CGSize.zero
//            image.frame = CGRect(origin: CGPoint.zero, size: size)
//            image.backgroundImage = trueImage
//        }
//    }
    
    @IBOutlet weak var image: TrueImageView!
    
//    var backgroundImage: UIImage? { didSet { setNeedsDisplay() } }
//
//    override func draw(_ rect: CGRect) {
//        backgroundImage?.draw(in: bounds)
//    }
    
    
}
