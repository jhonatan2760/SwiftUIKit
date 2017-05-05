//
//  ViewController.swift
//  UIKIT swift
//
//  Created by Jhonatan Souza on 5/5/17.
//  Copyright © 2017 Jhonatan Souza Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var meu_segmento: UISegmentedControl!
    @IBOutlet weak var meu_steper: UIStepper!
    @IBOutlet weak var lbl_ano: UILabel!
    @IBOutlet weak var salvar: UIButton!
    @IBOutlet weak var inf_rota: UIButton!
    @IBOutlet weak var km: UILabel!
    @IBOutlet weak var ano: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var lbl_rota: UILabel!
    
    @IBAction func st_valuechange(_ sender: Any) {
        self.ano.text = "\(Int(meu_steper.value))";
    }
    
    @IBAction func changed_index(_ sender: Any) {
        switch(meu_segmento.selectedSegmentIndex){
            case 0 :
                print("Você clicou no botão 1");
                break;
        case 1 :
                print ("Você clicou no botão 2");
                break;
        case 2 :
            print("Você clicou no botão 3");
            break;
        case 3 :
            print("Você clicou no botão Arduino, você é pica!");
            break;
        default :
                break;
        }
    }
    @IBAction func slider_change(_ sender: UISlider) {
        self.km.text = "\(Int(sender.value))";
    }
    
    @IBAction func informar_rota(_ sender: Any) {
        let alerta = UIAlertController(
            title: "Atenção:",
            message: "Escolha a forma de receber a rota",
            preferredStyle: UIAlertControllerStyle.actionSheet);
        
        alerta.addAction(UIAlertAction(
            title: "SMS",
            style: UIAlertActionStyle.default,
            handler: {(action) in self.lbl_rota.text = action.title}));
        
        
        alerta.addAction(UIAlertAction(
            title: "E-mail",
            style: UIAlertActionStyle.default,
            handler: {(action) in self.lbl_rota.text = action.title}));
        
        
        alerta.addAction(UIAlertAction(
            title: "Cancelar",
            style: UIAlertActionStyle.default,
            handler: {(action) in self.lbl_rota.text = action.title}));
        
        present(alerta, animated: true, completion: nil);
    }
    
    @IBAction func salvar_nq(_ sender: Any) {
        var msg:String
        var tipo:String
        
        if(self.meu_segmento.selectedSegmentIndex >= 0){
            tipo = meu_segmento.titleForSegment(at: meu_segmento.selectedSegmentIndex)!
            msg = "O veículo \(tipo) do ano \(self.ano.text) foi salvo com sucesso!"
        }else{
            tipo = "";
            msg = "Escolha uma das opções, carro, moto, SUV ou Arduino";
        }
        
        let alerta = UIAlertController(
            title: "Atenção:",
            message: msg,
            preferredStyle: UIAlertControllerStyle.alert);
        
        alerta.addAction(UIAlertAction(
            title: "Ok, eu já sabia.",
            style: UIAlertActionStyle.default,
            handler: nil));
        
        present(alerta, animated: true, completion: nil);
        
        
    }
    
    @IBAction func switch_change(_ sender: UISwitch) {
        let alerta = UIAlertController(
            title: "Atenção:",
            message: "\(sender.isOn)",
            preferredStyle: UIAlertControllerStyle.alert);
        
        alerta.addAction(UIAlertAction(
            title: "Ok",
            style: UIAlertActionStyle.default,
            handler: nil));
        present(alerta, animated: true, completion: nil);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ano.text = "1980";
        self.km.text = "7500";
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

