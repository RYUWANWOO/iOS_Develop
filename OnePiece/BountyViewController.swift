//
//  BountyViewController.swift
//  OnePiece
//
//  Created by 류완우 on 2021/03/16.
//

import UIKit

class BountyViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout{
    
    
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
    
//
      let viewModel = BountyViewModel()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // DetailViewController 데이터 줄꺼에요
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? DetailViewController
            
            if let index = sender as? Int{
                let bountyInfo = viewModel.bountyInfo(at: index)
                vc?.viewModel.update(model : bountyInfo)
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //UICollectionViewDataSource
    //몇개를 보여줄까요?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int)->Int{
        return viewModel.numOfBountyInfoList
    }
    
    func collectionView(_ collectionView: UICollectionView,cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCell", for: indexPath) as?
                GridCell else{
                return UICollectionViewCell()
        }
        
        let bountyInfo = viewModel.bountyInfo(at: indexPath.item)
                cell.update(info: bountyInfo)
        cell.update(info: bountyInfo)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("--> \(indexPath.item)")
        performSegue(withIdentifier: "showDetail", sender: indexPath.item)
    }

    //셀은 어떻게 표현 할 까요?
    
    //UICollectionviewdelegate,
    //셀이 클리 되었을때 어떻할까요?
    
    //UIcollectiondelegateflowlayout
    //calc cell size (다양한 디바이스에서 일관적인 디자인을 보여주기 위해)
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemSpacing: CGFloat = 10
        let textAreaHeight :CGFloat = 65
        
        let width : CGFloat = (collectionView.bounds.width - itemSpacing)/2
        let height : CGFloat = (width/7*10)+textAreaHeight
        
        
        
        
        
        return CGSize(width:width, height:height)
    }
    
    


}

class ListCell: UITableViewCell{
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    func update(info : BountyInfo){
        imgView.image = info.image
        nameLabel.text = info.name
        bountyLabel.text = "\(info.bounty)"
        
    }
}

class GridCell: UICollectionViewCell{
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!

    func update(info : BountyInfo){
        imgView.image = info.image
        nameLabel.text = info.name
        bountyLabel.text = "\(info.bounty)"

    }

}


class BountyViewModel{
    
    let bountyInfoList : [BountyInfo] = [
        BountyInfo(name: "brook", bounty: 33000000),
        BountyInfo(name: "chopper",bounty:50),
        BountyInfo(name: "franky", bounty: 44000000),
        BountyInfo(name: "luffy", bounty: 300000000),
        BountyInfo(name: "nami", bounty: 16000000),
        BountyInfo(name: "robin", bounty: 8000000),
        BountyInfo(name: "sanji", bounty: 77000000),
        BountyInfo(name: "zoro", bounty: 120000000)
    ]
    
    var sortedList : [BountyInfo]{
        let sortedList = bountyInfoList.sorted{prev, next in
            return prev.bounty > next.bounty
        }
        return sortedList
    }
    
    var numOfBountyInfoList : Int{
        return bountyInfoList.count
    }
    
    func bountyInfo(at index: Int)->BountyInfo{
        return sortedList[index]
        
    }
    
}
