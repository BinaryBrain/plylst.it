function startSpinner(){function e(e,t){a.save(),a.translate(s/2,r/2),a.rotate(t),a.beginPath(),a.moveTo(0,-2*e/3),a.lineTo(e/Math.sqrt(3),e/3),a.lineTo(-e/Math.sqrt(3),e/3),a.closePath(),a.stroke(),a.restore()}function t(e){return e*Math.PI/180}function i(){a.clearRect(0,0,s,r),o%8===0&&(l.push({size:10,life:o}),f++);for(var n=0;n<l.length;n++)l[n].size+=10,a.lineWidth=Math.round(10-l[n].size/200),a.strokeStyle="rgba("+(l[n].size/5+50)+", 91, 167, 1)",e(l[n].size,t(-l[n].size/100-1.4*l[n].life));l[0].size>2e3&&l.shift(),a.font="35px Quicksand",a.fillStyle="white",a.textAlign="center",a.fillText("Downloading...",250,70),o++,requestAnimationFrame(i)}var n=document.querySelector("#spinner");n.style.display="block";var s=spinner.offsetWidth,r=spinner.offsetHeight,a=n.getContext("2d");a.canvas.width=s,a.canvas.height=r;var o=0,l=[{size:4,life:0}],f=0;i()}