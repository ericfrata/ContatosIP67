//
//  EFListaContatosViewController.m
//  ContatosIP67
//
//  Created by ios3401 on 27/03/13.
//  Copyright (c) 2013 br.com.caelum. All rights reserved.
//

#import "EFFormularioContatoViewController.h"
#import "EFListaContatosViewController.h"
#import "EFContato.h"


@implementation EFListaContatosViewController

- (id)init {
    if (self = [super init]){
       
        UIImage *imageTabItem = [UIImage imageNamed:@"lista-contatos.png"];
        
        UITabBarItem * tabItem = [[UITabBarItem alloc] initWithTitle:@"Contatos" image:imageTabItem tag:0];
        
        self.tabBarItem = tabItem;
        
        self.navigationItem.title = @"Contatos";
        UIBarButtonItem *botaoExibirFormulario = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                                               target:(self)
                                                                                               action:@selector (exibeFormulario)];
  
        self.navigationItem.rightBarButtonItem = botaoExibirFormulario;
        self.navigationItem.leftBarButtonItem = self.editButtonItem;
        
        
        
    }
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self
                                                                                            action:@selector(exibeMaisAcoes:)];
    
    [self.tableView addGestureRecognizer:longPress];
    
}


-(void)exibeMaisAcoes:(UIGestureRecognizer *)gesture
{
    if(gesture.state == UIGestureRecognizerStateBegan){
        CGPoint ponto = [gesture locationInView:self.tableView];
        NSIndexPath *index = [self.tableView indexPathForRowAtPoint:ponto];
        
        EFContato * contato = self.contatos[index.row];
        
        contatoSelecionado = contato;
        
        UIActionSheet *opcoes = [[UIActionSheet alloc] initWithTitle:contato.nome
                                                            delegate:self
                                                   cancelButtonTitle:@"Cancelar"
                                              destructiveButtonTitle: nil
                                                   otherButtonTitles:@"Ligar", @"Enviar Email", @"Vizualizar site", @"Abrir Mapa", @"Enviar Tweet", nil];
        [opcoes showFromTabBar: self.tabBarController.tabBar];
        
        
    }
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            [self ligar];
            break;
        case 1:
            [self enviarEmail];
            break;
        case 2:
            [self abrirSite];
            break;
        case 3:
            [self mostrarMapa];
            break;
        case 4:
            [self enviarTweet];
            break;
        default:
            break;
    }
}


-(void)enviarTweet{
    SLComposeViewController *enviador = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    [enviador setInitialText:[NSString stringWithFormat:@"@%@", contatoSelecionado.twitter]];
    [self presentViewController:enviador animated:YES completion:nil];
}

-(void)abrirAplicativoComURL:(NSString *) url
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}




-(void)ligar{
    UIDevice *device = [UIDevice currentDevice];
    if([device.model isEqualToString:@"iPhone"]){
        NSString *numero = [NSString stringWithFormat:@"tel: %@", contatoSelecionado.telefone];
        [self abrirAplicativoComURL:numero];
    }
    else{
        [[[UIAlertView alloc]  initWithTitle:@"Impossivel fazer ligacao"
                                    message:@"Seu dispositivo nao e um iPhone"
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                           otherButtonTitles:nil]show];
    }
}


-(void) abrirSite{
    NSString *url = contatoSelecionado.site;
    [self abrirAplicativoComURL:url];
}

-(void)mostrarMapa{
    NSString *url = [NSString stringWithFormat:@"http://maps.apple.com/maps?q=%@", contatoSelecionado.endereco];
    [self abrirAplicativoComURL:url];
}

-(void)enviarEmail
{
    if([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *enviadorEmail = [[MFMailComposeViewController alloc] init];
        enviadorEmail.mailComposeDelegate = self;
        
        [enviadorEmail setToRecipients:[NSArray arrayWithObject:contatoSelecionado.email]];
        [enviadorEmail setSubject:@"Caelum"];
        
        [self presentViewController:enviadorEmail animated:YES completion:nil];
    }
    else{
        UIAlertView* alert=[[UIAlertView alloc] initWithTitle:@"Ops"
                                                      message:@"You cannot send an email"
                                                     delegate:nil
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
        [alert show];
    }
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.contatos count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    EFContato *contato = [self.contatos objectAtIndex:indexPath.row];
    
    cell.textLabel.text = contato.nome;
    
    return cell;
        
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    EFContato *contato = [self.contatos objectAtIndex: indexPath.row];
    //NSLog(@"Nome: %@", contato.nome);
    
    EFFormularioContatoViewController *form = [[EFFormularioContatoViewController alloc] initWithContato:contato];
    form.delegate = self;
    form.contatos = self.contatos;

    [self.navigationController pushViewController:form animated:YES];
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        [self.contatos removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
    }

}
    
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    EFContato *contatoTemporario = [[EFContato alloc]init];
    [self.contatos removeObjectAtIndex:sourceIndexPath.row];
    [self.contatos insertObject:contatoTemporario atIndex:destinationIndexPath.row];
}


- (void) exibeFormulario
{

    EFFormularioContatoViewController *form = [[EFFormularioContatoViewController alloc]init];
    
    form.contatos = self.contatos;
    form.delegate = self;
    
    UINavigationController *navigation = [[UINavigationController alloc]initWithRootViewController:form];
    
    [self presentViewController:navigation animated:YES completion:nil];
    
}

- (void) viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

-(void) contatoAtualizado:(EFContato *)contato
{
    NSLog(@"Atualizado: %d", [self.contatos indexOfObject:contato]);
}


-(void) contatoAdicionado:(EFContato *)contato{
    NSLog(@"Adicionado: %d", [self.contatos indexOfObject:contato]);
}

@end