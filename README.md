
## Tankulator
It basically just calculates between a given set of people who used how much

### Formats
Tankulator currently only accepts CSV files. To see what that looks like open `apr18_apr24_.csv`

### CSV Format Explanation (because it's a little dumb)
The first 5 lines are purely informational

Line 1 is the start date

Line 2 is the end date

Line 3 is the cost of the tank

Line 4 is the distance travelled for the tank

Line 5 maps the abbreviations to full names, that way you can just pick an abbreviation
for each driver instead of typing their full name on each applicable line

Line 6 and everything after it are the entries

These lines are formatted as follows:

The first value is the odometer start value 

The second value is the odometer end value

The third value is the category and driver

The category is either 'p' for personal or 'b' for business

## Roadmap
- [ ] YAML Support
- [ ] JSON Support
