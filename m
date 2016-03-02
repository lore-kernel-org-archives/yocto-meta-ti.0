Return-Path: <b.bimmermann@yahoo.de>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6FA89E00D19; Wed,  2 Mar 2016 01:07:40 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW, URI_HEX autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (b.bimmermann[at]yahoo.de)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [212.82.96.104 listed in list.dnswl.org]
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from nm4-vm6.bullet.mail.ir2.yahoo.com
	(nm4-vm6.bullet.mail.ir2.yahoo.com [212.82.96.104])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 661DEE00D0E
	for <meta-ti@yoctoproject.org>; Wed,  2 Mar 2016 01:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.de; s=s2048;
	t=1456909654; bh=lLE7spKiHGzXefKeluZWE9jaKBlAT2cZ5X+5td/T6Ms=;
	h=Date:From:Reply-To:To:Subject:References:From:Subject;
	b=qRHf3RDBCd9/N3gvEdG1cUSVXuxUUc3YpnpJr+/7sRb8GfoNuqg9YGMpD307Unnu+tilIquHiyZQJqFEWbb3/eRjDEOtkwlbeCF29fpWY1ZdEuHqy1atutM7+Rd4jAorkplN9qmH1RK8avuxHM3tzBFmdFKGNTzlSjnLA0zw/A36QX1AG8TlXnJ1hg/PUAS1qd8TevlDvUU5XYWrPlGfOYbJ0bGDhf9M69U5bTGTwkb1yrj4AqPbjfAfcgAhrnFwFtDQvM+MyilfanE58td5ZmmmlIeGGxrZ9iCODKmlqpNNecfSxoVQjxKoiLYjcPcCibC3+4rxsHjIncG3807Hzw==
Received: from [212.82.98.57] by nm4.bullet.mail.ir2.yahoo.com with NNFMP;
	02 Mar 2016 09:07:34 -0000
Received: from [212.82.98.86] by tm10.bullet.mail.ir2.yahoo.com with NNFMP;
	02 Mar 2016 09:07:34 -0000
Received: from [127.0.0.1] by omp1023.mail.ir2.yahoo.com with NNFMP;
	02 Mar 2016 09:07:34 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 935209.80306.bm@omp1023.mail.ir2.yahoo.com
X-YMail-OSG: SRVVZScVM1k3PTCBe8hplsEzLHRkGxh4Ex7CKy1r3qimjCGuGmbVP097SDzobr2
	frGaaCeF8.pAJVS379L3Ervtd9nSU31fEdw_BgLP737z_XobLS3bytXvvaYAXeo9uX41JGZd3Yoe
	3F7bviozYCTcbZplYYMDS1VIPR6aWZ973hmm3kbbkKnmbVT3f9o2wu8xohlLUAOxfT7CTsFxPZuP
	m3HUAD5QA0vnB9r0K6YHjX5.L9Jw8dgMQdf_mt2AiBbMfkLvBHNiCTm1khyyz1bj3PayTmb1SW7p
	3SAxf2XzT0gZvkvWkIfRuuvdQdAZjxKTTRaloSQ6Os8uUyngwvO8MeZR6GpTuR_eaM8NHXTu7uNo
	Td9KrbgxlWKd8vk4CMv0d6QGJ5VL.q1Cd4esejeJM5cxCLI_gxr8qz4mmKM2rB.qEkkohxa0YimT
	AiXkx1tTYu3mOKbRzecWYKwAQvQeXUkZVmYlZi7okMu06z8CN8BD81Q5kQkcwoc.YiP.XYSRRccI
	cMs_Z4tn3h.nTpnIEJGgQI5BH
Received: by 212.82.98.120; Wed, 02 Mar 2016 09:07:34 +0000 
Date: Wed, 2 Mar 2016 09:07:33 +0000 (UTC)
From: Benjamin Bimmermann <b.bimmermann@yahoo.de>
To: Meta-ti Mailing List <meta-ti@yoctoproject.org>, 
	Denys Dmytriyenko <denys@ti.com>
Message-ID: <811157959.3252810.1456909653704.JavaMail.yahoo@mail.yahoo.com>
MIME-Version: 1.0
References: <811157959.3252810.1456909653704.JavaMail.yahoo.ref@mail.yahoo.com>
Subject: Omap5 / multiple packages / mesa / PREFERRED_PROVIDER_virtual/libgl
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: Benjamin Bimmermann <b.bimmermann@yahoo.de>
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Mar 2016 09:07:40 -0000
Content-Type: multipart/alternative; 
	boundary="----=_Part_3252809_722793989.1456909653698"

------=_Part_3252809_722793989.1456909653698
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,
i try to build the omap5-sgx-ddk-um-linux for the am335x_boneblack.Two mont=
h ago I have build a Image with omap5-sgx-ddk-um-linux and QT5 and it runs =
fine.
Now I get :ERROR: Multiple .bb files are due to be built which each provide=
 virtual/libgles1ERROR: Multiple .bb files are due to be built which each p=
rovide virtual/libgles2ERROR: Multiple .bb files are due to be built which =
each provide virtual/egl=20

With verbose on I get :NOTE: selecting mesa to satisfy runtime libgbm due t=
o PREFERRED_PROVIDER_virtual/libgl =3D mesa
NOTE: selecting mesa to satisfy runtime mesa-dev due to PREFERRED_PROVIDER_=
virtual/libgl =3D mesa


In my Layer in my beaglebone.conf I have the lines :PREFERRED_PROVIDER_virt=
ual/egl =3D=C2=A0 "omap5-sgx-ddk-um-linux"
PREFERRED_PROVIDER_virtual/libgles1 =3D "omap5-sgx-ddk-um-linux"
PREFERRED_PROVIDER_virtual/libgles2 =3D "omap5-sgx-ddk-um-linux"and last ti=
me it runs without errors.
I build the Image at the moment without qt5 to fix the error. My Image is :=
IMAGE_INSTALL +=3D " \
=C2=A0=C2=A0=C2=A0 openssh \
=C2=A0=C2=A0=C2=A0 openssh-sftp-server \
=C2=A0=C2=A0=C2=A0 openssh-keygen \
=C2=A0=C2=A0=C2=A0 openssh-sftp-server \
=C2=A0=C2=A0=C2=A0 tzdata \
=C2=A0=C2=A0=C2=A0 kernel-modules \
=C2=A0=C2=A0=C2=A0 omapdrm-pvr \
=C2=A0=C2=A0=C2=A0 omap5-sgx-ddk-um-linux \
"


Where is my Problem ?=20

I have google a lot and have seen this :https://lists.yoctoproject.org/pipe=
rmail/yocto/2014-June/020390.htmlAlso from the Raspery-Layer I have this :
PREFERRED_PROVIDER_virtual/egl ?=3D "userland"
PREFERRED_PROVIDER_virtual/libgles2 ?=3D "userland"
PREFERRED_PROVIDER_virtual/libgl ?=3D "mesa-gl"
PREFERRED_PROVIDER_virtual/mesa ?=3D "mesa-gl"
So I think I must add:PREFERRED_PROVIDER_virtual/libgl =3D "omap5-sgx-ddk-u=
m-linux"but that changes nothing if I add it to the beaglebone.conf.
If you need anything else please tell me.Have a nice day.

---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
------------------------------------
The LOG:
Parsing of 2147 .bb files complete (2145 cached, 2 parsed). 2740 targets, 4=
63 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "1.28.0"
BUILD_SYS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "x86_64-linux=
"
NATIVELSBSTRING=C2=A0=C2=A0 =3D "Ubuntu-15.10"
TARGET_SYS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "arm-poky-linux-gn=
ueabi"
MACHINE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "be=
aglebone"
DISTRO=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D "poky"
DISTRO_VERSION=C2=A0=C2=A0=C2=A0 =3D "2.0.1"
TUNE_FEATURES=C2=A0=C2=A0=C2=A0=C2=A0 =3D "arm armv7a vfp thumb neon callco=
nvention-hard cortexa8"
TARGET_FPU=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "vfp-neon"
meta-BBB_QT5_PSS=C2=A0 =3D "ada:6af2a3e5bf61cc4651499e909e9e28eeb37238da"
meta-ti=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "ma=
ster:3ceebfaf5f0828a173da66e48a5a562634e79470"
meta-qt5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "master:=
26637f766a40fd59df6e1edc65e4b14cd2f78014"
meta-oe=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
meta-perl=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
meta-efl=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
meta-multimedia=C2=A0=C2=A0=20
meta-networking=C2=A0=C2=A0=20
meta-ruby=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
meta-python=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "jethro:dc5634968b270dd=
e250690609f0015f881db81f2"
meta=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=20
meta-yocto=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "jethro:b1f23d1254=
682866236bfaeb843c0d8aa332efc2"

NOTE: Preparing RunQueue
ERROR: Multiple .bb files are due to be built which each provide virtual/li=
bgles1 (/home/drago/poky-jethro/meta-ti/recipes-graphics/libgles/omap5-sgx-=
ddk-um-linux_1.14.3699939.bb /home/drago/poky-jethro/meta/recipes-graphics/=
mesa/mesa_10.6.3.bb).
=C2=A0This usually means one provides something the other doesn't and shoul=
d.
ERROR: Multiple .bb files are due to be built which each provide virtual/li=
bgles2 (/home/drago/poky-jethro/meta-ti/recipes-graphics/libgles/omap5-sgx-=
ddk-um-linux_1.14.3699939.bb /home/drago/poky-jethro/meta/recipes-graphics/=
mesa/mesa_10.6.3.bb).
=C2=A0This usually means one provides something the other doesn't and shoul=
d.
ERROR: Multiple .bb files are due to be built which each provide virtual/eg=
l (/home/drago/poky-jethro/meta-ti/recipes-graphics/libgles/omap5-sgx-ddk-u=
m-linux_1.14.3699939.bb /home/drago/poky-jethro/meta/recipes-graphics/mesa/=
mesa_10.6.3.bb).
=C2=A0This usually means one provides something the other doesn't and shoul=
d.


------=_Part_3252809_722793989.1456909653698
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div style=3D"color:#000; background-color:#fff; f=
ont-family:times new roman, new york, times, serif;font-size:16px"><div id=
=3D"yui_3_16_0_1_1456908083664_2473">Hello,</div><div id=3D"yui_3_16_0_1_14=
56908083664_2744"><br></div><div id=3D"yui_3_16_0_1_1456908083664_2745" dir=
=3D"ltr">i try to build the omap5-sgx-ddk-um-linux for the am335x_boneblack=
.</div><div id=3D"yui_3_16_0_1_1456908083664_2858" dir=3D"ltr">Two month ag=
o I have build a Image with omap5-sgx-ddk-um-linux and QT5 and it runs fine=
.</div><div id=3D"yui_3_16_0_1_1456908083664_2885" dir=3D"ltr"><br></div><d=
iv id=3D"yui_3_16_0_1_1456908083664_2941" dir=3D"ltr">Now I get :</div><div=
 id=3D"yui_3_16_0_1_1456908083664_2940" dir=3D"ltr">ERROR: Multiple .bb fil=
es are due to be built which each provide virtual/libgles1</div><div id=3D"=
yui_3_16_0_1_1456908083664_2964" dir=3D"ltr">ERROR: Multiple .bb files are =
due to be built which each provide virtual/libgles2</div><div id=3D"yui_3_1=
6_0_1_1456908083664_2963" dir=3D"ltr">ERROR: Multiple .bb files are due to =
be built which each provide virtual/egl <br></div><div id=3D"yui_3_16_0_1_1=
456908083664_3029" dir=3D"ltr"><br></div><div id=3D"yui_3_16_0_1_1456908083=
664_3369" dir=3D"ltr">With verbose on I get :</div><div id=3D"yui_3_16_0_1_=
1456908083664_3370" dir=3D"ltr">NOTE: selecting mesa to satisfy runtime lib=
gbm due to PREFERRED_PROVIDER_virtual/libgl =3D mesa<br>NOTE: selecting mes=
a to satisfy runtime mesa-dev due to PREFERRED_PROVIDER_virtual/libgl =3D m=
esa<br><br></div><div id=3D"yui_3_16_0_1_1456908083664_3372" dir=3D"ltr"><b=
r></div><div id=3D"yui_3_16_0_1_1456908083664_3030" dir=3D"ltr">In my Layer=
 in my beaglebone.conf I have the lines :</div><div id=3D"yui_3_16_0_1_1456=
908083664_3166" dir=3D"ltr">PREFERRED_PROVIDER_virtual/egl =3D&nbsp; "omap5=
-sgx-ddk-um-linux"<br>PREFERRED_PROVIDER_virtual/libgles1 =3D "omap5-sgx-dd=
k-um-linux"<br>PREFERRED_PROVIDER_virtual/libgles2 =3D "omap5-sgx-ddk-um-li=
nux"</div><div id=3D"yui_3_16_0_1_1456908083664_3168" dir=3D"ltr">and last =
time it runs without errors.</div><div id=3D"yui_3_16_0_1_1456908083664_318=
4" dir=3D"ltr"><br></div><div id=3D"yui_3_16_0_1_1456908083664_3446" dir=3D=
"ltr">I build the Image at the moment without qt5 to fix the error. My Imag=
e is :</div><div id=3D"yui_3_16_0_1_1456908083664_3508" dir=3D"ltr">IMAGE_I=
NSTALL +=3D " \<br>&nbsp;&nbsp;&nbsp; openssh \<br>&nbsp;&nbsp;&nbsp; opens=
sh-sftp-server \<br>&nbsp;&nbsp;&nbsp; openssh-keygen \<br>&nbsp;&nbsp;&nbs=
p; openssh-sftp-server \<br>&nbsp;&nbsp;&nbsp; tzdata \<br>&nbsp;&nbsp;&nbs=
p; kernel-modules \<br>&nbsp;&nbsp;&nbsp; omapdrm-pvr \<br>&nbsp;&nbsp;&nbs=
p; omap5-sgx-ddk-um-linux \<br>"<br></div><div id=3D"yui_3_16_0_1_145690808=
3664_3509" dir=3D"ltr"><br></div><div id=3D"yui_3_16_0_1_1456908083664_3510=
" dir=3D"ltr"><br></div><div id=3D"yui_3_16_0_1_1456908083664_5171">Where i=
s my Problem ? <br></div><div id=3D"yui_3_16_0_1_1456908083664_5172"><br></=
div><div id=3D"yui_3_16_0_1_1456908083664_3211" dir=3D"ltr">I have google a=
 lot and have seen this :</div><div id=3D"yui_3_16_0_1_1456908083664_3614" =
dir=3D"ltr"><a id=3D"yui_3_16_0_1_1456908083664_3615" href=3D"https://lists=
.yoctoproject.org/pipermail/yocto/2014-June/020390.html">https://lists.yoct=
oproject.org/pipermail/yocto/2014-June/020390.html</a></div><div id=3D"yui_=
3_16_0_1_1456908083664_5174" dir=3D"ltr">Also from the Raspery-Layer I have=
 this :<br>PREFERRED_PROVIDER_virtual/egl ?=3D "userland"<br>PREFERRED_PROV=
IDER_virtual/libgles2 ?=3D "userland"<br>PREFERRED_PROVIDER_virtual/libgl ?=
=3D "mesa-gl"<br>PREFERRED_PROVIDER_virtual/mesa ?=3D "mesa-gl"</div><div i=
d=3D"yui_3_16_0_1_1456908083664_5193" dir=3D"ltr"><br></div><div id=3D"yui_=
3_16_0_1_1456908083664_5194" dir=3D"ltr">So I think I must add:</div><div i=
d=3D"yui_3_16_0_1_1456908083664_5266" dir=3D"ltr">PREFERRED_PROVIDER_virtua=
l/libgl =3D "omap5-sgx-ddk-um-linux"</div><div id=3D"yui_3_16_0_1_145690808=
3664_5275" dir=3D"ltr">but that changes nothing if I add it to the beaglebo=
ne.conf.</div><div id=3D"yui_3_16_0_1_1456908083664_5373" dir=3D"ltr"><br><=
/div><div id=3D"yui_3_16_0_1_1456908083664_5384" dir=3D"ltr">If you need an=
ything else please tell me.</div><div id=3D"yui_3_16_0_1_1456908083664_5591=
" dir=3D"ltr">Have a nice day.<br></div><div id=3D"yui_3_16_0_1_14569080836=
64_5419" dir=3D"ltr"><br></div><div id=3D"yui_3_16_0_1_1456908083664_5733" =
dir=3D"ltr">---------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
------------------------------------------------</div><div id=3D"yui_3_16_0=
_1_1456908083664_5602" dir=3D"ltr"><br></div><div id=3D"yui_3_16_0_1_145690=
8083664_2965" dir=3D"ltr">The LOG:<br></div><div id=3D"yui_3_16_0_1_1456908=
083664_2966" dir=3D"ltr">Parsing of 2147 .bb files complete (2145 cached, 2=
 parsed). 2740 targets, 463 skipped, 0 masked, 0 errors.<br>NOTE: Resolving=
 any missing task queue dependencies<br><br>Build Configuration:<br>BB_VERS=
ION&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D "1.28.0"<br>BUILD_SYS&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D "x86_64-linux"<br>NATIVELS=
BSTRING&nbsp;&nbsp; =3D "Ubuntu-15.10"<br>TARGET_SYS&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; =3D "arm-poky-linux-gnueabi"<br>MACHINE&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D "beaglebone"<br>DISTRO&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D "poky"<b=
r>DISTRO_VERSION&nbsp;&nbsp;&nbsp; =3D "2.0.1"<br>TUNE_FEATURES&nbsp;&nbsp;=
&nbsp;&nbsp; =3D "arm armv7a vfp thumb neon callconvention-hard cortexa8"<b=
r>TARGET_FPU&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D "vfp-neon"<br>me=
ta-BBB_QT5_PSS&nbsp; =3D "ada:6af2a3e5bf61cc4651499e909e9e28eeb37238da"<br>=
meta-ti&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D "ma=
ster:3ceebfaf5f0828a173da66e48a5a562634e79470"<br>meta-qt5&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D "master:26637f766a40fd59df6e1edc6=
5e4b14cd2f78014"<br>meta-oe&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; <br>meta-perl&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
<br>meta-efl&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>meta=
-multimedia&nbsp;&nbsp; <br>meta-networking&nbsp;&nbsp; <br>meta-ruby&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>meta-python&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; =3D "jethro:dc5634968b270dde250690609f0015f881db81f2"<b=
r>meta&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; <br>meta-yocto&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D "jet=
hro:b1f23d1254682866236bfaeb843c0d8aa332efc2"<br><br>NOTE: Preparing RunQue=
ue<br>ERROR: Multiple .bb files are due to be built which each provide virt=
ual/libgles1 (/home/drago/poky-jethro/meta-ti/recipes-graphics/libgles/omap=
5-sgx-ddk-um-linux_1.14.3699939.bb /home/drago/poky-jethro/meta/recipes-gra=
phics/mesa/mesa_10.6.3.bb).<br>&nbsp;This usually means one provides someth=
ing the other doesn't and should.<br>ERROR: Multiple .bb files are due to b=
e built which each provide virtual/libgles2 (/home/drago/poky-jethro/meta-t=
i/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.14.3699939.bb /home/dra=
go/poky-jethro/meta/recipes-graphics/mesa/mesa_10.6.3.bb).<br>&nbsp;This us=
ually means one provides something the other doesn't and should.<br>ERROR: =
Multiple .bb files are due to be built which each provide virtual/egl (/hom=
e/drago/poky-jethro/meta-ti/recipes-graphics/libgles/omap5-sgx-ddk-um-linux=
_1.14.3699939.bb /home/drago/poky-jethro/meta/recipes-graphics/mesa/mesa_10=
.6.3.bb).<br>&nbsp;This usually means one provides something the other does=
n't and should.<br><br></div></div></body></html>

------=_Part_3252809_722793989.1456909653698--
