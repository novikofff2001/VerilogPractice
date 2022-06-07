#!/bin/bash
env=~/.ssh/agent.env

agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }

agent_start () {
    (umask 077; ssh-agent >| "$env")
    . "$env" >| /dev/null ; }

agent_load_env

# agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2= agent not running
agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)

if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
    agent_start
    ssh-add ./lab_student
elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
    ssh-add ./lab_student
fi

unset env

#==============================================================================
scp -r -P2222 ../sw lab_student@borisblade.ru:~/

ssh -p2222 lab_student@borisblade.ru "cd ~/sw/; chmod +x elf2dat.sh; make clean; make"
scp -P2222 lab_student@borisblade.ru:~/pulpino_data.dat ./pulpino_data.dat
scp -P2222 lab_student@borisblade.ru:~/pulpino_text.dat ./pulpino_text.dat
scp -P2222 lab_student@borisblade.ru:~/sw/disasm_emb.S ./disasm_emb.S