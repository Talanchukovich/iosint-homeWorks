//
//  PhotoCollectionView.swift
//  Navigation
//
//  Created by Andrey Talanchuk on 26.10.2022.
//

import UIKit
import StorageService

class PhotoCollectionView: UICollectionView {
    
    enum ViewControllerName {
        case profileVC
        case photosVC
    }
    
    lazy var photos: [UIImage] = Photos().photosName
    var layout = UICollectionViewFlowLayout()
    var itemWidth: CGFloat = 0
    
    init(viewControllerName: ViewControllerName) {
        super.init(frame: .zero, collectionViewLayout: layout)
        self.layout = setLayout(viewControllerName)
        self.itemWidth = setItemWidth(viewControllerName)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLayout(_ viewControllerName: ViewControllerName) -> UICollectionViewFlowLayout {
        switch viewControllerName {
        case .profileVC:
           layout.scrollDirection = .horizontal
            layout.minimumInteritemSpacing = 8
            layout.sectionInset = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
            return layout
        case .photosVC:
            layout.scrollDirection = .vertical
            layout.minimumInteritemSpacing = 8
            layout.minimumLineSpacing = 8
            layout.sectionInset = UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12)
            return layout
        }
    }
    
    func setItemWidth(_ viewControllerName: ViewControllerName) -> CGFloat{
        var collectionViewItemCount: CGFloat = 0
        switch viewControllerName {
        case .profileVC:
            collectionViewItemCount = 4
        case .photosVC:
            collectionViewItemCount = 3
        }
        let width = UIScreen.main.bounds.width - (collectionViewItemCount - 1) * layout.minimumInteritemSpacing - layout.sectionInset.left - layout.sectionInset.right
        let itemWidth = width / collectionViewItemCount
        return itemWidth
    }
    
    func setupView() {
        self.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "PhotosCollectionViewCell")
        self.backgroundColor = .white
        self.delegate = self
        self.dataSource = self
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension PhotoCollectionView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosCollectionViewCell", for: indexPath) as! PhotosCollectionViewCell
        let photo = photos[indexPath.row]
        let photoViewModel = PhotosCollectionViewCell.PhotoViewModel(photo: photo)
        cell.setupViewModel(viewModel: photoViewModel)
        cell.clipsToBounds = true
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = itemWidth
        return CGSize(width: size, height: size)
    }
}
