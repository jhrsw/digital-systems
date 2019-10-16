function t = Mask_maker(im, text_name)

fid = fopen(text_name,'W'); 
imsize = size(im);
count = 0;
if (fid)     
    %% Write the RGB data
    fprintf(fid,'WIDTH = 1;\n');
    fprintf(fid,'DEPTH = %d;\n',imsize(1)*imsize(2));
    fprintf(fid,'ADDRESS_RADIX = HEX;\n');
    fprintf(fid,'DATA_RADIX = HEX;\n');
    fprintf(fid,'CONTENT BEGIN\n');
    for i=1:imsize(1)
       for j=1:imsize(2)
          fprintf(fid,'%x:',count);
          count = count + 1;
          if(im(i,j) == 1)         fprintf(fid,'1;\n');   
          else                         fprintf(fid,'0;\n');
          end
       end    
    end 
    fprintf(fid,'END;\n');
    fclose(fid);
    t = 0; % successful
	
else
    t = 1; % error
end
