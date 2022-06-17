self.$__dart_deferred_initializers__=self.$__dart_deferred_initializers__||Object.create(null)
$__dart_deferred_initializers__.current=function(a,b,c,$){var A={
afg(d,e){return new A.Gn(e,!1,d,null)},
Gn:function Gn(d,e,f,g){var _=this
_.f=d
_.r=e
_.x=f
_.a=g},
Zk:function Zk(d,e,f){this.a=d
this.b=e
this.c=f},
rC:function rC(d,e,f,g,h){var _=this
_.e=d
_.f=e
_.r=f
_.c=g
_.a=h},
M5:function M5(d,e){var _=this
_.d=_.c=_.b=_.a=_.cx=_.ch=_.p3=null
_.e=$
_.f=d
_.r=null
_.w=e
_.z=_.y=null
_.Q=!1
_.as=!0
_.ay=_.ax=_.at=!1},
zu:function zu(d,e,f,g,h,i){var _=this
_.m=d
_.t=e
_.a5=f
_.al=g
_.m$=h
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
a6u:function a6u(d,e){this.a=d
this.b=e},
a6t:function a6t(d,e){this.a=d
this.b=e},
AR:function AR(){},
NP:function NP(){},
NQ:function NQ(){}},D,C,B,E
A=a.updateHolder(c[16],A)
D=c[22]
C=c[2]
B=c[0]
E=c[25]
A.Gn.prototype={
F(d,e){var x,w,v,u=this,t=null,s={},r=D.ahA(e,C.aF,!1)
s.a=u.x
x=u.r
w=x?B.ij(e):u.f
v=E.ab9(r,w,C.an,!1,t,t,t,t,new A.Zk(s,u,r))
return x&&w!=null?D.aeJ(v):v}}
A.rC.prototype={
aB(d){var x=new A.zu(this.e,this.f,this.r,B.a3(),null,B.a3())
x.gaf()
x.CW=!0
x.saN(null)
return x},
aE(d,e){var x
e.scL(this.e)
e.seb(0,this.f)
x=this.r
if(x!==e.a5){e.a5=x
e.aC()
e.ae()}},
bn(d){return new A.M5(this,C.J)}}
A.M5.prototype={}
A.zu.prototype={
scL(d){if(d===this.m)return
this.m=d
this.S()},
seb(d,e){var x=this,w=x.t
if(e===w)return
if(x.b!=null)w.J(0,x.gqb())
x.t=e
if(x.b!=null)e.a2(0,x.gqb())
x.S()},
UD(){this.aC()
this.ae()},
e2(d){if(!(d.e instanceof B.bT))d.e=new B.bT()},
aa(d){this.Os(d)
this.t.a2(0,this.gqb())},
a3(d){this.t.J(0,this.gqb())
this.Ot(0)},
gaf(){return!0},
gXU(){switch(B.bb(this.m).a){case 0:return this.k1.a
case 1:return this.k1.b}},
gVf(){var x=this,w=x.m$
if(w==null)return 0
switch(B.bb(x.m).a){case 0:return Math.max(0,w.k1.a-x.k1.a)
case 1:return Math.max(0,w.k1.b-x.k1.b)}},
D9(d){switch(B.bb(this.m).a){case 0:return new B.a1(0,1/0,d.c,d.d)
case 1:return new B.a1(d.a,d.b,0,1/0)}},
bL(d){var x=this.m$
if(x==null)return new B.J(C.i.E(0,d.a,d.b),C.i.E(0,d.c,d.d))
return d.ba(x.hc(this.D9(d)))},
bo(){var x=this,w=y.a.a(B.q.prototype.gY.call(x)),v=x.m$
if(v==null)x.k1=new B.J(C.i.E(0,w.a,w.b),C.i.E(0,w.c,w.d))
else{v.bW(0,x.D9(w),!0)
v=x.m$.k1
v.toString
x.k1=w.ba(v)}x.t.qS(x.gXU())
x.t.qR(0,x.gVf())},
na(d){var x=this
switch(x.m.a){case 0:return new B.k(0,d-x.m$.k1.b+x.k1.b)
case 2:return new B.k(0,-d)
case 3:return new B.k(d-x.m$.k1.a+x.k1.a,0)
case 1:return new B.k(-d,0)}},
F7(d){var x,w,v,u,t=d.a
if(!(t<0)){x=d.b
if(!(x<0)){w=this.m$.k1
v=w.a
u=this.k1
t=t+v>u.a||x+w.b>u.b}else t=!0}else t=!0
return t},
ap(d,e){var x,w,v,u,t=this
if(t.m$!=null){x=t.t.as
x.toString
x=t.na(x)
w=new A.a6u(t,x)
x=t.F7(x)&&t.a5!==C.k
v=t.al
if(x){x=B.a(t.CW,"_needsCompositing")
u=t.k1
v.sao(0,d.jp(x,e,new B.v(0,0,0+u.a,0+u.b),w,t.a5,v.a))}else{v.sao(0,null)
w.$2(d,e)}}},
l(d){this.al.sao(0,null)
this.jI(0)},
cK(d,e){var x=this.t.as
x.toString
x=this.na(x)
e.av(0,x.a,x.b)},
ib(d){var x=this,w=x.t.as
w.toString
w=x.na(w)
if(x.F7(w)){w=x.k1
return new B.v(0,0,0+w.a,0+w.b)}return null},
c3(d,e){var x,w=this
if(w.m$!=null){x=w.t.as
x.toString
return d.j1(new A.a6t(w,e),w.na(x),e)}return!1},
kC(d,e,f){var x,w,v,u,t,s,r,q=this
if(f==null)f=d.ghL()
if(!(d instanceof B.w)){x=q.t.as
x.toString
return new E.n_(x,f)}w=B.kI(d.cw(0,q.m$),f)
x=q.m$.k1
x.toString
switch(q.m.a){case 0:v=q.k1.b
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
return new E.n_(r,w.bQ(q.na(r)))},
cX(d,e,f,g){this.Bh(d,null,f,D.aeZ(d,e,f,this.t,g,this))},
mC(){return this.cX(C.aq,null,C.u,null)},
jE(d){return this.cX(C.aq,null,C.u,d)},
kN(d,e,f){return this.cX(d,null,e,f)},
jF(d,e){return this.cX(C.aq,d,C.u,e)},
xY(d){var x
switch(B.bb(this.m).a){case 1:x=this.k1
return new B.v(0,-250,0+x.a,0+x.b+250)
case 0:x=this.k1
return new B.v(-250,0,0+x.a+250,0+x.b)}},
$iFk:1}
A.AR.prototype={
aa(d){var x
this.d4(d)
x=this.m$
if(x!=null)x.aa(d)},
a3(d){var x
this.cI(0)
x=this.m$
if(x!=null)x.a3(0)}}
A.NP.prototype={}
A.NQ.prototype={}
var z=a.updateTypes(["rC(L,fb)","~()","~({curve:dT,descendant:q?,duration:aA,rect:v?})"])
A.Zk.prototype={
$2(d,e){return new A.rC(this.c,e,C.av,this.a.a,null)},
$S:z+0}
A.a6u.prototype={
$2(d,e){var x=this.a.m$
x.toString
d.cv(x,e.P(0,this.b))},
$S:18}
A.a6t.prototype={
$2(d,e){return this.a.m$.bg(d,e)},
$S:7};(function aliases(){var x=A.AR.prototype
x.Os=x.aa
x.Ot=x.a3})();(function installTearOffs(){var x=a._instance_0u,w=a.installInstanceTearOff
var v
x(v=A.zu.prototype,"gqb","UD",1)
w(v,"gmB",0,0,null,["$4$curve$descendant$duration$rect","$0","$1$rect","$3$curve$duration$rect","$2$descendant$rect"],["cX","mC","jE","kN","jF"],2,0,0)})();(function inheritance(){var x=a.mixinHard,w=a.mixin,v=a.inherit,u=a.inheritMany
v(A.Gn,B.a2)
u(B.eP,[A.Zk,A.a6u,A.a6t])
v(A.rC,B.aF)
v(A.NP,B.q_)
v(A.NQ,A.NP)
v(A.M5,A.NQ)
v(A.AR,B.w)
v(A.zu,A.AR)
x(A.AR,B.au)
w(A.NP,B.Ek)
w(A.NQ,D.a2_)})()
B.cr(b.typeUniverse,JSON.parse('{"rC":{"aF":[],"a4":[],"h":[]},"Gn":{"a2":[],"h":[]},"M5":{"ba":[],"aa":[],"L":[]},"zu":{"w":[],"au":["w"],"Fk":[],"q":[],"D":[],"Z":[]}}'))
var y={a:B.M("a1")}}
$__dart_deferred_initializers__["zB3euOLBpljHMqK8kTZF0er4dEg="] = $__dart_deferred_initializers__.current
