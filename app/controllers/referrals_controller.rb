class ReferralsController < ApplicationController
  def create
    return render json: {response: "Required email"}, status: 400 if params[:email].nil? || params[:email].empty?
    referral = Referral.new(permitted_params)
    if referral.save
      mail = ReferralMailer.referral(referral, params[:email]).deliver
      render json: mail, status: :ok
    else
      render json: {response: "Not Sucessfully"}, status: :unprocessable_entity
    end
  end

  def show
    referral = search_referrals(params[:code])
    if referral
      increment = increment_count(referral)
      render json: {response: {message: "Found referral"}}, status: :ok
    else
      render json: {response: {message: "Not found referral"}}, status: 404
    end
  end

  protected

  def permitted_params
    params.permit(:code)
  end

  def search_referrals(code)
    Referral.find_by(code: code)
  end

  def increment_count(referral)
    referral.increment!(:count)
  end
end