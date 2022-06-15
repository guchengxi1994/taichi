self.$__dart_deferred_initializers__=self.$__dart_deferred_initializers__||Object.create(null)
$__dart_deferred_initializers__.current=function(a,b,c,$){var A={
aeh(d,e){return new A.Ge(e,!1,d,null)},
Ge:function Ge(d,e,f,g){var _=this
_.f=d
_.r=e
_.x=f
_.a=g},
Z_:function Z_(d,e,f){this.a=d
this.b=e
this.c=f},
rs:function rs(d,e,f,g,h){var _=this
_.e=d
_.f=e
_.r=f
_.c=g
_.a=h},
LS:function LS(d,e){var _=this
_.d=_.c=_.b=_.a=_.cx=_.ch=_.p3=null
_.e=$
_.f=d
_.r=null
_.w=e
_.z=_.y=null
_.Q=!1
_.as=!0
_.ay=_.ax=_.at=!1},
zg:function zg(d,e,f,g,h,i){var _=this
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
a5z:function a5z(d,e){this.a=d
this.b=e},
a5y:function a5y(d,e){this.a=d
this.b=e},
AC:function AC(){},
Nx:function Nx(){},
Ny:function Ny(){}},D,C,B,E
A=a.updateHolder(c[16],A)
D=c[21]
C=c[2]
B=c[0]
E=c[24]
A.Ge.prototype={
G(d,e){var x,w,v,u=this,t=null,s={},r=D.agA(e,C.aC,!1)
s.a=u.x
x=u.r
w=x?B.ic(e):u.f
v=E.aae(r,w,C.am,!1,t,t,t,t,new A.Z_(s,u,r))
return x&&w!=null?D.adK(v):v}}
A.rs.prototype={
aC(d){var x=new A.zg(this.e,this.f,this.r,B.a2(),null,B.a2())
x.gaf()
x.CW=!0
x.saP(null)
return x},
aE(d,e){var x
e.scK(this.e)
e.se9(0,this.f)
x=this.r
if(x!==e.a3){e.a3=x
e.aA()
e.ae()}},
bk(d){return new A.LS(this,C.I)}}
A.LS.prototype={}
A.zg.prototype={
scK(d){if(d===this.n)return
this.n=d
this.R()},
se9(d,e){var x=this,w=x.t
if(e===w)return
if(x.b!=null)w.J(0,x.gq4())
x.t=e
if(x.b!=null)e.a_(0,x.gq4())
x.R()},
Uv(){this.aA()
this.ae()},
dY(d){if(!(d.e instanceof B.bN))d.e=new B.bN()},
a8(d){this.Ok(d)
this.t.a_(0,this.gq4())},
a0(d){this.t.J(0,this.gq4())
this.Ol(0)},
gaf(){return!0},
gXK(){switch(B.b9(this.n).a){case 0:return this.k1.a
case 1:return this.k1.b}},
gV5(){var x=this,w=x.n$
if(w==null)return 0
switch(B.b9(x.n).a){case 0:return Math.max(0,w.k1.a-x.k1.a)
case 1:return Math.max(0,w.k1.b-x.k1.b)}},
CX(d){switch(B.b9(this.n).a){case 0:return new B.a1(0,1/0,d.c,d.d)
case 1:return new B.a1(d.a,d.b,0,1/0)}},
bM(d){var x=this.n$
if(x==null)return new B.M(C.i.E(0,d.a,d.b),C.i.E(0,d.c,d.d))
return d.bb(x.hb(this.CX(d)))},
br(){var x=this,w=y.a.a(B.r.prototype.gY.call(x)),v=x.n$
if(v==null)x.k1=new B.M(C.i.E(0,w.a,w.b),C.i.E(0,w.c,w.d))
else{v.bS(0,x.CX(w),!0)
v=x.n$.k1
v.toString
x.k1=w.bb(v)}x.t.qJ(x.gXK())
x.t.qI(0,x.gV5())},
n6(d){var x=this
switch(x.n.a){case 0:return new B.k(0,d-x.n$.k1.b+x.k1.b)
case 2:return new B.k(0,-d)
case 3:return new B.k(d-x.n$.k1.a+x.k1.a,0)
case 1:return new B.k(-d,0)}},
EV(d){var x,w,v,u,t=d.a
if(!(t<0)){x=d.b
if(!(x<0)){w=this.n$.k1
v=w.a
u=this.k1
t=t+v>u.a||x+w.b>u.b}else t=!0}else t=!0
return t},
ar(d,e){var x,w,v,u,t=this
if(t.n$!=null){x=t.t.as
x.toString
x=t.n6(x)
w=new A.a5z(t,x)
x=t.EV(x)&&t.a3!==C.k
v=t.al
if(x){x=B.a(t.CW,"_needsCompositing")
u=t.k1
v.san(0,d.jm(x,e,new B.v(0,0,0+u.a,0+u.b),w,t.a3,v.a))}else{v.san(0,null)
w.$2(d,e)}}},
l(d){this.al.san(0,null)
this.jF(0)},
cJ(d,e){var x=this.t.as
x.toString
x=this.n6(x)
e.aB(0,x.a,x.b)},
i9(d){var x=this,w=x.t.as
w.toString
w=x.n6(w)
if(x.EV(w)){w=x.k1
return new B.v(0,0,0+w.a,0+w.b)}return null},
c_(d,e){var x,w=this
if(w.n$!=null){x=w.t.as
x.toString
return d.j_(new A.a5y(w,e),w.n6(x),e)}return!1},
kx(d,e,f){var x,w,v,u,t,s,r,q=this
if(f==null)f=d.ghJ()
if(!(d instanceof B.w)){x=q.t.as
x.toString
return new E.mU(x,f)}w=B.kz(d.cu(0,q.n$),f)
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
return new E.mU(r,w.bP(q.n6(r)))},
cW(d,e,f,g){this.B5(d,null,f,D.ae_(d,e,f,this.t,g,this))},
mx(){return this.cW(C.aE,null,C.u,null)},
jB(d){return this.cW(C.aE,null,C.u,d)},
kI(d,e,f){return this.cW(d,null,e,f)},
jC(d,e){return this.cW(C.aE,d,C.u,e)},
xI(d){var x
switch(B.b9(this.n).a){case 1:x=this.k1
return new B.v(0,-250,0+x.a,0+x.b+250)
case 0:x=this.k1
return new B.v(-250,0,0+x.a+250,0+x.b)}},
$iFa:1}
A.AC.prototype={
a8(d){var x
this.d3(d)
x=this.n$
if(x!=null)x.a8(d)},
a0(d){var x
this.cG(0)
x=this.n$
if(x!=null)x.a0(0)}}
A.Nx.prototype={}
A.Ny.prototype={}
var z=a.updateTypes(["rs(K,f3)","~()","~({curve:dP,descendant:r?,duration:aH,rect:v?})"])
A.Z_.prototype={
$2(d,e){return new A.rs(this.c,e,C.au,this.a.a,null)},
$S:z+0}
A.a5z.prototype={
$2(d,e){var x=this.a.n$
x.toString
d.ct(x,e.O(0,this.b))},
$S:19}
A.a5y.prototype={
$2(d,e){return this.a.n$.bl(d,e)},
$S:7};(function aliases(){var x=A.AC.prototype
x.Ok=x.a8
x.Ol=x.a0})();(function installTearOffs(){var x=a._instance_0u,w=a.installInstanceTearOff
var v
x(v=A.zg.prototype,"gq4","Uv",1)
w(v,"gmw",0,0,null,["$4$curve$descendant$duration$rect","$0","$1$rect","$3$curve$duration$rect","$2$descendant$rect"],["cW","mx","jB","kI","jC"],2,0,0)})();(function inheritance(){var x=a.mixinHard,w=a.mixin,v=a.inherit,u=a.inheritMany
v(A.Ge,B.a4)
u(B.fb,[A.Z_,A.a5z,A.a5y])
v(A.rs,B.aG)
v(A.Nx,B.pP)
v(A.Ny,A.Nx)
v(A.LS,A.Ny)
v(A.AC,B.w)
v(A.zg,A.AC)
x(A.AC,B.au)
w(A.Nx,B.Ea)
w(A.Ny,D.a1A)})()
B.cy(b.typeUniverse,JSON.parse('{"rs":{"aG":[],"a3":[],"h":[]},"Ge":{"a4":[],"h":[]},"LS":{"b8":[],"aa":[],"K":[]},"zg":{"w":[],"au":["w"],"Fa":[],"r":[],"B":[],"a_":[]}}'))
var y={a:B.R("a1")}}
$__dart_deferred_initializers__["kHwPOewv7l26Xii/rwN5Kzfgx8M="] = $__dart_deferred_initializers__.current
