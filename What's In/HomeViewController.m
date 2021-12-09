//
//  ViewController.m
//  What's In
//
//  Created by roborock on 2021/12/9.
//

#import "HomeViewController.h"
#import <Masonry.h>

@interface ItemData : NSObject<NSCoding>
@property (strong, nonatomic) NSString * name;
-(instancetype)initWithName: (NSString *)name;
@end

@implementation ItemData
- (instancetype)initWithName: (NSString *)name {
    if (self = [self init]) {
        self.name = name;
    }
    return self;
}
- (void)encodeWithCoder:(nonnull NSCoder *)coder {
    [coder encodeObject:self.name forKey:@"name"];
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)coder {
    if (self = [self init]) {
        self.name = [coder decodeObjectForKey:@"name"];
    }
    return self;
}

@end

@interface HomeViewController ()
@property (strong, nonatomic) NSMutableArray<ItemData *> *datasource;
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UIAlertController *alertView;
@property (strong, nonatomic) UITextField *editingField;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.datasource = [NSMutableArray array];
    
    self.title = @"What's In 🏡";
    self.view.backgroundColor = UIColor.whiteColor;
    
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc] initWithImage:UIImage.addImage style:UIBarButtonItemStylePlain target:self action:@selector(onPressAdd)];
    [self.navigationItem setRightBarButtonItem: rightItem];
    UITableView * tableView = [[UITableView alloc] init];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview: tableView];
    tableView.backgroundColor = UIColor.systemMintColor;
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    self.tableView = tableView;
        

    __weak typeof(self) weakSelf = self;
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"Input name" message:@"Enter your house's nickname" preferredStyle:UIAlertControllerStyleAlert];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        weakSelf.editingField = textField;
    }];
    UIAlertAction * confirmAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        ItemData *row = [[ItemData alloc] initWithName: [NSString stringWithFormat:@"%@", weakSelf.editingField.text]];
        [weakSelf.datasource addObject:row];
        [weakSelf.tableView reloadData];
    }];
    [alert addAction:confirmAction];
    self.alertView = alert;
    // Do any additional setup after loading the view.
}

- (void)onPressAdd {
    [self presentViewController:self.alertView animated:true completion:^{}];
    NSLog(@"Press add.");
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString * identifier = @"cellId";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier: identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.backgroundColor = UIColor.clearColor;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.textLabel.font = [UIFont boldSystemFontOfSize:18];
    }
    cell.textLabel.text = self.datasource[indexPath.row].name;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datasource.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.navigationController pushViewController:[HomeViewController new] animated:true];
}

@end
