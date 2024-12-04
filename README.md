# Subscribe code challenge

A Ruby prototype addressing Subscribe code challenge: https://gist.github.com/safplatform/792314da6b54346594432f30d5868f36

## System dependencies

- Ruby 3.2.6 or higher

## Installation

1. Clone the repository:
```bash
git clone [https://github.com/DMazzei/subscribe_challenge.git]
cd subscribe_challenge
```

2. Install dependencies:
```bash
bundle install
```

## Running the Application

The application is currently limited to text input files. You can used the ones provided inside the *resources* folder or create your own.
And you can run the application simply calling `main.rb`:

### 1. Using default input file
Run the application without arguments:
```bash
ruby main.rb
```

### 2. Chosing input files from the `resources` folder
Run the application informing the file path as argument
```bash
ruby main.rb resources/input_01.txt
```

```bash
ruby main.rb resources/input_02.txt
```

```bash
ruby main.rb resources/input_03.txt
```

### 3. Using custom input files
1. Create an input file using the format `<quantity> <name> at <price>` for the items, one line per item:
```
5 local books at 19.99
2 imported books at 9.99
1 vynil at 20.55
```

2. Run the application with the path where you created the file:
```bash
ruby main.rb /Users/dmazei/custom_input.txt
```

## Running Tests

To run all tests, simply call rspec:
```bash
bundle exec rspec
```

You can run the test for specific files by informing its path:
```bash
bundle exec rspec spec/tax_calculator_spec.rb
```

## Assumptions

1. Input format follows the specified pattern - `<quantity> <name> at <price>` <br/>
  . quantity is always an integer <br/>
  . name is a string<br/>
  . price is a float<br/>
  . I'm not checking for divergencies, nor testing for different formts or types, given the time constraint
2. Exempt items are identified simply by predetermined keywords for now (e.g. 'book', 'chocolate', etc); With a little more time I would check for items listed inside categories, and use categories as exemption criteria
3. Imported items are marked with the word `imported`
4. All prices are positive numbers with up to 2 decimal places
5. Rounding rules are applied to tax, ensuring it is rounded up to the nearest 0.05
6. Multiple taxes can be combined summing up each percentage and the final percentage is then applied on the item's unitary price


