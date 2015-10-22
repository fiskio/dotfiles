function fish_prompt
   test $SSH_TTY; and printf (set_color red)(whoami)(set_color white)'@'(set_color yellow)(hostname)' '

   function _git_branch_name
      echo (git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
   echo (git status -s --ignore-submodules=dirty ^/dev/null)
 end

 function _is_git_repo
    git status -s >/dev/null ^/dev/null
 end

 function _repo_branch_name
    eval "_git_branch_name"
 end

 function _is_repo_dirty
    eval "_is_git_dirty"
 end

 set -l cyan (set_color -o cyan)
 set -l yellow (set_color -o yellow)
 set -l red (set_color -o red)
 set -l blue (set_color -o blue)
 set -l green (set_color -o green)
 set -l normal (set_color normal)

 set -l repo_branch $yellow(_repo_branch_name)
 set repo_info "$green($repo_branch$green)"
 if [ (_is_repo_dirty $repo_type) ]
    set -l dirty "$blue ✗"
    set repo_info "$repo_info$dirty"
 end
 test $USER = 'root'; and echo (set_color red)"#"
 # Main
 echo -n (set_color blue)(prompt_pwd) $repo_info (set_color red)'❯'(set_color yellow)'❯'(set_color green)'❯ '
end
