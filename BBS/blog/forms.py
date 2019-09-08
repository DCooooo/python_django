'''
BBS用到的form类
'''
from django import forms
from django.core.exceptions import ValidationError
from blog import models


class RegForm(forms.Form):
    username = forms.CharField(
        label='用户名',
        max_length=16,
        error_messages={
            'required': '请填写用户名'
        },
        widget=forms.widgets.TextInput(attrs={'class':'form-control'})
    )
    password = forms.CharField(
        label='密码',
        min_length=6,
        error_messages={
            'required': '请填写密码',
            'min_length': '长度至少为6'
        },
        widget=forms.widgets.PasswordInput(attrs={'class':'form-control'},render_value=True)
    )
    re_password = forms.CharField(
        label='确认密码',
        error_messages={
            'required': '请确认密码'
        },
        widget=forms.widgets.PasswordInput(attrs={'class':'form-control'},render_value=True)
    )
    email = forms.EmailField(
        label='邮箱',
        error_messages={
            'invalid': '邮箱格式不正确',
            'required':'请填写邮箱',
        },
        widget=forms.widgets.EmailInput(attrs={'class':'form-control'})
    )

    # 重写全局的钩子函数，对确认密码做校验
    def clean(self):
        password = self.cleaned_data.get('password')
        re_password = self.cleaned_data.get('re_password')
        if password != re_password:
            self.add_error('re_password', ValidationError('两次密码填写不一致！'))
            raise ValidationError('两次密码填写不一致！')
        return self.cleaned_data

    # 重写username字段的局部钩子。这种方式需要点击注册按钮才能校验。
    # def clean_username(self):
    #     username = self.cleaned_data.get('username')
    #     is_exist = models.UserInfo.objects.filter(username=username)
    #     if is_exist:
    #         self.add_error('username','用户名重复')
