function [ans count] = connected(img)
[rows,cols,dim]=size(img);
dp = zeros(rows+1,cols+1);  
cnt=1;
tmp=0;
map=zeros(10000,1);
count=zeros(10000,1);
for i=1:rows
    for j=1:cols
        if(img(i,j)==0)
            dp(i,j)=0;
        else
            if(i==1 && j>1)
                dp(i,j)=dp(i,j-1);
                count(dp(i,j))=count(dp(i,j))+1;
                
            elseif(j==1 && i>1)
                 dp(i,j)=dp(i-1,j);
                 if(dp(i,j)>0)
                 count(dp(i,j))=count(dp(i,j))+1;
                 end
                 
            elseif (i==1 && j==1)
                dp(i,j)=cnt;
                count(cnt)=count(cnt)+1;
                cnt=cnt+1;
                
            else
                    if(dp(i-1,j)==0 && dp(i,j-1)==0)
                        dp(i,j)=cnt;
                        count(cnt)=count(cnt)+1;
                        cnt=cnt+1;
                    elseif(dp(i-1,j)~=0 && dp(i,j-1)==0)
                            dp(i,j)=dp(i-1,j);
                            count(dp(i,j))=count(dp(i,j))+1;
                    elseif(dp(i-1,j)==0 && dp(i,j-1)~=0)
                            dp(i,j)=dp(i,j-1);
                             count(dp(i,j))=count(dp(i,j))+1;
                    elseif(dp(i-1,j)~=0 && dp(i,j-1)~=0)
                        if(dp(i-1,j)<dp(i,j-1))   
                          dp(i,j)=dp(i-1,j);
                          count(dp(i,j))=count(dp(i,j))+1;
                          map(dp(i,j-1),1)=dp(i-1,j);
                        else 
                           dp(i,j)=dp(i,j-1);
                           count(dp(i,j))=count(dp(i,j))+1;
                           map(dp(i-1,j),1)=dp(i,j-1);                   
                        end           
                    end 
            end
        end
    end
end

cnt=cnt-1;
ans=cnt;
doc=zeros(cnt,1); 
for i=1:cnt
    if(map(i,1)~=i && map(i,1)~=0)
        doc(i)=doc(map(i,1),1);
        dp(i)=dp(i)+1;
        ans=ans-1;
    else
        doc(i,1)=i;
    end
end
cnt