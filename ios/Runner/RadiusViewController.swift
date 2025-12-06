
//: Declare String Begin

/*: "LaunchImage" :*/
fileprivate let main_modifyStr:String = "with wait transaction safeLaun"
fileprivate let kPoorYourUrl:String = "awhen"

//: Declare String End

// __DEBUG__
// __CLOSE_PRINT__
//
//  RadiusViewController.swift
//  OverseaH5
//
//  Created by DouXiu on 2025/11/27.
//

//: import UIKit
import UIKit

//: class WaitViewController: UIViewController {
class RadiusViewController: UIViewController {
    //: override func viewDidLoad() {
    override func viewDidLoad() {
        //: super.viewDidLoad()
        super.viewDidLoad()
        //: let bgImgV = UIImageView()
        let bgImgV = UIImageView()
        //: bgImgV.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        bgImgV.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        //: bgImgV.image = UIImage(named: "LaunchImage")
        bgImgV.image = UIImage(named: (String(main_modifyStr.suffix(4)) + "chIm" + kPoorYourUrl.replacingOccurrences(of: "when", with: "ge")))
        //: view.addSubview(bgImgV)
        view.addSubview(bgImgV)
    }
}
