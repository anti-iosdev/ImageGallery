//
//  ImageGalleryViewController.swift
//  ImageGallery
//
//  Created by Anti on 10/30/18.
//  Copyright © 2018 Anti. All rights reserved.
//

import UIKit

class ImageGalleryViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
{

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    var emojis = "🍏🍎🍐🍊🍋🍌🍉🍇🍓🍈🍒🍑🍍🥥🥝🍅🍓🍈".map { String($0) }
    

    // ------------------------------------------------------------------------
    // imageCollectionView
    
    // Initializing
    @IBOutlet weak var imageCollectionView: UICollectionView! {
        didSet {
            imageCollectionView.dataSource = self
            imageCollectionView.delegate = self
        }
    }
    var width: CGFloat {
        return (view.frame.width-10)/2
    }
    
    
    // Number of Items
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return emojis.count
    }
    
    // Setting the Cells
    private var font: UIFont {
        let fontSize = width/3
        return UIFontMetrics(forTextStyle: .body).scaledFont(for: UIFont.preferredFont(forTextStyle: .body).withSize(fontSize))
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "testCell", for: indexPath)
        if let imageCell = cell as? ImageCollectionViewCell {
            let text = NSAttributedString(string: emojis[indexPath.item], attributes: [.font:font])
            imageCell.label.attributedText = text
        }
        return cell
    }

    // Size of Cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //let width = (view.frame.width-20)/2
        return CGSize(width: width, height: width)
    }
}
