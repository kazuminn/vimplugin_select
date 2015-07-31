#about
This is a terminal app which advance suits of Vim-Plugin to you.
Start and select yes or no and teach suits of Vim-Plugin to you.

conputer lunguage:
* perl 5.1

Module:
* YAML::Syck
* Curses::UI

# View
![画像](http://ie.u-ryukyu.ac.jp/~e145702/vim_select4)

#Installation
<pre>
cd
git clone https://github.com/kazuminn/vimplugin\_select.git
sudo cpan Curses::UI
sudo cpan YAML::Syck
</pre>

#expantion yaml
add below etc...
<pre>
hoge:
- question message
- github name
- url
</pre>


#How to use
<pre>
perl select.pl
</pre>

select yes or no.

exit :q in end point.


