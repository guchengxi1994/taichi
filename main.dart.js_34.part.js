self.$__dart_deferred_initializers__=self.$__dart_deferred_initializers__||Object.create(null)
$__dart_deferred_initializers__.current=function(a,b,c,$){var A={Hc:function Hc(d,e){this.a=d
this.b=e},Hd:function Hd(d,e){this.a=d
this.b=e},zh:function zh(d,e,f){this.a=d
this.b=e
this.c=f},ix:function ix(d,e,f){var _=this
_.e=0
_.c_$=d
_.a1$=e
_.a=f},FE:function FE(d,e,f,g,h,i,j,k,l,m,n,o,p,q){var _=this
_.n=d
_.t=e
_.ac=f
_.a3=g
_.al=h
_.b7=i
_.aX=j
_.aF=k
_.bh=l
_.bK=!1
_.da=m
_.bE$=n
_.N$=o
_.bL$=p
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
_.c=_.b=null},Lg:function Lg(){},Lh:function Lh(){},
aeN(d,e,f,g,h){return new A.Hb(f,h,g,e,d,null)},
Hb:function Hb(d,e,f,g,h,i){var _=this
_.e=d
_.r=e
_.x=f
_.y=g
_.c=h
_.a=i}},C,B,D
A=a.updateHolder(c[20],A)
C=c[2]
B=c[0]
D=c[39]
A.Hc.prototype={
i(d){return"WrapAlignment."+this.b}}
A.Hd.prototype={
i(d){return"WrapCrossAlignment."+this.b}}
A.zh.prototype={}
A.ix.prototype={}
A.FE.prototype={
sa_W(d,e){if(this.n===e)return
this.n=e
this.R()},
si2(d){if(this.t===d)return
this.t=d
this.R()},
sLd(d,e){if(this.ac===e)return
this.ac=e
this.R()},
sa4a(d){if(this.a3===d)return
this.a3=d
this.R()},
sa4f(d){if(this.al===d)return
this.al=d
this.R()},
sa_y(d){if(this.b7===d)return
this.b7=d
this.R()},
dY(d){if(!(d.e instanceof A.ix))d.e=new A.ix(null,null,C.j)},
cM(d){return this.xF(d)},
vF(d){switch(this.n.a){case 0:return d.a
case 1:return d.b}},
vE(d){switch(this.n.a){case 0:return d.b
case 1:return d.a}},
S_(d,e){switch(this.n.a){case 0:return new B.k(d,e)
case 1:return new B.k(e,d)}},
RJ(d,e,f){var x=e-f
switch(this.b7.a){case 0:return d?x:0
case 1:return d?0:x
case 2:return x/2}},
bM(d){return this.Q0(d)},
Q0(d){var x,w,v,u,t,s,r,q,p,o,n,m,l,k=this
switch(k.n.a){case 0:x=d.b
w=new B.a2(0,x,0,1/0)
break
case 1:x=d.d
w=new B.a2(0,1/0,0,x)
break
default:w=null
x=0}v=k.N$
for(u=B.p(k).j("a8.1"),t=0,s=0,r=0,q=0,p=0;v!=null;){o=B.ac2(v,w)
n=k.vF(o)
m=k.vE(o)
if(p>0&&r+n+k.ac>x){t=Math.max(t,r)
s+=q+k.al
r=0
q=0
p=0}r+=n
q=Math.max(q,m)
if(p>0)r+=k.ac;++p
l=v.e
l.toString
v=u.a(l).a1$}s+=q
t=Math.max(t,r)
switch(k.n.a){case 0:return d.bc(new B.M(t,s))
case 1:return d.bc(new B.M(s,t))}},
br(){var x,w,v,u,t,s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,b0,b1=this,b2=y.a.a(B.r.prototype.gZ.call(b1))
b1.bK=!1
x=b1.N$
if(x==null){b1.k1=new B.M(C.i.E(0,b2.a,b2.b),C.i.E(0,b2.c,b2.d))
return}switch(b1.n.a){case 0:w=b2.b
v=new B.a2(0,w,0,1/0)
u=b1.aX===C.M&&!0
t=b1.aF===C.l_&&!0
break
case 1:w=b2.d
v=new B.a2(0,1/0,0,w)
u=b1.aF===C.l_&&!0
t=b1.aX===C.M&&!0
break
default:v=null
w=0
u=!1
t=!1}s=b1.ac
r=b1.al
q=B.b([],y.l)
for(p=y.e,o=0,n=0,m=0,l=0,k=0;x!=null;){x.bT(0,v,!0)
j=x.k1
j.toString
i=b1.vF(j)
j=x.k1
j.toString
h=b1.vE(j)
if(k>0&&m+s+i>w){o=Math.max(o,m)
n+=l
if(q.length!==0)n+=r
q.push(new A.zh(m,l,k))
m=0
l=0
k=0}m+=i
if(k>0)m+=s
l=Math.max(l,h);++k
j=x.e
j.toString
p.a(j)
j.e=q.length
x=j.a1$}if(k>0){o=Math.max(o,m)
n+=l
if(q.length!==0)n+=r
q.push(new A.zh(m,l,k))}g=q.length
switch(b1.n.a){case 0:j=b1.k1=b2.bc(new B.M(o,n))
f=j.a
e=j.b
break
case 1:j=b1.k1=b2.bc(new B.M(n,o))
f=j.b
e=j.a
break
default:f=0
e=0}b1.bK=f<o||e<n
d=Math.max(0,e-n)
switch(b1.a3.a){case 0:a0=0
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
i=b1.vF(a9)
a9=x.k1
a9.toString
b0=b1.RJ(t,l,b1.vE(a9))
if(u)a8-=i
j.a=b1.S_(a8,a2+b0)
a8=u?a8-a7:a8+(i+a7)
x=j.a1$}a2=t?a2-a1:a2+(l+a1)}},
c0(d,e){return this.r8(d,e)},
ao(d,e){var x,w=this,v=w.bK&&w.bh!==C.k,u=w.da
if(v){v=B.a(w.CW,"_needsCompositing")
x=w.k1
u.san(0,d.jn(v,e,new B.v(0,0,0+x.a,0+x.b),w.gHi(),w.bh,u.a))}else{u.san(0,null)
w.lq(d,e)}},
l(d){this.da.san(0,null)
this.jG(0)}}
A.Lg.prototype={
a9(d){var x,w,v
this.d3(d)
x=this.N$
for(w=y.e;x!=null;){x.a9(d)
v=x.e
v.toString
x=w.a(v).a1$}},
a0(d){var x,w,v
this.cF(0)
x=this.N$
for(w=y.e;x!=null;){x.a0(0)
v=x.e
v.toString
x=w.a(v).a1$}}}
A.Lh.prototype={}
A.Hb.prototype={
aC(d){var x=this,w=B.cN(d)
w=new A.FE(x.e,D.eE,x.r,D.eE,x.x,x.y,w,C.cC,C.k,B.a3(),0,null,null,B.a3())
w.gaf()
w.gav()
w.CW=!1
w.P(0,null)
return w},
aE(d,e){var x,w=this
e.sa_W(0,w.e)
e.si2(D.eE)
e.sLd(0,w.r)
e.sa4a(D.eE)
e.sa4f(w.x)
e.sa_y(w.y)
x=B.cN(d)
if(e.aX!=x){e.aX=x
e.R()}if(e.aF!==C.cC){e.aF=C.cC
e.R()}if(C.k!==e.bh){e.bh=C.k
e.aB()
e.ad()}}}
var z=a.updateTypes([]);(function inheritance(){var x=a.mixinHard,w=a.mixin,v=a.inheritMany,u=a.inherit
v(B.fJ,[A.Hc,A.Hd])
u(A.zh,B.D)
u(A.ix,B.oi)
u(A.Lg,B.w)
u(A.Lh,A.Lg)
u(A.FE,A.Lh)
u(A.Hb,B.d4)
x(A.Lg,B.a8)
w(A.Lh,B.bP)})()
B.cy(b.typeUniverse,JSON.parse('{"ix":{"dN":[],"dO":["w"],"bO":[]},"Hc":{"I":[]},"Hd":{"I":[]},"FE":{"bP":["w","ix"],"w":[],"a8":["w","ix"],"r":[],"A":[],"a_":[],"a8.1":"ix","bP.1":"ix","a8.0":"w"},"Hb":{"d4":[],"a4":[],"h":[]}}'))
var y={a:B.Q("a2"),l:B.Q("l<zh>"),e:B.Q("ix")};(function constants(){D.eE=new A.Hc(0,"start")
D.vh=new A.Hd(0,"start")})()}
$__dart_deferred_initializers__["gXXHI6xPqc5g6CGjUWU8j4WoV1E="] = $__dart_deferred_initializers__.current
