//
//  TrueImageViewController.swift
//  ImageGallery
//
//  Created by Anti on 11/1/18.
//  Copyright © 2018 Anti. All rights reserved.
//

import UIKit

class TrueImageViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    var images = [UIImage]()
    
    var testImage = UIImage()
    
    @IBOutlet weak var imageCollectionView: UICollectionView! {
        didSet {
            imageCollectionView.dataSource = self
            imageCollectionView.delegate = self
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath)
        if let imageCell = cell as? TrueImageCollectionViewCell {

            badFetchImage()
            //imageCell.image.contentMode = .scal
            imageCell.image.backgroundImage = imageArtBackgroundImage
            
        }
        return cell
    }

    
    // MARK: - Images and Resizing
    
    var imageView = TrueImageView()
    var imageSize: CGSize?
    
    let hearthstone = Bundle.main.url(forResource: "hearthstoneCardback", withExtension: "png")
    var imageURL: URL?
    var image: UIImage?
    
    func badFetchImage() {
        imageURL = hearthstone
        if let url = imageURL {
            let urlContents = try? Data(contentsOf: url)
            if let imageData = urlContents, url == self.imageURL {
                imageArtBackgroundImage = UIImage(data: imageData)
            }
        }
    }
    
    var imageArtBackgroundImage: UIImage? {
        get {
            return imageView.backgroundImage
        }
        set {
            imageView.backgroundImage = newValue
            let size = newValue?.size ?? CGSize.zero
            imageView.frame = CGRect(origin: CGPoint.zero, size: size)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (imageCollectionView.frame.width-20)/2
        
        return CGSize(width: width, height: width)
    }
    
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let width = (imageCollectionView.frame.width-20)/2
//        return CGSize(width: width, height: width)
//    }
    
//    private func fetchImage() -> UIImage {
//        if let url = imageURL {
//            //spinner.startAnimating()
//            // weak self is if it's okay to throw it away if it takes too long
//            DispatchQueue.global(qos: .userInitiated).async { [weak self] in
//                let urlContents = try? Data(contentsOf: url)
//                DispatchQueue.main.async {
//                    if let imageData = urlContents, url == self?.imageURL {
//                        self?.image = UIImage(data: imageData)
//                    }
//                }
//            }
//        }
//    }
    
}
