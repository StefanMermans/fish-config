function find_application
for s in (seq 6)
   for l in (ssh prod$s 'sudo docker ps' | grep -i $argv)
       echo prod$s
   end&
 end; wait
end
