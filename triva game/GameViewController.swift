//
//  GameViewController.swift
//  triva game
//
//  Created by Morgan w Rees on 12/3/20.
//

import UIKit

class GameViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
   
    

    
    var gameModels = [question]()
    var currrentQuestion: question?
    @IBOutlet var label: UILabel!
    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
         table.dataSource = self
setupQuestions()
        configureUI(question: gameModels.first!)
        
    }
    
    
    
    private func configureUI(question: question) {
        label.text = question.text
        currrentQuestion = question
        table.reloadData()
        
    }
    private func checkanswer(answer: answer, question: question) -> Bool {
        return question.answers.contains(where: { $0.text == answer.text }) && answer.correct
        
    }
    private func setupQuestions() {
        gameModels.append(question(text: "In Operation Plunder what US Army crossed the Rhine in support of  the British second army and caused the route of the first German Parachute army?",answers: [
            answer(text: "US 6th Army" , correct: false ),
            answer(text: "US 3th Army" , correct: false ),
            answer(text: "US 2th Army" , correct: false ),
            answer(text: "US 9th Army" , correct: true),
        ]))
        
        gameModels.append(question(text: "In 1944 Adolf Hitler authorized the creation of what civilian millita?",answers: [
            answer(text: "The Home Guard" , correct: false ),
            answer(text: "Volkssturm" , correct: true ),
            answer(text: "WerWolf" , correct: false ),
            answer(text: "Valkyires" , correct: false),
            
        ]))
        
        gameModels.append(question(text: "The 3rd Reich disbanded on what day?",answers: [
            answer(text: "May 23" , correct: true ),
            answer(text: "May 8th" , correct: false ),
            answer(text: "June 6th" , correct: false ),
            answer(text: "September 2nd" , correct: false),
        ]))
        
        gameModels.append(question(text: " What Ship earned 4 battle stars in the Pacific threater of operations?",answers: [
            answer(text: "USS Missouri" , correct: false ),
            answer(text: "USS. Yorktown" , correct: false ),
            answer(text: "USS Enterprise" , correct: true),
            answer(text: "The Bismarck" , correct: false),
            
        ]))
        
        gameModels.append(question(text: "What was the name of the plane that dropped an Atomic bomb on Nagaski?",answers: [
            answer(text: "Enola Gay" , correct: false ),
            answer(text: "Maverick" , correct: false ),
            answer(text: "Tirpitz" , correct: false),
            answer(text: "Bochscar" , correct: true),
            
        ]))
        gameModels.append(question(text: " What Ship sunk the HMS Hood?",answers: [
            answer(text: "USS Missouri" , correct: false ),
            answer(text: "USS Yorktown" , correct: false ),
            answer(text: "USS Enterprise" , correct: false),
            answer(text: "The Bismarck" , correct: true),
            
        ]))
        gameModels.append(question(text: "In operation Husky the allies solicated the aid of what anti Mussolini group?",answers: [
            answer(text: "Crops of Freedom volunteers" , correct: false ),
            answer(text: "Brigate Garibaldi" , correct: false ),
            answer(text: "Brigate Mazzini" , correct: false),
        answer(text: "The Mafia" , correct: true),
        ]))
        gameModels.append(question(text: "What battle wiped out the  Japanese aircraft carriers?",answers: [
            answer(text: "Midway" , correct: true ),
            answer(text: "Phipplines" , correct: false ),
            answer(text: "Wake island " , correct: false),
        answer(text: "Guandalcanal" , correct: false),
        ]))

        gameModels.append(question(text: "What was the german codename for the battle of the bugle?",answers: [
            answer(text: "Operation hail mary" , correct: false ),
            answer(text: " operation  Death" , correct: false ),
            answer(text: "operation i'm tired of typing the word operation" , correct: false),
        answer(text: "Operation Watch on the Rhine" , correct: true),
        ]))
        
        gameModels.append(question(text: "The Kyuio incident was a last attempt to keep the war going by doing what?",answers: [
            answer(text: "A Coup" , correct: true ),
            answer(text: "invading the United States " , correct: false ),
            answer(text: "Surrendering" , correct: false),
        answer(text: "Drawing anime" , correct: false),
        ]))


    }
  
// Table view functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currrentQuestion?.answers.count ?? 0
    }
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = currrentQuestion?.answers[indexPath.row].text
       return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let question = currrentQuestion else {
            return
        
        }
        let answer = question.answers[indexPath.row]
        
        if  checkanswer(answer: answer , question: question) {
            // correct
            if let index = gameModels.firstIndex(where: {$0.text == question.text }) {
                if index < (gameModels.count - 1) {
                    // next question
                    let nextquestion = gameModels[index + 1]
                   print ("\(nextquestion.text)")
                    currrentQuestion = nil
                    configureUI(question: nextquestion)
                }
                else {
                    // end of game
                    let alert = UIAlertController(title: "victory", message: "now go and play outside", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
                    present(alert, animated: true)
                }
                }
            }
        else {
            // wrong
            let alert = UIAlertController(title: "wrong", message: "fail", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
            present(alert, animated: true)
        }
    }
    }



struct question {
    let text: String
    let answers: [answer]
}
    struct answer {
        let text: String
        let correct: Bool // true / false
    }

