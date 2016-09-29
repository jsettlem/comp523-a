//
//  floorCell.swift
//  Code Quest
//
//  Created by (You) Narukami on 9/20/16.
//  Copyright © 2016 Spookle. All rights reserved.
//

import UIKit

class floorCell: gameCell {

	var isPlayer: Bool = false
	
	init() {
		if isPlayer {
			super.init(image: UIImage(named:"player.png"))
			self.accessibilityLabel = "Player"
		} else {
			super.init(image: UIImage(named:"grid.png"))
			self.accessibilityLabel = "Floor"
		}
		
    }
	
	func makePlayer() {
		isPlayer = true
		self.image = UIImage(named:"player.png")
		self.accessibilityLabel = "Player"
	}
	
	func makeNotPlayer() {
		isPlayer = false
		self.image = UIImage(named:"floor.png")
		self.accessibilityLabel = "Floor"
	}
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
