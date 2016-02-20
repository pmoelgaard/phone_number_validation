[![Travis](https://travis-ci.org/pmoelgaard/phone_number_validation.svg)](Travis)

# phone_number_validation

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

Before using the languagelayer API client you have to setup your account and obtain your API Access Key.  
You can get it by signing up at [https://numverify.com/product](https://numverify.com/product).

---

## API Overview
All endpoints in the public API is available through this library.

- validate
- countries

---

## Usage

The general API is documented here: [https://numverify.com/documentation](https://numverify.com/documentation).  
You can find parameters, result set definitions and status codes documented here as well.

In the examples directory you can find demos and samples of general usage of all the API functions.

### Setup

First we require the module

```
require 'languagedetection'

```

Second we instantiate the client

```
@client = LanguageLayer::Client.new( [access_key] )

```

#### Required Parameters

###### access_key
Your unique key that you can find on the dashboard of your account under the languagelayer account.

#### Optional Parameters

###### Secure (only available for Basic, Pro and Enterprise accounts)
Boolean value to indicate if the calls to the API should use a secure protocol or insecure (HTTP/HTTPS). Defaults to false (HTTP, insecure).

---

## Detect (simple case)

Takes a query string and detects the language.

###### Define Query

First we get a reference to the string that needs to be detected

```
query = 'Good afternoon, sir. How are you today?'

```

Second we define an options object.
All the options are documented here: [https://numverify.com/documentation](https://numverify.com/documentation)

```
options = LanguageLayer::DetectOptions.new()

```

###### Call Client
We then place the actual call to the API, passing in the email we wish to check and the options we defined above.

```
response = @client.detect( [query] [, options] )

``` 

###### Response

If we pass the email ```Good afternoon, sir. How are you today?``` as the query argument above, we get the following result:

```
{
		"success": true,
		"results":[
			{
				"language_code": "en",
				"language_name": "English",
				"probability": 12.141682269266,
				"percentage": 100,
				"reliable_result": true
			}
		]
	}

```
## Batch Detection
Takes an array of strings and detects the language with a corresponding list of detections for each string.

###### Define Query

First we get a reference to the string that needs to be detected

```
query: [
        	'Good afternoon, how are you today?',
        	'Guten Tag mein Herr, wie geht es Ihnen?',
        	'Buenos días señor, cómo está hoy?'
    	],

```

Second we define an options object.
In this example we are passing the ```show_query``` option so each of elements in the result will contain the original query.
All the options are documented here: [https://numverify.com/documentation](https://numverify.com/documentation)

```
options = LanguageLayer::BatchOptions.new({
	show_query: 1
})

```

###### Call Client
We then place the actual call to the API, passing in the email we wish to check and the options we defined above.

```
response = @client.batch( [query] [, options] )

```
	    
###### Response
	{
     	"success": true,
      	"results": [
			[
	          	{
	          		"query": "Good afternoon, how are you today?",
	            	"language_code": "en",
	            	"language_name": "English",
	            	"probability": 12.141682269266,
	            	"percentage": 100,
	            	"reliable_result": true
	          	}
	        ],
		    [
	        	{
	        		"query": "Guten Tag mein Herr, wie geht es Ihnen?",
	            	"language_code": "de",
	            	"language_name": "German",
	            	"probability": 23.045066185021,
	            	"percentage": 100,
	            	"reliable_result": false
	          	}
	        ],
	        [
	          	{
	          		"query": "Buenos días señor, cómo está hoy?",
	            	"language_code": "es",
	            	"language_name": "Spanish",
	            	"probability": 14.560273752505,
	            	"percentage": 100,
	            	"reliable_result": false
	          	},
	          	{
	          		"query": "Buenos días señor, cómo está hoy?",
	            	"language_code": "pt",
	            	"language_name": "Portuguese",
	            	"probability": 13.98519485076,
	            	"percentage": 96.05035652818,
	            	"reliable_result": false
	          	},
	          	{
	          		"query": "Buenos días señor, cómo está hoy?",
	            	"language_code": "gl",
	            	"language_name": "Galician",
	            	"probability": 13.585199932687,
	            	"percentage": 93.30319033562,
	            	"reliable_result": false
	          	}
			]
	 	]
	 }
	
## Supported Languages
Returns the list of Supported Languages, similar to the list found here:  
[https://languagelayer.com/languages](https://numverify.com/languages)

###### Define Query

For this endpoint, we dont pass any primary argument, just the control options, so we define an options object.
There are currently no options for the ```languages``` endpoint, so we could omit it, however we use it with an empty options object here to stay aligned with the standard for the library.

```
options = LanguageLayer::LanguagesOptions.new()

```

###### Call Client
We then place the actual call to the API, passing in the email we wish to check and the options we defined above.

```
response = @client.languages([options] )

``` 
    
###### Response
	{
  		"success": true,
  		"languages": [
    		{
      			"language_code": "en",
      			"language_name": "English"
    		},
    		{
      			"language_code": "af",
      			"language_name": "Afrikaans"
    		},
    		{
      			"language_code": "ar",
      			"language_name": "Arabic"
    		},
    		...
    	]
    }

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

All usage of the languagelayer website, API, and services is subject to the [pdflayer Terms & Conditions](https://pdflayer.com/terms) and all annexed legal documents and agreements.

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

