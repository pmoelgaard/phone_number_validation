[![Travis](https://travis-ci.org/pmoelgaard/phone_number_validation.svg)](Travis)

# phone_number_validation (incomplete)

Ruby Library for the numverify API, Global Phone Number Validation & Lookup, [https://numverify.com/](https://numverify.com/)   

---

## Installation

Add this line to your application's Gemfile:

```
gem 'phone_number_validation'

```

And then execute:

```
$ bundle

```

Or install it yourself as:

```
$ gem install phone_number_validation

```

---

## Configuration

Before using the numverify API client you have to setup your account and obtain your API Access Key.  
You can get it by signing up at [https://numverify.com/product](https://numverify.com/product).

---

## API Overview
All endpoints in the public API is available through this library.

- validate
- countries (not yet implemented)

---

## Usage

The general API is documented here: [https://numverify.com/documentation](https://numverify.com/documentation).  
You can find parameters, result set definitions and status codes documented here as well.

In the examples directory you can find demos and samples of general usage of all the API functions.

### Setup

First we require the module

```
require 'phone_number_validation'

```

Second we instantiate the client

```
@client = NumverifyLayer::Client.new( [access_key] )

```

#### Required Parameters

###### access_key
Your unique key that you can find on the dashboard of your account under the numverify account.

#### Optional Parameters

###### Secure (only available for Basic, Pro and Enterprise accounts)
Boolean value to indicate if the calls to the API should use a secure protocol or insecure (HTTP/HTTPS). Defaults to false (HTTP, insecure).

---

## Validate

Takes a string representing a phone number and validates and analyses it.

###### Define Query

First we get a reference to the string that needs to be detected

```
number = '+14158586273'

```

Second we define an options object.
All the options are documented here: [https://numverify.com/documentation](https://numverify.com/documentation)

```
options = NumverifyLayer::ValidateOptions.new()

```

###### Call Client
We then place the actual call to the API, passing in the email we wish to check and the options we defined above.

```
response = @client.validate( [number] [, options] )

``` 

###### Response

If we pass the number ```+14158586273``` as the query argument above, we get the following result:

```
{
  "valid": true,
  "number": "14158586273",
  "local_format": "4158586273",
  "international_format": "+14158586273",
  "country_prefix": "+1",
  "country_code": "US",
  "country_name": "United States of America",
  "location": "Novato",
  "carrier": "AT&T Mobility LLC",
  "line_type": "mobile"
}

```
---

## Example Application

In the [rootdir]/example directory there is a fully functional application which runs all requests against all the endpoints in the API, the examples above can be seen there as source code.

The example application uses a process.env variable to hold the access key.

---

## Tests

The tests are written using the rspec testing library.  
**RSpec** [http://rspec.info/](http://rspec.info/)

In order to run the tests, the following environment variables needs to be set:

```
ACCESS_KEY = [access_key]

```


---

## Customer Support

Need any assistance? [Get in touch with Customer Support](mailto:support@apilayer.net?subject=%numverify%5D).

---

## Updates
Stay up to date by following [@apilayernet](https://twitter.com/apilayernet) on Twitter.

---

## Legal

All usage of the numverify website, API, and services is subject to the [numverify Terms & Conditions](https://numverify.com/terms) and all annexed legal documents and agreements.

---

## Author
Peter Andreas Moelgaard ([GitHub](https://github.com/pmoelgaard), [Twitter](https://twitter.com/petermoelgaard))

---

## License
Licensed under the The MIT License (MIT)

Copyright (&copy;) 2016 Peter Andreas Moelgaard & apilayer

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

