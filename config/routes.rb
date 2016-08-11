# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

get 'newissuealerts', :to => 'newissuealerts#index'
post 'newissuealerts/:project_id/new', :to => 'newissuealerts#new'
post 'newissuealerts/:project_id/edit', :to => 'newissuealerts#edit'
post 'newissuealerts/:project_id/new/:id', :to => 'newissuealerts#new'
post 'newissuealerts/:project_id/edit/:id', :to => 'newissuealerts#edit'