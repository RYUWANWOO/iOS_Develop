//
//  BountyViewController.swift
//  OnePiece
//
//  Created by 류완우 on 2021/03/16.
//

import UIKit

class BountyViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    //MVVM
    
    //Model
    
    //- BountyInfo
    // > BountyInfo 만들자
    //View
    // ListCell을 통해서 각각의 현상금 정보를 보여준다.
    // ListCell은 viewmodel로 부터 받은 정보로 뷰 업데이트 하기
    //ViewModel
    // - BountyViewModel
    // BountyViewModel 을 만들고, View Layer에서 필요한 메서드 만들기
    
    // > 모델 가지고 있기, BountyInfo 들을 가지고 있어야한다.
    
    
    let bountyInfoList : [BountyInfo] = [
        BountyInfo(name: "brook", bounty: 33000000),
        BountyInfo(name: "chopper",bounty:50),
        BountyInfo(name: "franky", bounty: 44000000),
        BountyInfo(name: "luffy", bounty: 30000000),
        BountyInfo(name: "nami", bounty: 16000000),
        BountyInfo(name: "robin", bounty: 8000000),
        BountyInfo(name: "sanji", bounty: 77000000),
        BountyInfo(name: "zoro", bounty: 120000000)
    ]
    
    
    
//
//    let nameList = ["brook","chopper","franky","luffy","nami","robin","sanji","zoro"]
//    let bountyList = [33000000,50,44000000,300000000,16000000,80000000,77000000,120000000]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // DetailViewController 데이터 줄꺼에요
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? DetailViewController
            
            if let index = sender as? Int{
                let bountyInfo = bountyInfoList[index]
//                vc?.name = bountyInfo.name
//                vc?.bounty = bountyInfo.bounty
                vc?.bountyInfo = bountyInfo
//                vc?.name = nameList[index]
//                vc?.bounty = bountyList[index]
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bountyInfoList.count
        //return bountyList.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else{
            return UITableViewCell()
        }
        
        let bountyInfo = bountyInfoList[indexPath.row]
        cell.imgView.image = bountyInfo.image
        cell.nameLabel.text = bountyInfo.name
        cell.bountyLabel.text = "\(bountyInfo.bounty)"
        return cell
        
//        let img = UIImage(named: "\(nameList[indexPath.row]).jpg")
//        cell.imgView.image = img
//        cell.nameLabel.text = nameList[indexPath.row]
//        cell.bountyLabel.text = "\(bountyList[indexPath.row])"
//        return cell


        
    }
    
    
    //UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("--> \(indexPath.row)")
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
    }
}

class ListCell: UITableViewCell{
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
}


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
