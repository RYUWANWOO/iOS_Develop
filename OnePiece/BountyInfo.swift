//
//  BountyInfo.swift
//  OnePiece
//
//  Created by 류완우 on 2021/03/28.
//

import UIKit


struct BountyInfo {
    let name: String
    let bounty: Int
            
    var image : UIImage?{
        return UIImage(named: "\(name).jpg")
    }
        
    init(name: String,bounty :Int){
        self.name = name
        self.bounty = bounty
    }
    
}
