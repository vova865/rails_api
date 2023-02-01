class ChangeFieldToDataWeather < ActiveRecord::Migration[6.1]
  def change
    rename_column :data_weathers, :type, :kind
  end
end
