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

describe DigitalfilesController do

  # This should return the minimal set of attributes required to create a valid
  # Digitalfile. As you add validations to Digitalfile, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all digitalfiles as @digitalfiles" do
      digitalfile = Digitalfile.create! valid_attributes
      get :index
      assigns(:digitalfiles).should eq([digitalfile])
    end
  end

  describe "GET show" do
    it "assigns the requested digitalfile as @digitalfile" do
      digitalfile = Digitalfile.create! valid_attributes
      get :show, :id => digitalfile.id.to_s
      assigns(:digitalfile).should eq(digitalfile)
    end
  end

  describe "GET new" do
    it "assigns a new digitalfile as @digitalfile" do
      get :new
      assigns(:digitalfile).should be_a_new(Digitalfile)
    end
  end

  describe "GET edit" do
    it "assigns the requested digitalfile as @digitalfile" do
      digitalfile = Digitalfile.create! valid_attributes
      get :edit, :id => digitalfile.id.to_s
      assigns(:digitalfile).should eq(digitalfile)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Digitalfile" do
        expect {
          post :create, :digitalfile => valid_attributes
        }.to change(Digitalfile, :count).by(1)
      end

      it "assigns a newly created digitalfile as @digitalfile" do
        post :create, :digitalfile => valid_attributes
        assigns(:digitalfile).should be_a(Digitalfile)
        assigns(:digitalfile).should be_persisted
      end

      it "redirects to the created digitalfile" do
        post :create, :digitalfile => valid_attributes
        response.should redirect_to(Digitalfile.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved digitalfile as @digitalfile" do
        # Trigger the behavior that occurs when invalid params are submitted
        Digitalfile.any_instance.stub(:save).and_return(false)
        post :create, :digitalfile => {}
        assigns(:digitalfile).should be_a_new(Digitalfile)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Digitalfile.any_instance.stub(:save).and_return(false)
        post :create, :digitalfile => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested digitalfile" do
        digitalfile = Digitalfile.create! valid_attributes
        # Assuming there are no other digitalfiles in the database, this
        # specifies that the Digitalfile created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Digitalfile.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => digitalfile.id, :digitalfile => {'these' => 'params'}
      end

      it "assigns the requested digitalfile as @digitalfile" do
        digitalfile = Digitalfile.create! valid_attributes
        put :update, :id => digitalfile.id, :digitalfile => valid_attributes
        assigns(:digitalfile).should eq(digitalfile)
      end

      it "redirects to the digitalfile" do
        digitalfile = Digitalfile.create! valid_attributes
        put :update, :id => digitalfile.id, :digitalfile => valid_attributes
        response.should redirect_to(digitalfile)
      end
    end

    describe "with invalid params" do
      it "assigns the digitalfile as @digitalfile" do
        digitalfile = Digitalfile.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Digitalfile.any_instance.stub(:save).and_return(false)
        put :update, :id => digitalfile.id.to_s, :digitalfile => {}
        assigns(:digitalfile).should eq(digitalfile)
      end

      it "re-renders the 'edit' template" do
        digitalfile = Digitalfile.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Digitalfile.any_instance.stub(:save).and_return(false)
        put :update, :id => digitalfile.id.to_s, :digitalfile => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested digitalfile" do
      digitalfile = Digitalfile.create! valid_attributes
      expect {
        delete :destroy, :id => digitalfile.id.to_s
      }.to change(Digitalfile, :count).by(-1)
    end

    it "redirects to the digitalfiles list" do
      digitalfile = Digitalfile.create! valid_attributes
      delete :destroy, :id => digitalfile.id.to_s
      response.should redirect_to(digitalfiles_url)
    end
  end

end
