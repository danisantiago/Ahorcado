//
//  SecondViewController.swift
//  Ahorcado
//
//  Created by Daniel Santiago Martinez on 18/11/14.
//  Copyright (c) 2014 Daniel Santiago Martinez. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var texto: String!
    var nombreImagen: String!
    @IBOutlet weak var textoLabel: UILabel!
    @IBOutlet weak var imagen: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textoLabel.text = texto
        imagen.image = UIImage(named: nombreImagen)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let juego: ViewController = segue.destinationViewController as ViewController
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */

}
