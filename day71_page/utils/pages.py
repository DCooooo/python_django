class Page():
    def __init__(self,page_num,total_count,url_prefix,per_page=10,max_page=11):
        '''

        :param page_num: 当前页
        :param total_count: 总数据
        :param url_prefix: url标识
        :param per_page: 每一页展示的数据
        :param max_page: 每一页允许展示的最大页码数
        '''
        self.url_prefix = url_prefix
        self.max_page = max_page
        # 计算总页数
        page_count, m = divmod(total_count, per_page)
        if m:
            page_count += 1
        self.page_count = page_count
        # 用户输入错误时的解决办法
        try:
            page_num = int(page_num)
            # 当用户输入的页数超过最大页数时，返回最后一页
            if page_num > page_count:
                page_num = page_count
            # 当输入数据小于1时：
            if page_num < 1:
                page_num = 1
        except Exception as e:
            # 当输入的页码不是正常的数字时
            page_num = 1
        self.page_num = page_num
        # 每一页的数据起始和结束
        self.data_start = (page_num - 1) * 10
        self.data_end = page_num * 10
        # 对称两边的页数
        half_page = self.max_page // 2
        # 起始和结束页码
        start_page = page_num - half_page
        end_page = page_num + half_page
        # 判断总页数小于per_page的情况
        if page_count < self.max_page:
            self.max_page = page_count
        # 如果起始页比1还小
        if start_page < 1:
            start_page = 1
            end_page = self.max_page
        # 如果尾页比总页数还要大
        if end_page > page_count:
            end_page = page_count
            start_page = end_page - self.max_page + 1
        self.start_page =start_page
        self.end_page =end_page

    @property
    def start(self):
        return  self.data_start

    @property
    def end(self):
        return  self.data_end

    def page_html(self):
        # 自己拼接分页的html代码
        html_str_list = []
        # 添加首页页码
        html_str_list.append('<li><a href="/{}/?page=1">首页</a></li>'.format(self.url_prefix))
        # 添加上一页功能
        if self.page_num <= 1:
            html_str_list.append(
                '<li class="disabled"><a href="" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>')
        else:
            html_str_list.append(
                '<li><a href="?page={}" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>'.format(
                    self.page_num - 1))

        for i in range(self.start_page, self.end_page + 1):
            if i == self.page_num:
                tmp = '<li class = "active"><a href="/{0}/?page={1}">{1}</a></li>'.format(self.url_prefix,i)
            else:
                tmp = '<li><a href="/{0}/?page={1}">{1}</a></li>'.format(self.url_prefix,i)
            html_str_list.append(tmp)

        # 添加下一页功能
        if self.page_num >= self.page_count:
            html_str_list.append(
                '<li class="disabled"><a href="" aria-label="Previous"><span aria-hidden="true">&raquo;</span></a></li>')
        else:
            html_str_list.append(
                '<li><a href="?page={}" aria-label="Previous"><span aria-hidden="true">&raquo;</span></a></li>'.format(
                    self.page_num + 1))
        # 添加尾页页码
        html_str_list.append('<li><a href="/{}/?page={}">尾页</a></li>'.format(self.url_prefix,self.page_count))
        page_html = ''.join(html_str_list)
        return page_html