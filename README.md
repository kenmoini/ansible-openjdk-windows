# ansible-openjdk-windows

Generate reports on Java consumption and deploy Red Hat's OpenJDK

## Prerequisites

1. Ensure your environment has Ansible 2.10 installed
2. Install the WinRM python module: `pip3 install pywinrm`
3. Copy `example_inventory` to `inventory` and modify as needed
4. Install the Windows Ansible Collection: `ansible-galaxy collection install ansible.windows`
5. Ensure the remote hosts are enabled with WinRM: https://docs.ansible.com/ansible/latest/user_guide/windows_setup.html#winrm-setup
6. You may also need to set the ExecutionPolicy of the remote Windows host, such as is the default for Windows 10: `Set-ExecutionPolicy -ExecutionPolicy Unrestricted`.  See this for more info: http://go.microsoft.com/fwlink/?linkid=135170

### Running on Mac OS X

If you are receiving an error in executing the Playbook on Mac OS X, then you'll need to likely add `no_proxy="*"` before the `ansible-playbook` command.
See this for details: https://github.com/ansible/ansible/issues/32554#issuecomment-572985680