文字路片滚动，自定义cell样式。

DemoGif

![image](https://github.com/a758209678/XXAutoScrollView/blob/master/XXScrollViewGif.gif)


//这里替换成你想滚动的cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CCCoinIncomeCell *cell = [[CCCoinIncomeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    CCCoinIncom *item = self.titles[indexPath.row];
    cell.coinIncom = item;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

//实现代理方法
-(void)didSelectAutoScrollView {
    NSLog(@"1");
}
