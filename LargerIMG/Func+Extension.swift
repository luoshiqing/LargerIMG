//
//  Func+Extension.swift
//  LargerIMG
//
//  Created by sqluo on 2017/3/21.
//  Copyright © 2017年 sqluo. All rights reserved.
//

import UIKit

extension String {
    //字符串获取类型
    func classType() -> UIViewController? {
        guard let clsName = Bundle.main.infoDictionary!["CFBundleExecutable"] else {
            print("命名空间不存在")
            return nil
        }
        let cls: AnyClass? = NSClassFromString((clsName as! String) + "." + self)
        guard let clsType = cls as? UIViewController.Type else {
            print("无法转换成UIViewController")
            return nil
        }
        let viewCtr = clsType.init()
        return viewCtr
    }
 
}
