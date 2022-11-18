//
//  Photos.swift
//  Navigation
//
//  Created by Andrey Talanchuk on 25.10.2022.
//

import UIKit

public class Photos {
    
    public var photosName: [UIImage] {
        var photosName: [UIImage] = []
        for i in 0...19 {
            let image = UIImage(named: String(i+1))
            photosName.append(image!)
        }
        return photosName
    }
    
    public init() {}
}
