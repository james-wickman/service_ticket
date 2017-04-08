Rails.application.routes.draw do
  get 'home/index'

  get 'tickets/index'

  get 'tickets/show'

  get 'tickets/create'

  get 'tickets/update'

  get 'tickets/new'

  get 'tickets/edit'

  get 'tickets/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
