//
//  EFContatoCell.m
//  ContatosIP67
//
//  Created by ios3401 on 03/04/13.
//  Copyright (c) 2013 br.com.caelum. All rights reserved.
//

#import "EFContatoCell.h"

@implementation EFContatoCell

- (void)setContato: (EFContato *) contato;
{
    self.labelNome.text = contato.nome;
    self.labelEmail.text = contato.email;
    self.labelTwitter.text = contato.twitter;
    if(contato.foto){
        self.imageFoto.image = contato.foto;
    }
    else{
        self.imageFoto.image =  [UIImage imageNamed:@"lista-contatos.png"];
    }
    
}

@end
