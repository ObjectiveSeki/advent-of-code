//
//  ViewController.swift
//  AllDays
//
//  Created by Niclas Eriksson on 2018-12-04.
//  Copyright © 2018 DarkFit. All rights reserved.
//

import UIKit


struct Day {
    let name: String
    let file: String
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var tableView: UITableView!
    var days = [
        Day(name: "Day 1", file: "InputDay1"),
        Day(name: "Day 2", file: "InputDay2"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
    }


    // MARK: UIStoryboardSegue

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DayDetails" {
            let vc = segue.destination as! DayViewController
            vc.day = days[sender as! Int]
            switch sender as! Int {
            case 0:
                vc.generator = FrequencyCalibrator()
            case 1:
                vc.generator = IDScanner()
            default:
                vc.generator = FrequencyCalibrator()
            }
        }
    }


    // MARK: UITableViewDelegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "DayDetails", sender: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }


    // MARK: UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return days.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell (style: .default, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = days[indexPath.row].name
        cell?.accessoryType = .disclosureIndicator
        return cell!
    }
}

