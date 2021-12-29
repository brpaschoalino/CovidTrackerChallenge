//
//  FeedMenuViewController.swift
//  XcodeGenSample
//
//  Created by Bruno Rodrigues Paschoalino on 03/12/21.
//

import Foundation
import UIKit
import Combine

class FeedMenuViewController:UIViewController, Storyboarded, UITableViewDelegate, UITableViewDataSource {

    weak var coordinator: MainCoordinator?

    var viewModel = FeedMenuViewModel()
    private var cancellables: Set<AnyCancellable> = []

    @IBOutlet var tableView: UITableView!


    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(StatesTableViewCell.nib(), forCellReuseIdentifier: StatesTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self

        registerObservers()

        viewModel.loadStatesData()
        viewModel.loadCountryData()
    }

    func registerObservers() {
        viewModel.objectWillChange.sink { [weak self] in
            guard let self = self else { return }
            self.tableView.reloadData()
        }.store(in: &cancellables)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)

        self.tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getCountryDataSize()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("inside the cell creation")

        let textCell = tableView.dequeueReusableCell(withIdentifier: StatesTableViewCell.identifier,
                                                         for: indexPath) as! StatesTableViewCell
            textCell.configure(with: viewModel.getStateUF(index: indexPath.row),
                               state: viewModel.getState(index: indexPath.row),
                               cases: viewModel.getStateCases(index: indexPath.row),
                               suspects: viewModel.getStateSuspects(index: indexPath.row),
                               deaths: viewModel.getStateDeats(index: indexPath.row))
            textCell.selectionStyle = UITableViewCell.SelectionStyle.none

            print("success in creating the text cell")
        return textCell

    }

}
