module ValidateParameters
  def self.add_timesheet(params)
    missing_parameters = []
    missing_parameters << "start_date" if params[:start_date].blank?
    missing_parameters << "end_date" if params[:end_date].blank?
      
    return [] if missing_parameters.blank?
    return {status: 400, message: "Missing the following parameters: #{missing_parameters.join(', ')}"}

    end
end