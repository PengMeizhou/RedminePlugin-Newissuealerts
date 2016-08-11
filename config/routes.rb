# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

get 'newissuealerts', :to => 'newissuealerts#index'
get 'newissuealerts/new', :to => 'newissuealerts#new'
get 'newissuealerts/edit', :to => 'newissuealerts#edit'

post 'newissuealerts/new', :to => 'newissuealerts#new'
post 'newissuealerts/edit', :to => 'newissuealerts#edit'
