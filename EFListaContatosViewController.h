//
//  EFListaContatosViewController.h
//  ContatosIP67
//
//  Created by ios3401 on 27/03/13.
//  Copyright (c) 2013 br.com.caelum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EFListaContatosProtocol.h"
#import <MessageUI/MFMailComposeViewController.h>
#import <Social/Social.h>

@interface EFListaContatosViewController : UITableViewController <EFListaContatosProtocol, UIActionSheetDelegate, MFMailComposeViewControllerDelegate>
{
    EFContato * contatoSelecionado;
}
@property (nonatomic, strong) NSMutableArray *contatos;

- (void) exibeMaisAcoes: (UIGestureRecognizer *) gesture;

@end
