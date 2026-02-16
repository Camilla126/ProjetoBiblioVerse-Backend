class ApplicationController < ActionController::API
  # Remova o 'private' antes desse método se ele estiver lá, 
  # ou certifique-se de que ele está acessível.
  
  def authenticate_user!
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    
    begin
      # Aqui ele vai tentar decodificar o token
      decoded = Authentication::JwtService.decode(header)
      @current_user = User.find(decoded[:user_id])
    rescue ActiveRecord::RecordNotFound, JWT::DecodeError
      render json: { errors: ['Não autorizado'] }, status: :unauthorized
    end
  end

  def current_user
    @current_user
  end
end