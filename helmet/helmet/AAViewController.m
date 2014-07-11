

#import "AAViewController.h"

@interface AAViewController ()

@end

@implementation AAViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImageView *myImageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
    myImageView.image = [UIImage imageNamed:@"helmet.png"];
    
    UIButton *authorizeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    authorizeButton.frame = CGRectMake(0, 200, 300, 15);
    [authorizeButton setTitle:[NSString stringWithFormat:@"Return to sending application"] forState:UIControlStateNormal];
    [authorizeButton addTarget:self action:@selector(returnToSourceApp) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:myImageView];
    
    [self.view addSubview:authorizeButton];
}

- (void)returnToSourceApp{
    NSLog(@"Clicked Back button with URL: %@", self.sourceSuccessURL);
    NSString *urlString = [self.sourceSuccessURL absoluteString];
    
    NSString *urlWithAuthToken = [NSString stringWithFormat:@"%@?auth_token=HelloFromHelmet",urlString];
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString:urlWithAuthToken]];
}

@end
