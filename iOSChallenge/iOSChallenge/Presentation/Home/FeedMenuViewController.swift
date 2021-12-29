//
//  FeedMenuViewController.swift
//  XcodeGenSample
//
//  Created by Bruno Rodrigues Paschoalino on 03/12/21.
//

import Foundation
import UIKit

class FeedMenuViewController:UIViewController, Storyboarded, UITableViewDelegate, UITableViewDataSource {

    weak var coordinator: MainCoordinator?

    var viewModel: FeedMenuViewModel?

    @IBOutlet var tableView: UITableView!


    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(StatesTableViewCell.nib(), forCellReuseIdentifier: StatesTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self

        viewModel?.doStatesDataRequest()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)

        self.tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.getCountryDataSize() ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("inside the cell creation")

        let textCell = tableView.dequeueReusableCell(withIdentifier: StatesTableViewCell.identifier,
                                                     for: indexPath) as! StatesTableViewCell
        textCell.configure(with: viewModel?.getStateUF(index: indexPath.row) ?? "",
                           state: viewModel?.getState(index: indexPath.row) ?? "",
                           cases: viewModel?.getStateCases(index: indexPath.row) ?? 0,
                           suspects: viewModel?.getStateSuspects(index: indexPath.row) ?? 0,
                           deaths: viewModel?.getStateDeats(index: indexPath.row) ?? 0)
        textCell.selectionStyle = UITableViewCell.SelectionStyle.none

        print("success in creating the text cell")
        return textCell

    }

}
