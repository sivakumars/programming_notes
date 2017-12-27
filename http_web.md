179 Study Guide
=================

Notes created while preparing for Assessment 179. This assessment is designed to test knowledge of course 170 and will focus on HTTP, the Web, and Sinatra.

Internet
---------

The Internet is a tangible, physical structure made to move information. Like the postal service, the Internet sends things from one place to another, but instead of letters and packages, it sends bits (or binary information). These bits are usually sent through either electricity (ethernet/copper cable), light (fiber optic cable), or radio (wireless transmission).

Ethernet cable is cheap but suffers from significant signal loss over long distances. Fiber optic is fast and doesn't suffer from much signal loss but is expensive. Wireless translates bits into radio waves of different frequencies but suffers from very significant signal loss. The physical methods for moving bits has and will continue to change, but the underlying binary representation of information and the protocols for sending and receiving that information have and will likely stay the same.

TCP/IP
-------

In addition to the physical structure, the Internet is comprised of a design philosophy that is expressed in a set of protocols. A protocol is defined as an agreed-upon set of rules for sending and receiving information. The first protocol enables a computer to send information to another computer. Every Internet-connected computer has a unique address, analogous to a person's mailing address, and that address is used to determine where to send information.

Let's say a user wants to use the Internet to view a website. To do this, the user's computer sends a message to the website's computer requesting the contents of the website. After entering the site URL, http://www.example.com/, into a web browser, the website request is forwarded to the Domain Name System (DNS), which translates the human-friendly site name (www.example.com) into what's called an IP address for the website's computer (90.32.123.122). With the translated IP address, the browser knows where to send the website request. This system of assigning addresses to computers and routing the information between computers based on these addresses is known as the Internet Protocol (IP).

Like a car, information on the Internet doesn't travel in a fixed or direct path. If construction or traffic is detected on a particular route, a faster route is selected. In addition, the entire message isn't sent at once; it's broken into tiny chunks called packets. Each packet is tagged with an IP header, indicating the source and destination IP addresses, and a TCP header, indicating the source and destination port numbers. Once broken up, the packets travel independently, optimizing their own routes, and are reassembled upon arriving successfully at their destination. This process of breaking up, sending, verifying, resending, and reassembling packets is known as the transmission control protocol (TCP). Together, this system of communication is known as the **TCP/IP** suite.

When computers exchange information, they either send a request for information or respond to a request for information; this is known as the "request-response" messaging pattern. The computer that requests is called the "client" and the computer that responds is called the "server". The content of these messages is just text, and the "language" used is the hypertext transfer protocol (HTTP). HTTP is a set of rules outlining the specific information that a request or response must contain and the specific format that a request and response must follow.

To summarize, computers send HTTP messages, either requests or responses, over TCP/IP connections.

URL
----

When you a enter a URL into a browser and hit ENTER, the TCP/IP protocol is used to send an HTTP message requesting a specific resource from a web server.

`URL: http://www.example.com:88/home?item=book`

This URL can be broken into 5 parts:

- `http`: The **scheme** always comes before the colon and two forward slashes and tells the browser what protocol to use to access the resource.
- `www.example.com`: The **host** tells the browser where the resource is located.
- `:88`: The **port** indicates to which port on the web server to send the request.
- `/home/`: The **path** indicates the specific resource requested from the web server.
- `?item=book`: The **query parameters** are optionally used to send additional data to the server.
- `GET`: The **request method** that is automatically set when you manually enter a URL into a browser. Other request methods (e.g. PUT) can be used

If included, the host and port are used by TCP/IP to tag and route packets to their destination. The path, query parameters, and request method are included as part of the HTTP request.

HTTP
------

To issue an HTTP request, a request method ("GET") and path ("/") are required.

`GET / HTTP/1.1`

To issue a corresponding HTTP response, a status code ("200 OK") is required.

`HTTP/1.1 200 OK`

In addition to these required components, an HTTP request/response can optionally contain headers and a body.

HTTP headers contain various metadata that a browser chooses include as part of a request or a web server chooses to include as part of a response.

Common HTTP Request Headers:
- Cookie
- Host
- User-Agent

Common HTTP Response Headers:
- Content-Type
- Location
- Content-Length
- Set-Cookie

Lastly, the HTTP body contains the main content of the message. Depending on the nature of the request, it may be empty. In a HTTP POST request, the body will contain the data submitted in the form. In an HTTP response, the body will often contain raw HTML code representing the requested web page.

HTTP Methods
-------------

The **Request Method** is a request header that tells the web server what to do with the requested resource. The two most common types are **GET** and **POST**.

**GET** is used to simply retrieve a resource (e.g. web page) from the web server. It's "read-only", which means nothing is modified on the server. GET requests are met with a "200 OK" response if the resource is found and a "404 NOT FOUND" if the resource was not found.

If an HTTP response's body contains HTML code that references additional resources, a browser will automatically issue GET requests to retrieve these resources. If you open a browser's *Network* tab, you can see the requesting of one URL actually resulting in several GET requests for multiple resources all used to display one web page.

**POST** is used to submit new data to the server. It is most often used when submitting HTML form data (e.g. signing up a new user). Successful POST requests often respond with a "201 Created" or "303 See Other". Unsuccessful POST requests often respond with a "415 Unsupported Media Type" or a "422 Unprocessable Entity"

A successful POST request often includes a `Location` header in its HTTP response. The inclusion of the header triggers the browser to automatically issue a GET request to the value specified in that header; this process is known as a **redirect**. The purpose of the redirect is so that the browser's last request becomes a GET. Therefore, if the user were the refresh the page, that same GET request would be resubmitted. If, on the other hand, the browser's last request is a POST, a page refresh can result in duplicate  form data submitted to the server.

Stateful Applications
---------------------

HTTP is a **stateless** protocol, meaning that the server is not required to retain information about a user (or track state) over multiple requests. To provide a superior user experience, however, developers employ various tricks to preserve state in their applications.

One trick is to use a **session identifier** to identify a particular user. Upon receiving an initial HTTP request from a user, a web server will create a unique session id token and include its value in the `set-cookie` header of its HTTP response. Upon receiving the response, the browser stores the header's value in local storage as a **cookie**. On subsequent HTTP requests, the browser includes the value in the `cookie` header. So when the web server receives an HTTP request that includes `cookie` header, it can use the session id to retrieve data specific to that user.

Another user experience trick is the use of **AJAX**, or Asynchronous Javascript and XML. Ajax allows browsers to send requests and process responses without reloading the page. The responses are processed using client-side Javascript to update HTML of a page without actually reloading the page. This method of processing a response using client-side Javascript code to is known as a *callback*.

Security
--------

Since HTTP is transmitted over TCP/IP as text, it can easily be read by anyone employing a technique called *packet sniffing*. To prevent a h \acker from reading your HTTP messages, an encryption protocol called **TLS** is used to scramble a message's content. TLS ensures that only the intended recipient of your HTTP message can unscramble and read the message. The use of *HTTP over TLS* is enabled when *http* is replaced with *https* in a URL.

**Same-origin policy** is a concept that prevents scrips from one site from accessing the content of resources from another site. To access a resource, they must be requested using the same protocol, hostname, and port. **Cross-origin resource sharing (CORS)** is an extension on same-origin that allows resources from one domain to be requested from another domain by adding new HTTP headers which allow servers to serve resources to specific domains.

**Session hijacking** is when a hacker steals another user's session id and uses it to impersonate the user and access their data. To minimize this risk, sessions often have an expiration date, after which the `session id` is no longer valid. The use of HTTPS also reduces the chance of session hijacking even occurring.

**Cross-site scripting (XSS)** is an attack that occurs when a user inputs raw HTML or Javascript code in a form, and the input is able to affect the server-side code. One solution is to *sanitize* the user input or disallow HTML and Javascript altogether in favor of a safer format, like Markdown.

Another solution is to *escape* any submitted form data by replacing certain characters with text that the browser won't interpret as code. Some characters that must be escaped include quotation marks and greater or less than symbols.

Rack
-----
Rack is an interface that gives Ruby apps a standard protocol of communicating with various web servers.

To use Rack, an app must respond to a `call` method that takes an `env` hash as an argument and returns an array with 3 elements:
- HTTP status code (as a string)
- HTTP headers (as a set of key-value pairs within a hash)
- HTTP response body (nested in an object that responds to `each`, like Array)

```ruby
class HelloWorld
  def call(env)
    [
      '200',
      {'Content-Type' => 'text/plain'},
      ['Hello World']
    ]
  end
end
```

To deploy the app on a web server, the `rackup` command is used to run a rackup file (`config.ru`) that specifies the location of a rack-enabled application.

```ruby
require_relative 'hello_world'

run HelloWorld.new
```

Sinatra and Ruby on Rails are web application frameworks that adhere to the Rack specification and are categorized as "rack based" frameworks.

Sinatra
-------

Sinatra is a Ruby library that makes it simple to write Ruby code that runs when a browser visits a particular URL.

To use Sinatra, we must `require sinatra`. It's also good to `require sinatra/reloader`, a feature that automatically reloads the app whenever we load a page, speeding up development.

```ruby
require "sinatra"
require "sinatra/reloader"
```

The mapping of a URL pattern to Ruby code is accomplished by defining a *route handler*. Each URL pattern is associated with a block of code that executes when the pattern is matched. Routes are matched in the order they are defined, and only the first match is executed. The value that is returned by the block is then sent to the browser.

```ruby
get '/' do
  "Hello World."
end
```

Route patterns may include named parameters, accessible via the *params* hash:

```ruby
get '/hello/:name' do
  "Hello #{params['name']}!"
end
```

Routes may also utilize query parameters:

```ruby
get '/posts' do  # matches "GET /posts?title=foo&author=bar"
  title = params['title'] # => "foo"
  author = params['author'] # => "bar"
end
```

A route's block return value determines the HTTP response body passed by the web server to the browser.

View templates are files that contain text that is converted to HTML before being sent to a browser in an HTTP response. In Sinatra, views are served from the `./views` directory. So the route below will render `views/index.erb`.

```ruby
get '/' do
  @title = "My Page"
  erb :index
end
```

View templates can take an optional second argument, the options hash. The code below will render `views/index.erb` embedded in the `views/layout.erb`. View templates allow an app to separate the logic of the application from the presentation of the application. It also allows views to be reused in different route handlers and allows views to be nested within other views. These features reduce the redundancy of view template code.

```ruby
get '/' do
  erb :index, :layout => :layout
end
```

Ruby code can be executed in an .erb file by including it between `<%` and `%>` tags. To display the return value of Ruby code, a special start tag, `<%=`, is used.

```ruby
<h1><%= @title %></h1>
```

Code places within a `before` filter evaluates before each request and code placed within an `after` filter evaluates after each request. Instance variables assigned in a route handler or in a `before` filter are accessible by `after` filters:

```ruby
before do
  @note = 'Hi!'
end

after do
  puts @note
end
```

The top-level `helpers` method is used to define methods that can be used in route handlers and view templates:

```ruby
helpers do
  def bar(name)
    "#{name}bar"
  end
end

get '/:name' do
  bar(params['name'])
end
```

The `configure` block is executed once at startup of the web server. The code below enables sessions and provides a `session` hash stored as a cookie in the user's browser.

```ruby
configure do
  enable :sessions
end
```

Values can be added/removed from the `session` hash within a Sinatra method, route handler, or view template.

```ruby
get '/:value' do
  session['value'] = params['value']
end
```

A browser redirect can be triggered using the built-in `redirect` helper method. The method interrupts processing of a request and exits the route handler.

```ruby
get '/foo' do
  redirect '/bar'
end
```

Sinatra provides the ability to automatically escape all output. Since this will automatically escape all `erb` return values, you must replace `<%=` with `<%==` where you want to disable auto-escaping.

```ruby
configure do
  set :erb, :escape_html => true
end
```

In Sinatra, static files are served from the `./public` directory.

HTML Forms
----------

A common way of submitting user-input is with an HTML form. The form below has two input tags nested within a form tag. The first input tag provides a place for a user to enter text and the second input tag provides a button for a user to submit that text.

```html
<form action="/form" method="post">
  <input type="text" name="message">
  <input type="submit">
</form>
```

When the form is submitted, an HTTP POST request is sent with the text entered in the form included as a key-value pair in the HTTP request body; the key being the value of the `name` attribute of the input (or textarea) tag and the value being the text the user entered in the form.

```html
POST /form HTTP/1.1
Content-Type: application/x-www-form-urlencoded; charset=utf-8
Host: localhost:4567
Content-Length: 37

message=text+that+was+entered+in+form
```

Javascript
----------

Modern web applications do most of the heavy lifting before sending HTML, CSS, and Javascript to the client web browser. There are, however, many user experience improvements that are better handled directly in the browser. Javascript is the language for this and allows for features such as drag-and-drop and the ability to perform actions (e.g. liking) without needing to reload the entire page.

Javascript code is considered client-side code because it's executed in the user's browser. All Ruby code, however, is executed on the server before it's results are transmitted via HTTP, therefore it's known as server-side code.
