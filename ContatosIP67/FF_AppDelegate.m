//
//  FF_AppDelegate.m
//  ContatosIP67
//
//  Created by ios3401 on 26/03/13.
//  Copyright (c) 2013 ios3401. All rights reserved.
//

#import "FF_AppDelegate.h"

//Criar o import para o form que será chamado.
//#import "FF_FormularioContatoViewController.h"
#import "EFListaContatosViewController.h"
#import "EFContatosNoMapaViewController.h"
//-------------------------------------------ˆ

@implementation FF_AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    
    //Para Escrever em arquivo, voce precisa buscar o caminho
   
    NSArray *userDirs = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDir = [userDirs objectAtIndex:0];
    self.arquivoContatos = [NSString stringWithFormat:@"%@/ArquivoContatos", documentDir];
    
    self.contatos = [NSKeyedUnarchiver unarchiveObjectWithFile:self.arquivoContatos];
    if(!self.contatos)
    {
        self.contatos = [[NSMutableArray alloc] init];
    }
    
    //-------------------------------------------ˆ
    


    
    //Criar instancia do form para iniciá-lo.
    //FF_FormularioContatoViewController *form = [[FF_FormularioContatoViewController alloc] init];
    //self.window.rootViewController = form;
    
    //self.contatos = [[NSMutableArray alloc] init];
    
    
    EFListaContatosViewController *lista = [[EFListaContatosViewController alloc] init];
    //self.window.rootViewController = lista;
    
    lista.contatos = self.contatos;


    
   UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:lista];
   // self.window.rootViewController =nav;
    
    EFContatosNoMapaViewController *contatosMapa = [[EFContatosNoMapaViewController alloc] init];
    
    contatosMapa.contatos = _contatos;
    
    UINavigationController *mapaNavigation = [[UINavigationController alloc] initWithRootViewController:contatosMapa];
    
    UITabBarController *tabBarController = [[UITabBarController alloc]init ];
    tabBarController.viewControllers = [NSArray arrayWithObjects:nav, mapaNavigation, nil];
    
    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
    
    
    //-------------------------------------------ˆ
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [NSKeyedArchiver archiveRootObject:self.contatos toFile:self.arquivoContatos];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void)ExibMSG:(NSString *)Mensagem{
  
    NSLog(@"Contatos Cadastrados: %d", [self.contatos count]);
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Mensagem"
                                                    message: Mensagem
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil,nil];
    [alert show];
}

@end
