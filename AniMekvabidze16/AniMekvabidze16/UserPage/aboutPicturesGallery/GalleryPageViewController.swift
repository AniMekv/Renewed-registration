//
//  GalleryViewController.swift
//  AniMekvabidze16
//
//  Created by Mac User on 5/20/21.
//

import UIKit

class GalleryPageViewController: UIViewController{

    @IBOutlet weak var picturesCollection: UICollectionView!
    
    var picturesArray = ["image1", "image2", "image3", "image4", "image5", "image6", "image7"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.picturesCollection.delegate = self
        self.picturesCollection.dataSource = self
        
    }
    
}

extension GalleryPageViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return picturesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath as IndexPath) as! PictureCell
        cell.fullScreen(imageName: picturesArray[indexPath.row])
        
        return cell
    }
    

    
      
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return  10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 3.4, height: collectionView.frame.width / 3.4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let sb = UIStoryboard(name: "UserProfile", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "FullScreenImageViewController") as! FullScreenViewController

        vc.imageName = picturesArray[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
    

