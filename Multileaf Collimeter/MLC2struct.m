function [outputStruct, fileRev, CRC] = MLC2struct(fileAddress)
    % MLC2STRUCT(FILE_ADDR) Convert .MLC file to structure
    % Usage:
    %       structOut = MLC2struct(FILE_ADDR)
    %       [structOut, fileRev] = MLC2struct(FILE_ADDR)
    %       [structOut, fileRev, CRC] = MLC2struct(FILE_ADDR)
    %
    % This function gets a file adress as an input and return a structure
    % that contains the .MLC file information.

    % Opening the file it'll return
    % fid as a positive integer.
    [fid, err] = fopen(fileAddress, 'r');
    if fid > 0      
        % Neccesary variables to store information
        specs = cell(8, 1);
        dataSpecs = cell(8, 1);
        leafs(60, 1) = struct('a', [], 'b', []);
        data = struct("field", [], "index", [], "carriageGroup", [], ...
                                "operator", [], "collimator", [], "leafs", [], ...
                                "note", [], "shape", [], "magnification", []);
        outputStruct = struct("treatment",  [], "lastName", [], ...
                                                "firstName", [], "patientID", [], ...
                                                "numberOfFields", [], "model", [], ...
                                                "tolerance", [], "data", []);
        
       for index = 1:1:8
            % Getting main spesifications
            temp = split(fgetl(fid), '=');
            temp = strtrim(temp(2));
            specs{index} = temp{1};
        end
        
        % Processing Data Part
        counters = struct("Data", 0, "DSpecs", 1, "LeafA", 1, "LeafB", 1);
        doContinue = 1;
        while doContinue
            line = fgetl(fid);
            
            % If it's an empty line
            if ~min(size(line))
                if counters.Data > 0
                    data(counters.Data).field = dataSpecs{1};
                    data(counters.Data).index = dataSpecs{2};
                    data(counters.Data).carriageGroup = dataSpecs{3};
                    data(counters.Data).operator = dataSpecs{4};
                    data(counters.Data).collimator = dataSpecs{5};
                    data(counters.Data).leafs = leafs;
                    data(counters.Data).note = dataSpecs{6};
                    data(counters.Data).shape = dataSpecs{7};
                    data(counters.Data).magnification = dataSpecs{8};
                end
                counters.LeafA = 1;
                counters.LeafB = 1;
                counters.DSpecs = 1;
                counters.Data = counters.Data + 1;
                
            % Getting CRC and it is EOF
            elseif contains(line, "CRC")
                temp = split(line, '=');
                temp = strtrim(temp(2));
                CRC = str2double(temp{1});
                doContinue = 0;
                
            % Getting data spesifications
            elseif ~contains(line, "Leaf")
                temp = split(line, '=');
                temp = strtrim(temp(2));
                % If that cell contains only digits,
                % change it to double form.
                if isstrprop(temp{1}, "digit")
                    temp{1} =str2double( temp{1});
                end
                dataSpecs{counters.DSpecs} = temp{1};
                counters.DSpecs = counters.DSpecs + 1;
                
            % Classifacation of Leafs
            else
                temp = split(line, '=');
                temp{2} = strtrim(temp(2));
                temp{2} = str2double(temp{2});
                
                if contains(temp{1}, 'A')
                    leafs(counters.LeafA).a = temp{2};
                    counters.LeafA = counters.LeafA + 1;
                elseif contains(temp{1}, 'B')
                   leafs(counters.LeafB).b = temp{2};
                   counters.LeafB = counters.LeafB + 1;
                end
            end
            
        end
        
        % Closing the file
        fclose(fid);
        
        % Assigning data to return variable
        fileRev = specs{1};
        outputStruct.treatment = specs{2};
        outputStruct.lastName = specs{3};
        outputStruct.firstName = specs{4};
        outputStruct.patientID = str2double(specs{5});
        outputStruct.numberOfFields = specs{6};
        outputStruct.model = specs{7};
        outputStruct.tolerance = specs{8};
        outputStruct.data = data;
    else
        error(err);
    end

end
