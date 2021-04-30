disp([gcs ': model preload'])
try      
      model_preload();
catch ClbckException
      disp([gcs ': exception in preload function occured'])
      disp(ClbckException)
end