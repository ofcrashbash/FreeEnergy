srcdir = uigetdir();
disp('pattern')
pattern = [srcdir '\*.csv']

disp('destination folder');
dstdir = uigetdir()

files = ls(pattern)
file_size = size(files);
sequence = cell(file_size(1),1);

if (dstdir~=0)
    if (srcdir~=0)
        for i=1:file_size(1)
            name = '';
            for j=1:file_size(2)
                if ~isspace(files(i,j))
                    name = [name files(i,j)];
                end
            end
            srcfile = [srcdir '\' name];
            temp = csvread(srcfile);
            temp = temp';
            %convert from hours to seconds
            temp(1,:) = 3600*temp(1,:);
            name(end-2:end) = 'mat';
            dstfile = [dstdir '\' name];
            save(dstfile, 'temp')
        end
    end
end