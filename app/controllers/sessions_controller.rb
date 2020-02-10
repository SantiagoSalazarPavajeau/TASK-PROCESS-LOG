require './config/environment'

class SessionsController <  ApplicationController

    
    
    
    
    get '/sessions/logout' do
        session.clear
        redirect '/'
    end

end