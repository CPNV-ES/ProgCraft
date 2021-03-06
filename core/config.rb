module Config
    @@base_path = ENV["OCRA_EXECUTABLE"] != nil ? File.join(File.dirname(ENV["OCRA_EXECUTABLE"]),"core") : File.dirname(__FILE__)
    @@base_path.gsub!("\\", "/")

    ASSETS_DIR = File.join(@@base_path, "assets")
    MY_CODES_DIR = File.join(@@base_path, "..", "mycodes")
    MY_MAPS_DIR = File.join(@@base_path, "..", "MyMaps")
    MY_FUNCTIONS_DIR = File.join(@@base_path, "..", "MyFunctions")   
end