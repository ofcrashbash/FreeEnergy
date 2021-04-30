paths = paths_project();
for i=1:length(paths)
  try
    open([paths{i} '.slx'])  
    set_param(gcs,'InitFcn','modelPreLoadClbck');
    set_param(gcs,'PreLoadFcn','modelPreLoadClbck');
  catch
      disp('unknown file')
      disp(paths{i})
  end
end