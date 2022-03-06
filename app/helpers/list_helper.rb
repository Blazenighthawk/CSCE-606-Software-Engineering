#pagation helpers
def pagation_links_remote(paginator)
    page_options ={:window_size =>1}
    pagation_links_each(paginator,page_options) do |n|
        options ={ 
            :url => { action=> 'list', :params =>params.merge({:page=>n})},
            :update =>'table',
            :before =>"Element.show('spinner')",
            :success => "Element.hide(spinner)"
          } 
          html_options ={:href=> url_for(:action=> 'list',:params=>params.merge({:page=>n}))}
          link_to_remote(n.to_s,options,html_options)
        end
    end

end
#sort helpers
def sort_td_class_helper(params)
    result ='class ="sortup" 'if params[sort] ==param 
    result ='class = "sortdown" ' if params[sort]==params+ "_reverse"
    return result
end

#sort link helpers

def  sort_link_helper(text, param )
    key =param
    key += "_reserve" if params[:sort]==param
    options={ 
        :url =>{:action => 'list', :params =>params.merge({:sort=>key, page => nil})},
        :update =>'table',
        :before =>"Element.show('spinner')",
        :success =>"Element.hide('spinner')"
      }
      html_options ={ 
          :title =>"sort by id",
          :href =>url_for(:action=> 'list', :params =>params.merge({:sort=>key, page=> nil}))
       }
       link_to_remote(text,options, html_options)
end