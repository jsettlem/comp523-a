//
//  LevelTableViewController.swift
//  Code Quest
//
//  Created by OSX on 9/21/16.
//  Copyright © 2016 Spookle. All rights reserved.
//

import UIKit

/// Renders level select screen
class LevelTableViewController: UITableViewController {
	
	///Array of level objects
    var levels = [Level]()

	
    override func viewDidLoad() {
        super.viewDidLoad()

		if let savedLevels = loadLevels() {
			levels += savedLevels
		} else {
			loadDefaultLevels()
		}
		
		
    }
	
	func saveLevels () {
		let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(levels, toFile: Level.ArchiveURL.path)
		if !isSuccessfulSave {
			print("failed to save levels...")
		}
	}
	
	func loadLevels() -> [Level]? {
		return NSKeyedUnarchiver.unarchiveObject(withFile: Level.ArchiveURL.path) as? [Level]
	}
	
	/// Contains data for built in levels and adds them to level array
    func loadDefaultLevels() {
        //let data1 = [[2,2,2,2,2,2],
        //             [2,1,1,1,1,2],
        //             [2,2,2,2,2,2]]
		//let level1 = Level(name: "Level 1", data: data1, startingLoc: (1, 1), goalLoc: (4, 1), tutorial: "Bring the player to the goal!")
		
		let data1 = [[1,1,1,1,1]]
		let level1 = Level(name: "Level 1", data: data1, startingLoc: (0, 0), goalLoc: (4, 0), tutorial: "Bring the player to the goal!")
		
        let data2 = [[2,2,2],
                     [2,1,2],
                     [2,1,2],
                     [2,1,2],
                     [2,1,2],
                     [2,2,2]]
		let level2 = Level(name: "Level 2", data: data2, startingLoc: (1, 1), goalLoc: (1, 4), tutorial: "This is the second level!")
        let data3 = [[2,2,2,2,2,2],
                     [2,1,1,1,1,2],
                     [2,1,1,1,1,2],
                     [2,1,1,1,1,2],
                     [2,2,2,2,2,2]]
		let level3 = Level(name: "Level 3", data: data3, startingLoc: (1, 3), goalLoc: (4, 1), tutorial: "This is your ultimate challenge!")
		
		let data4 = [[2,2,2,2,2,2],
		             [2,1,1,2,1,2],
		             [2,1,1,2,1,2],
		             [2,1,1,2,1,2],
		             [2,2,2,2,2,2]]
		let level4 = Level(name: "White Whale", data: data4, startingLoc:(1,2), goalLoc:(4,3), tutorial:"Call me Ishmael. Some years ago--never mind how long precisely--having little or no money in my purse, and nothing particular to interest me on shore, I thought I would sail about a little and see the watery part of the world.")
		level4.background = "speech2.png"
		
		let data5 = [[2,2,2,2,2,2,2,2,2,2],
		             [2,1,1,1,1,1,1,1,1,2],
		             [2,1,1,1,2,2,2,1,1,2],
		             [2,1,1,1,2,1,1,1,1,2],
		             [2,1,1,1,2,1,1,1,1,2],
		             [2,2,2,2,2,2,2,2,2,2]]
		

		let level5 = Level(name: "Level 5", data: data5, startingLoc: (1, 4), goalLoc: (5, 3), tutorial: "Get to the goal!")
		
		let data6 = [[2,2,2,2,2,2,2,2,2,2],
		             [2,1,1,2,1,1,1,1,1,2],
		             [2,1,1,2,1,1,1,1,1,2],
		             [2,1,1,1,1,2,1,2,2,2],
		             [2,1,1,1,1,2,1,1,1,2],
		             [2,2,2,2,2,2,2,2,2,2]]
		
		let level6 = Level(name: "Level 6", data: data6, startingLoc: (1, 4), goalLoc: (8, 1), tutorial: "Get to the goal!")
		
		let data7 = [[2,2,2,2,2,2,2,2,2,2],
		             [2,1,1,2,1,1,1,1,1,2],
		             [2,2,1,2,1,1,1,1,1,2],
		             [2,1,1,1,1,2,2,2,1,2],
		             [2,1,1,1,1,2,1,1,1,2],
		             [2,2,2,2,2,2,2,2,2,2]]
		
		let level7 = Level(name: "Level 7", data: data7, startingLoc: (1, 4), goalLoc: (7, 4), tutorial: "Get to the goal!")
		
		let data8 = [[2,2,2,2,2,2,2,2,2,2],
		             [2,1,1,1,1,1,1,1,1,2],
		             [2,1,1,2,1,1,2,1,1,2],
		             [2,2,2,2,1,1,2,2,1,2],
		             [2,1,1,1,1,1,1,1,1,2],
		             [2,2,2,2,2,2,2,2,2,2]]
		
		let level8 = Level(name: "Level 8", data: data8, startingLoc: (1, 4), goalLoc: (7, 4), tutorial: "Get to the goal!")

        levels += [level1, level2, level3, level4, level5, level6, level7, level8]
		saveLevels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return levels.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "LevelTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! LevelTableViewCell
        let level = levels[indexPath.row]
    
		print (level)
		print(indexPath)
		print(indexPath.row)
		print (level.highscore)
        cell.levelLabel.text = level.name
		if level.cleared {
			cell.highscoreLabel.text = "Highscore: \(level.highscore) moves"
		} else {
			cell.highscoreLabel.text = "Not Yet Cleared"
		}

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowStage" {
            let LevelViewController = segue.destination as! ViewController
            if let selectedLevelCell = sender as? LevelTableViewCell {
                let indexPath = tableView.indexPath(for: selectedLevelCell)!
                let selectedLevel = levels[indexPath.row]
                LevelViewController.level = selectedLevel
				LevelViewController.parentLevelTableViewController = self
            }
        }
    }
	
	/*@IBAction func unwindToLevelList(sender: UIStoryboardSegue) {
		print("we just got a seque, I wonder who it's from")
		if let sourceViewController = sender.source as? ViewController, let level = sourceViewController.level {
			if let selectedIndexPath = tableView.indexPathForSelectedRow {
				levels[selectedIndexPath.row] = level
				tableView.reloadRows(at: [selectedIndexPath], with:.fade)
				
			}
		}
		saveLevels()
	}*/
    

}
