//
//  ViewController.swift
//  Assignment-16
//
//  Created by Eka Kelenjeridze on 05.11.23.
//

import UIKit


class Note {
    let title: String
    let content: String
    let date: String
    
    init(title: String, content: String, date: String) {
        self.title = title
        self.content = content
        self.date = date
    }
    
    static let myNotes = [
        Note(
            title: "App Idea 💡",
            content: "Came up with a brilliant app idea today! It's time to start planning and sketching the user interface. Exciting times ahead!",
            date: "November 5, 2023"
        ),
        Note(
            title: "Debugging Journey 💻",
            content: "Spent the day debugging my code. It can be frustrating, but I'm learning so much in the process. Don't give up, fellow learners, debugging is a skill we all need!",
            date: "October 31, 2023"
        ),
        Note(
            title: "Useful Resources 🔗",
            content: "Compiled a list of valuable Swift learning resources, including online courses, documentation, and forums. These will be my go-to references while learning Swift.",
            date: "October 12, 2023"
        ),
        Note(
            title: "Xcode Tricks 🛠️",
            content: "Discovered some useful Xcode shortcuts and tricks today. These will definitely speed up my coding workflow. I love the efficiency gains!",
            date: "September 30, 2023"
        ),
        Note(
            title: "Swift Language Basics 📌",
            content: "Today, I reviewed the fundamentals of Swift, including variables, constants, and data types. It's crucial to have a strong foundation. Onward to more complex topics!",
            date: "September 21, 2023"
        )
    ]
}
