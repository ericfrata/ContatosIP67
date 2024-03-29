//
//  EFContato.m
//  ContatosIP67
//
//  Created by ios3401 on 26/03/13.
//  Copyright (c) 2013 br.com.caelum. All rights reserved.
//

#import "EFContato.h"

@implementation EFContato 

//estou implementando as classes do contrato (interface).

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self){
        [self setNome:[aDecoder decodeObjectForKey:@"nome"]];
        [self setTelefone:[aDecoder decodeObjectForKey:@"telefone"]];
        [self setEmail:[aDecoder decodeObjectForKey:@"email"]];
        [self setEndereco:[aDecoder decodeObjectForKey:@"endereco"]];
        [self setSite:[aDecoder decodeObjectForKey:@"site"]];
        [self setFoto:[aDecoder decodeObjectForKey:@"foto"]];
        [self setTwitter:[aDecoder decodeObjectForKey:@"twitter"]];
        [self setLatitude:[aDecoder decodeObjectForKey:@"latitude"]];
        [self setLongitude:[aDecoder decodeObjectForKey:@"longitude"]];
    }
    return self;
}

-(CLLocationCoordinate2D)coordinate{
    return CLLocationCoordinate2DMake([_latitude doubleValue], [_longitude doubleValue]);
}

-(NSString *) title{
    return _nome;
}

-(NSString *) subtitle{
    return _twitter;
}

-(void) encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:_nome forKey:@"nome"];
    [aCoder encodeObject:_telefone forKey:@"telefone"];
    [aCoder encodeObject:_email forKey:@"email"];
    [aCoder encodeObject:_endereco forKey:@"endereco"];
    [aCoder encodeObject:_site forKey:@"site"];
    [aCoder encodeObject:_foto forKey:@"foto"];
    [aCoder encodeObject:_twitter forKey:@"twitter"];
    [aCoder encodeObject:_latitude forKey:@"latitude"];
    [aCoder encodeObject:_longitude forKey:@"longitude"];
}

@end
