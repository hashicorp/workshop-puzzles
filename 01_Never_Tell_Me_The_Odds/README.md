# Terraform Puzzle #2
## Never Tell Me The Odds
**Challenge Level: Intermediate**

<img src="../images/canto_bight.png" alt="Do You Feel Lucky?" width="400">

### Background
You're working for the devops team at a large casino. You need to generate some random numbers that simulate rolling six-sided dice.

### Setup
For this challenge all you need is terraform.

### The Challenge
Use the [random integer](https://www.terraform.io/docs/providers/random/r/integer.html) provider along with a [null resource](https://www.terraform.io/docs/provisioners/null_resource.html) to generate a random number between 1 and 6.