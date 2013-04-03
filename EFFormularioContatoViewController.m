//
//  EFFormularioContatoViewController.m
//  ContatosIP67
//
//  Created by ios3401 on 26/03/13.
//  Copyright (c) 2013 br.com.caelum. All rights reserved.
//

#import "EFFormularioContatoViewController.h"
#import "EFContato.h"

@interface EFFormularioContatoViewController ()
       
@end

@implementation EFFormularioContatoViewController

@synthesize contato, delegate;

-(id)initWithContato: (EFContato*)_contato{
    self = [super init];
    if (self)
    {
        self.contato = _contato;
        UIBarButtonItem *confirmar = [[UIBarButtonItem alloc] initWithTitle:@"Confirmar"
                                                                      style:UIBarButtonItemStylePlain
                                                                     target:self
                                                                     action:@selector(atualizaContato)];
        self.navigationItem.rightBarButtonItem = confirmar;
    }
    return self;
}



-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *imagemSelecionada = [info valueForKey: UIImagePickerControllerEditedImage];
    [_botaoFoto setImage:imagemSelecionada forState: UIControlStateNormal];
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}

-(void) viewDidLoad
{
    if (self.contato)
    {
        self.nome.text = contato.nome;
        self.telefone.text  = contato.telefone;
        self.email.text = contato.email;
        self.endereco.text = contato.endereco;
        self.site.text = contato.site;
        self.twitter.text = contato.twitter;
        if(contato.foto){
            [_botaoFoto setImage:contato.foto forState:UIControlStateNormal];
        }
        
    }
}

- (id)init {
    self =[super init];
    if (self){
        //self.contatos = [[NSMutableArray alloc] init];
        self.navigationItem.title = @"Cadastro";
        
        UIBarButtonItem *cancela = [[UIBarButtonItem alloc] initWithTitle:@"Cancela"
                                                                    style: UIBarButtonItemStylePlain
                                                                   target:self
                                                                   action:@selector(escondeFormulario)];
        self.navigationItem.leftBarButtonItem = cancela;
        
        UIBarButtonItem *adiciona = [[UIBarButtonItem alloc]initWithTitle:@"Adiciona"
                                                                    style:UIBarButtonItemStylePlain
                                                                   target:self
                                                                   action:@selector(criaContato)];
       self.navigationItem.rightBarButtonItem = adiciona;
    }
    return self;
}

-(void)selecionaFoto:(id)sender{
    if([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]){
        // camera disponivel
    }
    else{
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        picker.allowsEditing = YES;
        picker.delegate = self;
        [self presentViewController:picker animated:YES completion:nil];
    }
}

-(void)escondeFormulario{
    [self dismissViewControllerAnimated:YES completion:nil];
}
//@synthesize nome, telefone, email, endereco, site;

- (IBAction)proximoElemento:(UITextField *)campo{
    if(campo == [self nome]){
        [[self telefone] becomeFirstResponder];
    }
    else if(campo == [self telefone]){
        [[self email] becomeFirstResponder];
    }
    else if(campo == [self email]){
        [[self endereco] becomeFirstResponder];
    }
    else if(campo == [self endereco]){
        [[self site] becomeFirstResponder];
    }
    else if(campo == [self site]){
        [[self twitter] becomeFirstResponder];
    }
       else if(campo == [self endereco]){
        [self pegaDadosDoFormulario];

   //   else if(campo == [self twitter]){
   //    [self pegaDadosDoFormulario];
    }
    
}

- (void) criaContato {
    EFContato *novoContato = [self pegaDadosDoFormulario];
    [self.contatos addObject:novoContato];
    //[self.contatos addObject:[self pegaDadosDoFormulario]];
    //[self.navigationController popViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
    
    if (self.delegate)
    {
        [self.delegate contatoAdicionado:novoContato];
    }
    
}

- (EFContato *)pegaDadosDoFormulario {

    if(!self.contato)
    {
        contato = [[EFContato alloc]init];
    }
    
    if(_botaoFoto.imageView.image){
        contato.foto = _botaoFoto.imageView.image;
    }

    contato.nome = self.nome.text;
    contato.telefone = self.telefone.text;
    contato.email = self.email.text;
    contato.endereco = self.endereco.text;
    contato.site = self.site.text;
    contato.twitter = self.twitter.text;

    //NSLog(@"%@", contato.nome);
    
    return self.contato;
    
}

-(void) atualizaContato
{
    EFContato *contatoAtualizado = [self pegaDadosDoFormulario];
    //[self pegaDadosDoFormulario];
    [self.navigationController popViewControllerAnimated:YES];

    if(self.delegate)
    {
        [self.delegate contatoAtualizado:contatoAtualizado];
    }
    
}

@end
