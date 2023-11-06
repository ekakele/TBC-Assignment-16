//
//  AddNoteViewController.swift
//  Assignment-16
//
//  Created by Eka Kelenjeridze on 05.11.23.
//

import UIKit

// MARK: - protocol
protocol AddNewNoteDelegate: AnyObject {
    func addNewItem(with item: Note)
}

final class AddNoteViewController: UIViewController {
    // MARK: - Properties
    private lazy var noteDetailsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [noteTileLabel, noteContentTextView, noteDateLabel])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let noteTileLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private let noteDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.textColor = UIColor(red: 0.61, green: 0.40, blue: 0.27, alpha: 1.00)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private let noteContentTextView: UITextView = {
        let textView = UITextView()
        textView.isScrollEnabled = true
        textView.backgroundColor = .clear
        textView.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textView.textColor = .darkGray
        textView.textAlignment = .left
        return textView
    }()
    
    weak var delegate: AddNewNoteDelegate?
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackground()
        setupNavigationBar()
        setupSubviews()
        setupConstraints()
    }
    
    // MARK: - Private Methods
    private func setupBackground() {
        view.backgroundColor = UIColor(red: 0.96, green: 0.95, blue: 0.93, alpha: 1.00)
    }
    
    private func setupNavigationBar() {
        self.navigationItem.title = "New Note"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: (UIImage(systemName: "checkmark.circle")), style: .plain, target: self, action: #selector(saveButtonTapped))
    }
    
    @objc private func saveButtonTapped() {
        guard let noteTitle = noteTileLabel.text, let noteContent = noteContentTextView.text else {
            fatalError()
        }
        let newNote = Note(title: noteTitle, content: noteContent, date: "2023")
        delegate?.addNewItem(with: newNote)
        self.navigationController?.popViewController(animated: true)
    }
    
    private func setupSubviews() {
        view.addSubview(noteDetailsStackView)
        
        noteDetailsStackView.addArrangedSubview(noteTileLabel)
        noteDetailsStackView.addArrangedSubview(noteDateLabel)
        noteDetailsStackView.addArrangedSubview(noteContentTextView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            noteDetailsStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            noteDetailsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            noteDetailsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            noteDetailsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            noteTileLabel.topAnchor.constraint(equalTo: noteDetailsStackView.topAnchor),
            noteTileLabel.leadingAnchor.constraint(equalTo: noteDetailsStackView.leadingAnchor),
            noteTileLabel.trailingAnchor.constraint(equalTo: noteDetailsStackView.trailingAnchor),
            
            noteContentTextView.leadingAnchor.constraint(equalTo: noteDetailsStackView.leadingAnchor),
            noteContentTextView.trailingAnchor.constraint(equalTo: noteDetailsStackView.trailingAnchor)
        ])
    }
}
