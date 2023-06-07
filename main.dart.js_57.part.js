self.$__dart_deferred_initializers__=self.$__dart_deferred_initializers__||Object.create(null)
$__dart_deferred_initializers__.current=function(a,b,c,$){var B={ajn:function ajn(d,e,f,g,h,i,j){var _=this
_.a=d
_.b=e
_.c=f
_.d=g
_.e=h
_.f=i
_.r=j},zb:function zb(d,e,f){var _=this
_.u=d
_.l$=e
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
_.ay=f
_.ch=!1
_.CW=$
_.cx=!0
_.cy=null
_.db=!0
_.dx=null
_.a=0
_.c=_.b=null},F_:function F_(d,e){this.c=d
this.a=e},
axO(d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,a0,a1){var x=new B.IT(A.b([],y.v),6.283185307179586,m,l,!1,!0,!1,n,!0,k,i,j,r,v,p,s,q,o,h,a0,null)
x.Uo(d,!0,!1,g,h,i,j,k,l,m,n,o,p,q,r,s,!0,!1,v,w,a0,a1)
return x},
IT:function IT(d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x){var _=this
_.b=d
_.c=$
_.d=0
_.e=e
_.f=f
_.r=g
_.w=h
_.x=i
_.y=j
_.z=k
_.Q=l
_.as=m
_.at=n
_.ax=o
_.ay=p
_.ch=q
_.CW=r
_.cx=s
_.cy=t
_.db=u
_.dx=v
_.dy=w
_.fr=$
_.a=x},
a1p:function a1p(){},
Uw:function Uw(){},
Gh:function Gh(d,e){this.a=d
this.b=e},
os:function os(d,e,f,g,h){var _=this
_.c=d
_.d=e
_.e=f
_.f=g
_.a=h},
a_D:function a_D(d){this.c=d},
HB:function HB(d,e){this.a=d
this.b=e},
wb:function wb(d,e){this.a=d
this.b=e},
yT:function yT(d,e,f,g,h,i,j,k,l,m,n){var _=this
_.c=d
_.d=e
_.e=f
_.f=g
_.r=h
_.w=i
_.y=j
_.at=k
_.ax=l
_.ay=m
_.a=n},
P7:function P7(d,e,f){var _=this
_.d=$
_.e=null
_.f=0
_.r=null
_.w=$
_.eo$=d
_.bF$=e
_.a=null
_.b=f
_.c=null},
ae1:function ae1(d){this.a=d},
ae3:function ae3(d){this.a=d},
ae2:function ae2(d){this.a=d},
ae_:function ae_(d){this.a=d},
ae0:function ae0(d,e,f){this.a=d
this.b=e
this.c=f},
Eb:function Eb(){},
avR(d){return new B.nN(d,null)},
a1q(d,e){return new B.IU(e,d)},
axP(d){var x,w,v=A.F(y.w,y.b)
for(x=0;x<4;++x){w=d[x]
v.q(0,w.b,w.a)}return v},
nN:function nN(d,e){this.c=d
this.a=e},
MZ:function MZ(d){this.a=null
this.b=d
this.c=null},
IU:function IU(d,e){this.a=d
this.b=e},
arw(d,e){if(e>3)return d[C.h.cW(e,3)]
return d[e]}},C,A,D,J,E,F,G
B=a.updateHolder(c[12],B)
C=c[2]
A=c[0]
D=c[56]
J=c[1]
E=c[37]
F=c[26]
G=c[57]
B.ajn.prototype={
pW(a0,a1,a2){var x,w,v,u,t,s,r,q,p,o,n,m,l,k,j=this,i="u_tile_offset",h="angle_range",g="m_gradient",f="uniform2f",e=a0.c,d=a0.a
e-=d
x=C.e.fg(e)
w=a0.d
v=a0.b
w-=v
u=C.e.fg(w)
if($.Eu==null)$.Eu=new A.RV()
t=A.ann(A.ao4(x,u))
t.fr=x
t.fx=u
s=A.ao3(j.b,j.c)
r=A.apt()
q=$.pZ
p=A.aoN(q==null?$.pZ=A.ah5():q)
p.e=1
p.uk(11,"v_color")
p.hg(9,"u_resolution")
p.hg(9,i)
p.hg(9,h)
p.hg(14,g)
o=p.gN4()
n=new A.tp("main",A.b([],y.x))
p.c.push(n)
n.cY("vec2 center = 0.5 * (u_resolution + u_tile_offset);")
n.cY("vec4 localCoord = vec4(gl_FragCoord.x - center.x, center.y - gl_FragCoord.y, 0, 1) * m_gradient;")
n.cY("float angle = atan(-localCoord.y, -localCoord.x) + 3.141592653589793;")
n.cY("float sweep = angle_range.y - angle_range.x;")
n.cY("angle = (angle - angle_range.x) / sweep;")
n.cY("float st = angle;")
n.cY(o.a+" = "+A.ar3(p,n,s,j.d)+" * scale + bias;")
m=t.LF(r,p.bq(0))
r=t.a
q=m.a
A.bv(r,"useProgram",[q])
l=j.a
A.bv(r,f,[t.j4(0,q,i),2*(e*((l.a-d)/e-0.5)),2*(w*((l.b-v)/w-0.5))])
A.bv(r,f,[t.j4(0,q,h),j.e,j.f])
s.Ez(t,m)
k=t.j4(0,q,g)
q=j.r
A.bv(r,"uniformMatrix4fv",[k,!1,q==null?A.eK().a:q])
d=$.Eu
e=0+e
w=0+w
if(a2)return d.MB(new A.u(0,0,e,w),t,m,s,x,u)
else{e=d.Mz(0,new A.u(0,0,e,w),t,m,s,x,u)
e.toString
return e}},
M7(d,e,f){var x=d.createPattern(this.pW(e,f,!1),"no-repeat")
x.toString
return x}}
B.zb.prototype={
sa62(d,e){if(this.u===e)return
this.u=e
this.S()},
aU(d){var x
if(isFinite(d))return d*this.u
x=this.l$
if(x!=null)return x.W(C.G,d,x.gaR())
return 0},
aT(d){var x
if(isFinite(d))return d*this.u
x=this.l$
if(x!=null)return x.W(C.Q,d,x.gb1())
return 0},
aN(d){var x
if(isFinite(d))return d/this.u
x=this.l$
if(x!=null)return x.W(C.T,d,x.gb8())
return 0},
aS(d){var x
if(isFinite(d))return d/this.u
x=this.l$
if(x!=null)return x.W(C.a6,d,x.gbi())
return 0},
FF(d){var x,w,v,u,t=d.a,s=d.b
if(t>=s&&d.c>=d.d)return new A.O(C.h.F(0,t,s),C.h.F(0,d.c,d.d))
x=this.u
if(isFinite(s)){w=s/x
v=s}else{w=d.d
v=w*x}if(v>s)w=s/x
else s=v
u=d.d
if(w>u){s=u*x
w=u}if(s<t)w=t/x
else t=s
u=d.c
if(w<u){t=u*x
w=u}return d.aV(new A.O(t,w))},
c2(d){return this.FF(d)},
bD(){var x,w=this,v=w.FF(y.a.a(A.r.prototype.ga6.call(w)))
w.k1=v
x=w.l$
if(x!=null)x.ft(0,A.qm(v))}}
B.F_.prototype={
aE(d){var x=new B.zb(1,null,A.ab(y.d))
x.gao()
x.gaz()
x.CW=!1
x.saY(null)
return x},
aH(d,e){e.sa62(0,1)}}
B.IT.prototype={
Uo(d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,a0,a1,a2,a3,a4,a5,a6){var x,w,v,u,t,s=this
s.d=C.c.ny(a6,0,new B.a1p())
for(x=s.b,w=s.as===D.h4,v=s.ch,u=0;u<a6.length;++u){t=new A.aV(new A.b_())
t.sae(0,B.arw(g,u))
if(w){t.sc7(0,C.N)
t.sf9(v)}x.push(t)}x=s.db
s.e=d*6.283185307179586*(x.a/360)
s.c=a6
s.fr=x.b*3.141592653589793/180},
Ew(d){if(this.as===D.h4){d.sc7(0,C.N)
d.sf9(this.ch)}},
an(d,e){var x,w,v,u,t,s,r,q=this,p="_prevAngle",o="_subParts",n=e.a,m=e.b,l=Math.min(n,m),k=q.db.a,j=k<=180?-n/2:0,i=new A.u(j,0,j+l,0+m),h=q.as===D.zR&&!0,g=new A.aV(new A.b_())
g.sae(0,q.dx)
q.Ew(g)
d.kr(0,i,0,6.283185307179586,h,g)
if(q.d===0){x=new A.aV(new A.b_())
x.sae(0,q.CW)
q.Ew(x)
d.kr(0,i,A.a(q.fr,p),k*3.141592653589793/180,h,x)}else{J.aS(A.a(q.c,o))
for(w=l/3,n=q.b,m=q.z,v=0;v<J.aS(A.a(q.c,o));++v){k=A.a(q.fr,p)
d.kr(0,i,k,q.e/q.d*J.aj(A.a(q.c,o),v),h,n[v])
u=A.a(q.fr,p)+q.e/q.d*J.aj(A.a(q.c,o),v)/2
k=Math.cos(u)
t=Math.sin(u)
if(J.aj(A.a(q.c,o),v)>0){s=A.a(q.c,o)
r=J.auV(J.aj(s,v),m)
q.WN(d,r,w*k,w*t,l)}q.fr=A.a(q.fr,p)+q.e/q.d*J.aj(A.a(q.c,o),v)}}},
WO(d,e,f,g,h,i){var x,w,v,u,t,s,r=null,q=A.La(r,r,r,r,A.h7(r,this.f,e),C.dR,C.t,r,1,C.aa)
q.NV(0)
x=h/2
w=x+f
x+=g
v=q.gb_(q)
u=q.a
u=u.gbx(u)
t=A.t0(A.aox(new A.j(w,x),Math.ceil(u)+4,v+6),C.by)
s=new A.aV(new A.b_())
s.sae(0,C.hf)
s.sc7(0,C.av)
d.d_(0,t,s)
v=q.gb_(q)
u=q.a
q.an(d,new A.j(w-v/2,x-Math.ceil(u.gbx(u))/2))},
WN(d,e,f,g,h){return this.WO(d,e,f,g,h,null)},
dW(d){return d.e!==this.e}}
B.Uw.prototype={}
B.Gh.prototype={}
B.os.prototype={
E(d,e){var x=this,w=null
return A.dA(A.b([A.aw(w,w,C.k,w,w,new A.bL(x.d,w,w,w,w,w,x.f),w,20,D.C7,w,w,w,18),D.wy,new A.o0(1,C.ht,E.cY(x.c,w,w,w,!0,x.e,w,w),w),D.wy],y.u),C.E,C.x,C.ca,w)}}
B.a_D.prototype={}
B.HB.prototype={
j(d){return"LegendPosition."+this.b}}
B.wb.prototype={
j(d){return"ChartType."+this.b}}
B.yT.prototype={
a7(){return new B.P7(null,null,C.l)}}
B.P7.prototype={
Ns(){var x=this.a.c,w=A.o(x).i("b8<1>"),v=A.Z(new A.b8(x,w),!1,w.i("n.E"))
w=A.V(v).i("a3<1,l>")
this.r=A.Z(new A.a3(v,new B.ae1(this),w),!1,w.i("at.E"))},
Nt(){var x=this.a.c
x=x.gba(x)
this.w=A.Z(x,!1,A.o(x).i("n.E"))},
am(){var x,w,v=this,u=null
v.aK()
v.Ns()
v.Nt()
x=v.a.f
x=A.bK(u,x,u,u,v)
v.e=x
w=A.ch(C.d7,x,u)
x=y.g
w.a5(0,new B.ae3(v))
v.d=new A.aJ(w,new A.aq(0,1,x),x.i("aJ<ar.T>"))
v.e.bB(0)},
XW(){return new A.o0(1,C.ht,new A.rz(new B.ae_(this),null),null)},
Yg(){var x=this
x.a.toString
switch(3){case 3:return A.dA(A.b([x.XW(),x.Y9(new A.ao(x.a.r,0,0,0))],y.u),C.E,C.x,C.ca,null)}},
Y9(d){var x,w,v=this.a
v=v.c.a
x=this.r
x.toString
w=A.V(x).i("a3<1,os>")
return new A.c2(d,F.apz(A.Z(new A.a3(x,new B.ae0(this,!1,v-0>0),w),!0,w.i("at.E")),G.xb,C.Y,8,0),null)},
E(d,e){var x=null
return A.aw(C.H,this.Yg(),C.k,x,x,x,x,x,x,C.bI,x,x,x)},
aW(d){this.Ns()
this.Nt()
this.bt(d)},
n(d){var x=this.e
if(x!=null)x.n(0)
this.U5(0)}}
B.Eb.prototype={
n(d){var x=this,w=x.bF$
if(w!=null)w.M(0,x.gij())
x.bF$=null
x.aP(0)},
bL(){this.cO()
this.cn()
this.ik()}}
B.nN.prototype={
a7(){return new B.MZ(C.l)}}
B.MZ.prototype={
E(d,e){var x=null,w=y.A,v=e.I(w).f,u=e.I(w).f
return A.aw(x,new B.yT(B.axP(this.a.c),D.h4,e.I(w).f.a.a/3.2,D.BZ,32,D.F2,0,32,D.DY,D.yY,x),C.k,C.Z,x,x,x,u.a.b*0.25,x,x,x,x,v.a.a*0.15)}}
B.IU.prototype={
j(d){return""+this.a+"%"},
gm(d){return this.a},
gaB(d){return this.b}}
var z=a.updateTypes(["C(C)","os(l)"])
B.a1p.prototype={
$2(d,e){return d+e},
$S:45}
B.ae1.prototype={
$1(d){this.a.a.toString
C.I6.h(0,d)
return d},
$S:12}
B.ae3.prototype={
$0(){var x=this.a
x.al(new B.ae2(x))},
$S:0}
B.ae2.prototype={
$0(){var x=this.a,w=A.a(x.d,"animation"),v=w.b
w=w.a
x.f=v.a9(0,w.gm(w))},
$S:0}
B.ae_.prototype={
$2(d,e){var x,w,v,u,t=null,s=this.a,r=s.a,q=e.b,p=r.e
q=q<p?q:p
p=s.f
r=r.w
x=A.a(s.w,"legendValues")
w=s.r
s=s.a
v=s.d
u=s.at
s=s.y
return A.eg(A.ie(D.xM,t,t,B.axO(p,!0,!1,r,C.Z,t,t,v,t,D.Nj,1,new B.Gh(360,s),C.ux,D.EK,t,t,!0,!1,u,w,t,x),C.o),q,t)},
$S:372}
B.ae0.prototype={
$1(d){var x=this.a,w=x.a.w,v=x.r
v.toString
v=B.arw(w,C.c.du(v,d))
return new B.os(d,v,x.a.ax.c,C.d3,null)},
$S:z+1};(function aliases(){var x=B.Eb.prototype
x.U5=x.n})();(function installTearOffs(){var x=a._instance_1u
var w
x(w=B.zb.prototype,"gaR","aU",0)
x(w,"gb1","aT",0)
x(w,"gb8","aN",0)
x(w,"gbi","aS",0)})();(function inheritance(){var x=a.mixinHard,w=a.inherit,v=a.inheritMany
w(B.ajn,A.nW)
w(B.zb,A.kJ)
w(B.F_,A.aO)
w(B.IT,A.kc)
v(A.fr,[B.a1p,B.ae_])
v(A.E,[B.Uw,B.Gh,B.a_D,B.IU])
w(B.os,A.a2)
v(A.eo,[B.HB,B.wb])
v(A.P,[B.yT,B.nN])
v(A.R,[B.Eb,B.MZ])
w(B.P7,B.Eb)
v(A.b6,[B.ae1,B.ae0])
v(A.dq,[B.ae3,B.ae2])
x(B.Eb,A.hN)})()
A.bS(b.typeUniverse,JSON.parse('{"zb":{"v":[],"aB":["v"],"r":[],"H":[],"a1":[]},"F_":{"aO":[],"ad":[],"h":[]},"IT":{"ak":[]},"os":{"a2":[],"h":[]},"yT":{"P":[],"h":[]},"HB":{"N":[]},"wb":{"N":[]},"P7":{"R":["yT"]},"nN":{"P":[],"h":[]},"MZ":{"R":["nN"]}}'))
var y=(function rtii(){var x=A.I
return{a:x("a4"),d:x("bO"),c:x("m<x>"),v:x("m<yB>"),x:x("m<l>"),u:x("m<h>"),A:x("df"),w:x("l"),g:x("aq<C>"),b:x("C")}})();(function constants(){var x=a.makeConstList
D.xM=new B.F_(null,null)
D.Nj=new A.q(!0,C.p,null,null,null,null,12,C.bJ,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null)
D.yY=new B.Uw()
D.zR=new B.wb(0,"disc")
D.h4=new B.wb(1,"ring")
D.T4=new B.Gh(360,0)
D.BZ=new A.aN(8e5)
D.C7=new A.ao(0,2,0,2)
D.Ta=new B.HB(3,"right")
D.DY=new B.a_D(C.wT)
D.zZ=new A.x(1107296256)
D.EK=A.b(x([D.zZ,C.A]),y.c)
D.Ac=new A.x(4278359022)
D.AQ=new A.x(4294488656)
D.AA=new A.x(4286864367)
D.Ae=new A.x(4279489422)
D.F2=A.b(x([D.Ac,D.AQ,D.AA,D.Ae]),y.c)
D.wy=new A.ef(8,null,null,null)})()}
$__dart_deferred_initializers__["yR+PT4UcUeuMk6QS8y9iyNEgrA8="] = $__dart_deferred_initializers__.current
