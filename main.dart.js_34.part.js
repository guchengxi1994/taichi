self.$__dart_deferred_initializers__=self.$__dart_deferred_initializers__||Object.create(null)
$__dart_deferred_initializers__.current=function(a,b,c,$){var A={Hg:function Hg(d,e){this.a=d
this.b=e},Hh:function Hh(d,e){this.a=d
this.b=e},zj:function zj(d,e,f){this.a=d
this.b=e
this.c=f},iv:function iv(d,e,f){var _=this
_.e=0
_.bZ$=d
_.a1$=e
_.a=f},FI:function FI(d,e,f,g,h,i,j,k,l,m,n,o,p,q){var _=this
_.n=d
_.t=e
_.a9=f
_.a3=g
_.al=h
_.b7=i
_.aX=j
_.aF=k
_.bg=l
_.bF=!1
_.da=m
_.bG$=n
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
_.c=_.b=null},Ll:function Ll(){},Lm:function Lm(){},
aeU(d,e,f,g,h){return new A.Hf(f,h,g,e,d,null)},
Hf:function Hf(d,e,f,g,h,i){var _=this
_.e=d
_.r=e
_.x=f
_.y=g
_.c=h
_.a=i}},C,B,D
A=a.updateHolder(c[19],A)
C=c[2]
B=c[0]
D=c[36]
A.Hg.prototype={
i(d){return"WrapAlignment."+this.b}}
A.Hh.prototype={
i(d){return"WrapCrossAlignment."+this.b}}
A.zj.prototype={}
A.iv.prototype={}
A.FI.prototype={
sa01(d,e){if(this.n===e)return
this.n=e
this.R()},
si5(d){if(this.t===d)return
this.t=d
this.R()},
sLd(d,e){if(this.a9===e)return
this.a9=e
this.R()},
sa4f(d){if(this.a3===d)return
this.a3=d
this.R()},
sa4k(d){if(this.al===d)return
this.al=d
this.R()},
sa_E(d){if(this.b7===d)return
this.b7=d
this.R()},
dY(d){if(!(d.e instanceof A.iv))d.e=new A.iv(null,null,C.j)},
cN(d){return this.xD(d)},
vC(d){switch(this.n.a){case 0:return d.a
case 1:return d.b}},
vB(d){switch(this.n.a){case 0:return d.b
case 1:return d.a}},
S3(d,e){switch(this.n.a){case 0:return new B.k(d,e)
case 1:return new B.k(e,d)}},
RN(d,e,f){var x=e-f
switch(this.b7.a){case 0:return d?x:0
case 1:return d?0:x
case 2:return x/2}},
bM(d){return this.Q1(d)},
Q1(d){var x,w,v,u,t,s,r,q,p,o,n,m,l,k=this
switch(k.n.a){case 0:x=d.b
w=new B.a1(0,x,0,1/0)
break
case 1:x=d.d
w=new B.a1(0,1/0,0,x)
break
default:w=null
x=0}v=k.N$
for(u=B.p(k).j("a6.1"),t=0,s=0,r=0,q=0,p=0;v!=null;){o=B.ac9(v,w)
n=k.vC(o)
m=k.vB(o)
if(p>0&&r+n+k.a9>x){t=Math.max(t,r)
s+=q+k.al
r=0
q=0
p=0}r+=n
q=Math.max(q,m)
if(p>0)r+=k.a9;++p
l=v.e
l.toString
v=u.a(l).a1$}s+=q
t=Math.max(t,r)
switch(k.n.a){case 0:return d.bb(new B.L(t,s))
case 1:return d.bb(new B.L(s,t))}},
br(){var x,w,v,u,t,s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,b0,b1=this,b2=y.a.a(B.r.prototype.gY.call(b1))
b1.bF=!1
x=b1.N$
if(x==null){b1.k1=new B.L(C.i.E(0,b2.a,b2.b),C.i.E(0,b2.c,b2.d))
return}switch(b1.n.a){case 0:w=b2.b
v=new B.a1(0,w,0,1/0)
u=b1.aX===C.M&&!0
t=b1.aF===C.l1&&!0
break
case 1:w=b2.d
v=new B.a1(0,1/0,0,w)
u=b1.aF===C.l1&&!0
t=b1.aX===C.M&&!0
break
default:v=null
w=0
u=!1
t=!1}s=b1.a9
r=b1.al
q=B.b([],y.l)
for(p=y.e,o=0,n=0,m=0,l=0,k=0;x!=null;){x.bS(0,v,!0)
j=x.k1
j.toString
i=b1.vC(j)
j=x.k1
j.toString
h=b1.vB(j)
if(k>0&&m+s+i>w){o=Math.max(o,m)
n+=l
if(q.length!==0)n+=r
q.push(new A.zj(m,l,k))
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
q.push(new A.zj(m,l,k))}g=q.length
switch(b1.n.a){case 0:j=b1.k1=b2.bb(new B.L(o,n))
f=j.a
e=j.b
break
case 1:j=b1.k1=b2.bb(new B.L(n,o))
f=j.b
e=j.a
break
default:f=0
e=0}b1.bF=f<o||e<n
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
i=b1.vC(a9)
a9=x.k1
a9.toString
b0=b1.RN(t,l,b1.vB(a9))
if(u)a8-=i
j.a=b1.S3(a8,a2+b0)
a8=u?a8-a7:a8+(i+a7)
x=j.a1$}a2=t?a2-a1:a2+(l+a1)}},
c_(d,e){return this.ra(d,e)},
ar(d,e){var x,w=this,v=w.bF&&w.bg!==C.k,u=w.da
if(v){v=B.a(w.CW,"_needsCompositing")
x=w.k1
u.san(0,d.jm(v,e,new B.v(0,0,0+x.a,0+x.b),w.gHf(),w.bg,u.a))}else{u.san(0,null)
w.lr(d,e)}},
l(d){this.da.san(0,null)
this.jF(0)}}
A.Ll.prototype={
a8(d){var x,w,v
this.d3(d)
x=this.N$
for(w=y.e;x!=null;){x.a8(d)
v=x.e
v.toString
x=w.a(v).a1$}},
a0(d){var x,w,v
this.cG(0)
x=this.N$
for(w=y.e;x!=null;){x.a0(0)
v=x.e
v.toString
x=w.a(v).a1$}}}
A.Lm.prototype={}
A.Hf.prototype={
aC(d){var x=this,w=B.cM(d)
w=new A.FI(x.e,D.eD,x.r,D.eD,x.x,x.y,w,C.cC,C.k,B.a2(),0,null,null,B.a2())
w.gaf()
w.gav()
w.CW=!1
w.P(0,null)
return w},
aE(d,e){var x,w=this
e.sa01(0,w.e)
e.si5(D.eD)
e.sLd(0,w.r)
e.sa4f(D.eD)
e.sa4k(w.x)
e.sa_E(w.y)
x=B.cM(d)
if(e.aX!=x){e.aX=x
e.R()}if(e.aF!==C.cC){e.aF=C.cC
e.R()}if(C.k!==e.bg){e.bg=C.k
e.aA()
e.ae()}}}
var z=a.updateTypes([]);(function inheritance(){var x=a.mixinHard,w=a.mixin,v=a.inheritMany,u=a.inherit
v(B.fK,[A.Hg,A.Hh])
u(A.zj,B.D)
u(A.iv,B.oj)
u(A.Ll,B.w)
u(A.Lm,A.Ll)
u(A.FI,A.Lm)
u(A.Hf,B.d5)
x(A.Ll,B.a6)
w(A.Lm,B.bO)})()
B.cJ(b.typeUniverse,JSON.parse('{"iv":{"dN":[],"dO":["w"],"bN":[]},"Hg":{"H":[]},"Hh":{"H":[]},"FI":{"bO":["w","iv"],"w":[],"a6":["w","iv"],"r":[],"B":[],"a_":[],"a6.1":"iv","bO.1":"iv","a6.0":"w"},"Hf":{"d5":[],"a3":[],"h":[]}}'))
var y={a:B.R("a1"),l:B.R("l<zj>"),e:B.R("iv")};(function constants(){D.eD=new A.Hg(0,"start")
D.vh=new A.Hh(0,"start")})()}
$__dart_deferred_initializers__["nDvW8AgKKEahHIFWzFd9DY3E2CA="] = $__dart_deferred_initializers__.current
