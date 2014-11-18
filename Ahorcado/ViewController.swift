//
//  ViewController.swift
//  Ahorcado
//
//  Created by Daniel Santiago Martinez on 18/11/14.
//  Copyright (c) 2014 Daniel Santiago Martinez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var imagenes: [String] = ["pikachu.png", "charmander.png", "squirtle.png", "bulbasaur.png"]
    var palabras: [String] = ["SWIFT", "APPLE", "XCODE", "DICCIONARIO", "DEVELOPER", "PALABRA"]
    var palabraSecreta: String!
    var errores = 0
    
    @IBOutlet weak var palabraLabel: UILabel!
    @IBOutlet weak var letraText: UITextField!
    @IBOutlet weak var imagen: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var i: Int = Int(arc4random_uniform(UInt32(palabras.count)))
        palabraSecreta = palabras[i]
        var stringLabel: String = String()
        for(var pos=0; pos<countElements(palabraSecreta); pos++){
            stringLabel += "_ "
        }
        palabraLabel.text = stringLabel
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func comprobarLetra(sender: AnyObject) {
        var existe = false
        var letra: Character = Array(letraText.text.uppercaseString)[0]
        
        var stringTemp = palabraLabel.text
        
        for(var i=0; i<countElements(palabraSecreta); i++){
            if(Array(palabraSecreta)[i] == letra){
                existe = true
                var rango:Range<String.Index> = Range<String.Index>(start: advance(stringTemp!.startIndex, i*2), end: advance(stringTemp!.startIndex, i*2+1))
                stringTemp = stringTemp?.stringByReplacingCharactersInRange(rango, withString: String(letra))
            }
        }
        
        if(!existe){
            errores++
            imagen.image = UIImage(named: imagenes[errores])
            if(errores == imagenes.count-1){
                let secondViewController: SecondViewController = self.storyboard?.instantiateViewControllerWithIdentifier("GameOver") as SecondViewController
                //Aquí debes establecer el texto y la imagen a mostrar
                secondViewController.texto = "HAS PERDIDO!!!"
                secondViewController.nombreImagen = "ahorcado5.jpg"
                self.showViewController(secondViewController, sender: self)
            }
        }
        else{
            let stringTemp2 = stringTemp?.stringByReplacingOccurrencesOfString(" ", withString: "", options: nil, range: nil)
            if(stringTemp2 == palabraSecreta){
                let secondViewController: SecondViewController = self.storyboard?.instantiateViewControllerWithIdentifier("GameOver") as SecondViewController
                secondViewController.texto = "HAS GANADO!!!"
                self.showViewController(secondViewController, sender: self)
            }
        }
        
        palabraLabel.text = stringTemp
        letraText.text = ""
        self.view.endEditing(true)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
}

