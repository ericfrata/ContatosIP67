//
//  EFFormularioContatoViewController.h
//  ContatosIP67
//
//  Created by ios3401 on 26/03/13.
//  Copyright (c) 2013 br.com.caelum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EFContato.h"
#import "EFListaContatosProtocol.h"

@interface EFFormularioContatoViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (strong, nonatomic) EFContato *contato;

- (id)initWithContato:(EFContato *)contato;

@property (weak, nonatomic) IBOutlet UITextField *nome;
@property (weak, nonatomic) IBOutlet UITextField *telefone;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *endereco;
@property (weak, nonatomic) IBOutlet UITextField *site;
@property (weak, nonatomic) IBOutlet UIButton *botaoFoto;

@property (weak, nonatomic) id<EFListaContatosProtocol> delegate;

@property (strong, nonatomic) NSMutableArray *contatos;

-(IBAction)selecionaFoto:(id)sender;

//- (IBAction)CadastroContato:(UIButton*)sender;

- (IBAction)proximoElemento:(UITextField*)textField;


@end
