class AnswersController < ApplicationController
  before_action :set_answer, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: %i[show index]

  # GET /answers or /answers.json
  def index
    @answers = Answer.all
    redirect_to controller: 'questions', action: 'index'
  end

  # GET /answers/1 or /answers/1.json
  def show
    redirect_to controller: 'questions', action: 'index'
  end


  # GET /answers/new
  def new
    @answer = Answer.new
  end

  # GET /answers/1/edit
  def edit
    if current_user.id != @answer.user_id
      flash[:alert] =  "Not Authorized!!"
      redirect_to controller: 'questions', action: 'show', id: @answer.question_id
    elsif !params['question'].present?
      redirect_to controller: 'questions', action: 'show', id: @answer.question_id
    end
  end

  # POST /answers or /answers.json
  def create
    if answer_params['content'].length == 0
      flash[:alert] = "Nice try, answer can't be blank!!"
      redirect_to controller: 'questions', action: 'show', id: answer_params['question_id']
    else
      @answer = Answer.new(answer_params)
      respond_to do |format|
        if @answer.save
          flash[:notice] = "Answer was successfully created!!"
          format.html { redirect_to controller: 'questions', action: 'show', id: @answer.question_id}
          format.json { render :show, status: :created, location: @answer }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @answer.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /answers/1 or /answers/1.json
  def update
    if current_user.id == @answer.user_id && params['answer']['question_id'].present?
      respond_to do |format|
        if @answer.update(answer_params)
          flash[:notice] = "Answer was successfully updated!!"
          format.html { redirect_to controller: 'questions', action: 'show', id: @answer.question_id }
          format.json { render :show, status: :ok, location: @answer }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @answer.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:alert] =  "Not Authorized User!!"
      redirect_to controller: 'questions', action: 'show', id: @answer.question_id
    end
  end

  # DELETE /answers/1 or /answers/1.json
  def destroy
    if current_user.id == @answer.user_id
      @answer.destroy
      respond_to do |format|
        flash[:notice] = "Answer was successfully destroyed!!"
        format.html { redirect_to controller: 'questions', action: 'show', id: @answer.question_id }
        format.json { head :no_content }
      end
    else
      flash[:alert] =  "Not Authorized User!!"
      redirect_to controller: 'questions', action: 'show', id: @answer.question_id
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      if Answer.find_by(id: params[:id]).blank?
        redirect_to controller: 'home', action: 'error404'
      else
        @answer = Answer.find(params[:id])
      end
    end

    # Only allow a list of trusted parameters through.
    def answer_params
      params.require(:answer).permit(:content, :up_vote, :down_vote, :question_id, :user_id)
    end

    
end
