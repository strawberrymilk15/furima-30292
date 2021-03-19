class ContactsController < ApplicationController

  def index
    @contacts = Contact.order("created_at DESC")
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.valid?
      @contact.save
      redirect_to create_contacts_path
    else
      redirect_to new_contact_path
    end
  end

  def destroy
    contact=Contact.find(params[:id])
    if contact.destroy
      redirect_to contacts_path
      else
        redirect_to contact_path(contact.id)
      end
  end

  def show
    @contact=Contact.find(params[:id])
  end


  private

  def contact_params
    params.require(:contact).permit(:name,:message)
  end

end
