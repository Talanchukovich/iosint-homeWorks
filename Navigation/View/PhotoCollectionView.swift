//
//  PhotoCollectionView.swift
//  Navigation
//
//  Created by Andrey Talanchuk on 26.10.2022.
//

import UIKit
import StorageService

class PhotoCollectionView: UICollectionView {

    
    lazy var photos: [UIImage] = Photos().photosName
    var itemHeight: CGFloat?
    private var layout: UICollectionViewFlowLayout
    private var collectionViewItemCount: CGFloat
    
    init(viewStruct: PhotosCollectionViewModel) {
        self.layout = viewStruct.layout
        self.collectionViewItemCount = viewStruct.collectionViewItemCount
        super.init(frame: .zero, collectionViewLayout: layout)
        setupView()
        setCollectionItemHieght(layout: layout)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        self.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "PhotosCollectionViewCell")
        self.backgroundColor = .white
        self.delegate = self
        self.dataSource = self
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setCollectionItemHieght(layout: UICollectionViewFlowLayout) {
        let inset = layout.sectionInset
        let interitemSpacing = layout.minimumLineSpacing
        let height = UIScreen.main.bounds.width - (collectionViewItemCount - 1) * interitemSpacing - inset.left - inset.right
        let itemHeight = height / collectionViewItemCount
        self.itemHeight = itemHeight
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
        let size = itemHeight ?? 0
        return CGSize(width: size, height: size)
    }
}
