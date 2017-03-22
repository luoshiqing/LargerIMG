//
//  LargerCollectionViewCell.swift
//  LargerIMG
//
//  Created by sqluo on 2017/3/22.
//  Copyright © 2017年 sqluo. All rights reserved.
//

import UIKit

class LargerCollectionViewCell: UICollectionViewCell ,UIScrollViewDelegate{
    
    var scrollView: UIScrollView?
    var imgView: UIImageView?
    
    public var img: UIImage!{
        didSet{
            imgView?.image = img
            imgView?.frame = CGRect(x: 0, y: 0, width: img.size.width, height: img.size.height)
            imgView?.center = scrollView!.center
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        self.backgroundColor = UIColor.black
        
        let width = frame.width
        let height = frame.height
        
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        
        scrollView?.minimumZoomScale = 0.5
        
        scrollView?.maximumZoomScale = 3
        scrollView?.zoomScale = 0.5
        scrollView?.delegate = self
        self.addSubview(scrollView!)
        
        
        imgView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        imgView?.isUserInteractionEnabled = true
        
        scrollView?.addSubview(imgView!)
        
        scrollView?.contentSize = CGSize(width: width, height: height)
        
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imgView
    }
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        //一直保持居中显示
        self.centerShow(scrollView, imageView: self.imgView!)
    }
    
 
    
    func centerShow(_ scrollView: UIScrollView, imageView: UIImageView){
        
        let boundsW = scrollView.bounds.size.width
        let contentW = scrollView.contentSize.width
        let offsetX = boundsW > contentW ? (boundsW - contentW) * 0.5 : 0.0
        
        
        let boundsH = scrollView.bounds.size.height
        let contentH = scrollView.contentSize.height
        
        let offsetY = boundsH > contentH ? (boundsH - contentH) * 0.5 : 0.0
        
        let x = scrollView.contentSize.width * 0.5 + offsetX
        let y = scrollView.contentSize.height * 0.5 + offsetY
        
        imageView.center = CGPoint(x: x, y: y)
    }
    
    
    
    
}
