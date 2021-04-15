class QuestionsController < ApplicationController
  before_action :set_question, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: %i[show index]

  # GET /questions or /questions.json
  def index
    # @questions = Question.all
    @questions = Question.search(params[:search])
    if @questions.blank?
      flash[:alert] = "No Questions found, It would be great if you post one."
    else
      flash[:alert] = nil
    end
  end

  # GET /questions/1 or /questions/1.json
  def show
    if params[:search].present?
      redirect_to questions_path(:search => params[:search], :commit => "search")
    else
      flash[:alert] = nil
    end
  end

  # GET /questions/new
  def new
    if params[:search].present?
      redirect_to questions_path(:search => params[:search], :commit => "search")
    else
      flash[:alert] = nil
    end
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
    if params[:search].present?
      redirect_to questions_path(:search => params[:search], :commit => "search")
    else
      flash[:alert] = nil
    end
    if current_user.id != @question.user_id
      redirect_to @question, alert: "Not Authorized User"
    end
    @a = Answer.find_by(question_id: @question.id)
    if @a.inspect.length > 28
      redirect_to @question, alert: "Question has already been answered, so can't be edited."
    end
  end

  # POST /questions or /questions.json
  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: "Question was successfully created." }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1 or /questions/1.json
  def update
    if current_user.id == @question.user_id
      respond_to do |format|
        if @question.update(question_params)
          format.html { redirect_to @question, notice: "Question was successfully updated." }
          format.json { render :show, status: :ok, location: @question }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @question.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to @question, alert: "Not Authorized User"
    end
  end

  # DELETE /questions/1 or /questions/1.json
  def destroy
    if current_user.id == @question.user_id
      @question.destroy
      respond_to do |format|
        format.html { redirect_to questions_url, notice: "Question was successfully destroyed." }
        format.json { head :no_content }
      end
    else
      redirect_to @question, alert: "Not Authorized User"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      if Question.find_by(id: params[:id]).blank?
        redirect_to controller: 'home', action: 'error404'
      else
        @question = Question.find(params[:id]) 
      end
    end

    # Only allow a list of trusted parameters through.
    def question_params
      params.require(:question).permit(:content, :tag, :user_id)
    end
end
