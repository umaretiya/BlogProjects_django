from django import forms
from .models import Post, Comment

class PostForm(forms.ModelForm):
    class Meta:
        model = Post
        fields = ['author','title', 'text',]
        
        widgets = {
            'auther':forms.TextInput(),
            'title': forms.TextInput(),
            'text': forms.Textarea(),
        }
        
class CommentForm(forms.ModelForm):
    class Meta:
        model = Comment
        fields = ['post','author','text',]
        
        widgets = {
            'title': forms.TextInput(),
            'post':forms.TextInput(),
            'text': forms.Textarea(),
        }
        