//
//  LevelTutorialViewController.swift
//  Code Quest
//
//  Created by OSX on 11/3/16.
//  Copyright © 2016 Spookle. All rights reserved.
//

import UIKit

class LevelTutorialViewController: UIViewController {

    //@IBOutlet weak var tutorialLabel: UITextView!
	///The tutorial text to display
	var tutorialText : String = "Good luck!"
	var background : String = "speech1.png"
	var myParent : ViewController?
	
	
	//init(tutorialText : String) {
	//	self.tutorialText = tutorialText
	//	let className = NSStringFromClass((type(of: self)))
	//	super.init()//nibName : className, bundle: Bundle(for:type(of: self)))
	//
	//}
	
	//required init?(coder aDecoder: NSCoder) {
	//	fatalError("init(coder:) has not been implemented")
	//}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.preferredContentSize = CGSize(width: 1000, height: 600)
		let backgroundImage = UIImageView(frame:CGRect(x:0, y:0, width:1000, height:600))
		backgroundImage.image = UIImage(named: background)
		self.view.insertSubview(backgroundImage, at: 0)
		let button = UIButton(type:.system)
		button.frame = CGRect(x:750, y:450, width:200, height:100)
		button.setTitle("Start Level", for: UIControlState.normal)
		button.titleLabel!.font = button.titleLabel!.font.withSize(30)
		button.addTarget(self, action: #selector(LevelTutorialViewController.start), for: UIControlEvents.touchUpInside)
		self.view.addSubview(button)
		let label = UILabel(frame:CGRect(x:200,y:50,width:550,height:400))
		//label.center = CGPoint(x:160, y:284)
		label.backgroundColor = .clear
		label.numberOfLines = 0
		label.lineBreakMode = NSLineBreakMode.byWordWrapping
		label.font = label.font?.withSize(30)
		label.textAlignment = .center
		label.text = tutorialText
		self.view.addSubview(label)

    }

	func start() {
		self.dismiss(animated: true, completion: {});
		myParent?.drumPlayer.volume = 1
	}
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}