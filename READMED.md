# ssh-copy
Using ssh-copy, you can copy the ssh key to your remote hosts with the same username and password.
Suppose you have more than one or two remote hosts, manual copying will be boring and time-consuming. But with this script, all you need to do is just executing this script.
This is helpful for you if you are [Ansible] user.
- Add your ssh key path to key_path variable of script.
- Have all your remote hosts IP addresses in a file. Of course, every IP must be in a separate line.
- Give your IPs file as input to this script.
```sh
$ ./ssh-copy.sh "<file's path>"
```

[//]: # (Link references)
[Ansible]: <https://www.ansible.com/>
