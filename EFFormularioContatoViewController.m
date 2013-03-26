//
//  EFFormularioContatoViewController.m
//  ContatosIP67
//
//  Created by ios3401 on 26/03/13.
//  Copyright (c) 2013 br.com.caelum. All rights reserved.
//

#import "EFFormularioContatoViewController.h"

@interface EFFormularioContatoViewController ()

@end

@implementation EFFormularioContatoViewController

@synthesize nome, telefone, email, endereco, site;

- (IBAction)CadastroContato:(id)sender {
    
    NSMutableDictionary *dadosDoContato = [[NSMutableDictionary alloc] init];
    [dadosDoContato setObject:[nome text] forKey:@"nome"];
    [dadosDoContato setObject:[telefone text] forKey:@"telefone"];
    [dadosDoContato setObject:[email text] forKey:@"email"];
    [dadosDoContato setObject:[endereco text] forKey:@"endereco"];
    [dadosDoContato setObject:[site text] forKey:@"site"];

    NSLog(@"dados: %@", dadosDoContato);
    
}
@end
