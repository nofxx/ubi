                                              _      _
                                       /\ /\ | |__  (_)
                                      / / \ \| '_ \ | |
                                      \ \_/ /| |_) || |
                                       \___/ |_.__/ |_|


Ubi finds information in the subject's webpage(s).
A forager.


## Thema -> Subject/Matter

- Name
- Email
- URL


## Memoria -> Attribute/Trait/Memory

- URLs
- Emails
- Phones
- Social
- Files
- Documents
- Address
- Logo/Images


## Aranea -> Spider/Crawler

Search
API

Others


## Use

```
Ubi::Thema.new('A Company on City').urls
Ubi::Thema.new('A Company on City', 'company.com').phones
```

### Memorias Directly

```
Ubi::Memoria::Email.parse('A text with some valid@emails.com')
Ubi::Memoria::Phone.parse('A text with some +55-5555-5555')
Ubi::Memoria::Site.parse('A text with some http://urls.com')
```

##### Keep crawling

> Ubi, and the class names are latin, in case you're curious.
> Yeah, apparently I got plenty of free time.
