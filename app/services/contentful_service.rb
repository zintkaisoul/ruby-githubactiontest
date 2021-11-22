require 'contentful/management'

class ContentfulService
    def initialize(access_key, space_id, environment_id)
        @client = Contentful::Management::Client.new(access_key)
        @content_type_factory = @client.content_types(space_id, environment_id)
        @entry_factory = @client.entries(space_id, environment_id)
    end 

    def get_content_type(content_type_id)
        return @content_type_factory.find(content_type_id)
    end 

    def get_entry(query)
        entries = @entry_factory.all(query)
        if entries.length > 0
            return entries.items[0]
        end 
        return nil  
    end 

    def create_entry(content_type_id, data)
        content_type = get_content_type(content_type_id)
        new_entry = @entry_factory.create(content_type, data)
        new_entry.publish
    end

    def update_entry(entry, data)
        entry.update(data)
        entry.publish
    end
end