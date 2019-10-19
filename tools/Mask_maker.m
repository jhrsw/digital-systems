function t = Mask_maker(image_name, text_name)

pkg load image;
im = imread(image_name);
im = imresize(im, [128, 256]);
im = im2bw(im);
fid = fopen(text_name,'W'); 
imsize = size(im);
count = 0;
if (fid)     
    fprintf(fid,'WIDTH = 1;\n');
    fprintf(fid,'DEPTH = %d;\n',imsize(1)*imsize(2));
    fprintf(fid,'ADDRESS_RADIX = HEX;\n');
    fprintf(fid,'DATA_RADIX = HEX;\n');
    fprintf(fid,'CONTENT BEGIN\n');
    for i=1:imsize(1)
       for j=1:imsize(2)
          fprintf(fid,'%x:',count);
          count = count + 1;
          if(im(i,j) == 1)         	fprintf(fid,'1;\n');   
          else                      fprintf(fid,'0;\n');
          end
       end    
    end 
    fprintf(fid,'END;\n');
    fclose(fid);
	image_name = strcat('bin_', image_name);
	image_name = strtok(image_name, '.');
	image_name = strcat(image_name, '.bmp');
	imwrite(im, image_name);
    t = 0; % successful
	
else
    t = 1; % error
end
