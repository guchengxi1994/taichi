self.$__dart_deferred_initializers__=self.$__dart_deferred_initializers__||Object.create(null)
$__dart_deferred_initializers__.current=function(a,b,c,$){var A={IF:function IF(d,e){this.a=d
this.b=e},IG:function IG(d,e){this.a=d
this.b=e},As:function As(d,e,f){this.a=d
this.b=e
this.c=f},iR:function iR(d,e,f){var _=this
_.e=0
_.bX$=d
_.a2$=e
_.a=f},GX:function GX(d,e,f,g,h,i,j,k,l,m,n,o,p,q){var _=this
_.p=d
_.t=e
_.ac=f
_.a8=g
_.aq=h
_.b7=i
_.b1=j
_.aH=k
_.bn=l
_.bL=!1
_.di=m
_.bw$=n
_.N$=o
_.bE$=p
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
_.c=_.b=null},MU:function MU(){},MV:function MV(){},
ajh(d,e,f,g,h){return new A.IE(f,h,g,e,d,null)},
IE:function IE(d,e,f,g,h,i){var _=this
_.e=d
_.r=e
_.x=f
_.y=g
_.c=h
_.a=i}},C,B,D
A=a.updateHolder(c[22],A)
C=c[2]
B=c[0]
D=c[54]
A.IF.prototype={
i(d){return"WrapAlignment."+this.b}}
A.IG.prototype={
i(d){return"WrapCrossAlignment."+this.b}}
A.As.prototype={}
A.iR.prototype={}
A.GX.prototype={
sa2d(d,e){if(this.p===e)return
this.p=e
this.S()},
sim(d){if(this.t===d)return
this.t=d
this.S()},
sMR(d,e){if(this.ac===e)return
this.ac=e
this.S()},
sa6u(d){if(this.a8===d)return
this.a8=d
this.S()},
sa6y(d){if(this.aq===d)return
this.aq=d
this.S()},
sa1Q(d){if(this.b7===d)return
this.b7=d
this.S()},
dR(d){if(!(d.e instanceof A.iR))d.e=new A.iR(null,null,C.j)},
cV(d){return this.yT(d)},
wJ(d){switch(this.p.a){case 0:return d.a
case 1:return d.b}},
wI(d){switch(this.p.a){case 0:return d.b
case 1:return d.a}},
TT(d,e){switch(this.p.a){case 0:return new B.j(d,e)
case 1:return new B.j(e,d)}},
TC(d,e,f){var x=e-f
switch(this.b7.a){case 0:return d?x:0
case 1:return d?0:x
case 2:return x/2}},
bO(d){return this.RS(d)},
RS(d){var x,w,v,u,t,s,r,q,p,o,n,m,l,k=this
switch(k.p.a){case 0:x=d.b
w=new B.a7(0,x,0,1/0)
break
case 1:x=d.d
w=new B.a7(0,1/0,0,x)
break
default:w=null
x=0}v=k.N$
for(u=B.n(k).j("ab.1"),t=0,s=0,r=0,q=0,p=0;v!=null;){o=B.ags(v,w)
n=k.wJ(o)
m=k.wI(o)
if(p>0&&r+n+k.ac>x){t=Math.max(t,r)
s+=q+k.aq
r=0
q=0
p=0}r+=n
q=Math.max(q,m)
if(p>0)r+=k.ac;++p
l=v.e
l.toString
v=u.a(l).a2$}s+=q
t=Math.max(t,r)
switch(k.p.a){case 0:return d.bc(new B.N(t,s))
case 1:return d.bc(new B.N(s,t))}},
bp(){var x,w,v,u,t,s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,b0,b1=this,b2=y.a.a(B.t.prototype.ga_.call(b1))
b1.bL=!1
x=b1.N$
if(x==null){b1.k1=new B.N(C.h.F(0,b2.a,b2.b),C.h.F(0,b2.c,b2.d))
return}switch(b1.p.a){case 0:w=b2.b
v=new B.a7(0,w,0,1/0)
u=b1.b1===C.T&&!0
t=b1.aH===C.ls&&!0
break
case 1:w=b2.d
v=new B.a7(0,1/0,0,w)
u=b1.aH===C.ls&&!0
t=b1.b1===C.T&&!0
break
default:v=null
w=0
u=!1
t=!1}s=b1.ac
r=b1.aq
q=B.b([],y.l)
for(p=y.e,o=0,n=0,m=0,l=0,k=0;x!=null;){x.bZ(0,v,!0)
j=x.k1
j.toString
i=b1.wJ(j)
j=x.k1
j.toString
h=b1.wI(j)
if(k>0&&m+s+i>w){o=Math.max(o,m)
n+=l
if(q.length!==0)n+=r
q.push(new A.As(m,l,k))
m=0
l=0
k=0}m+=i
if(k>0)m+=s
l=Math.max(l,h);++k
j=x.e
j.toString
p.a(j)
j.e=q.length
x=j.a2$}if(k>0){o=Math.max(o,m)
n+=l
if(q.length!==0)n+=r
q.push(new A.As(m,l,k))}g=q.length
switch(b1.p.a){case 0:j=b1.k1=b2.bc(new B.N(o,n))
f=j.a
e=j.b
break
case 1:j=b1.k1=b2.bc(new B.N(n,o))
f=j.b
e=j.a
break
default:f=0
e=0}b1.bL=f<o||e<n
d=Math.max(0,e-n)
switch(b1.a8.a){case 0:a0=0
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
x=b1.N$
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
i=b1.wJ(a9)
a9=x.k1
a9.toString
b0=b1.TC(t,l,b1.wI(a9))
if(u)a8-=i
j.a=b1.TT(a8,a2+b0)
a8=u?a8-a7:a8+(i+a7)
x=j.a2$}a2=t?a2-a1:a2+(l+a1)}},
c5(d,e){return this.t1(d,e)},
av(d,e){var x,w=this,v=w.bL&&w.bn!==C.k,u=w.di
if(v){v=B.a(w.CW,"_needsCompositing")
x=w.k1
u.sau(0,d.jB(v,e,new B.v(0,0,0+x.a,0+x.b),w.gIJ(),w.bn,u.a))}else{u.sau(0,null)
w.lW(d,e)}},
l(d){this.di.sau(0,null)
this.jT(0)}}
A.MU.prototype={
ad(d){var x,w,v
this.da(d)
x=this.N$
for(w=y.e;x!=null;){x.ad(d)
v=x.e
v.toString
x=w.a(v).a2$}},
a5(d){var x,w,v
this.cQ(0)
x=this.N$
for(w=y.e;x!=null;){x.a5(0)
v=x.e
v.toString
x=w.a(v).a2$}}}
A.MV.prototype={}
A.IE.prototype={
aC(d){var x=this,w=B.d4(d)
w=new A.GX(x.e,D.eV,x.r,D.eV,x.x,x.y,w,C.cG,C.k,B.a8(),0,null,null,B.a8())
w.gak()
w.gar()
w.CW=!1
w.R(0,null)
return w},
aF(d,e){var x,w=this
e.sa2d(0,w.e)
e.sim(D.eV)
e.sMR(0,w.r)
e.sa6u(D.eV)
e.sa6y(w.x)
e.sa1Q(w.y)
x=B.d4(d)
if(e.b1!=x){e.b1=x
e.S()}if(e.aH!==C.cG){e.aH=C.cG
e.S()}if(C.k!==e.bn){e.bn=C.k
e.aE()
e.ah()}}}
var z=a.updateTypes([]);(function inheritance(){var x=a.mixinHard,w=a.mixin,v=a.inheritMany,u=a.inherit
v(B.eL,[A.IF,A.IG])
u(A.As,B.B)
u(A.iR,B.pa)
u(A.MU,B.w)
u(A.MV,A.MU)
u(A.GX,A.MV)
u(A.IE,B.dk)
x(A.MU,B.ab)
w(A.MV,B.c_)})()
B.bE(b.typeUniverse,JSON.parse('{"iR":{"dJ":[],"dM":["w"],"bU":[]},"IF":{"I":[]},"IG":{"I":[]},"GX":{"c_":["w","iR"],"w":[],"ab":["w","iR"],"t":[],"F":[],"Y":[],"ab.1":"iR","c_.1":"iR","ab.0":"w"},"IE":{"dk":[],"a9":[],"h":[]}}'))
var y={a:B.E("a7"),l:B.E("l<As>"),e:B.E("iR")};(function constants(){D.eV=new A.IF(0,"start")
D.vS=new A.IG(0,"start")})()}
$__dart_deferred_initializers__["smWi4gP/iwROTilghureObTq4V8="] = $__dart_deferred_initializers__.current
