# Security vulnerabilities in Ruby on Rails


## 1.  Mass assignment

- attr_accessible / attr_protected
- http://talks.dev/challenge1 (add field user[admin])

## 2. CSRF via Leaky #match Routes

- http://talks.dev/challenge2
- http://talks.dev/challenge2/like
- hack is in `file:///Users/toni/_Work/talks/TalksApp/public/challenge2_hack.html`

## 3. XSS via link_to

- users table (xss via personal url)

## 4.  SQL Injection
- create table hacks (id INT);
- http://talks.dev/?status=open')%3bcreate%20table%20hacks%20(id%20INT)%3b--
- http://talks.dev/?status=open')%3bdrop%20table%20hacks%3b--


## 5. Logging Passwords in SQL Statements

- add `config.filter_parameters << :password << :password_confirmation << :credit_card` in `application.rb`


## 6. Binding on 0.0.0.0 on dev

- rails server
- can be accessed from outsite 192.168.x.x:3000

## 7. Versioned Secret Tokens

- do not store 'config/initializers/secret_token.rb' into version control

## 8. File vulnerabilities
  - downloading files
  - uploading files
  
## 9. User readable sessions

```
- session_cookie = <<-STR.strip.gsub(/\n/, '')
BAh7CEkiD3Nlc3Npb25faWQGOgZFRkkiJTkwYThmZmQ3Zm
dAY7AEZJIgtzZWtyaXQGO…--4c50026d340abf222…
STR

Marshal.load(Base64.decode64(session_cookie.split("--")[0]))

 # => {
   
 #   "session_id"  => "90a8f...",
 
 #   "_csrf_token" => "iUoXA...",
 
 #   "secret"      => "sekrit"
 
 # }

```

## 10. XSS via regular expressions

- A common pitfall in Ruby’s regular expressions is to match the string’s beginning and end by ^ and $, instead of \A and \z.