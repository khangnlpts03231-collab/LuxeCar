// Dữ liệu trưng bày tĩnh ở Lab 4. DAO danh mục chạy với SQL Server riêng.
const $ = id => document.getElementById(id);
if ($('hero-car')) {
 let index=0;
 function render(){const c=CARS[index];$('hero-car').src=BASE+c.hero;$('hero-car').alt=c.brand+' '+c.name;$('backtype').textContent=c.name.toUpperCase();$('car-brand').textContent=c.brand.toUpperCase();$('car-name').textContent=c.name;$('detail-link').href=BASE+'vehicle?id='+c.id;$('car-note').textContent=c.variants.length+' sắc màu • Khám phá dấu ấn riêng';document.querySelectorAll('#dots button').forEach((b,i)=>{b.classList.toggle('selected',i===index);b.setAttribute('aria-pressed',i===index);});}
 function move(step){index=(index+step+CARS.length)%CARS.length;render();}
 CARS.forEach((c,i)=>{const b=document.createElement('button');b.setAttribute('aria-label',c.brand+' '+c.name);b.onclick=()=>{index=i;render();};$('dots').append(b);});
 $('previous').onclick=()=>move(-1);$('next').onclick=()=>move(1);
 document.addEventListener('keydown',e=>{if(e.key==='ArrowRight')move(1);if(e.key==='ArrowLeft')move(-1);});
 let x=0;$('hero-car').addEventListener('touchstart',e=>{x=e.changedTouches[0].clientX;},{passive:true});$('hero-car').addEventListener('touchend',e=>{let d=e.changedTouches[0].clientX-x;if(Math.abs(d)>40)move(d<0?1:-1);},{passive:true});render();
}
if ($('detail-title')) {
 const id=Number(new URLSearchParams(location.search).get('id')||101);const c=CARS.find(c=>c.id===id);
 if(!c){$('detail-title').textContent='Không tìm thấy xe';document.querySelector('.configurator').hidden=true;document.querySelector('.spec-section').hidden=true;}
 else {
 $('detail-brand').textContent=c.brand.toUpperCase();$('detail-title').textContent=c.name;$('price').textContent=new Intl.NumberFormat('vi-VN',{style:'currency',currency:'VND'}).format(c.price);
 const isSprite=c.id===101;let color=0,angle=0;
 const options=isSprite?[{label:'Vàng',tone:'#e5bd26'},{label:'Bạc',tone:'#a6abaa'},{label:'Xanh lục',tone:'#275441'}]:c.variants;
 $('sprite').hidden=!isSprite;$('photo').hidden=isSprite;$('angles').hidden=!isSprite;
 $('image-note').textContent=isSprite?'Ảnh phối màu minh họa • Góc trước và góc sau':'Ảnh thực tế • Góc chụp theo ảnh của từng màu';
 function update(){let v=options[color];$('color-name').textContent=v.label;if(isSprite){$('sprite').style.backgroundPosition=(angle*100)+'% '+(color*50)+'%';$('sprite').setAttribute('aria-label',c.name+' '+v.label+' '+(angle?'góc sau':'góc trước'));}else{$('photo').src=BASE+v.image;$('photo').alt=c.name+' '+v.label;}document.querySelectorAll('#swatches button').forEach((b,i)=>{b.classList.toggle('selected',i===color);b.setAttribute('aria-pressed',i===color);});document.querySelectorAll('#angles button').forEach((b,i)=>{b.classList.toggle('selected',i===angle);b.setAttribute('aria-pressed',i===angle);});}
 options.forEach((v,i)=>{let b=document.createElement('button');b.style.backgroundColor=v.tone;b.setAttribute('aria-label',v.label);b.onclick=()=>{color=i;update();};$('swatches').append(b);});document.querySelectorAll('#angles button').forEach(b=>b.onclick=()=>{angle=Number(b.dataset.angle);update();});
 Object.entries(c.details).forEach(([key,value])=>{const row=document.createElement('div'),dt=document.createElement('dt'),dd=document.createElement('dd');dt.textContent=key;dd.textContent=value;row.append(dt,dd);$('specs').append(row);});
 c.variants.slice(0,3).forEach(v=>{const div=document.createElement('div'),img=document.createElement('img'),a=document.createElement('a');img.src=BASE+v.image;img.alt=c.brand+' '+c.name+' '+v.label;img.loading='lazy';a.href=v.source;a.target='_blank';a.rel='noopener noreferrer';a.textContent='Ảnh gốc: Wikimedia Commons ↗';const small=document.createElement('small');small.append(a);div.append(img,small);$('gallery').append(div);});update();
 }
}
