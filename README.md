                                              _      _
                                       /\ /\ | |__  (_)
                                      / / \ \| '_ \ | |
                                      \ \_/ /| |_) || |
                                       \___/ |_.__/ |_|


Ubi finds information in the subject's webpage(s).
Forager.


## Thema -> Subject/matter

- Name
- Email
- URL


## Memoria -> Attribute/trait/memory

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
