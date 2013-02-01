class OrdersController < InheritedResources::Base
	before_filter :authenticate_user!

	def index
		@orders = current_user.orders.completed
	end

	def show
		@order = current_user.orders.find(params[:id])
	end

	def create
		@order = current_user.orders.build(params[:order])
		@order.ip_address = request.remote_ip
		@order.deal = Deal.find(params[:deal_id])
		if @order.save
			if @order.purchase
				@order.complete!
        OrderMailer.order_confirmation(current_user, @order).deliver
				redirect_to success_deal_order_path(@order.deal,@order)
			else
				redirect_to failure_deal_order_path(@order.deal,@order)
			end
			# end
		else
			render 'new'
		end
	end

	def edit
		@order = current_user.orders.find(params[:id])
	end

	def update
		@order = current_user.orders.find(params[:id])
		@order.ip_address = request.remote_ip
		if @order.update_attributes(params[:order])
			if @order.purchase
				@order.complete!
				OrderMailer.order_confirmation(current_user, @order).deliver
				redirect_to success_deal_order_path(@order.deal,@order)
			else
				redirect_to failure_deal_order_path(@order.deal,@order)
			end
		else
			render 'new'
		end
	end

	def failure
		@order = current_user.orders.find(params[:id])
	end

	def success
		@order = current_user.orders.find(params[:id])
	end

end
