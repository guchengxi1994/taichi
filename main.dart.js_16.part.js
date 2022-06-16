self.$__dart_deferred_initializers__=self.$__dart_deferred_initializers__||Object.create(null)
$__dart_deferred_initializers__.current=function(a,b,c,$){var A={
ae7(d,e){return new A.G9(e,!1,d,null)},
G9:function G9(d,e,f,g){var _=this
_.f=d
_.r=e
_.x=f
_.a=g},
YQ:function YQ(d,e,f){this.a=d
this.b=e
this.c=f},
rp:function rp(d,e,f,g,h){var _=this
_.e=d
_.f=e
_.r=f
_.c=g
_.a=h},
LM:function LM(d,e){var _=this
_.d=_.c=_.b=_.a=_.cx=_.ch=_.p3=null
_.e=$
_.f=d
_.r=null
_.w=e
_.z=_.y=null
_.Q=!1
_.as=!0
_.ay=_.ax=_.at=!1},
zd:function zd(d,e,f,g,h,i){var _=this
_.n=d
_.t=e
_.a3=f
_.al=g
_.n$=h
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
_.ay=i
_.ch=!1
_.CW=$
_.cx=!0
_.cy=null
_.db=!0
_.dx=null
_.a=0
_.c=_.b=null},
a5n:function a5n(d,e){this.a=d
this.b=e},
a5m:function a5m(d,e){this.a=d
this.b=e},
Az:function Az(){},
Nr:function Nr(){},
Ns:function Ns(){}},D,C,B,E
A=a.updateHolder(c[16],A)
D=c[21]
C=c[2]
B=c[0]
E=c[24]
A.G9.prototype={
F(d,e){var x,w,v,u=this,t=null,s={},r=D.agp(e,C.aC,!1)
s.a=u.x
x=u.r
w=x?B.ib(e):u.f
v=E.aa3(r,w,C.ap,!1,t,t,t,t,new A.YQ(s,u,r))
return x&&w!=null?D.adA(v):v}}
A.rp.prototype={
aC(d){var x=new A.zd(this.e,this.f,this.r,B.a3(),null,B.a3())
x.gaf()
x.CW=!0
x.saP(null)
return x},
aE(d,e){var x
e.scJ(this.e)
e.se8(0,this.f)
x=this.r
if(x!==e.a3){e.a3=x
e.aB()
e.ad()}},
bk(d){return new A.LM(this,C.I)}}
A.LM.prototype={}
A.zd.prototype={
scJ(d){if(d===this.n)return
this.n=d
this.R()},
se8(d,e){var x=this,w=x.t
if(e===w)return
if(x.b!=null)w.J(0,x.gq0())
x.t=e
if(x.b!=null)e.a_(0,x.gq0())
x.R()},
Ur(){this.aB()
this.ad()},
dY(d){if(!(d.e instanceof B.bO))d.e=new B.bO()},
a9(d){this.Ok(d)
this.t.a_(0,this.gq0())},
a0(d){this.t.J(0,this.gq0())
this.Ol(0)},
gaf(){return!0},
gXF(){switch(B.ba(this.n).a){case 0:return this.k1.a
case 1:return this.k1.b}},
gV1(){var x=this,w=x.n$
if(w==null)return 0
switch(B.ba(x.n).a){case 0:return Math.max(0,w.k1.a-x.k1.a)
case 1:return Math.max(0,w.k1.b-x.k1.b)}},
CZ(d){switch(B.ba(this.n).a){case 0:return new B.a2(0,1/0,d.c,d.d)
case 1:return new B.a2(d.a,d.b,0,1/0)}},
bM(d){var x=this.n$
if(x==null)return new B.M(C.i.E(0,d.a,d.b),C.i.E(0,d.c,d.d))
return d.bc(x.h8(this.CZ(d)))},
br(){var x=this,w=y.a.a(B.r.prototype.gZ.call(x)),v=x.n$
if(v==null)x.k1=new B.M(C.i.E(0,w.a,w.b),C.i.E(0,w.c,w.d))
else{v.bT(0,x.CZ(w),!0)
v=x.n$.k1
v.toString
x.k1=w.bc(v)}x.t.qH(x.gXF())
x.t.qG(0,x.gV1())},
n4(d){var x=this
switch(x.n.a){case 0:return new B.k(0,d-x.n$.k1.b+x.k1.b)
case 2:return new B.k(0,-d)
case 3:return new B.k(d-x.n$.k1.a+x.k1.a,0)
case 1:return new B.k(-d,0)}},
EX(d){var x,w,v,u,t=d.a
if(!(t<0)){x=d.b
if(!(x<0)){w=this.n$.k1
v=w.a
u=this.k1
t=t+v>u.a||x+w.b>u.b}else t=!0}else t=!0
return t},
ao(d,e){var x,w,v,u,t=this
if(t.n$!=null){x=t.t.as
x.toString
x=t.n4(x)
w=new A.a5n(t,x)
x=t.EX(x)&&t.a3!==C.k
v=t.al
if(x){x=B.a(t.CW,"_needsCompositing")
u=t.k1
v.san(0,d.jn(x,e,new B.v(0,0,0+u.a,0+u.b),w,t.a3,v.a))}else{v.san(0,null)
w.$2(d,e)}}},
l(d){this.al.san(0,null)
this.jG(0)},
cI(d,e){var x=this.t.as
x.toString
x=this.n4(x)
e.ar(0,x.a,x.b)},
i6(d){var x=this,w=x.t.as
w.toString
w=x.n4(w)
if(x.EX(w)){w=x.k1
return new B.v(0,0,0+w.a,0+w.b)}return null},
c0(d,e){var x,w=this
if(w.n$!=null){x=w.t.as
x.toString
return d.iZ(new A.a5m(w,e),w.n4(x),e)}return!1},
ky(d,e,f){var x,w,v,u,t,s,r,q=this
if(f==null)f=d.ghI()
if(!(d instanceof B.w)){x=q.t.as
x.toString
return new E.mS(x,f)}w=B.kw(d.cu(0,q.n$),f)
x=q.n$.k1
x.toString
switch(q.n.a){case 0:v=q.k1.b
u=w.d
t=x.b-u
s=u-w.b
break
case 1:v=q.k1.a
t=w.a
s=w.c-t
break
case 2:v=q.k1.b
t=w.b
s=w.d-t
break
case 3:v=q.k1.a
u=w.c
t=x.a-u
s=u-w.a
break
default:t=null
s=null
v=null}r=t-(v-s)*e
return new E.mS(r,w.bO(q.n4(r)))},
cU(d,e,f,g){this.B9(d,null,f,D.adQ(d,e,f,this.t,g,this))},
mt(){return this.cU(C.aE,null,C.u,null)},
jC(d){return this.cU(C.aE,null,C.u,d)},
kJ(d,e,f){return this.cU(d,null,e,f)},
jD(d,e){return this.cU(C.aE,d,C.u,e)},
xK(d){var x
switch(B.ba(this.n).a){case 1:x=this.k1
return new B.v(0,-250,0+x.a,0+x.b+250)
case 0:x=this.k1
return new B.v(-250,0,0+x.a+250,0+x.b)}},
$iF5:1}
A.Az.prototype={
a9(d){var x
this.d3(d)
x=this.n$
if(x!=null)x.a9(d)},
a0(d){var x
this.cF(0)
x=this.n$
if(x!=null)x.a0(0)}}
A.Nr.prototype={}
A.Ns.prototype={}
var z=a.updateTypes(["rp(K,f2)","~()","~({curve:dP,descendant:r?,duration:aI,rect:v?})"])
A.YQ.prototype={
$2(d,e){return new A.rp(this.c,e,C.au,this.a.a,null)},
$S:z+0}
A.a5n.prototype={
$2(d,e){var x=this.a.n$
x.toString
d.ct(x,e.O(0,this.b))},
$S:17}
A.a5m.prototype={
$2(d,e){return this.a.n$.bl(d,e)},
$S:7};(function aliases(){var x=A.Az.prototype
x.Ok=x.a9
x.Ol=x.a0})();(function installTearOffs(){var x=a._instance_0u,w=a.installInstanceTearOff
var v
x(v=A.zd.prototype,"gq0","Ur",1)
w(v,"gms",0,0,null,["$4$curve$descendant$duration$rect","$0","$1$rect","$3$curve$duration$rect","$2$descendant$rect"],["cU","mt","jC","kJ","jD"],2,0,0)})();(function inheritance(){var x=a.mixinHard,w=a.mixin,v=a.inherit,u=a.inheritMany
v(A.G9,B.a1)
u(B.fb,[A.YQ,A.a5n,A.a5m])
v(A.rp,B.aH)
v(A.Nr,B.pM)
v(A.Ns,A.Nr)
v(A.LM,A.Ns)
v(A.Az,B.w)
v(A.zd,A.Az)
x(A.Az,B.at)
w(A.Nr,B.E7)
w(A.Ns,D.a1q)})()
B.cy(b.typeUniverse,JSON.parse('{"rp":{"aH":[],"a4":[],"h":[]},"G9":{"a1":[],"h":[]},"LM":{"b9":[],"a9":[],"K":[]},"zd":{"w":[],"at":["w"],"F5":[],"r":[],"A":[],"a_":[]}}'))
var y={a:B.Q("a2")}}
$__dart_deferred_initializers__["oHP8EJoNFtctWM7gkJW7gFpWS6I="] = $__dart_deferred_initializers__.current
