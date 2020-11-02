

### Running on Mac OS X

If you are receiving an error in executing the Playbook on Mac OS X, then you'll need to likely add `no_proxy="*"` before the `ansible-playbook` command.
See this for details: https://github.com/ansible/ansible/issues/32554#issuecomment-572985680