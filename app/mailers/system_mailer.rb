class SystemMailer < ApplicationMailer
 default from: "admin@envida.com"
  
 	def complete_task_mail(sender,receiver,offer)
  	@user=sender
  	@offer=offer
    @store=offer.store
  	mail(to:@user.email,from: receiver,subject: "Offer Task is Complete")
  end
  
  def used_claimed_offer(sender,receiver,offer)
  	@user=sender
    @offer=offer
    @store=offer.store
  	mail(to:@user.email,from: receiver,subject: "Offer Task is Complete")
  end

end
