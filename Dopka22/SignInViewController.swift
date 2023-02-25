//
//  SignInViewController.swift
//  Dopka22
//
//  Created by Teacher on 24.02.2023.
//

import UIKit

class SignInViewController: UIViewController {
    @IBOutlet
    private var loginField: UITextField!

    @IBAction
    private func signInTap() {
        guard let storyboard, let login = loginField.text else { return }

        let controller: NotesViewController = storyboard.instantiateViewController(identifier: "NotesViewController")
        show(controller, sender: nil)
    }
}

