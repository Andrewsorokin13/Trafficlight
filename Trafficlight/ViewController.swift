import UIKit

final class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet weak var redLightView: UIView!
    @IBOutlet weak var yellowLightView: UIView!
    @IBOutlet weak var greenLightView: UIView!
    
    @IBOutlet weak var startButton: UIButton!
    
    // MARK: - Private Properties
    private var currentLightView = CurrentLightView.redLightView
    private let startTitle = "Start"
    private let nextTitle = "Next"
    
    // MARK: - Overrides Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButtonAppearance()
        configureLightViewAppearance(redLightView)
        configureLightViewAppearance(yellowLightView)
        configureLightViewAppearance(greenLightView)
    }
    
    // MARK: - IB Actions
    @IBAction func startTrafficLight(_ sender: UIButton) {
        if startButton.currentTitle == startTitle {
            startButton.setTitle(nextTitle, for: .normal)
        }
        
        switch currentLightView {
        case .redLightView:
            isOnLight(redLightView, greenLightView)
            currentLightView = .yellowLightView
        case .yellowLightView:
            isOnLight(yellowLightView, redLightView)
            currentLightView = .greenLightView
        case .greenLightView:
            isOnLight(greenLightView, yellowLightView)
            currentLightView = .redLightView
        }
    }
    
    // MARK: - Private Methods
    private func isOnLight(_ currentlight: UIView, _ lightIsOff: UIView) {
        currentlight.alpha = 1.0
        lightIsOff.alpha = 0.3
    }
    
    private func configureButtonAppearance() {
        startButton.setTitle(startTitle, for: .normal)
        
        startButton.layer.cornerRadius = 10
        
        startButton.layer.borderWidth = 2
        startButton.layer.borderColor = UIColor.lightGray.cgColor
        
        startButton.layer.shadowColor = UIColor.black.cgColor
        startButton.layer.shadowOpacity = 0.5
        startButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        startButton.layer.shadowRadius = 5
    }
    
    private func configureLightViewAppearance(_ view: UIView) {
        view.alpha = 0.3
        
        view.layer.masksToBounds = true
        
        view.layer.cornerRadius = view.frame.size.width / 2
        
        view.layer.borderWidth = 4.0
        view.layer.borderColor = UIColor.black.cgColor
        
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 2, height: 2)
        view.layer.shadowRadius = 5
    }
    
}

