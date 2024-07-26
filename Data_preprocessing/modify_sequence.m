function modifed=modify_sequence(input_sequence,treatment)

if treatment==1

    withoutrepeats=[input_sequence(1,:)];
for n=2:1:length(input_sequence)
   
    if or(input_sequence(n,2)~=input_sequence(n-1,2),input_sequence(n,3)~=input_sequence(n-1,3))
        
        withoutrepeats=[withoutrepeats;input_sequence(n,:)];
    end
end

%e do this to removed the extra effect of emplty space with a behaviour or
%a note 
modify1=[withoutrepeats(1,:)];
for n=2:1:length(withoutrepeats)-1
   
    if and(withoutrepeats(n,2)==0,withoutrepeats(n,3)==withoutrepeats(n-1,3))
        
        modify1=modify1;
    elseif and(withoutrepeats(n,2)==0,withoutrepeats(n,3)==withoutrepeats(n+1,3))
        modify1=modify1;
    elseif and(withoutrepeats(n,2)==withoutrepeats(n-1,2),withoutrepeats(n,3)==0)
        modify1=modify1;
    elseif and(withoutrepeats(n,2)==withoutrepeats(n+1,2),withoutrepeats(n,3)==0)
        modify1=modify1;
    else
        modify1=[modify1;withoutrepeats(n,:)];
    end
end
modify1=[modify1;withoutrepeats(size(withoutrepeats,1),:)];

withoutgaps=[modify1(1,:)];
for k=2:1:length(modify1)
    if  or(modify1(k,2)~=0,modify1(k,3)~=0)
       
        withoutgaps=[withoutgaps;modify1(k,:)];
    end
end



modifed=withoutgaps;

end

if treatment==2
    withoutrepeats=[input_sequence(1,:)];
for n=2:1:length(input_sequence)
   
    if or(input_sequence(n,2)~=input_sequence(n-1,2),input_sequence(n,3)~=input_sequence(n-1,3))
        
        withoutrepeats=[withoutrepeats;input_sequence(n,:)];
    end
end

%e do this to removed the extra effect of emplty space with a behaviour or
%a note 
modify1=[withoutrepeats(1,:)];
for n=2:1:length(withoutrepeats)-1
   
    if and(withoutrepeats(n,2)==0,withoutrepeats(n,3)==withoutrepeats(n-1,3))
        
        modify1=modify1;
    elseif and(withoutrepeats(n,2)==0,withoutrepeats(n,3)==withoutrepeats(n+1,3))
        modify1=modify1;
    elseif and(withoutrepeats(n,2)==withoutrepeats(n-1,2),withoutrepeats(n,3)==0)
        modify1=modify1;
    elseif and(withoutrepeats(n,2)==withoutrepeats(n+1,2),withoutrepeats(n,3)==0)
        modify1=modify1;
    else
        modify1=[modify1;withoutrepeats(n,:)];
    end
end
modify1=[modify1;withoutrepeats(size(withoutrepeats,1),:)];

withoutgaps=[modify1(1,:)];
for k=2:1:length(modify1)
    if  or(modify1(k,2)~=0,modify1(k,3)~=0)
       
        withoutgaps=[withoutgaps;modify1(k,:)];
    end
end

modifed=withoutgaps

modifed(modifed(:,2)==0, 2) = 109;
modifed(modifed(:,3)==0, 3) = 18;


end

if treatment==3
    modifed=input_sequence
end

if treatment==4
    modifed=input_sequence
    modifed(modifed(:,2)==0, 2) = 109;
    modifed(modifed(:,3)==0, 3) = 18;
end
end



