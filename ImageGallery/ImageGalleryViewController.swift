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
    
    
    func randomFloat(_ cap: CGFloat) -> CGFloat {
        return CGFloat.random(in: 30..<cap)
    }
    
    
    private var font: UIFont {
        
        //let randomFloat = self.randomFloat(64)
        //imageCellSize2 = CGSize(width: randomFloat, height: randomFloat)
        return UIFontMetrics(forTextStyle: .body).scaledFont(for: UIFont.preferredFont(forTextStyle: .body).withSize(randomFloat(64)))
    }
    
    ////////////
    
    var imageLayout: Grid.Layout {
        return Grid.Layout.dimensions(rowCount: emojis.count/2, columnCount: 1)
    }
    
    var imageCellSize: CGSize?
    
    var imageGrid: Grid? {
        didSet {
            imageCellSize = imageGrid?.cellSize
        }
    }
    
    @IBOutlet weak var imageCollectionView: UICollectionView! {
        didSet {
            imageCollectionView.dataSource = self
            imageCollectionView.delegate = self
            
            imageGrid = Grid(layout: imageLayout, frame: imageCollectionView.bounds)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return emojis.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "testCell", for: indexPath)
        if let imageCell = cell as? ImageCollectionViewCell {
            let text = NSAttributedString(string: emojis[indexPath.item], attributes: [.font:font])
            imageCell.label.attributedText = text
        }
        return cell
    }
    
    var imageCellSize2: CGSize?
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return imageCellSize!
    }
}
