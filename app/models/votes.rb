class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :answer
   validates :value, inclusion: {in: [1, -1]}

 def create
    @upvote = Upvote.new(secure_params)
    @upvote.answer = Answer.find(params[:answet_id, :user_id])
    if @upvote.save
      respond_to do |format|
        format.html { redirect_to @upvote.answer }
        format.js # we'll use this later for AJAX!
      end
    end
  end

  private
    def secure_params
      params.require(:upvote).permit(:user)
    end
end

end
