Subject: Build core-image-weston for beaglebone/am335x with GPU SGX530 enabled
To: meta-ti@lists.yoctoproject.org
From: "Luca" <magnabosco.luca@gmail.com>
X-Originating-Location: Isola Vicentina, Veneto, IT (109.234.143.106)
X-Originating-Platform: Windows Chrome 81
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 11 May 2020 08:07:49 -0700
Message-ID: <zrPI.1589209669954801158.UpYg@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="yUKW35PniZZpro7cdUar"

--yUKW35PniZZpro7cdUar
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

I am trying to get Weston working with the GPU SGX530 enabled.
Basically I would like to get the same results described in BeagleBoneBlac=
k/SGX + Qt EGLFS + Weston ( https://elinux.org/BeagleBoneBlack/SGX_%2B_Qt_E=
GLFS_%2B_Weston ) using Yocto.

At the moment I am using:

* meta-ti: branch zeus, commit 1dd4558 (with a fixed .wks see https://list=
s.yoctoproject.org/g/meta-ti/message/12916). I will probably switch to tag =
ti2020.00 or previous if needed
* poky: branch zeus, commit ca9cc50
* meta-openembedded: branch zeus, commit 44e458f
* A very simple patch applied by a ti-sgx-ddk-km_%.bbappend to set "$(1)_c=
ompiler_preferred_target :=3D arm-linux-gnueabihf" when arm-poky-linux-gnue=
abi is used (Similar to the patch described in https://www.yoctoproject.org=
/pipermail/meta-ti/2019-September/012193.html but with arm-poky-linux-gnuea=
bi instead of arm-oe-linux-gnueabi ).

The board seems to boot properly if I use core-image-base but when I run b=
itbake core-image-weston I get some bitbake errors due to libgl.

*First approach*
In my local.conf

IMAGE_INSTALL_append =3D " ti-sgx-ddk-km ti-sgx-ddk-um libdrm"
PREFERRED_PROVIDER_virtual/egl =3D "ti-sgx-ddk-um"
PREFERRED_PROVIDER_virtual/libgles1=3D "ti-sgx-ddk-um"
PREFERRED_PROVIDER_virtual/libgles2 =3D "ti-sgx-ddk-um"
PREFERRED_PROVIDER_virtual/mesa =3D "ti-sgx-ddk-um"

After taking a look to https://code.qt.io/cgit/yocto/meta-boot2qt.git meta=
-ti-extras layer dropped with commit 17747110065d6d1482fb5786773c27d78f7c8b=
ac I added in my ti-sgx-ddk-um_%.bbappend

PROVIDES +=3D "virtual/mesa"

Anyway when I run bitbake core-image-weston, it stops immediately with the=
 error:
Nothing PROVIDES 'virtual/libgl' (but /home/qem/Yocto/poky-zeus/meta/recip=
es-graphics/clutter/clutter-1.0_1.26.2.bb, /home/qem/Yocto/poky-zeus/meta/r=
ecipes-graphics/cairo/cairo_1.16.0.bb, /home/qem/Yocto/poky-zeus/meta/recip=
es-graphics/libepoxy/libepoxy_1.5.3.bb DEPENDS on or otherwise requires it)
mesa-gl PROVIDES virtual/libgl but was skipped: PREFERRED_PROVIDER_virtual=
/libgl set to mesa, not mesa-gl
mesa PROVIDES virtual/libgl but was skipped: PREFERRED_PROVIDER_virtual/li=
bgles1 set to ti-sgx-ddk-um, not mesa

*Second approach*
Considering https://www.yoctoproject.org/pipermail/meta-ti/2016-October/00=
9100.html I deleted the =C2=A0In my ti-sgx-ddk-um_%.bbappend and modified m=
y local.conf setting

PREFERRED_PROVIDER_virtual/egl =3D "ti-sgx-ddk-um"
PREFERRED_PROVIDER_virtual/libgles1 =3D "ti-sgx-ddk-um"
PREFERRED_PROVIDER_virtual/libgles2 =3D "ti-sgx-ddk-um"
PREFERRED_PROVIDER_libgbm =3D "libgbm"
PREFERRED_PROVIDER_libgbm-dev =3D "libgbm-dev"

But bitbake stops with the same error of the first approach.

*Doubts about Weston and OpenGL*
Looking for a solution I sow https://patchwork.openembedded.org/patch/1520=
82/ and http://git.yoctoproject.org/cgit/cgit.cgi/meta-freescale/tree/recip=
es-graphics/wayland/weston_4.0.0.imx.bb?h=3Dthud and I am wondering if "REQ=
UIRED_DISTRO_FEATURES =3D "opengl"" is strictly required for Weston 7 or if=
 a solution similar to the one implemented for Weston 4 would be viable.

Any suggestion or consideration would be much appreciated

Regards

Luca

--yUKW35PniZZpro7cdUar
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi all,<br /><br />I am trying to get Weston working with the GPU SGX530 en=
abled.<br />Basically I would like to get the same results described in <a =
href=3D"https://elinux.org/BeagleBoneBlack/SGX_%2B_Qt_EGLFS_%2B_Weston" tar=
get=3D"_blank" rel=3D"noopener">BeagleBoneBlack/SGX + Qt EGLFS + Weston</a>=
 using Yocto.<br /><br />At the moment I am using:<br />
<ul>
<li>meta-ti: branch zeus, commit 1dd4558 (with a fixed .wks see <a href=3D=
"https://lists.yoctoproject.org/g/meta-ti/message/12916)" target=3D"_blank"=
 rel=3D"noopener">https://lists.yoctoproject.org/g/meta-ti/message/12916)</=
a>. I will probably switch to tag ti2020.00 or previous if needed</li>
<li>poky: branch zeus, commit ca9cc50</li>
<li>meta-openembedded: branch zeus, commit 44e458f</li>
<li>A very simple patch applied by a ti-sgx-ddk-km_%.bbappend to set "$(1)=
_compiler_preferred_target :=3D arm-linux-gnueabihf" when arm-poky-linux-gn=
ueabi is used (Similar to the patch described in&nbsp;<a href=3D"https://ww=
w.yoctoproject.org/pipermail/meta-ti/2019-September/012193.html" target=3D"=
_blank" rel=3D"noopener">https://www.yoctoproject.org/pipermail/meta-ti/201=
9-September/012193.html</a>&nbsp;but with <em>arm-poky-linux-gnueabi </em>i=
nstead of&nbsp;<em>arm-oe-linux-gnueabi</em>).</li>
</ul>
<br />The board seems to boot properly if I use core-image-base but when I=
 run <em>bitbake core-image-weston</em> I get some bitbake errors due to li=
bgl.<br /><br /><strong>First approach</strong><br />In my local.conf<br />=
<br />
<div style=3D"padding-left: 30px;"><em>IMAGE_INSTALL_append =3D " ti-sgx-d=
dk-km ti-sgx-ddk-um libdrm"</em></div>
<div style=3D"padding-left: 30px;"><em>PREFERRED_PROVIDER_virtual/egl =3D =
"ti-sgx-ddk-um"</em></div>
<div style=3D"padding-left: 30px;"><em>PREFERRED_PROVIDER_virtual/libgles1=
=
=3D "ti-sgx-ddk-um"</em></div>
<div style=3D"padding-left: 30px;"><em>PREFERRED_PROVIDER_virtual/libgles2=
 =3D "ti-sgx-ddk-um"</em></div>
<div style=3D"padding-left: 30px;"><em>PREFERRED_PROVIDER_virtual/mesa =3D=
 "ti-sgx-ddk-um"</em></div>
<br />After taking a look to <a href=3D"https://code.qt.io/cgit/yocto/meta=
-boot2qt.git" target=3D"_blank" rel=3D"noopener">https://code.qt.io/cgit/yo=
cto/meta-boot2qt.git</a> meta-ti-extras layer dropped with commit 177471100=
65d6d1482fb5786773c27d78f7c8bac I added in my ti-sgx-ddk-um_%.bbappend<br /=
><br /><em>&nbsp; &nbsp; PROVIDES +=3D "virtual/mesa"</em><br /><br />Anywa=
y when I run&nbsp;<em>bitbake core-image-weston,</em>&nbsp;it stops immedia=
tely with the error:<br />
<div style=3D"padding-left: 30px;"><em>Nothing PROVIDES 'virtual/libgl' (b=
ut /home/qem/Yocto/poky-zeus/meta/recipes-graphics/clutter/clutter-1.0_1.26=
.2.bb, /home/qem/Yocto/poky-zeus/meta/recipes-graphics/cairo/cairo_1.16.0.b=
b, /home/qem/Yocto/poky-zeus/meta/recipes-graphics/libepoxy/libepoxy_1.5.3.=
bb DEPENDS on or otherwise requires it)</em></div>
<div style=3D"padding-left: 30px;"><em>mesa-gl PROVIDES virtual/libgl but =
was skipped: PREFERRED_PROVIDER_virtual/libgl set to mesa, not mesa-gl</em>=
</div>
<div style=3D"padding-left: 30px;"><em>mesa PROVIDES virtual/libgl but was=
 skipped: PREFERRED_PROVIDER_virtual/libgles1 set to ti-sgx-ddk-um, not mes=
a</em></div>
<br /><strong>Second approach</strong><br />Considering https://www.yoctop=
roject.org/pipermail/meta-ti/2016-October/009100.html I deleted the &nbsp;I=
n my ti-sgx-ddk-um_%.bbappend and modified my local.conf setting<br /><br /=
>
<div style=3D"padding-left: 30px;"><em>PREFERRED_PROVIDER_virtual/egl =3D =
"ti-sgx-ddk-um"</em></div>
<div style=3D"padding-left: 30px;"><em>PREFERRED_PROVIDER_virtual/libgles1=
 =3D "ti-sgx-ddk-um"</em></div>
<div style=3D"padding-left: 30px;"><em>PREFERRED_PROVIDER_virtual/libgles2=
 =3D "ti-sgx-ddk-um"</em></div>
<div style=3D"padding-left: 30px;"><em>PREFERRED_PROVIDER_libgbm =3D "libg=
bm"</em></div>
<div style=3D"padding-left: 30px;"><em>PREFERRED_PROVIDER_libgbm-dev =3D "=
libgbm-dev"</em></div>
<br />But bitbake stops with the same error of the first approach.<br /><b=
r /><strong>Doubts about Weston and OpenGL</strong><br />Looking for a solu=
tion I sow&nbsp;<a href=3D"https://patchwork.openembedded.org/patch/152082/=
" target=3D"_blank" rel=3D"noopener">https://patchwork.openembedded.org/pat=
ch/152082/</a> and&nbsp;<a href=3D"http://git.yoctoproject.org/cgit/cgit.cg=
i/meta-freescale/tree/recipes-graphics/wayland/weston_4.0.0.imx.bb?h=3Dthud=
" target=3D"_blank" rel=3D"noopener">http://git.yoctoproject.org/cgit/cgit.=
cgi/meta-freescale/tree/recipes-graphics/wayland/weston_4.0.0.imx.bb?h=3Dth=
ud</a> and I am wondering if "REQUIRED_DISTRO_FEATURES =3D "opengl"" is str=
ictly required for Weston 7 or if a solution similar to the one implemented=
 for Weston 4 would be viable.<br /><br />Any suggestion or consideration w=
ould be much appreciated<br /><br />Regards<br /><br />Luca

--yUKW35PniZZpro7cdUar--
