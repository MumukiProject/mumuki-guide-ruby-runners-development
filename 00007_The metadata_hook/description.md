Although your runner works, you should implement metadata in order to make it a good citizen in the Mumuki Platform. Just edit the `metadata_hook` in `lib/metadata_hook.rb`: 

```ruby
class YourRunnerMetadataHook < Mumukit::Hook
  def metadata
    {language: {
        name: '...',
        version: '...',
        extension: '...',
        ace_mode: '...'
    },
     test_framework: {
         name: '...',
         version: '...',
         test_extension: '...'
     }}
  end
end
```

Please provide at least the above fields. Notice that every information provided here - plus some other generated data - will be publicly available under `GET /info`, so you can augment it with custom attributes. 

> `mumukit` generates more data about your runner based on your customizations. In a terminal - or browser - hit the following URL... 
> 
>  ```bash
> curl http://prolog.runners.mumuki.io/info
> ```
> 
> and then go on. 
