self.$__dart_deferred_initializers__=self.$__dart_deferred_initializers__||Object.create(null)
$__dart_deferred_initializers__.current=function(a,b,c,$){var A={
yC(d,e,f,g){return new A.Ic(g,f,e,!1,d,null)},
Ic:function Ic(d,e,f,g,h,i){var _=this
_.c=d
_.e=e
_.f=f
_.r=g
_.x=h
_.a=i},
a1A:function a1A(d,e,f){this.a=d
this.b=e
this.c=f},
tV:function tV(d,e,f,g,h){var _=this
_.e=d
_.f=e
_.r=f
_.c=g
_.a=h},
Od:function Od(d,e){var _=this
_.d=_.c=_.b=_.a=_.cx=_.ch=_.p3=null
_.e=$
_.f=d
_.r=null
_.w=e
_.z=_.y=null
_.Q=!1
_.as=!0
_.ay=_.ax=_.at=!1},
Bh:function Bh(d,e,f,g,h,i){var _=this
_.l=d
_.t=e
_.V=f
_.ar=g
_.l$=h
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
aaN:function aaN(d,e){this.a=d
this.b=e},
aaM:function aaM(d,e){this.a=d
this.b=e},
CD:function CD(){},
Q2:function Q2(){},
Q3:function Q3(){}},D,B,E,C
A=a.updateHolder(c[32],A)
D=c[35]
B=c[0]
E=c[36]
C=c[2]
A.Ic.prototype={
F(d,e){var x,w,v,u=this,t=null,s={},r=D.amG(e,u.c,!1),q=u.x
s.a=q
x=u.e
if(x!=null)s.a=new B.ct(x,q,t)
x=u.r
w=x?B.iP(e):u.f
v=E.afR(r,w,C.a6,!1,t,t,t,t,new A.a1A(s,u,r))
return x&&w!=null?D.ajL(v):v}}
A.tV.prototype={
aD(d){var x=new A.Bh(this.e,this.f,this.r,B.ad(),null,B.ad())
x.gal()
x.CW=!0
x.sb0(null)
return x},
aG(d,e){var x
e.sda(this.e)
e.sex(0,this.f)
x=this.r
if(x!==e.V){e.V=x
e.aF()
e.ai()}},
bw(d){return new A.Od(this,C.Q)}}
A.Od.prototype={}
A.Bh.prototype={
sda(d){if(d===this.l)return
this.l=d
this.P()},
sex(d,e){var x=this,w=x.t
if(e===w)return
if(x.b!=null)w.I(0,x.grf())
x.t=e
if(x.b!=null)e.a_(0,x.grf())
x.P()},
XR(){this.aF()
this.ai()},
du(d){if(!(d.e instanceof B.bR))d.e=new B.bR()},
af(d){this.Ri(d)
this.t.a_(0,this.grf())},
aa(d){this.t.I(0,this.grf())
this.Rj(0)},
gal(){return!0},
ga0k(){switch(B.bf(this.l).a){case 0:return this.k1.a
case 1:return this.k1.b}},
gYy(){var x=this,w=x.l$
if(w==null)return 0
switch(B.bf(x.l).a){case 0:return Math.max(0,w.k1.a-x.k1.a)
case 1:return Math.max(0,w.k1.b-x.k1.b)}},
F7(d){switch(B.bf(this.l).a){case 0:return new B.a_(0,1/0,d.c,d.d)
case 1:return new B.a_(d.a,d.b,0,1/0)}},
aV(d){var x=this.l$
if(x!=null)return x.a1(C.G,d,x.gaO())
return 0},
aU(d){var x=this.l$
if(x!=null)return x.a1(C.M,d,x.gaZ())
return 0},
aN(d){var x=this.l$
if(x!=null)return x.a1(C.a2,d,x.gbc())
return 0},
aT(d){var x=this.l$
if(x!=null)return x.a1(C.aG,d,x.gbv())
return 0},
bW(d){var x=this.l$
if(x==null)return new B.L(C.h.E(0,d.a,d.b),C.h.E(0,d.c,d.d))
return d.aW(x.fk(this.F7(d)))},
by(){var x=this,w=y.a.a(B.t.prototype.ga2.call(x)),v=x.l$
if(v==null)x.k1=new B.L(C.h.E(0,w.a,w.b),C.h.E(0,w.c,w.d))
else{v.c_(0,x.F7(w),!0)
v=x.l$.k1
v.toString
x.k1=w.aW(v)}x.t.t_(x.ga0k())
x.t.rZ(0,x.gYy())},
o_(d){var x=this
switch(x.l.a){case 0:return new B.j(0,d-x.l$.k1.b+x.k1.b)
case 2:return new B.j(0,-d)
case 3:return new B.j(d-x.l$.k1.a+x.k1.a,0)
case 1:return new B.j(-d,0)}},
Hg(d){var x,w,v,u,t=d.a
if(!(t<0)){x=d.b
if(!(x<0)){w=this.l$.k1
v=w.a
u=this.k1
t=t+v>u.a||x+w.b>u.b}else t=!0}else t=!0
return t},
ao(d,e){var x,w,v,u,t=this
if(t.l$!=null){x=t.t.as
x.toString
x=t.o_(x)
w=new A.aaN(t,x)
x=t.Hg(x)&&t.V!==C.k
v=t.ar
if(x){x=B.a(t.CW,"_needsCompositing")
u=t.k1
v.saB(0,d.jR(x,e,new B.w(0,0,0+u.a,0+u.b),w,t.V,v.a))}else{v.saB(0,null)
w.$2(d,e)}}},
m(d){this.ar.saB(0,null)
this.kd(0)},
cM(d,e){var x=this.t.as
x.toString
x=this.o_(x)
e.aE(0,x.a,x.b)},
iF(d){var x=this,w=x.t.as
w.toString
w=x.o_(w)
if(x.Hg(w)){w=x.k1
return new B.w(0,0,0+w.a,0+w.b)}return null},
ca(d,e){var x,w=this
if(w.l$!=null){x=w.t.as
x.toString
return d.iB(new A.aaM(w,e),w.o_(x),e)}return!1},
l7(d,e,f){var x,w,v,u,t,s,r,q=this
if(f==null)f=d.gi7()
if(!(d instanceof B.v)){x=q.t.as
x.toString
return new E.lN(x,f)}w=B.lt(d.cL(0,q.l$),f)
x=q.l$.k1
x.toString
switch(q.l.a){case 0:v=q.k1.b
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
return new E.lN(r,w.c0(q.o_(r)))},
di(d,e,f,g){var x=this
if(!x.t.f.gks())return x.qG(d,e,f,g)
x.qG(d,null,f,D.ak1(d,e,f,x.t,g,x))},
no(){return this.di(C.aC,null,C.u,null)},
ka(d){return this.di(C.aC,null,C.u,d)},
ll(d,e,f){return this.di(d,null,e,f)},
kb(d,e){return this.di(C.aC,d,C.u,e)},
zH(d){var x
switch(B.bf(this.l).a){case 1:x=this.k1
return new B.w(0,-250,0+x.a,0+x.b+250)
case 0:x=this.k1
return new B.w(-250,0,0+x.a+250,0+x.b)}},
$iHk:1}
A.CD.prototype={
af(d){var x
this.dk(d)
x=this.l$
if(x!=null)x.af(d)},
aa(d){var x
this.d_(0)
x=this.l$
if(x!=null)x.aa(0)}}
A.Q2.prototype={}
A.Q3.prototype={}
var z=a.updateTypes(["A(A)","tV(I,fC)","~()","~({curve:ek,descendant:t?,duration:aG,rect:w?})"])
A.a1A.prototype={
$2(d,e){return new A.tV(this.c,e,C.ap,this.a.a,null)},
$S:z+1}
A.aaN.prototype={
$2(d,e){var x=this.a.l$
x.toString
d.cI(x,e.O(0,this.b))},
$S:24}
A.aaM.prototype={
$2(d,e){return this.a.l$.bt(d,e)},
$S:8};(function aliases(){var x=A.CD.prototype
x.Ri=x.af
x.Rj=x.aa})();(function installTearOffs(){var x=a._instance_0u,w=a._instance_1u,v=a.installInstanceTearOff
var u
x(u=A.Bh.prototype,"grf","XR",2)
w(u,"gaO","aV",0)
w(u,"gaZ","aU",0)
w(u,"gbc","aN",0)
w(u,"gbv","aT",0)
v(u,"gnn",0,0,null,["$4$curve$descendant$duration$rect","$0","$1$rect","$3$curve$duration$rect","$2$descendant$rect"],["di","no","ka","ll","kb"],3,0,0)})();(function inheritance(){var x=a.mixinHard,w=a.mixin,v=a.inherit,u=a.inheritMany
v(A.Ic,B.Z)
u(B.dy,[A.a1A,A.aaN,A.aaM])
v(A.tV,B.aJ)
v(A.Q2,B.rd)
v(A.Q3,A.Q2)
v(A.Od,A.Q3)
v(A.CD,B.v)
v(A.Bh,A.CD)
x(A.CD,B.az)
w(A.Q2,B.Ge)
w(A.Q3,D.a5q)})()
B.bD(b.typeUniverse,JSON.parse('{"tV":{"aJ":[],"ac":[],"h":[]},"Ic":{"Z":[],"h":[]},"Od":{"b5":[],"a4":[],"I":[]},"Bh":{"v":[],"az":["v"],"Hk":[],"t":[],"G":[],"Y":[]}}'))
var y={a:B.F("a_")}}
$__dart_deferred_initializers__["b8MqtPhSCQEaUP1J4+pPvwobBpA="] = $__dart_deferred_initializers__.current
