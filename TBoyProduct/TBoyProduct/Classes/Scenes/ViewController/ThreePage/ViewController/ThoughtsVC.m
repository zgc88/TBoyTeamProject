//
//  ThoughtsVC.m
//  TBoyProduct
//
//  Created by lanou3g on 15/11/11.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "ThoughtsVC.h"

@interface ThoughtsVC ()
{
    int height;
}
@property (nonatomic,strong) UITextView *thoughtTextView;
@end

@implementation ThoughtsVC

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.title = @"经历与感想";
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"确认" style:UIBarButtonItemStyleDone target:self action:@selector(doneBtnAction:)];
    }
    return self;
}

- (void)doneBtnAction:(id)sender{
    NSString *thoughtStr = self.thoughtTextView.text;
    self.textRtn(thoughtStr);
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    [self addAllViews];
    
    
}

- (void)addAllViews{
    self.thoughtTextView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    [_thoughtTextView becomeFirstResponder];
    _thoughtTextView.text=@"asdasd";
    [self.view addSubview:_thoughtTextView];
    
    _thoughtTextView.text = self.theArticle;
    
}

//- (void)setTheArticle:(NSString *)theArticle{
//   _thoughtTextView.text = self.theArticle;
//    
//    NSLog(@"??????????????%@",self.theArticle);
//    NSLog(@"???????????????%@",_thoughtTextView.text);
//}

- (void)keyboardWillShow:(NSNotification *)aNotification
{
    NSDictionary *userInfo = [aNotification userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    height = keyboardRect.size.height;
    self.thoughtTextView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - height);
}

@end
