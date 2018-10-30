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
    
    private var font: UIFont {
        return UIFontMetrics(forTextStyle: .body).scaledFont(for: UIFont.preferredFont(forTextStyle: .body).withSize(64.0))
    }
    
    @IBOutlet weak var imageCollectionView: UICollectionView! {
        didSet {
            imageCollectionView.dataSource = self
            imageCollectionView.delegate = self
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
}
