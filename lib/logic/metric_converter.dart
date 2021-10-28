class MetricConverter {

  double calculate(String from, String to, double enteredValue)
  {
    if(from == "KM") {
      if(to == "M") {
        double d = enteredValue * 1000;
        return d;
      } else if(to == "CM") {
        double d = enteredValue * 100000;
        return d;
      }

    }
    else if(from == "M")
      {
        if(to == "KM") {
          double d = enteredValue / 1000;
          return d;

        } else if (to == "CM"){
          double d = enteredValue * 100;
          return  d;
        }
      }
    else if (from == "CM"){
      if(to == "KM") {
        double d = enteredValue / 100000;
        return d;
      }
      else if(to == "M") {
        double d = enteredValue / 100;
        return d;
      }
    }
    else {
      return enteredValue;
    }
    return enteredValue;
  }
}

class CurrencyHelper {

  double convertTo(double amount, String? chosenCurrency, String asdf) {
    if (chosenCurrency == "USD") {
      double converted = amount / 3.1;
      return converted;
    }

    if (chosenCurrency == "EUR") {
      double convertedEur = amount / 3.6;
      return convertedEur;
    }

    if (chosenCurrency == "GBP") {
      double convertedGbp = amount / 4.2;
      return convertedGbp;
    }

    return amount;
  }
}