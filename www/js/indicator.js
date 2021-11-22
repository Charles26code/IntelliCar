var num = 1;
          function boule(side){
              if(side =='right'){
                num ++;
                if(num >3){
                  num=1;
                  document.getElementById('boule-3').classList.remove('active');
                  document.getElementById('boule-'+num).classList.add('active');
                }else{
                  document.getElementById('boule-'+(num-1)).classList.remove('active');
                  document.getElementById('boule-'+num).classList.add('active');
                }  
                
              }else if(side =='left'){
                num--;
                if(num <1){
                  num=3;
                  document.getElementById('boule-1').classList.remove('active');
                  document.getElementById('boule-'+num).classList.add('active');
                }else{
                  document.getElementById('boule-'+(num+1)).classList.remove('active');
                  document.getElementById('boule-'+num).classList.add('active');
                }  
              }
                                        

}
