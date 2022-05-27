function forget
    set -l cmd (commandline | string collect)
    history delete --exact --case-sensitive -- $cmd
end

bind \cg forget
