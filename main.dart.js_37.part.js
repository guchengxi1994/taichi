self.$__dart_deferred_initializers__=self.$__dart_deferred_initializers__||Object.create(null)
$__dart_deferred_initializers__.current=function(a,b,c,$){var A={Hr:function Hr(d,e){this.a=d
this.b=e},Hs:function Hs(d,e){this.a=d
this.b=e},zy:function zy(d,e,f){this.a=d
this.b=e
this.c=f},iC:function iC(d,e,f){var _=this
_.e=0
_.c1$=d
_.a4$=e
_.a=f},FS:function FS(d,e,f,g,h,i,j,k,l,m,n,o,p,q){var _=this
_.m=d
_.t=e
_.ab=f
_.a5=g
_.al=h
_.b7=i
_.aY=j
_.aF=k
_.bj=l
_.bG=!1
_.dc=m
_.bH$=n
_.O$=o
_.bN$=p
_.go=_.fy=null
_.id=!1
_.k2=_.k1=null
_.k3=0
_.d=!1
_.f=_.e=null
_.w=_.r=!1
_.x=null
_.y=!1
_.z=!0
_.Q=null
_.as=!1
_.at=null
_.ax=!1
_.ay=q
_.ch=!1
_.CW=$
_.cx=!0
_.cy=null
_.db=!0
_.dx=null
_.a=0
_.c=_.b=null},LA:function LA(){},LB:function LB(){},
afX(d,e,f,g,h){return new A.Hq(f,h,g,e,d,null)},
Hq:function Hq(d,e,f,g,h,i){var _=this
_.e=d
_.r=e
_.x=f
_.y=g
_.c=h
_.a=i}},C,B,D
A=a.updateHolder(c[21],A)
C=c[2]
B=c[0]
D=c[40]
A.Hr.prototype={
i(d){return"WrapAlignment."+this.b}}
A.Hs.prototype={
i(d){return"WrapCrossAlignment."+this.b}}
A.zy.prototype={}
A.iC.prototype={}
A.FS.prototype={
sa0a(d,e){if(this.m===e)return
this.m=e
this.S()},
si7(d){if(this.t===d)return
this.t=d
this.S()},
sLk(d,e){if(this.ab===e)return
this.ab=e
this.S()},
sa4n(d){if(this.a5===d)return
this.a5=d
this.S()},
sa4s(d){if(this.al===d)return
this.al=d
this.S()},
sa_N(d){if(this.b7===d)return
this.b7=d
this.S()},
e2(d){if(!(d.e instanceof A.iC))d.e=new A.iC(null,null,C.j)},
cO(d){return this.xT(d)},
vS(d){switch(this.m.a){case 0:return d.a
case 1:return d.b}},
vR(d){switch(this.m.a){case 0:return d.b
case 1:return d.a}},
Sb(d,e){switch(this.m.a){case 0:return new B.k(d,e)
case 1:return new B.k(e,d)}},
RV(d,e,f){var x=e-f
switch(this.b7.a){case 0:return d?x:0
case 1:return d?0:x
case 2:return x/2}},
bL(d){return this.Q9(d)},
Q9(d){var x,w,v,u,t,s,r,q,p,o,n,m,l,k=this
switch(k.m.a){case 0:x=d.b
w=new B.a1(0,x,0,1/0)
break
case 1:x=d.d
w=new B.a1(0,1/0,0,x)
break
default:w=null
x=0}v=k.O$
for(u=B.p(k).j("a8.1"),t=0,s=0,r=0,q=0,p=0;v!=null;){o=B.ad9(v,w)
n=k.vS(o)
m=k.vR(o)
if(p>0&&r+n+k.ab>x){t=Math.max(t,r)
s+=q+k.al
r=0
q=0
p=0}r+=n
q=Math.max(q,m)
if(p>0)r+=k.ab;++p
l=v.e
l.toString
v=u.a(l).a4$}s+=q
t=Math.max(t,r)
switch(k.m.a){case 0:return d.ba(new B.J(t,s))
case 1:return d.ba(new B.J(s,t))}},
bo(){var x,w,v,u,t,s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,b0,b1=this,b2=y.a.a(B.q.prototype.gY.call(b1))
b1.bG=!1
x=b1.O$
if(x==null){b1.k1=new B.J(C.i.E(0,b2.a,b2.b),C.i.E(0,b2.c,b2.d))
return}switch(b1.m.a){case 0:w=b2.b
v=new B.a1(0,w,0,1/0)
u=b1.aY===C.O&&!0
t=b1.aF===C.l9&&!0
break
case 1:w=b2.d
v=new B.a1(0,1/0,0,w)
u=b1.aF===C.l9&&!0
t=b1.aY===C.O&&!0
break
default:v=null
w=0
u=!1
t=!1}s=b1.ab
r=b1.al
q=B.b([],y.l)
for(p=y.e,o=0,n=0,m=0,l=0,k=0;x!=null;){x.bW(0,v,!0)
j=x.k1
j.toString
i=b1.vS(j)
j=x.k1
j.toString
h=b1.vR(j)
if(k>0&&m+s+i>w){o=Math.max(o,m)
n+=l
if(q.length!==0)n+=r
q.push(new A.zy(m,l,k))
m=0
l=0
k=0}m+=i
if(k>0)m+=s
l=Math.max(l,h);++k
j=x.e
j.toString
p.a(j)
j.e=q.length
x=j.a4$}if(k>0){o=Math.max(o,m)
n+=l
if(q.length!==0)n+=r
q.push(new A.zy(m,l,k))}g=q.length
switch(b1.m.a){case 0:j=b1.k1=b2.ba(new B.J(o,n))
f=j.a
e=j.b
break
case 1:j=b1.k1=b2.ba(new B.J(n,o))
f=j.b
e=j.a
break
default:f=0
e=0}b1.bG=f<o||e<n
d=Math.max(0,e-n)
switch(b1.a5.a){case 0:a0=0
a1=0
break
case 1:a0=d
a1=0
break
case 2:a0=d/2
a1=0
break
case 3:a1=g>1?d/(g-1):0
a0=0
break
case 4:a1=d/g
a0=a1/2
break
case 5:a1=d/(g+1)
a0=a1
break
default:a0=0
a1=0}a1+=r
a2=t?e-a0:a0
x=b1.O$
for(a3=0;a3<g;++a3){a4=q[a3]
l=a4.b
k=a4.c
a5=Math.max(0,f-a4.a)
switch(b1.t.a){case 0:a6=0
a7=0
break
case 1:a6=a5
a7=0
break
case 2:a6=a5/2
a7=0
break
case 3:a7=k>1?a5/(k-1):0
a6=0
break
case 4:a7=a5/k
a6=a7/2
break
case 5:a7=a5/(k+1)
a6=a7
break
default:a6=0
a7=0}a7+=s
a8=u?f-a6:a6
if(t)a2-=l
for(;x!=null;){j=x.e
j.toString
p.a(j)
if(j.e!==a3)break
a9=x.k1
a9.toString
i=b1.vS(a9)
a9=x.k1
a9.toString
b0=b1.RV(t,l,b1.vR(a9))
if(u)a8-=i
j.a=b1.Sb(a8,a2+b0)
a8=u?a8-a7:a8+(i+a7)
x=j.a4$}a2=t?a2-a1:a2+(l+a1)}},
c3(d,e){return this.rk(d,e)},
ap(d,e){var x,w=this,v=w.bG&&w.bj!==C.k,u=w.dc
if(v){v=B.a(w.CW,"_needsCompositing")
x=w.k1
u.sao(0,d.jp(v,e,new B.v(0,0,0+x.a,0+x.b),w.gHr(),w.bj,u.a))}else{u.sao(0,null)
w.lx(d,e)}},
l(d){this.dc.sao(0,null)
this.jI(0)}}
A.LA.prototype={
aa(d){var x,w,v
this.d4(d)
x=this.O$
for(w=y.e;x!=null;){x.aa(d)
v=x.e
v.toString
x=w.a(v).a4$}},
a3(d){var x,w,v
this.cI(0)
x=this.O$
for(w=y.e;x!=null;){x.a3(0)
v=x.e
v.toString
x=w.a(v).a4$}}}
A.LB.prototype={}
A.Hq.prototype={
aB(d){var x=this,w=B.cS(d)
w=new A.FS(x.e,D.eH,x.r,D.eH,x.x,x.y,w,C.cD,C.k,B.a3(),0,null,null,B.a3())
w.gaf()
w.gaq()
w.CW=!1
w.R(0,null)
return w},
aE(d,e){var x,w=this
e.sa0a(0,w.e)
e.si7(D.eH)
e.sLk(0,w.r)
e.sa4n(D.eH)
e.sa4s(w.x)
e.sa_N(w.y)
x=B.cS(d)
if(e.aY!=x){e.aY=x
e.S()}if(e.aF!==C.cD){e.aF=C.cD
e.S()}if(C.k!==e.bj){e.bj=C.k
e.aC()
e.ae()}}}
var z=a.updateTypes([]);(function inheritance(){var x=a.mixinHard,w=a.mixin,v=a.inheritMany,u=a.inherit
v(B.fR,[A.Hr,A.Hs])
u(A.zy,B.B)
u(A.iC,B.or)
u(A.LA,B.w)
u(A.LB,A.LA)
u(A.FS,A.LB)
u(A.Hq,B.d9)
x(A.LA,B.a8)
w(A.LB,B.bU)})()
B.cr(b.typeUniverse,JSON.parse('{"iC":{"dv":[],"dS":["w"],"bT":[]},"Hr":{"H":[]},"Hs":{"H":[]},"FS":{"bU":["w","iC"],"w":[],"a8":["w","iC"],"q":[],"D":[],"Z":[],"a8.1":"iC","bU.1":"iC","a8.0":"w"},"Hq":{"d9":[],"a4":[],"h":[]}}'))
var y={a:B.M("a1"),l:B.M("l<zy>"),e:B.M("iC")};(function constants(){D.eH=new A.Hr(0,"start")
D.vr=new A.Hs(0,"start")})()}
$__dart_deferred_initializers__["EOuEyPL+M2aZMuSur6q+SiOlj4o="] = $__dart_deferred_initializers__.current
