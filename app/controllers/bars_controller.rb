class BarsController < ApplicationController

  helper_method :sort_column, :sort_direction

  # GET /bars
  # GET /bars.json
  def index
    @bars = Bar.order(sort_column+" "+sort_direction)

    attr = Bar.accessible_attributes

    attr.each do |atr|
      if params[atr]
        @bars = Bar.where(atr => params[atr])
      end
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bars }
    end
  end

  # GET /bars/1
  # GET /bars/1.json
  def show
    @bar = Bar.find(params[:id])

    authorize! :show, @bar, :message => 'Not authorized.'

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bar }
    end
  end

  # GET /bars/new
  # GET /bars/new.json

  def new
    @bar = Bar.new
    authorize! :new, @bar, :message => 'Not authorized.'

    attr = Bar.accessible_attributes

    attr.each do |atr|
      if params[atr]
        @bar.update_attribute(atr, params[atr])
      end
    end


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bar }
    end
  end

  # GET /bars/1/edit
  def edit
    @bar = Bar.find(params[:id])
    authorize! :edit, @bar, :message => 'Not authorized.'

  end

  # POST /bars
  # POST /bars.json
  def create
    @bar = Bar.new(params[:bar])

    authorize! :create, @bar, :message => 'Not authorized.'

    respond_to do |format|
      if @bar.save
        format.html { redirect_to @bar, notice: 'Bar was successfully created.' }
        format.json { render json: @bar, status: :created, location: @bar }
      else
        format.html { render action: "new" }
        format.json { render json: @bar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH /bars/1
  # PATCH /bars/1.json
  def update
    @bar = Bar.find(params[:id])

    authorize! :update, @bar, :message => 'Not authorized.'

    respond_to do |format|
      if @bar.update_attributes(params[:bar])
        format.html { redirect_to @bar, notice: 'Bar was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bars/1
  # DELETE /bars/1.json
  def destroy
    @bar = Bar.find(params[:id])
    authorize! :destroy, @bar, :message => 'Not authorized.'

    @bar.destroy

    respond_to do |format|
      format.html { redirect_to bars_url }
      format.json { head :no_content }
    end
  end

  private

  def sort_column
    Bar.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end


end
