require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe BarsController do

  # This should return the minimal set of attributes required to create a valid
  # Bar. As you add validations to Bar, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # BarsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all bars as @bars" do
      bar = Bar.create! valid_attributes
      get :index, {}, valid_session
      assigns(:bars).should eq([bar])
    end
  end

  describe "GET show" do
    it "assigns the requested bar as @bar" do
      bar = Bar.create! valid_attributes
      get :show, {:id => bar.to_param}, valid_session
      assigns(:bar).should eq(bar)
    end
  end

  describe "GET new" do
    it "assigns a new bar as @bar" do
      get :new, {}, valid_session
      assigns(:bar).should be_a_new(Bar)
    end
  end

  describe "GET edit" do
    it "assigns the requested bar as @bar" do
      bar = Bar.create! valid_attributes
      get :edit, {:id => bar.to_param}, valid_session
      assigns(:bar).should eq(bar)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Bar" do
        expect {
          post :create, {:bar => valid_attributes}, valid_session
        }.to change(Bar, :count).by(1)
      end

      it "assigns a newly created bar as @bar" do
        post :create, {:bar => valid_attributes}, valid_session
        assigns(:bar).should be_a(Bar)
        assigns(:bar).should be_persisted
      end

      it "redirects to the created bar" do
        post :create, {:bar => valid_attributes}, valid_session
        response.should redirect_to(Bar.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved bar as @bar" do
        # Trigger the behavior that occurs when invalid params are submitted
        Bar.any_instance.stub(:save).and_return(false)
        post :create, {:bar => { "name" => "invalid value" }}, valid_session
        assigns(:bar).should be_a_new(Bar)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Bar.any_instance.stub(:save).and_return(false)
        post :create, {:bar => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested bar" do
        bar = Bar.create! valid_attributes
        # Assuming there are no other bars in the database, this
        # specifies that the Bar created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Bar.any_instance.should_receive(:update_attributes).with({ "name" => "MyString" })
        put :update, {:id => bar.to_param, :bar => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested bar as @bar" do
        bar = Bar.create! valid_attributes
        put :update, {:id => bar.to_param, :bar => valid_attributes}, valid_session
        assigns(:bar).should eq(bar)
      end

      it "redirects to the bar" do
        bar = Bar.create! valid_attributes
        put :update, {:id => bar.to_param, :bar => valid_attributes}, valid_session
        response.should redirect_to(bar)
      end
    end

    describe "with invalid params" do
      it "assigns the bar as @bar" do
        bar = Bar.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Bar.any_instance.stub(:save).and_return(false)
        put :update, {:id => bar.to_param, :bar => { "name" => "invalid value" }}, valid_session
        assigns(:bar).should eq(bar)
      end

      it "re-renders the 'edit' template" do
        bar = Bar.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Bar.any_instance.stub(:save).and_return(false)
        put :update, {:id => bar.to_param, :bar => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested bar" do
      bar = Bar.create! valid_attributes
      expect {
        delete :destroy, {:id => bar.to_param}, valid_session
      }.to change(Bar, :count).by(-1)
    end

    it "redirects to the bars list" do
      bar = Bar.create! valid_attributes
      delete :destroy, {:id => bar.to_param}, valid_session
      response.should redirect_to(bars_url)
    end
  end

end
