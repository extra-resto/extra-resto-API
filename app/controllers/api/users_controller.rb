class Api::UsersController < Api::BaseController

    before_action :find_user, only: %w[show]
  
    def show
      render json: @user.as_json(root: false, methods: :resume_url, :include => {
                                                                        :businesses => {
                                                                        :include => {
                                                                          :events => {
                                                                            :include => {
                                                                              :jobs => {
                                                                                include: :candidatures
                                                                              }
                                                                            }
                                                                          }
                                                                        }
                                                                      }
                                                                    }).except('updated_at')
    end

    private
  
    def find_user
      @user = User.find(params[:id])
    end
  
end