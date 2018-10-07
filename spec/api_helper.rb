def sign_up_and_in
  valid_attributes = {
    name: 'Bob',
    email: 'bob@bob.com',
    password: '123456',
    password_confirmation: '123456'
  }
  Users::RegistrationsController

  @request.env["devise.mapping"] = Devise.mappings[:user]
  post :create, params: {user: valid_attributes}, controller: 'users/registrations'
  Users::SessionsController
  post :create, params: {user: valid_attributes}, controller: 'users/sessions'

  # post 'users/sign_in', params: {user: {email: 'bob@bob.com', password: '123456'}}

  # .path_parameters

  p response.headers
  return response.headers.authorization
end
