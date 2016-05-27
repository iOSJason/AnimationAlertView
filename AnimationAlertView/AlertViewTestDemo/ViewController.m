//
//  ViewController.m
//  AlertViewTestDemo
//
//  Created by 劉光軍 on 16/4/1.
//



#import "ViewController.h"
#import "UIView+SetRect.h"
#import "MessageAlertView.h"
#import "ButtonsAlertView.h"
#import "AbstractAlertView.h"


@interface ViewController ()<AbstractAlertViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatButtonWithTitle:@"MessageButton" y:100 tag:100];
    [self creatButtonWithTitle:@"NormalButton" y:300 tag:200];
    
    // Do any additional setup after loading the view, typically from a nib.
}

//MARK:- CreateButton
- (void)creatButtonWithTitle:(NSString *)title y:(CGFloat)y tag:(NSInteger)tag {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.frame = CGRectMake(self.view.frame.size.width/2 - 75 , y, 150, 60);
    btn.backgroundColor = [UIColor orangeColor];
    btn.tag = tag;
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:18];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}

- (void)btnClick:(UIButton *)btn {
    
    if (btn.tag == 100) {
        //MessageButton
        
        AbstractAlertView *alertView = [[MessageAlertView alloc] init];
        alertView.message = @"惟江上之清风，与山间之明月，耳得之而为声，目遇之而成色，取之无禁，用之不竭。";
        alertView.contentView = self.view;
        alertView.autoHiden = YES;
        alertView.delayAutoHidenDuration = 2.f;
        [alertView show];
        
    } else {
            //NormalButton
        AbstractAlertView *showView = [[ButtonsAlertView alloc] init];
        showView.delegate = self;
        showView.contentView = self.view;
        showView.buttonsTitle = @[@"OK",@"Cancel"];
        showView.message = @"Test message show";
        UIButton *button = (UIButton *)[showView viewWithKey:@"secondButton"];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [showView show];
    }
    
}

- (void)alertView:(AbstractAlertView *)alertView data:(id)data atIndex:(NSInteger)index {
    
    [alertView hide];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
