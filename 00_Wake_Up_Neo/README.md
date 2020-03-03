# Terraform Puzzle #0
## Wake Up Neo
**Challenge Level: Beginner**

```
Wake up, Neo...
```

### Background
👨🏻‍💻 You're working a boring job at the MetaCortex software company. While sitting in your cubicle and writing terraform code you receive a message on your terminal:

```
Install the cmatrix program using **local_exec** and wait for your next instruction...
```

### Setup
Before you begin this challenge please run the following commands to set up your keyboard configuration.

```
apt -y install debconf-utils keyboard-configuration
dpkg-reconfigure keyboard-configuration
```

### The Challenge
Create a file called `main.tf` and write terraform code that installs the **cmatrix** package. On Ubuntu systems you can use the following command to get it installed:

```
sudo apt -y install cmatrix
```

HINT: You can utilize the [null resource](https://www.terraform.io/docs/provisioners/null_resource.html) to park your **local-exec** provisioner in.

Run the **cmatrix** program and see what happens. You can press the q key to exit the program.
