//
//  EFContato.h
//  ContatosIP67
//
//  Created by ios3401 on 26/03/13.
//  Copyright (c) 2013 br.com.caelum. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EFContato : NSObject<NSCoding> //NSCoding = contrato / interface

@property(strong, nonatomic) NSString *nome;
@property(strong, nonatomic) NSString *telefone;
@property(strong, nonatomic) NSString *email;
@property(strong, nonatomic) NSString *endereco;
@property(strong, nonatomic) NSString *site;

@property(strong, nonatomic) UIImage *foto;

@end
