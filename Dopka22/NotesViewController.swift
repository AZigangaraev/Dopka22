//
//  NotesViewController.swift
//  Dopka22
//
//  Created by Teacher on 24.02.2023.
//

import UIKit

class NotesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet
    private var tableView: UITableView!

    @IBOutlet
    private var noteField: UITextField!

    @IBAction
    private func saveTap() {
        guard let note = noteField.text else { return }

        notes.append(note)
        tableView.reloadData()
    }

    var notes: [String] = [ "Hello, world" ]

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        notes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let note = notes[indexPath.row]
        var contentConfiguration = UIListContentConfiguration.cell()
        contentConfiguration.text = note

        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.contentConfiguration = contentConfiguration
        return cell
    }

    func tableView(
        _ tableView: UITableView,
        trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath
    ) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [unowned self] _, _, finished in
            notes.remove(at: indexPath.row)
            tableView.deleteRows(at: [ indexPath ], with: .automatic)
            finished(true)
        }

        return UISwipeActionsConfiguration(actions: [ deleteAction ])
    }
}
