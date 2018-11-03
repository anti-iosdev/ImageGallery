//
//  TrueImageViewController.swift
//  ImageGallery
//
//  Created by Anti on 11/1/18.
//  Copyright © 2018 Anti. All rights reserved.
//

import UIKit

class TrueImageViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDropDelegate
{

    
    @IBOutlet weak var imageCollectionView: UICollectionView! {
        didSet {
            imageCollectionView.dataSource = self
            imageCollectionView.delegate = self
            imageCollectionView.dropDelegate = self
        }
    }
    
    // MARK: - Establish Model / How many cells will there be?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        temporaryImages()
        temporaryImages()
        return imageURLs.count
    }
    
    var imageURLs = [URL]()
    
    let hearthstone = Bundle.main.url(forResource: "hearthstoneCardback", withExtension: "png")
    let iPadProImage = Bundle.main.url(forResource: "iPadProImage", withExtension: "jpg")
    let stanford = Bundle.main.url(forResource: "stanford", withExtension: "jpeg")

    
    func temporaryImages() {
        if let url1 = hearthstone, let url2 = iPadProImage, let url3 = stanford {
            imageURLs.append(url1)
            imageURLs.append(url2)
            imageURLs.append(url3)
        }
    }
    
    // MARK: - Use the URLs for each image cell.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath)
        if let imageCell = cell as? TrueImageCollectionViewCell {

            imageURL = imageURLs[indexPath.item]
            imageCell.testImageView = masterImageView()
            //imageCell.resizeImage()
            //imageCell.content
        }
        return cell
    }
    
    var imageURL: URL?
    
    func masterImageView() -> TrueImageView {
        let imageView = TrueImageView()
        
        let image = getHearthstoneImage()
        let size = image?.size ?? CGSize.zero
        
        imageView.frame = CGRect(origin: CGPoint.zero, size: size)
        imageView.backgroundImage = image
        imageView.backgroundColor = UIColor.clear
        
        return imageView
    }
    
    // Grab an image
    func getHearthstoneImage() -> UIImage? {
        //imageURL = hearthstone
        if let url = imageURL {
            let urlContents = try? Data(contentsOf: url)
            if let imageData = urlContents, url == self.imageURL {
                return UIImage(data: imageData)
            }
        }
        return nil
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (imageCollectionView.frame.width-20)/2
        
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator) {
        
    }
    // MARK: - Create a new UIView to attach to every collectionView cell
    
    //let hearthstone = Bundle.main.url(forResource: "hearthstoneCardback", withExtension: "png")

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    
    // MARK: - Images and Resizing
    
//    var imageView = TrueImageView()
//    var imageSize: CGSize?
//
//
//    var image: UIImage?
//
//    func badFetchImage() {
//        imageURL = hearthstone
//        if let url = imageURL {
//            let urlContents = try? Data(contentsOf: url)
//            if let imageData = urlContents, url == self.imageURL {
//                imageArtBackgroundImage = UIImage(data: imageData)
//            }
//        }
//    }
    
//    var imageArtBackgroundImage: UIImage? {
//        get {
//            return imageView.backgroundImage
//        }
//        set {
//            imageView.backgroundImage = newValue
//            let size = newValue?.size ?? CGSize.zero
//            imageView.frame = CGRect(origin: CGPoint.zero, size: size)
//        }
//    }
    

    
    
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
