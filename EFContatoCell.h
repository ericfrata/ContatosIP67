//
//  EFContatoCell.h
//  ContatosIP67
//
//  Created by ios3401 on 03/04/13.
//  Copyright (c) 2013 br.com.caelum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EFContato.h"

@interface EFContatoCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UILabel *labelNome;
@property (weak, nonatomic) IBOutlet UILabel *labelEmail;
@property (weak, nonatomic) IBOutlet UILabel *labelTwitter;
@property (weak, nonatomic) IBOutlet UIImageView *imageFoto;



- (void)setContato: (EFContato *) contato;

@end
