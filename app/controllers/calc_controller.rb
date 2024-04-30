class CalcController < ApplicationController
  
  def square_new
    render({ :template => "calc/square_form"})
  end

  def square_result
    @number = params.fetch("number").to_f
    @square = @number**2
    @form = [["Number", @number], ["Square", @square]]
    render({ :template => "calc/flexible"})
  end

  def root_new
    render({ :template => "calc/root_form"})
  end

  def root_result
    @number = params.fetch("number").to_f
    @sqrt = Math.sqrt(@number)
    @form = [["Number", @number], ["Square Root", @sqrt]]
    render({ :template => "calc/flexible"})
  end

  def payment_new
    render({ :template => "calc/payment_form"})
  end

  def payment_result
    @apr = params.fetch("user_apr").to_f
    @rate = @apr/100/12
    @years = params.fetch("user_years").to_i
    @pv=params.fetch("user_pv").to_f
    @payment=((@rate*@pv)/(1-(1+@rate)**(-@years*12))).to_fs(:currency)
    @form = [["APR", @apr.to_fs(:percentage, { :precision => 4 } )], ["Number of years", @years], ["Principal", @pv.to_fs(:currency)], ["Payment", @payment]]
    render({ :template => "calc/flexible"})
  end

  def random_new
    render({ :template => "calc/random_form"})
  end

  def random_result
    @min = params.fetch("user_min").to_f
    @max = params.fetch("user_max").to_f
    @random= Random.rand(@min..@max)
    @form = [["Minimum", @min], ["Maximum", @max], ["Random", @random]]
    render({ :template => "calc/flexible"})
  end


end
