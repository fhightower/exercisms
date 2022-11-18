module SavingsAccount
  INTEREST_RATE_MAXIMUMS = {0=> 3.213, 1000=> 0.5, 5000=> 1.621, Float::INFINITY=> 2.475}

  def self.interest_rate(balance)
    INTEREST_RATE_MAXIMUMS.find { |k, v| balance < k}[1]
  end

  def self.annual_balance_update(balance)
    # This is a hack for calculating the interest and adding it to the balance...
    # Doing this: (1 + interest_rate) * balance
    # Is the same as doing: balance + (interest_rate * balance)
    (1 + (self.interest_rate(balance) / 100)) * balance
  end

  def self.years_before_desired_balance(current_balance, desired_balance)
    balance = current_balance
    year = 0
    while balance < desired_balance
      year += 1
      balance = self.annual_balance_update(balance)
    end

=begin
Alternatively:

```
until balance > desired_balance:
  year += 1
  balance = self.annual_balance_update(balance)
end
```
=end
    year
  end
end
