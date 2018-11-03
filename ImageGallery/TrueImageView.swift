//
//  TrueImageView.swift
//  ImageGallery
//
//  Created by Anti on 11/2/18.
//  Copyright © 2018 Anti. All rights reserved.
//

import UIKit

class TrueImageView: UIView {
    
    var backgroundImage: UIImage? { didSet { setNeedsDisplay() } }
    
    override func draw(_ rect: CGRect) {
        backgroundImage?.draw(in: bounds)
    }

}
