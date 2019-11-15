//
//  ViewController.swift
//  Geekhub_iOS(HW-5)
//
//  Created by Pavel Bondar on 14.11.2019.
//  Copyright © 2019 Pavel Bondar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var changesValueHereLabel: UILabel!
    @IBOutlet weak var outputs1or2Label: UILabel!
    @IBOutlet weak var itAppearsHereLabel: UILabel!
    @IBOutlet weak var changesEdit: UITextField!
    @IBOutlet weak var valueСhangesLabel: UILabel!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var isChangingHereLabel: UILabel!
    @IBOutlet weak var showImageView: UIImageView!
    var rectView: UIView!
    var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changesValueHereLabel.text = "0"
        changesEdit.addTarget(self, action: #selector(changeText), for: .editingChanged)
        rectView = createView()
        slider = createSlider()
        slider.addTarget(self, action: #selector(changeAlpha), for: .valueChanged)
        createRandomColorButton()
    }
    
    //MARK: - Part 1
    @objc func changeText(text: UITextField) {
        itAppearsHereLabel.text = text.text
    }

    @IBAction func clickButton(_ sender: UIButton) {
        changesValueHereLabel.text = String((Int(changesValueHereLabel.text!)!) + 1)
    }
    @IBAction func clickSegmentControll(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            outputs1or2Label.text = "1"
        } else {
            outputs1or2Label.text = "2"
        }
    }
    @IBAction func slider(_ sender: UISlider) {
        valueСhangesLabel.text = "Value = \(sender.value)"
    }
    @IBAction func switchButton(_ sender: UISwitch) {
        if sender.isOn {
            view.backgroundColor = .cyan
        } else {
            view.backgroundColor = .white
        }
    }
    @IBAction func startButton(_ sender: UIButton) {
        spinner.startAnimating()
    }
    @IBAction func stepperAction(_ sender: UIStepper) {
        isChangingHereLabel.text = Int(sender.value).description
    }
    @IBAction func showImageButton(_ sender: UIButton) {
        let image = UIImage(named: "apple")
        showImageView.image = image
    }
    
    //MARK: - Part 2
    func createSlider() -> UISlider {
        let slider = UISlider(frame: CGRect(x: 20,
                                            y: showImageView.center.y + 100,
                                            width: 200,
                                            height: 0))
        slider.maximumValue = 100
        slider.minimumValue = 0
        self.view.addSubview(slider)
        return slider
    }
    
    func createView() -> UIView {
        let view = UIView(frame: CGRect(x: showImageView.center.x - 20,
                                        y: showImageView.center.y + 50,
                                        width: 100,
                                        height: 100))
        view.alpha = 0.0
        view.backgroundColor = .darkGray
        self.view.addSubview(view)
        return view
    }
    
    @objc func changeAlpha(sender: UISlider) {
        rectView.alpha = CGFloat(sender.value/100)
        let color = CGFloat(sender.value * 2)
        sender.maximumTrackTintColor = UIColor(hue: color,
                                               saturation: 1,
                                               brightness: 1,
                                               alpha: 1)
    }
    
    //MARK: - Part 3
    func createRandomColorButton() {
        let button = UIButton(frame: CGRect(x: 20,
                                            y: slider.center.y + 50,
                                            width: 150,
                                            height: 20))
        button.setTitle("Change color", for: .normal)
        button.addTarget(self, action: #selector(setTitleColorButton), for: .touchDown)
        button.addTarget(self, action: #selector(setRandomBackgroundButton), for: .touchDragOutside)
        view.addSubview(button)
    }
    
    @objc func setRandomBackgroundButton(sender: UIButton) {
        sender.backgroundColor = .random
    }
    
    @objc func setTitleColorButton(sender: UIButton) {
        sender.setTitleColor(.random, for: .normal)
    }
}
    
extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
}
