//
//  EFContatosNoMapaViewController.h
//  ContatosIP67
//
//  Created by ios3401 on 02/04/13.
//  Copyright (c) 2013 br.com.caelum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "EFContato.h"

@interface EFContatosNoMapaViewController : UIViewController <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapa;
@property (strong, nonatomic) NSMutableArray *contatos;

@end
