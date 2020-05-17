Subject: Re: Build core-image-weston for beaglebone/am335x with GPU SGX530 enabled
To: meta-ti@lists.yoctoproject.org
From: "Luca" <magnabosco.luca@gmail.com>
X-Originating-Location: Arzignano, Veneto, IT (185.23.87.190)
X-Originating-Platform: Windows Chrome 81
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 17 May 2020 14:22:39 -0700
References: <zrPI.1589209669954801158.UpYg@lists.yoctoproject.org>
In-Reply-To: <zrPI.1589209669954801158.UpYg@lists.yoctoproject.org>
Message-ID: <23459.1589750559600576112@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="afjnVLsORQBhP1qI3CRx"

--afjnVLsORQBhP1qI3CRx
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Probably the topic was too broad,

I think I got a partial solution and here you have a partial reply:

To my understanding, when using OpenGL and EGL there are two common scenar=
ios:
* The provider for both GL and EGL is mesa: that works fine in our case
* The provider for GL is mesa (specifically mesa-gl) and the provider for =
EGL is a GPU user space module (in our case ti-sgx-ddk-um): that at the mom=
ent is giving some bitbake errors due to a conflict. Indeed both mesa-gl an=
d ti-sgx-ddk-um provide the header khrplatform.h and the library libglapi
Since my goal is to use the GPU provided by the am335x SOC I have to focus=
 on the second one.

To setup the second scenario in a .conf file we have to set:

IMAGE_INSTALL_append =3D " ti-sgx-ddk-km ti-sgx-ddk-um libdrm"
PREFERRED_PROVIDER_virtual/egl =3D "ti-sgx-ddk-um"
PREFERRED_PROVIDER_virtual/libgles1=3D "ti-sgx-ddk-um"
PREFERRED_PROVIDER_virtual/libgles2 =3D "ti-sgx-ddk-um"
PREFERRED_PROVIDER_virtual/libgl =3D "mesa-gl"
PREFERRED_PROVIDER_virtual/mesa =3D "mesa-gl"
PREFERRED_PROVIDER_libgbm =3D "libgbm"
PREFERRED_PROVIDER_libgbm-dev =3D "libgbm-dev"

Moreover,=C2=A0since TI provides its own version of libgbm, in a mesa-gl_%=
.bbappend we set

PACKAGES_remove =3D "libgbm"
PACKAGES_remove =3D "libgbm-dev"
EXTRA_OECONF_remove =3D "--enable-gbm"

(Reference Automotive Grade Linux ( https://gerrit.automotivelinux.org/ger=
rit/gitweb?p=3DAGL/meta-agl.git;a=3Dblob;f=3Dmeta-agl-bsp/meta-ti/recipes-g=
raphics/mesa/mesa-gl_%25.bbappend;h=3Da5a69513ab927aa054d358aa699845fc43501=
2a6;hb=3DHEAD) ) )

This way the "providers should be set up properly" but unfortunately (depe=
nding on the=C2=A0openembedded-core we are using) we could get the error:
" file /usr/include/KHR/khrplatform.h is installed by both ti-sgx-ddk-um a=
nd mesa-gl, aborting "

This seems to be caused by mesa commit 87c156183 ( https://lists.yoctoproj=
ect.org/g/meta-ti/topic/build_core_image_weston_for/87c1561 ) that installs=
 the header khrplatform.h even when mesa should provide only opengl.
In other BSP layers the issue has been fixed preventing the GPU module to =
install the header (See meta-xilinx ( https://www.yoctoproject.org/pipermai=
l/meta-xilinx/2019-November/004555.html ) ).
I don't know if it is the proper solution, but I tried to implement it and=
 I patched the Makefile in omap5-sgx-ddk-um-linux, results:
- The error related to khrplatform.h is gone
- I get another similar error about libglapi.so being installed by both ti=
-sgx-ddk-um and mesa-gl. Should I disable its installation too? Not sure...

Any suggestion?

Regards
Luca

--afjnVLsORQBhP1qI3CRx
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Probably the topic was too broad,<br /><br />I think I got a partial soluti=
on and here you have a partial reply:<br /><br />To my understanding, when =
using OpenGL and EGL there are two common scenarios:<br />
<ol>
<li>The provider for both GL and EGL is mesa: that works fine in our case<=
/li>
<li>The provider for GL is mesa (specifically mesa-gl) and the provider fo=
r EGL is a GPU user space module (in our case&nbsp;<em>ti-sgx-ddk-um): </em=
>that at the moment is giving some bitbake errors due to a conflict. Indeed=
 both mesa-gl and ti-sgx-ddk-um provide the header khrplatform.h and the li=
brary libglapi</li>
</ol>
Since my goal is to use the GPU provided by the am335x SOC I have to focus=
 on the second one.<br /><br />To setup the second scenario in a .conf file=
 we have to set:<em><em><br /></em></em>
<div style=3D"padding-left: 30px;"><br />IMAGE_INSTALL_append =3D " ti-sgx=
-ddk-km ti-sgx-ddk-um libdrm"</div>
<div>
<div style=3D"padding-left: 30px;">PREFERRED_PROVIDER_virtual/egl =3D "ti-=
sgx-ddk-um"</div>
</div>
<div>
<div style=3D"padding-left: 30px;">PREFERRED_PROVIDER_virtual/libgles1=3D =
"ti-sgx-ddk-um"<br />PREFERRED_PROVIDER_virtual/libgles2 =3D "ti-sgx-ddk-um=
"<br />PREFERRED_PROVIDER_virtual/libgl =3D "mesa-gl"<br />PREFERRED_PROVID=
ER_virtual/mesa =3D "mesa-gl"<br />PREFERRED_PROVIDER_libgbm =3D "libgbm"<b=
r />PREFERRED_PROVIDER_libgbm-dev =3D "libgbm-dev"</div>
</div>
<div>
<div style=3D"padding-left: 30px;">&nbsp;</div>
</div>
<div>
<div>Moreover,&nbsp;since TI provides its own version of libgbm, in a mesa=
-gl_%.bbappend we set</div>
</div>
<div>
<div style=3D"padding-left: 30px;">
<div><br />PACKAGES_remove =3D "libgbm"<br />PACKAGES_remove =3D "libgbm-d=
ev"<br />EXTRA_OECONF_remove =3D "--enable-gbm"</div>
</div>
</div>
<em><br />(Reference&nbsp;<a href=3D"https://gerrit.automotivelinux.org/ge=
rrit/gitweb?p=3DAGL/meta-agl.git;a=3Dblob;f=3Dmeta-agl-bsp/meta-ti/recipes-=
graphics/mesa/mesa-gl_%25.bbappend;h=3Da5a69513ab927aa054d358aa699845fc4350=
12a6;hb=3DHEAD)" target=3D"_blank" rel=3D"noopener">Automotive Grade Linux<=
/a>)<br /></em><br />This way the "providers should be set up properly" but=
 unfortunately (depending on the&nbsp;openembedded-core we are using) we co=
uld get the error:
<div>"<span style=3D"font-size: 11pt; color: inherit; font-family: inherit=
;">file /usr/include/KHR/khrplatform.h is installed by both&nbsp;</span>ti-=
sgx-ddk-um<span style=3D"font-size: 11pt; color: inherit; font-family: inhe=
rit;">&nbsp;and mesa-gl, aborting</span><span style=3D"font-size: 11pt; col=
or: inherit; font-family: inherit;">"<br /></span><br />This seems to be ca=
used by mesa commit&nbsp;<a href=3D"https://lists.yoctoproject.org/g/meta-t=
i/topic/build_core_image_weston_for/87c1561">87c156183</a>&nbsp;that instal=
ls the header&nbsp;<span style=3D"font-size: 14.6667px;">khrplatform.h even=
 when mesa should provide only opengl.</span></div>
<span style=3D"font-size: 14.6667px;">In other BSP layers the issue has be=
en fixed preventing the GPU module to install the header (See&nbsp;</span><=
a style=3D"font-size: 14.6667px;" href=3D"https://www.yoctoproject.org/pipe=
rmail/meta-xilinx/2019-November/004555.html" target=3D"_blank" rel=3D"noope=
ner">meta-xilinx</a><span style=3D"font-size: 14.6667px;">).</span><br /><s=
pan style=3D"font-size: 14.6667px;">I don't know if it is the proper soluti=
on, but I tried to implement it and I patched the Makefile in omap5-sgx-ddk=
-um-linux, results:<br />- The error related to&nbsp;</span><span style=3D"=
font-size: 14.6667px;">khrplatform.h is gone<br />- I get another similar e=
rror about libglapi.so being installed by both&nbsp;</span>ti-sgx-ddk-um<sp=
an style=3D"color: inherit; font-family: inherit; font-size: 11pt;">&nbsp;a=
nd mesa-gl. Should I disable its installation too? Not sure...<br /><br /><=
/span>Any suggestion?<br /><br />Regards<br />Luca

--afjnVLsORQBhP1qI3CRx--
