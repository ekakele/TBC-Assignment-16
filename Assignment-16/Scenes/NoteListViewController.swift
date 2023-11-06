//
//  NoteListViewController.swift
//  Assignment-16
//
//  Created by Eka Kelenjeridze on 05.11.23.
//

import UIKit

final class NoteListViewController: UIViewController {
    
    // MARK: - Properties
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackground()
        setupNavigationBar()
        setupTableView()
        setupTableViewConstraints()
    }
    
    private var notes = Note.myNotes
    
    // MARK: - Private Methods
    private func setupBackground() {
        view.backgroundColor = UIColor(red: 0.97, green: 0.94, blue: 0.88, alpha: 1.00)
    }
    
    private func setupNavigationBar() {
        self.navigationItem.title = "My Notes"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: (UIImage(systemName: "plus.circle")), style: .plain, target: self, action: #selector(navigateToAddNoteVCPage))
    }
    
    @objc private func navigateToAddNoteVCPage() {
        let addNoteVCPage = AddNoteViewController()
        addNoteVCPage.delegate = self
        self.navigationController?.pushViewController(addNoteVCPage, animated: true)
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(NoteTableViewCell.self, forCellReuseIdentifier: NoteTableViewCell.identifier)
        
    }
    
    private func setupTableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
    
}

// MARK: -  Methods
//func updateNote(with item: Note) {
//    notes.title = updatedTitle
//}

// MARK: - TableVIew DataSource
extension NoteListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let note = notes[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: NoteTableViewCell.identifier) as? NoteTableViewCell {
            cell.configure(with: note)
            return cell
        }
        return UITableViewCell()
    }
    
    
    // MARK: - Swipe Actions
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let noteToDelete = notes[indexPath.row]
            if let index = notes.firstIndex(where: { $0 === noteToDelete }) {
                notes.remove(at: index)
            }
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

// MARK: - TableVIew Delegate Methods
extension NoteListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let noteDetailsViewController = NoteDetailsViewController()
        noteDetailsViewController.note = notes[indexPath.row]
        navigationController?.pushViewController(noteDetailsViewController, animated: true)
    }
}

// MARK: - AddNewItemDelegate Methods
extension NoteListViewController: AddNewNoteDelegate {
    func addNewItem(with item: Note) {
        notes.append(item)
        tableView.reloadData()
    }
}

