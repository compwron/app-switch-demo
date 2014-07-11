#import "AAViewController.h"

@interface AAViewController ()
    @property (nonatomic, strong) NSArray *supportedURLSchemes;
@end

@implementation AAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self fetchClientToken];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)fetchClientToken{
    NSArray *authorizedApps = @[@"helmet", @"boot"];
    self.supportedURLSchemes = authorizedApps;
    [self addAppSwitchButtons];
}

- (void)addAppSwitchButtons{
    int y = 200;
    
    for (NSString *urlScheme in self.supportedURLSchemes) {
        UIButton *otherAppButton = [UIButton buttonWithType:UIButtonTypeSystem];
        NSString *buttonTitle = [NSString stringWithFormat:@"Go to %@", urlScheme];
        otherAppButton.frame= CGRectMake(0, y, 300, 15);
        [otherAppButton setTitle:buttonTitle forState:UIControlStateNormal];
        [otherAppButton addTarget:self action:@selector(makePayment:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:otherAppButton];
        y+=50;
    }
}

- (void)makePayment: (id)sender{
    UIButton *otherAppButton = (UIButton*) sender;
    NSLog(@"Returning from %@", otherAppButton.titleLabel.text);
    
    NSString *urlSchema = [[otherAppButton.titleLabel.text componentsSeparatedByString:@" "] lastObject];
    
    NSString *otherAppURLString = [NSString stringWithFormat:@"%@://hello?x-success=glove://yep?x-source=Glove",urlSchema];
    NSURL *paymentURL = [NSURL URLWithString:otherAppURLString];
    
    [[UIApplication sharedApplication] openURL:paymentURL];
}

@end
