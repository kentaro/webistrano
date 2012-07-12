module StagesHelper

  def display_deployment_problems(stage)
    content_tag 'ul' do
      stage.deployment_problems.each do |k, v|
        concat content_tag 'li', v
      end
    end
  end

  # returns the escaped format of a config value
  def capfile_cast(val)
    casted_val = Webistrano::Deployer.type_cast(val).class

    if casted_val == String
      val.inspect
    elsif casted_val == Symbol
      val.to_s
    elsif casted_val == Array
      val.to_s
    elsif casted_val == Hash
      val.to_s
    elsif (casted_val == TrueClass ) || (casted_val == FalseClass)
      val
    elsif casted_val == NilClass
      'nil'
    end

  end


end
