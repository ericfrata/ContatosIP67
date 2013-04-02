//
//  EFListaContatosProtocol.h
//  ContatosIP67
//
//  Created by ios3401 on 29/03/13.
//  Copyright (c) 2013 br.com.caelum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EFContato.h"

@protocol EFListaContatosProtocol <NSObject>

-(void) contatoAtualizado: (EFContato *) contato;
-(void) contatoAdicionado: (EFContato *) contato;

@end
