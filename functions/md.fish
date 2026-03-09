function md --wraps='glow --pager $argv' --description 'alias md glow --tui $argv'
  if test (count $argv) -eq 1
    glow --pager $argv
  else
    glow $argv
  end
end
