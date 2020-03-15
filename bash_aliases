alias mv='mv -i'
alias cp='cp -i'
alias ll='ls -la'
alias diffg='git diff'
alias youtube-dl-mkv='youtube-dl --merge-output-format mkv'
alias gccw='gcc -Wall -Wextra -Werror'
if [ "$(uname)" == "Darwin" ]; then
  alias top='top -o cpu'
  alias norminette='PATH=$PATH_BACKUP norminette -R CheckForbiddenSourceHeader'
  alias vim8='PATH=$HOME/.brew/opt/ruby/bin:$HOME/.brew/lib/ruby/gems/2.6.0/bin:$PATH vim'
  alias vagrant='PATH=$HOME/bin/vagrant/exec:$HOME/.brew/opt/ruby@2.6/bin:$HOME/.brew/lib/ruby/gems/2.6.0/bin:$PATH_BACKUP vagrant'
fi
