function [X,Y] = Img_Translate(x,y,x_transalte,y_translate)
  X = x.+x_transalte;
  Y = y.+y_translate;
  end 