
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var QuestionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
   @objc func updateUI() {
       
       let answerChoice = quizBrain.getAnswer()
       choice1.setTitle(answerChoice[0], for: .normal)
       choice2.setTitle(answerChoice[1], for: .normal)
       choice3.setTitle(answerChoice[2], for: .normal)
       
       choice1.backgroundColor = UIColor.clear
       choice2.backgroundColor = UIColor.clear
       choice3.backgroundColor = UIColor.clear
       
       choice1.layer.cornerRadius = 20
       choice2.layer.cornerRadius = 20
       choice3.layer.cornerRadius = 20
       
       QuestionLabel.text = quizBrain.getQuestingText()
       progressBar.progress = quizBrain.getProgress()
       scoreLabel.text = "Score: \(quizBrain.getScore())"
    }
    
    

}

