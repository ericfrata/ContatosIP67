//
//  EFContatosNoMapaViewController.m
//  ContatosIP67
//
//  Created by ios3401 on 02/04/13.
//  Copyright (c) 2013 br.com.caelum. All rights reserved.
//

#import "EFContatosNoMapaViewController.h"
#import <MapKit/MKMapView.h>


@interface EFContatosNoMapaViewController ()

@end

@implementation EFContatosNoMapaViewController

- (id)init
{
    self = [super init];
    if (self) {
        
        UIImage *imageTabItem = [UIImage imageNamed:@"mapa-contatos.png"];
        UITabBarItem *tabItem = [[UITabBarItem alloc] initWithTitle:@"Mapa" image:imageTabItem tag:0];
        
        self.tabBarItem = tabItem;
        self.navigationItem.title = @"Localização";
        
    }
    return self;
}

-(void) viewWillAppear:(BOOL)animated{
    [self.mapa addAnnotations:_contatos];
}

-(void) viewWillDisappear:(BOOL)animated{
    [self.mapa removeAnnotations:_contatos];
}

-(MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    if ([annotation isKindOfClass:[MKUserLocation class]]){
        return nil;
    }
    static NSString *identifier = @"pino";
    MKPinAnnotationView *pino = (MKPinAnnotationView *)[_mapa dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (!pino){
        pino = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:identifier];
    }else{
        pino.annotation = annotation;
    }
    
    EFContato *contato = (EFContato*) annotation;
    pino.pinColor = MKPinAnnotationColorRed;
    pino.canShowCallout = YES;

    if (contato.foto){
        UIImageView *imagemContato = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
        imagemContato.image = contato.foto;
        pino.leftCalloutAccessoryView = imagemContato;
    }
    return pino;
}


-(void)viewDidLoad{
    [super viewDidLoad];
    MKUserTrackingBarButtonItem *botaoLocalizacao = [[MKUserTrackingBarButtonItem alloc] initWithMapView:self.mapa];
    self.navigationItem.leftBarButtonItem = botaoLocalizacao;
}
@end
