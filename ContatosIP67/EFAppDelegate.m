//
//  EFAppDelegate.m
//  ContatosIP67
//
//  Created by ios3401 on 26/03/13.
//  Copyright (c) 2013 br.com.caelum. All rights reserved.
//

#import "EFAppDelegate.h"
#import "EFFormularioContatoViewController.h"


@implementation EFAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    EFFormularioContatoViewController *formulario = [[EFFormularioContatoViewController alloc]init];
    
    self.window.rootViewController = formulario;
    
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}



@end
