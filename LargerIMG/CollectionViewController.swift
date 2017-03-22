//
//  CollectionViewController.swift
//  LargerIMG
//
//  Created by sqluo on 2017/3/21.
//  Copyright © 2017年 sqluo. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController ,UICollectionViewDelegate ,UICollectionViewDataSource{

    fileprivate var myCollectionView: UICollectionView?
    
    fileprivate lazy var dataArray: [UIImage] = {
        var array = [UIImage]()
        for i in 1...8 {
            let img = UIImage(named: "\(i).png")
            array.append(img!)
        }
        return array
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "哈"
        self.view.backgroundColor = UIColor.blue
        
        
        self.initCollectionView()
        
    }

    //每行显示几个
    let lineItem = 3
    //间距
    let spac: CGFloat = 10
    
    fileprivate let identifier = "CollectionCell"
    
    
    fileprivate func initCollectionView(){
        
        let size = self.view.frame.size
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionViewScrollDirection.vertical
        
        let wh = (size.width - spac * CGFloat(lineItem + 1)) / CGFloat(lineItem)
        layout.itemSize = CGSize(width: wh, height: wh)
        
        layout.minimumLineSpacing = 10.0  //上下间隔
        layout.minimumInteritemSpacing = 10.0 //左右间隔
        layout.headerReferenceSize = CGSize(width: 10, height: 10)
        layout.footerReferenceSize = CGSize(width: 10, height: 10)
        

        layout.sectionInset.left = 10
        layout.sectionInset.right = 10
        
        
        myCollectionView = UICollectionView(frame: CGRect(x: 0,y: 0,width: size.width,height: size.height), collectionViewLayout: layout)
        
        myCollectionView?.backgroundColor = UIColor.white
        
        myCollectionView?.delegate = self
        myCollectionView?.dataSource = self
        
        
        myCollectionView?.register(ImgCollectionViewCell.self, forCellWithReuseIdentifier: identifier)
        
        self.view.addSubview(myCollectionView!)
    }
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! ImgCollectionViewCell
        
        cell.imgView?.image = self.dataArray[indexPath.row]
        
      
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print(indexPath.row)
      
        let largerImgVC = LargerImgViewController(imgs: self.dataArray, at: indexPath.row)
        
        largerImgVC.modalTransitionStyle = .crossDissolve
        self.present(largerImgVC, animated: true, completion: nil)
        
        
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
