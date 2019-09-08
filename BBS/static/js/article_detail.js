$('#div_digg .action').click(function () {
            if ($(".js").attr("username")) {
                // 点赞或踩灭，返回一个布尔值
                var is_up = $(this).hasClass('diggit');
                // 获取对应这篇文章的id
                var article_id = $(".js").attr("article_id");

                $.ajax({
                    url: 'blog/up_down/',
                    type: 'post',
                    data: {
                        is_up: is_up,
                        article_id: article_id,
                        csrfmiddlewaretoken: $("[name='csrfmiddlewaretoken']").val(),
                    },
                    success: function (data) {
                        console.log(data);
                        if (data.state) {//点赞或者踩灭成功
                            if (is_up) {
                                var val = $('#digg_count').text();
                                val = parseInt(val) + 1;
                                $('#digg_count').text(val);
                            } else {
                                var val = $('#bury_count').text();
                                val = parseInt(val) + 1;
                                $('#bury_count').text(val);
                            }
                        } else {//重复提交
                            if (data.first_action) {
                                $('#digg_tips').html('您已推荐过');
                            } else {
                                $('#digg_tips').html('您已反对过');
                            }
                            setTimeout(function () {
                                $('#digg_tips').html('')
                            }, 1000)
                        }
                    }
                })
            } else {
                location.href = "/login/"
            }
        });