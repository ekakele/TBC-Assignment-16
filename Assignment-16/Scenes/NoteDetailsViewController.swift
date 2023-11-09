//
//  NoteDetailsViewController.swift
//  Assignment-16
//
//  Created by Eka Kelenjeridze on 05.11.23.
//

import UIKit

// MARK: - protocol
protocol updateNoteDelegate: AnyObject {
    func updateNote(_ note: Note, with newTitle: String, newContent: String)
}

final class NoteDetailsViewController: UIViewController {
    // MARK: - Properties
    var note: Note?
    
    private lazy var noteDetailsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [noteTileTextField, noteContentTextView, noteDateLabel])
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let noteTileTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        textField.textColor = .darkGray
        textField.textAlignment = .left
        return textField
    }()
    
    private let noteDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.textColor = UIColor(red: 0.61, green: 0.40, blue: 0.27, alpha: 1.00)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private let noteContentTextView: UITextView = {
        let textView = UITextView()
        textView.isScrollEnabled = true
        textView.backgroundColor = .clear
        textView.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        textView.textColor = .darkGray
        textView.textAlignment = .left
        textView.textContainerInset = .zero
        textView.textContainer.lineFragmentPadding = 0
        return textView
    }()
    
    weak var delegate: updateNoteDelegate?
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackground()
        setupNavigationBar()
        setupSubviews()
        setupConstraints()
    }
    
    // MARK: - Configure
    func configure(with note: Note) {
        noteTileTextField.text = note.title
        noteContentTextView.text = note.content
        noteDateLabel.text = note.date
    }
    
    // MARK: - Private Methods
    private func setupBackground() {
        view.backgroundColor = UIColor(red: 0.96, green: 0.95, blue: 0.93, alpha: 1.00)
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "New Note"
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: (UIImage(systemName: "checkmark.circle")),
            style: .plain,
            target: self,
            action: #selector(saveButtonTapped)
        )
    }
    
    @objc private func saveButtonTapped() {
        guard let noteTitle = noteTileTextField.text, let noteContent = noteContentTextView.text else { return }
        if let note {
            delegate?.updateNote(note, with: noteTitle, newContent: noteContent)
        }
        navigationController?.popViewController(animated: true)
    }
    
    private func setupSubviews() {
        view.addSubview(noteDetailsStackView)
        
        noteDetailsStackView.addArrangedSubview(noteTileTextField)
        noteDetailsStackView.addArrangedSubview(noteDateLabel)
        noteDetailsStackView.addArrangedSubview(noteContentTextView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            noteDetailsStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            noteDetailsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            noteDetailsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            noteDetailsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}







