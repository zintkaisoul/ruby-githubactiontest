require 'contentful/management'

class DbSyncController < ApplicationController
    
    CMA_KEY = ENV['CMA_KEY']
    SPACE_ID = ENV['SPACE_ID']
    ENVIRONMENT_ID = ENV['ENVIRONMENT_ID']
    
    POST_CONTENT_TYPE_ID = 'blogPost'
    AUTHOR_CONTENT_TYPE_ID = 'person'

    def index
        render 'db_sync'
    end

    def synchronize
        contentful_service = ContentfulService.new(CMA_KEY, SPACE_ID, ENVIRONMENT_ID) 

        slug_str = params[:slugs]

        if slug_str == ''
            @err_msg = 'Empty slugs'
        else 
            @slugs = slug_str.split(/,|\r\n|\r|\n/)
            @slugs.map!{ |slug| slug.strip }
            
            posts = Post.includes(:author).where(slug: @slugs)

            @failed_posts = []
            @success_posts = []

            for post in posts do
                begin
                    author_name = post.author.name 
                    author_entry = contentful_service.get_entry(content_type: AUTHOR_CONTENT_TYPE_ID, 'fields.name' => author_name)
                    post_data = {
                        :title => post.title,
                        :slug => post.slug,
                        :description => post.description,
                        :body => post.content,
                        :author => author_entry,
                        :publishDate => post.publish_date
                    }

                    existing_entry = contentful_service.get_entry(content_type: POST_CONTENT_TYPE_ID, 'fields.slug' => post.slug)
                    
                    if existing_entry != nil
                        contentful_service.update_entry(existing_entry, post_data)            
                    else
                        contentful_service.create_entry(POST_CONTENT_TYPE_ID, post_data)
                    end    

                    @success_posts.push(post)
                rescue => e
                    puts e.message
                    @failed_posts.push(post)
                end
            end
        end

        render 'db_sync'
    end
end
