//
//  DetailViewController.swift
//  OnePiece
//
//  Created by 류완우 on 2021/03/17.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    //MVVM
    
    //Model
    
    //- BountyInfo
    // > BountyInfo 만들자
    //View
    // img view, bountylabel, namelabel
    // > view들은 viewModel을 통해서 구성도
    // ListCell을 통해서 각각의 현상금 정보를 보여준다.
    // ListCell은 viewmodel로 부터 받은 정보로 뷰 업데이트 하기
    //ViewModel
    // - BountyViewModel
    // BountyViewModel 을 만들고, View Layer에서 필요한 메서드 만들기
    
    // > 모델 가지고 있기, BountyInfo 들을 가지고 있어야한다.
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!

    let viewModel = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    func updateUI() {
        
        if let bountyInfo=self.viewModel.bountyInfo{
            imgView.image = bountyInfo.image
            nameLabel.text = bountyInfo.name
            bountyLabel.text = "\(bountyInfo.bounty)"
        }
        
        
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
class DetailViewModel{
    var bountyInfo : BountyInfo?
    
    func update(model: BountyInfo?){
        bountyInfo = model
    }
}
