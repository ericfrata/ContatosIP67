//
//  EFContatosNoMapaViewController.m
//  ContatosIP67
//
//  Created by ios3401 on 02/04/13.
//  Copyright (c) 2013 br.com.caelum. All rights reserved.
//

#import "EFContatosNoMapaViewController.h"


@interface EFContatosNoMapaViewController ()

@end

@implementation EFContatosNoMapaViewController

-(void) viewDidLoad{
    MKUserTrackingBarButtonItem *botaoLocalizacao = [[MKUserTrackingBarButtonItem alloc]initWithMapView:self.mapa];
    self.navigationItem.leftBarButtonItem = botaoLocalizacao;
    
}
-(id)init {
    self = [super init];
    
    if(self){
        UIImage *imagemTabItem = [UIImage imageNamed:@"mapa-contatos.png"];
        UITabBarItem *tabItem = [[UITabBarItem alloc]initWithTitle:@"Mapa" image:imagemTabItem tag:0];
        self.tabBarItem = tabItem;
        self.navigationItem.title = @"Localização";
    }
    return self;
}

@end
