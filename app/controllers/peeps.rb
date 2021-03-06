class Chitter < Sinatra::Base

  get '/' do
    redirect to '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.chronological
    erb :'peeps/index'
  end

  post '/peeps' do
    Peep.create(experience: params[:experience], user: current_user)
    redirect to '/peeps'
  end
end
