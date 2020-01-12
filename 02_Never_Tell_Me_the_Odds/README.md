# Terraform Puzzle #2
## Never Tell Me The Odds
**Challenge Level: Intermediate**

<img src="../images/canto_bight.png" alt="Do You Feel Lucky?" width="400">

### Background
You're working for the devops team at a large casino. You need to generate some random numbers that simulate rolling dice.

### Setup
For this challenge all you need is terraform and the **random** provider.

### Main Challenge
Use a [random integer](https://www.terraform.io/docs/providers/random/r/integer.html) resource along with a [null resource](https://www.terraform.io/docs/provisioners/null_resource.html) to generate a random number between 1 and 6. You can use a [local exec](https://www.terraform.io/docs/provisioners/local-exec.html) provisioner inside your null resource to echo out the dice roll results. Name your **random_integer** resource `d6`.

### Extra Challenges
#### Load the Dice
🎲 Your boss has asked you to rig some of the casino machines where you are provisioning resources. Rig the d6 resource you created in the first challenge so it rolls a 1 every single time.

#### Roll for Initiative
One of the new games needs a 20-sided dice simulator. Create another resource that creates random numbers between 1 and 20. You can name this one `d20`.

#### Critical Hit!
The die that rolls the same number every time is easy to detect. Create another one that rolls a 20 one out of every five rolls or 20% of the time. You'll need to use a [conditional expression](https://www.terraform.io/docs/configuration/expressions.html#conditional-expressions) to solve this one.