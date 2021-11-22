var num = 1;
          function slide(side){
              if(side =='right'){
                num ++;
                if(num >3){
                  num=1;
                  document.getElementById('slide-3').classList.remove('active');
                  document.getElementById('slide-'+num).classList.add('active');

                   document.getElementById('boule-3').classList.remove('cacaEnAvant');
                  document.getElementById('boule-'+num).classList.add('cacaEnAvant');
                }else{
                  document.getElementById('slide-'+(num-1)).classList.remove('active');
                  document.getElementById('slide-'+num).classList.add('active');

                  document.getElementById('boule-'+(num-1)).classList.remove('cacaEnAvant');
                  document.getElementById('boule-'+num).classList.add('cacaEnAvant');
                }  
                
              }else if(side =='left'){
                num--;
                if(num <1){
                  num=3;
                  document.getElementById('slide-1').classList.remove('active');
                  document.getElementById('slide-'+num).classList.add('active');

                  document.getElementById('boule-1').classList.remove('cacaEnAvant');
                  document.getElementById('boule-'+num).classList.add('cacaEnAvant');
                }else{
                  document.getElementById('slide-'+(num+1)).classList.remove('active');
                  document.getElementById('slide-'+num).classList.add('active');

                  document.getElementById('boule-'+(num+1)).classList.remove('cacaEnAvant');
                  document.getElementById('boule-'+num).classList.add('cacaEnAvant');
                }  
              }
                                        

}
