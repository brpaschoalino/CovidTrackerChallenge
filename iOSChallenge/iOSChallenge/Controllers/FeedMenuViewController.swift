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

    private let viewModel = FeedMenuViewModel.shared
//    private let statesData = GetApiData()

    @IBOutlet var tableView: UITableView!


    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(StatesTableViewCell.nib(), forCellReuseIdentifier: StatesTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self

//        doStatesDataRequest()
    }

//    func doStatesDataRequest(){
//        guard let statesDataUrl = URL(string: "https://covid19-brazil-api.vercel.app/api/report/v1/brazil/20200318") else { return }
//
//        statesData.apiStatesData(url: statesDataUrl, success: { (data) in
//            FeedMenuViewModel.shared.fillStatesData(statesData: data)
//
//        })
//    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("inside the cell creation")

        let textCell = tableView.dequeueReusableCell(withIdentifier: StatesTableViewCell.identifier,
                                                     for: indexPath) as! StatesTableViewCell
        textCell.configure(with: viewModel.getStateUF(index: indexPath.row), state: viewModel.getState(index: indexPath.row),
                           cases: viewModel.getStateCases(index: indexPath.row),
                           suspects: viewModel.getStateSuspects(index: indexPath.row),
                           deaths: viewModel.getStateDeats(index: indexPath.row))
        textCell.selectionStyle = UITableViewCell.SelectionStyle.none

        print("success in creating the text cell")
        return textCell

    }

}
