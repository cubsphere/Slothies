//
//  Player.swift
//  Slothies
//
//  Created by Lucas Miranda Lin on 13/05/19.
//  Copyright © 2019 Slothies Inc. All rights reserved.
//

import UIKit

class Player {
    //deve conter informacoes e metodos relacionados a ao jogador
    
    //estes comentarios foram escritos sem muito pensamento
    //se achar melhor, sinta-se disposto a ignora-los
    
    //identificador unico ao jogador. não é definitivo
    let identifier: UUID
    
    //preguicinha
    var slothy: Sloth?
    
    //algum valor anterior de exercicio (i.e. numero previo de passos)
    //use para atualizar preguiçometro
    //ainda não olhamos healthkit: não sabemos se é necessário, ou de que dado se trata
    var previousHealthStatus: Int
    
    init() {
        identifier = UIDevice().identifierForVendor!
        previousHealthStatus = 0
    }
}
