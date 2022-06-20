self.$__dart_deferred_initializers__=self.$__dart_deferred_initializers__||Object.create(null)
$__dart_deferred_initializers__.current=function(a,b,c,$){var A={
a0u(d,e,f){return new A.Hr(f,e,!1,d,null)},
Hr:function Hr(d,e,f,g,h){var _=this
_.e=d
_.f=e
_.r=f
_.x=g
_.a=h},
a0v:function a0v(d,e,f){this.a=d
this.b=e
this.c=f},
tt:function tt(d,e,f,g,h){var _=this
_.e=d
_.f=e
_.r=f
_.c=g
_.a=h},
Nq:function Nq(d,e){var _=this
_.d=_.c=_.b=_.a=_.cx=_.ch=_.p3=null
_.e=$
_.f=d
_.r=null
_.w=e
_.z=_.y=null
_.Q=!1
_.as=!0
_.ay=_.ax=_.at=!1},
Ao:function Ao(d,e,f,g,h,i){var _=this
_.p=d
_.t=e
_.a8=f
_.aq=g
_.p$=h
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
a9p:function a9p(d,e){this.a=d
this.b=e},
a9o:function a9o(d,e){this.a=d
this.b=e},
BK:function BK(){},
Pc:function Pc(){},
Pd:function Pd(){}},D,C,B,E
A=a.updateHolder(c[27],A)
D=c[33]
C=c[2]
B=c[0]
E=c[34]
A.Hr.prototype={
E(d,e){var x,w,v,u=this,t=null,s={},r=D.al0(e,C.ar,!1),q=u.x
s.a=q
x=u.e
if(x!=null)s.a=new B.cx(x,q,t)
x=u.r
w=x?B.iB(e):u.f
v=E.aef(r,w,C.Z,!1,t,t,t,t,new A.a0v(s,u,r))
return x&&w!=null?D.ai6(v):v}}
A.tt.prototype={
aC(d){var x=new A.Ao(this.e,this.f,this.r,B.a8(),null,B.a8())
x.gak()
x.CW=!0
x.saR(null)
return x},
aF(d,e){var x
e.scT(this.e)
e.sej(0,this.f)
x=this.r
if(x!==e.a8){e.a8=x
e.aE()
e.ah()}},
bq(d){return new A.Nq(this,C.O)}}
A.Nq.prototype={}
A.Ao.prototype={
scT(d){if(d===this.p)return
this.p=d
this.S()},
sej(d,e){var x=this,w=x.t
if(e===w)return
if(x.b!=null)w.K(0,x.gqP())
x.t=e
if(x.b!=null)e.a1(0,x.gqP())
x.S()},
Wr(){this.aE()
this.ah()},
dR(d){if(!(d.e instanceof B.bU))d.e=new B.bU()},
ad(d){this.Q6(d)
this.t.a1(0,this.gqP())},
a5(d){this.t.K(0,this.gqP())
this.Q7(0)},
gak(){return!0},
gZT(){switch(B.be(this.p).a){case 0:return this.k1.a
case 1:return this.k1.b}},
gX7(){var x=this,w=x.p$
if(w==null)return 0
switch(B.be(x.p).a){case 0:return Math.max(0,w.k1.a-x.k1.a)
case 1:return Math.max(0,w.k1.b-x.k1.b)}},
Ef(d){switch(B.be(this.p).a){case 0:return new B.a7(0,1/0,d.c,d.d)
case 1:return new B.a7(d.a,d.b,0,1/0)}},
bO(d){var x=this.p$
if(x==null)return new B.N(C.h.F(0,d.a,d.b),C.h.F(0,d.c,d.d))
return d.bc(x.hk(this.Ef(d)))},
bp(){var x=this,w=y.a.a(B.t.prototype.ga_.call(x)),v=x.p$
if(v==null)x.k1=new B.N(C.h.F(0,w.a,w.b),C.h.F(0,w.c,w.d))
else{v.bZ(0,x.Ef(w),!0)
v=x.p$.k1
v.toString
x.k1=w.bc(v)}x.t.rz(x.gZT())
x.t.rw(0,x.gX7())},
nC(d){var x=this
switch(x.p.a){case 0:return new B.j(0,d-x.p$.k1.b+x.k1.b)
case 2:return new B.j(0,-d)
case 3:return new B.j(d-x.p$.k1.a+x.k1.a,0)
case 1:return new B.j(-d,0)}},
Gj(d){var x,w,v,u,t=d.a
if(!(t<0)){x=d.b
if(!(x<0)){w=this.p$.k1
v=w.a
u=this.k1
t=t+v>u.a||x+w.b>u.b}else t=!0}else t=!0
return t},
av(d,e){var x,w,v,u,t=this
if(t.p$!=null){x=t.t.as
x.toString
x=t.nC(x)
w=new A.a9p(t,x)
x=t.Gj(x)&&t.a8!==C.k
v=t.aq
if(x){x=B.a(t.CW,"_needsCompositing")
u=t.k1
v.sau(0,d.jB(x,e,new B.v(0,0,0+u.a,0+u.b),w,t.a8,v.a))}else{v.sau(0,null)
w.$2(d,e)}}},
l(d){this.aq.sau(0,null)
this.jT(0)},
cS(d,e){var x=this.t.as
x.toString
x=this.nC(x)
e.aB(0,x.a,x.b)},
iq(d){var x=this,w=x.t.as
w.toString
w=x.nC(w)
if(x.Gj(w)){w=x.k1
return new B.v(0,0,0+w.a,0+w.b)}return null},
c5(d,e){var x,w=this
if(w.p$!=null){x=w.t.as
x.toString
return d.jb(new A.a9o(w,e),w.nC(x),e)}return!1},
kP(d,e,f){var x,w,v,u,t,s,r,q=this
if(f==null)f=d.ghX()
if(!(d instanceof B.w)){x=q.t.as
x.toString
return new E.ls(x,f)}w=B.l6(d.ct(0,q.p$),f)
x=q.p$.k1
x.toString
switch(q.p.a){case 0:v=q.k1.b
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
return new E.ls(r,w.bS(q.nC(r)))},
d1(d,e,f,g){var x=this
if(!x.t.f.gkc())return x.qg(d,e,f,g)
x.qg(d,null,f,D.aim(d,e,f,x.t,g,x))},
n2(){return this.d1(C.aw,null,C.u,null)},
jQ(d){return this.d1(C.aw,null,C.u,d)},
l1(d,e,f){return this.d1(d,null,e,f)},
jR(d,e){return this.d1(C.aw,d,C.u,e)},
yY(d){var x
switch(B.be(this.p).a){case 1:x=this.k1
return new B.v(0,-250,0+x.a,0+x.b+250)
case 0:x=this.k1
return new B.v(-250,0,0+x.a+250,0+x.b)}},
$iGo:1}
A.BK.prototype={
ad(d){var x
this.da(d)
x=this.p$
if(x!=null)x.ad(d)},
a5(d){var x
this.cQ(0)
x=this.p$
if(x!=null)x.a5(0)}}
A.Pc.prototype={}
A.Pd.prototype={}
var z=a.updateTypes(["tt(H,fv)","~()","~({curve:ed,descendant:t?,duration:aB,rect:v?})"])
A.a0v.prototype={
$2(d,e){return new A.tt(this.c,e,C.ai,this.a.a,null)},
$S:z+0}
A.a9p.prototype={
$2(d,e){var x=this.a.p$
x.toString
d.cE(x,e.O(0,this.b))},
$S:18}
A.a9o.prototype={
$2(d,e){return this.a.p$.bl(d,e)},
$S:7};(function aliases(){var x=A.BK.prototype
x.Q6=x.ad
x.Q7=x.a5})();(function installTearOffs(){var x=a._instance_0u,w=a.installInstanceTearOff
var v
x(v=A.Ao.prototype,"gqP","Wr",1)
w(v,"gn1",0,0,null,["$4$curve$descendant$duration$rect","$0","$1$rect","$3$curve$duration$rect","$2$descendant$rect"],["d1","n2","jQ","l1","jR"],2,0,0)})();(function inheritance(){var x=a.mixinHard,w=a.mixin,v=a.inherit,u=a.inheritMany
v(A.Hr,B.a0)
u(B.dK,[A.a0v,A.a9p,A.a9o])
v(A.tt,B.aH)
v(A.Pc,B.qN)
v(A.Pd,A.Pc)
v(A.Nq,A.Pd)
v(A.BK,B.w)
v(A.Ao,A.BK)
x(A.BK,B.ay)
w(A.Pc,B.Fh)
w(A.Pd,D.a4e)})()
B.bE(b.typeUniverse,JSON.parse('{"tt":{"aH":[],"a9":[],"h":[]},"Hr":{"a0":[],"h":[]},"Nq":{"bd":[],"am":[],"H":[]},"Ao":{"w":[],"ay":["w"],"Go":[],"t":[],"F":[],"Y":[]}}'))
var y={a:B.E("a7")}}
$__dart_deferred_initializers__["gYPSLp2nwAxpHWY7fxhvg9jQ+/w="] = $__dart_deferred_initializers__.current
