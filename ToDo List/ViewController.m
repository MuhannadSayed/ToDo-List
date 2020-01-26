//
//  ViewController.m
//  ToDo List
//
//  Created by Muhannad Sayed Abdullah on 2020-01-23.
//  Copyright © 2020 Muhannad. All rights reserved.
//

#import "ViewController.h"
#import "ListCellTableViewCell.h"
#import "AddItemViewController.h"

@interface ViewController () <UITableViewDelegate , UITableViewDataSource , AddItemViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) NSMutableArray *items;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.items = @[@{@"name" : @"Call the car workshop" , @"category" : @"Home"}].mutableCopy;
    self.navigationItem.title = @"To-Do list";
   // self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewItem)];
    
    
    
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"TodoItemRow";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    NSDictionary *item = self.items[indexPath.row];
    cell.textLabel.text = item[@"name"];
    
    if([item[@"completed"]boolValue]){
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}
-(void)addNewItem{
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    AddItemViewController *addVC = segue.destinationViewController;
    addVC.delegate = self;
    
    /*
     UINavigationController *nav = segue.destinationViewController;
     AddItemViewController *addVC = nav.viewControllers[0];
     addVC.delegate = self;
     */
}

- (void)didSaveNewTodo:(NSString *)todoText{
    NSLog(@"%@" , todoText);
    NSDictionary *item = @{@"name" : todoText,@"category" : @"Home"};
    [self.items addObject:item];
    [self.tableView reloadData];
}
 

/*
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NSString *cellId = @"ListCell";
    ListCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (nil == cell){
        cell = [[ListCellTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.cellLabel.text = @"Hi";
    return cell;
    
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    NSLog (@"hello %@" , indexPath);
    
}
*/
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSMutableDictionary *item = [self.items[indexPath.row] mutableCopy];
    BOOL completed = [item[@"completed"] boolValue];
    item[@"completed"] = @(!completed);
    self.items[indexPath.row] = item;
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = ([item[@"completed"]boolValue]) ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
@end
