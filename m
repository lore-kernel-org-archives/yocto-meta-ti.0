Return-Path: <b.bimmermann@yahoo.de>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 01FDCE0043F; Wed,  4 Jan 2017 00:33:19 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (b.bimmermann[at]yahoo.de)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [212.82.96.150 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from nm9-vm7.bullet.mail.ir2.yahoo.com
	(nm9-vm7.bullet.mail.ir2.yahoo.com [212.82.96.150])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0CA1FE00405
	for <meta-ti@yoctoproject.org>; Wed,  4 Jan 2017 00:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.de; s=s2048;
	t=1483518794; bh=lajvYLZYY3Jl5H7VGSk1r7mX2QiIlOrgq0DdBOmyVqg=;
	h=Date:From:Reply-To:To:Subject:References:From:Subject;
	b=fqhHue5T3+6QRSYMv1lhp4RGiSq4UgXkIvf8LpC6GQapd2k/t+SEUCi5av9G2l99XWSTooWAjVm9j4ogQKZwsSDA+ffdl1awyYsNJknC6EDhRYAeEI8dRl1kadJ8VXywTMRbofRZUCo0/Uko1zEVof22Oe0F39EGvoZ/kWG2YD+GxfUuduDkuhDMVjQC2aGg6OVwCw5mdAWzuqoJUnsE55+plM0w9hUTvA9hk1TLEKxjWFnMvxatqPLB6z4astVM4NwxCbQ/QLML1uGNjiTmUQAil+zJvAYyc50CTnyAy28IldXTJ/fTHlWClajtSENb9aaTb1kPK7KU9wlPpIy+7w==
Received: from [212.82.98.56] by nm9.bullet.mail.ir2.yahoo.com with NNFMP;
	04 Jan 2017 08:33:14 -0000
Received: from [212.82.98.77] by tm9.bullet.mail.ir2.yahoo.com with NNFMP;
	04 Jan 2017 08:33:14 -0000
Received: from [127.0.0.1] by omp1014.mail.ir2.yahoo.com with NNFMP;
	04 Jan 2017 08:32:48 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 205240.17977.bm@omp1014.mail.ir2.yahoo.com
X-YMail-OSG: V_Gc0CMVM1llKcxZw.vTLBbz.MmGvhYI1n3AMAqhhNnYLnl31362Xr1PcmHolsy
	TTmd9.N8Tl8.0wUgM8QQNhZHhgDeF0jOaPuB1MaBHYpuzZ_4EmgqpQ6JoZfyplWCkV9v4dF1c3cg
	9LB1W3vNRoyPxNBOg7pCtKhI08u2rKQRfQPPRZwzW5G6OJZzerjNZeEVYfmon87xDeNy4ATrXwUd
	NavfMWgg43tihrCb8wT_Tilk.OzqHzLYp0qSB8jewTdnX3bfXFARoRLttNIgplYMKWDYE5YW79sW
	onD3Nafx2wIQNtVVwfKyjfulH13wSGCJ95NsGI3RzJdLz692EkudAu9jS_3zWhvuc3cuZio6E3Kj
	NXA8civTwDQnzVWsmjVvZnAxmaLdeNmGOIB.._BJUOMpY5R29KTZyjYlCbzPXG5qI48I764s469V
	uOlYghp4oIluDoyl21K_3ysmZUSyldsbdvsQBMZNGdPpudmBeatsNNCDhyPUMwMg81WDQ1nsg.rO
	9dVXVON0r67CkHX1QL3guDSCRbyuW_Oqe26lAFoC.Afta1LYrdyN6nOC6AM_m2kpwag--
Received: from jws700067.mail.ir2.yahoo.com by
	sendmailws104.mail.ir2.yahoo.com;
	Wed, 04 Jan 2017 08:32:47 +0000; 1483518767.770
Date: Wed, 4 Jan 2017 08:32:47 +0000 (UTC)
From: Benjamin Bimmermann <b.bimmermann@yahoo.de>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Message-ID: <972676697.10149692.1483518767462@mail.yahoo.com>
MIME-Version: 1.0
References: <972676697.10149692.1483518767462.ref@mail.yahoo.com>
Subject: ti-sgx-ddk-um / do_install failed / cp: cannot stat './targetfs//etc/*': No such file or directory
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
X-List-Received-Date: Wed, 04 Jan 2017 08:33:19 -0000
Content-Type: multipart/alternative; 
	boundary="----=_Part_10149691_1411052709.1483518767459"

------=_Part_10149691_1411052709.1483518767459
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,

I'm trying to build the ti-sgx-ddk-for the AM33x.
I've tried to build the Krogoth and the morty branch, but both failed.
A few months ago I had this error yet. I also do not understand which files=
 he would like to copy, but not find.
I have attached an extract from my log.


Thank you for your attentionBimmermann


---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------=20
log.do_install.19908
Log data follows:
| DEBUG: Executing shell function do_install
| NOTE: make -j7 install DESTDIR=3D/home/bimmermann/bbb/build_Sens_krogoth/=
tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-um/1.14.3699939-r19/image=
 TARGET_PRODUCT=3D
| mkdir -p /home/bimmermann/bbb/build_Sens_krogoth/tmp/work/beaglebone-poky=
-linux-gnueabi/ti-sgx-ddk-um/1.14.3699939-r19/image/etc
| mkdir -p /home/bimmermann/bbb/build_Sens_krogoth/tmp/work/beaglebone-poky=
-linux-gnueabi/ti-sgx-ddk-um/1.14.3699939-r19/image/usr/bin
| mkdir -p /home/bimmermann/bbb/build_Sens_krogoth/tmp/work/beaglebone-poky=
-linux-gnueabi/ti-sgx-ddk-um/1.14.3699939-r19/image/usr/include
| mkdir -p /home/bimmermann/bbb/build_Sens_krogoth/tmp/work/beaglebone-poky=
-linux-gnueabi/ti-sgx-ddk-um/1.14.3699939-r19/image/usr/lib
| cp -ar ./targetfs//etc/* /home/bimmermann/bbb/build_Sens_krogoth/tmp/work=
/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-um/1.14.3699939-r19/image/etc
| cp: cannot stat './targetfs//etc/*': No such file or directory
| Makefile:14: recipe for target 'install' failed
| make: *** [install] Error 1
| ERROR: oe_runmake failed
| ERROR: Function failed: do_install (log file is located at /home/bimmerma=
nn/bbb/build_Sens_krogoth/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk=
-um/1.14.3699939-r19/temp/log.do_install.19908)
NOTE: recipe ti-sgx-ddk-um-1.14.3699939-r19: task do_install: Failed
ERROR: Task 843 (/home/bimmermann/poky-krogoth/meta-ti/recipes-graphics/lib=
gles/ti-sgx-ddk-um_1.14.3699939.bb, do_install) failed with exit code '1'
NOTE: Running task 2572 of 3217 (ID: 830, /home/bimmermann/poky-krogoth/met=
a-BBB_QT5_PSS/meta-BBB_QT5_PSS/recipes-extras/thermal-init/thermal-init.bb,=
 do_install)
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------
Build Configuration:
BB_VERSION=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "1.30.0"
BUILD_SYS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "x86_64-linux=
"
NATIVELSBSTRING=C2=A0=C2=A0 =3D "Ubuntu-16.04"
TARGET_SYS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "arm-poky-linux-gn=
ueabi"
MACHINE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "be=
aglebone"
DISTRO=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D "poky"
DISTRO_VERSION=C2=A0=C2=A0=C2=A0 =3D "2.1.2"
TUNE_FEATURES=C2=A0=C2=A0=C2=A0=C2=A0 =3D "arm armv7a vfp thumb neon=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 callconvention-hard"
TARGET_FPU=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "hard"
meta-ti=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "kr=
ogoth:8663e1611ab6c5bfe36d323d9d9db4dada4bd532"
meta-qt5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "krogoth=
:2b1871f0d139dc3caaa779a32a1931409c245a36"
meta-oe=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D "krogoth:55c8a76da5dc099a7bc3838495c672140cedb78e"
meta=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=20
meta-yocto=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "krogoth:ae9b341ec=
fcc60e970f29cfe04306411ad26c0cf"
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------

------=_Part_10149691_1411052709.1483518767459
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div style=3D"color:#000; background-color:#fff; f=
ont-family:times new roman, new york, times, serif;font-size:16px"><span id=
=3D"yui_3_16_0_ym19_1_1483517804504_8537" lang=3D"en">Hello,</span><span id=
=3D"yui_3_16_0_ym19_1_1483517804504_8537" lang=3D"en"><br></span><div dir=
=3D"ltr" id=3D"yui_3_16_0_ym19_1_1483517804504_8617"><span id=3D"yui_3_16_0=
_ym19_1_1483517804504_8537" lang=3D"en"><br></span></div><div dir=3D"ltr" i=
d=3D"yui_3_16_0_ym19_1_1483517804504_8616"><span id=3D"yui_3_16_0_ym19_1_14=
83517804504_8537" lang=3D"en">I'm trying to build the ti-sgx-ddk-for the AM=
33x.</span><span id=3D"yui_3_16_0_ym19_1_1483517804504_8537" lang=3D"en"><b=
r></span></div><div dir=3D"ltr" id=3D"yui_3_16_0_ym19_1_1483517804504_8615"=
><span id=3D"yui_3_16_0_ym19_1_1483517804504_8537" lang=3D"en">I've tried t=
o build the Krogoth and the morty branch, but both failed.</span><span id=
=3D"yui_3_16_0_ym19_1_1483517804504_8537" lang=3D"en"><br></span></div><div=
 dir=3D"ltr" id=3D"yui_3_16_0_ym19_1_1483517804504_8546"><span id=3D"yui_3_=
16_0_ym19_1_1483517804504_8537" lang=3D"en">A few months ago I had this err=
or yet. I also do not understand which files he would like to copy, but not=
 find.</span><span id=3D"yui_3_16_0_ym19_1_1483517804504_8537" lang=3D"en">=
<br></span></div><div dir=3D"ltr" id=3D"yui_3_16_0_ym19_1_1483517804504_854=
5"><span id=3D"yui_3_16_0_ym19_1_1483517804504_8537" lang=3D"en">I have att=
ached an extract from my log.</span><span id=3D"yui_3_16_0_ym19_1_148351780=
4504_8537" lang=3D"en"><br></span></div><div dir=3D"ltr" id=3D"yui_3_16_0_y=
m19_1_1483517804504_8547"><span id=3D"yui_3_16_0_ym19_1_1483517804504_8537"=
 lang=3D"en"><br></span></div><div dir=3D"ltr" id=3D"yui_3_16_0_ym19_1_1483=
517804504_8548"><span id=3D"yui_3_16_0_ym19_1_1483517804504_8537" lang=3D"e=
n"><br></span></div><div dir=3D"ltr" id=3D"yui_3_16_0_ym19_1_1483517804504_=
8549"><span id=3D"yui_3_16_0_ym19_1_1483517804504_8537" lang=3D"en">Thank y=
ou for your attention</span></div><div dir=3D"ltr" id=3D"yui_3_16_0_ym19_1_=
1483517804504_8628"><span id=3D"yui_3_16_0_ym19_1_1483517804504_8537" lang=
=3D"en">Bimmermann</span></div><div dir=3D"ltr" id=3D"yui_3_16_0_ym19_1_148=
3517804504_8629"><span id=3D"yui_3_16_0_ym19_1_1483517804504_8537" lang=3D"=
en"><br></span></div><div dir=3D"ltr" id=3D"yui_3_16_0_ym19_1_1483517804504=
_8612"><span id=3D"yui_3_16_0_ym19_1_1483517804504_8537" lang=3D"en"><br></=
span></div><div dir=3D"ltr" id=3D"yui_3_16_0_ym19_1_1483517804504_8632"><br=
><span id=3D"yui_3_16_0_ym19_1_1483517804504_8563" lang=3D"en">------------=
------------------------------------------</span><span id=3D"yui_3_16_0_ym1=
9_1_1483517804504_8567" lang=3D"en">---------------------------------------=
---------------</span><span id=3D"yui_3_16_0_ym19_1_1483517804504_8571" lan=
g=3D"en">------------------------------------------------------</span><span=
 id=3D"yui_3_16_0_ym19_1_1483517804504_8575" lang=3D"en">------------------=
------------------------------------</span><span id=3D"yui_3_16_0_ym19_1_14=
83517804504_8576" lang=3D"en">---------------------------------------------=
---------</span></div><div dir=3D"ltr" id=3D"yui_3_16_0_ym19_1_148351780450=
4_6713"> </div><div dir=3D"ltr" id=3D"yui_3_16_0_ym19_1_1483517804504_6712"=
><br></div><div dir=3D"ltr" id=3D"yui_3_16_0_ym19_1_1483517804504_6553">log=
.do_install.19908<br id=3D"yui_3_16_0_ym19_1_1483517804504_6537">Log data f=
ollows:<br id=3D"yui_3_16_0_ym19_1_1483517804504_6538">| DEBUG: Executing s=
hell function do_install<br id=3D"yui_3_16_0_ym19_1_1483517804504_6539">| N=
OTE: make -j7 install DESTDIR=3D/home/bimmermann/bbb/build_Sens_krogoth/tmp=
/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-um/1.14.3699939-r19/image TA=
RGET_PRODUCT=3D<br id=3D"yui_3_16_0_ym19_1_1483517804504_6540">| mkdir -p /=
home/bimmermann/bbb/build_Sens_krogoth/tmp/work/beaglebone-poky-linux-gnuea=
bi/ti-sgx-ddk-um/1.14.3699939-r19/image/etc<br id=3D"yui_3_16_0_ym19_1_1483=
517804504_6541">| mkdir -p /home/bimmermann/bbb/build_Sens_krogoth/tmp/work=
/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-um/1.14.3699939-r19/image/usr/bin=
<br id=3D"yui_3_16_0_ym19_1_1483517804504_6542">| mkdir -p /home/bimmermann=
/bbb/build_Sens_krogoth/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-u=
m/1.14.3699939-r19/image/usr/include<br id=3D"yui_3_16_0_ym19_1_14835178045=
04_6543">| mkdir -p /home/bimmermann/bbb/build_Sens_krogoth/tmp/work/beagle=
bone-poky-linux-gnueabi/ti-sgx-ddk-um/1.14.3699939-r19/image/usr/lib<br id=
=3D"yui_3_16_0_ym19_1_1483517804504_6544">| cp -ar ./targetfs//etc/* /home/=
bimmermann/bbb/build_Sens_krogoth/tmp/work/beaglebone-poky-linux-gnueabi/ti=
-sgx-ddk-um/1.14.3699939-r19/image/etc<br id=3D"yui_3_16_0_ym19_1_148351780=
4504_6545">| cp: cannot stat './targetfs//etc/*': No such file or directory=
<br id=3D"yui_3_16_0_ym19_1_1483517804504_6546">| Makefile:14: recipe for t=
arget 'install' failed<br id=3D"yui_3_16_0_ym19_1_1483517804504_6547">| mak=
e: *** [install] Error 1<br id=3D"yui_3_16_0_ym19_1_1483517804504_6548">| E=
RROR: oe_runmake failed<br id=3D"yui_3_16_0_ym19_1_1483517804504_6549">| ER=
ROR: Function failed: do_install (log file is located at /home/bimmermann/b=
bb/build_Sens_krogoth/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-um/=
1.14.3699939-r19/temp/log.do_install.19908)<br id=3D"yui_3_16_0_ym19_1_1483=
517804504_6550">NOTE: recipe ti-sgx-ddk-um-1.14.3699939-r19: task do_instal=
l: Failed<br id=3D"yui_3_16_0_ym19_1_1483517804504_6551">ERROR: Task 843 (/=
home/bimmermann/poky-krogoth/meta-ti/recipes-graphics/libgles/ti-sgx-ddk-um=
_1.14.3699939.bb, do_install) failed with exit code '1'<br id=3D"yui_3_16_0=
_ym19_1_1483517804504_6552">NOTE: Running task 2572 of 3217 (ID: 830, /home=
/bimmermann/poky-krogoth/meta-BBB_QT5_PSS/meta-BBB_QT5_PSS/recipes-extras/t=
hermal-init/thermal-init.bb, do_install)</div><div dir=3D"ltr" id=3D"yui_3_=
16_0_ym19_1_1483517804504_6694"><br></div><div dir=3D"ltr" id=3D"yui_3_16_0=
_ym19_1_1483517804504_6677"><span id=3D"yui_3_16_0_ym19_1_1483517804504_858=
2" lang=3D"en">------------------------------------------------------</span=
><span id=3D"yui_3_16_0_ym19_1_1483517804504_8583" lang=3D"en">------------=
------------------------------------------</span><span id=3D"yui_3_16_0_ym1=
9_1_1483517804504_8584" lang=3D"en">---------------------------------------=
---------------</span><span id=3D"yui_3_16_0_ym19_1_1483517804504_8585" lan=
g=3D"en">------------------------------------------------------</span><span=
 id=3D"yui_3_16_0_ym19_1_1483517804504_8586" lang=3D"en">------------------=
------------------------------------</span></div><div dir=3D"ltr" id=3D"yui=
_3_16_0_ym19_1_1483517804504_8636"><br></div><div dir=3D"ltr" id=3D"yui_3_1=
6_0_ym19_1_1483517804504_8633">Build Configuration:<br id=3D"yui_3_16_0_ym1=
9_1_1483517804504_6656">BB_VERSION&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; =3D "1.30.0"<br id=3D"yui_3_16_0_ym19_1_1483517804504_6657">BUILD_SYS&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D "x86_64-linux"<br id=3D"yu=
i_3_16_0_ym19_1_1483517804504_6658">NATIVELSBSTRING&nbsp;&nbsp; =3D "Ubuntu=
-16.04"<br id=3D"yui_3_16_0_ym19_1_1483517804504_6659">TARGET_SYS&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D "arm-poky-linux-gnueabi"<br id=3D"yui_=
3_16_0_ym19_1_1483517804504_6660">MACHINE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; =3D "beaglebone"<br id=3D"yui_3_16_0_ym19_1_1483=
517804504_6661">DISTRO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; =3D "poky"<br id=3D"yui_3_16_0_ym19_1_1483517804504_6662">DIS=
TRO_VERSION&nbsp;&nbsp;&nbsp; =3D "2.1.2"<br id=3D"yui_3_16_0_ym19_1_148351=
7804504_6663">TUNE_FEATURES&nbsp;&nbsp;&nbsp;&nbsp; =3D "arm armv7a vfp thu=
mb neon&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; callconvention-hard"<br id=3D"y=
ui_3_16_0_ym19_1_1483517804504_6664">TARGET_FPU&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; =3D "hard"<br id=3D"yui_3_16_0_ym19_1_1483517804504_6666">me=
ta-ti&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D "krog=
oth:8663e1611ab6c5bfe36d323d9d9db4dada4bd532"<br id=3D"yui_3_16_0_ym19_1_14=
83517804504_6667">meta-qt5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; =3D "krogoth:2b1871f0d139dc3caaa779a32a1931409c245a36"<br id=3D"yui_3=
_16_0_ym19_1_1483517804504_6668">meta-oe&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D "krogoth:55c8a76da5dc099a7bc3838495c672=
140cedb78e"<br id=3D"yui_3_16_0_ym19_1_1483517804504_6675">meta&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br id=
=3D"yui_3_16_0_ym19_1_1483517804504_6676">meta-yocto&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; =3D "krogoth:ae9b341ecfcc60e970f29cfe04306411ad26c0cf"<=
/div><div dir=3D"ltr"><br></div><div dir=3D"ltr"><span id=3D"yui_3_16_0_ym1=
9_1_1483517804504_8599" lang=3D"en">---------------------------------------=
---------------</span><span id=3D"yui_3_16_0_ym19_1_1483517804504_8600" lan=
g=3D"en">------------------------------------------------------</span><span=
 id=3D"yui_3_16_0_ym19_1_1483517804504_8601" lang=3D"en">------------------=
------------------------------------</span><span id=3D"yui_3_16_0_ym19_1_14=
83517804504_8602" lang=3D"en">---------------------------------------------=
---------</span><span id=3D"yui_3_16_0_ym19_1_1483517804504_8603" lang=3D"e=
n">------------------------------------------------------</span></div></div=
></body></html>

------=_Part_10149691_1411052709.1483518767459--
