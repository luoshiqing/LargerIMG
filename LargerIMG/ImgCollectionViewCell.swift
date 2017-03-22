//
//  ImgCollectionViewCell.swift
//  LargerIMG
//
//  Created by sqluo on 2017/3/21.
//  Copyright © 2017年 sqluo. All rights reserved.
//

import UIKit

class ImgCollectionViewCell: UICollectionViewCell {
    
    var imgView: UIImageView?
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.borderColor = UIColor.red.cgColor
        self.layer.borderWidth = 1
        
        
        imgView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))

        imgView?.backgroundColor = UIColor.white
        
        self.addSubview(imgView!)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
