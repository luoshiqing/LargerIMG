//
//  LargerImgViewController.swift
//  LargerIMG
//
//  Created by sqluo on 2017/3/21.
//  Copyright © 2017年 sqluo. All rights reserved.
//

import UIKit

class LargerImgViewController: UIViewController ,UICollectionViewDelegate ,UICollectionViewDataSource{

    fileprivate var imgs: [UIImage]!
    fileprivate var index: Int!
 
    init(imgs: [UIImage], at index: Int){
        super.init(nibName: nil, bundle: nil)
        
        self.imgs = imgs
        self.index = index
        //初始化indexpath
        self.indexPath = IndexPath(item: index, section: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //记录历史的 index
    fileprivate var indexPath: IndexPath?
    //idf
    fileprivate let identifier = "LargerCollectionCell"
    //-
    fileprivate var myCollectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.black
        
        self.initCollectionView()
        
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapAct(_:)))
        self.view.addGestureRecognizer(tap)
    }
    
    
    func tapAct(_ send: UITapGestureRecognizer){
        self.dismiss(animated: true, completion: nil)
    }
    
    fileprivate func initCollectionView(){
    
        let size = self.view.frame.size
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
        
        layout.itemSize = CGSize(width: size.width, height: size.height)
        
        layout.minimumLineSpacing = 0  //上下间隔
        layout.minimumInteritemSpacing = 0 //左右间隔
        layout.headerReferenceSize = CGSize(width: 0, height: 0)
        layout.footerReferenceSize = CGSize(width: 0, height: 0)
        
        
        layout.sectionInset.left = 0
        layout.sectionInset.right = 0
    
    
        myCollectionView = UICollectionView(frame: CGRect(x: 0,y: 0,width: size.width,height: size.height), collectionViewLayout: layout)
        
        myCollectionView?.backgroundColor = UIColor.black
        
        myCollectionView?.delegate = self
        myCollectionView?.dataSource = self
        
        myCollectionView?.isPagingEnabled = true
        
        
        myCollectionView?.register(LargerCollectionViewCell.self, forCellWithReuseIdentifier: identifier)
        
        self.view.addSubview(myCollectionView!)
    
        //注册cell
        self.myCollectionView?.contentOffset = CGPoint(x: size.width * CGFloat(self.index), y: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.imgs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! LargerCollectionViewCell
        
        cell.img = self.imgs[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print(indexPath.row)
        
        
    }
    
 
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        //获取点
        let point = self.view.convert(self.myCollectionView!.center, to: self.myCollectionView)
        //获取点上的cell
        guard let currentIndexpath = self.myCollectionView!.indexPathForItem(at: point) else {
            print("获取indexpath失败")
            return
        }
        //上一个 cell index
        guard let lastIndex = self.indexPath else {
            print("获取历史indexpath失败")
            return
        }
        
        if lastIndex != currentIndexpath {
            //更新历史index
            self.indexPath = currentIndexpath
            //获取cell
            guard let cell = self.myCollectionView?.cellForItem(at: lastIndex) as? LargerCollectionViewCell else{
                print("获取cell失败")
                return
            }
            //设置上一个cell的缩放比例为初始值
            cell.scrollView?.setZoomScale(1, animated: false)
        }else{
            print("cell没有变化")
        }
        
    }
    
    
    
    
    
    

}
