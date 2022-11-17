//
//  CollectionViewFactory.swift
//  Navigation
//
//  Created by Andrey Talanchuk on 17.11.2022.
//

import UIKit

class CollectionViewFactory {
    
    func createProfileViewControllerCollectionView() -> PhotoCollectionView {
        let sectionInset = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        let collectionViewModel = PhotosCollectionViewModel(collectionViewItemCount: 4, minimumInteritemSpacing: 8,
                                                          minimumLineSpacing: 8, sectionInset: sectionInset,
                                                          scrollDirection: .horizontal)
        let collectionView = PhotoCollectionView(viewStruct: collectionViewModel)
        return collectionView
    }
    
    func createPhotosViewControllerCollectionView() -> PhotoCollectionView {
        let sectionInset = UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12)
        let collectionViewModel = PhotosCollectionViewModel(collectionViewItemCount: 3, minimumInteritemSpacing: 8,
                                                         minimumLineSpacing: 8,sectionInset: sectionInset,
                                                         scrollDirection: .vertical)
        let collectionView = PhotoCollectionView(viewStruct: collectionViewModel)
        return collectionView
    }
}
