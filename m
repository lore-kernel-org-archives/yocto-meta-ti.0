Return-Path: <b.bimmermann@yahoo.de>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 27659E0049B; Sun, 16 Aug 2015 08:04:49 -0700 (PDT)
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
	*      [212.82.97.142 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from nm37-vm1.bullet.mail.ir2.yahoo.com
	(nm37-vm1.bullet.mail.ir2.yahoo.com [212.82.97.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B3E28E003D4
	for <meta-ti@yoctoproject.org>; Sun, 16 Aug 2015 08:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.de; s=s2048;
	t=1439737478; bh=51D1l8euBd1P6+QeLkp56TU/FEg4hymLPxWk/CoABoY=;
	h=Date:From:Reply-To:To:In-Reply-To:References:Subject:From:Subject;
	b=eMk+U/UT/T4lMGnZk9tQW3jFL2/bCu/P/CFoBlqqPOslw7KFjXhwHam8ITCFw9YwKvQ1rYIvJilaeog7zw45+bRd9GYXhJsBh2PHERUC+mj3YLOYAtt0HQIUt1qDlwcEJLTrccElxPh9olrbBVow3wfdXbEYoJzpF1DFoksMXC/e/3rxnZg+Bpp4+Daq+vS857xfosgxwBjMgZ/4VBNjR8xAhGrBDMeVcXBoltgGvvTghavtIlyt4b5S6QDmLYmokOox+N4cKxYH9qztO0ToQZgoasWbza8kIi08hxnXN5RTjHT7s8sM+YvNlr8aOSvZl82tLTYpNhGLupl2f6sOPw==
Received: from [212.82.98.124] by nm37.bullet.mail.ir2.yahoo.com with NNFMP;
	16 Aug 2015 15:04:38 -0000
Received: from [212.82.98.104] by tm17.bullet.mail.ir2.yahoo.com with NNFMP;
	16 Aug 2015 15:04:38 -0000
Received: from [127.0.0.1] by omp1041.mail.ir2.yahoo.com with NNFMP;
	16 Aug 2015 15:04:38 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 419466.99942.bm@omp1041.mail.ir2.yahoo.com
X-YMail-OSG: kSgbJS4VM1nyHWdPGihWTs.CLSvOKiSWaanxvfxRST3CpWK8u8zHt2ZAO.NAx7V
	dbWP61cSV_i8wwLaCo23KzPbfdr5wNE7L_byB8ugMTRhV.sygn2RqER0DSD5m_jDoELvRTnaNJ8o
	Bp74eD.eCLg_zQ_H1MS.vFLIvNSSlfNhaxHZap1w9yZJaL_pT82.jm6FHivLbrUsbxjstrpOswXH
	3sj0j0N3ag6cp4wXGXAojcyEZ_OhXEA0SOJUDZBa4U.Nra_EvwYYAX930dcqpI.lLIe2f8bIV.Sc
	u6DQmECteZuqwzlZMvyvXjaWrhsAAcYc5XlaSsRQl.znEc3mN2ASRs7xntD9mbjYnTpQEkl.IUWo
	2aiAAUCuQ91YsJUGjn6irCOJ5ytOZp_l.k9_IRKnpW5CW6.gKxL4wr6FucwjCJn4hG1N9hEMEoUS
	6hTy2Me1HNrIgaHZZuJSOI8mAWlPrlEMbJ5042GJQZxcEbOmOIYg8O94Nb92LJSU3YBk8H9wooVh
	V6wqHOpI.8lHUKnpF5EOq
Received: by 217.12.9.8; Sun, 16 Aug 2015 15:04:37 +0000 
Date: Sun, 16 Aug 2015 15:04:29 +0000 (UTC)
From: Benjamin Bimmermann <b.bimmermann@yahoo.de>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>, 
	Denys Dmytriyenko <denys@ti.com>
Message-ID: <203232546.5605769.1439737469482.JavaMail.yahoo@mail.yahoo.com>
In-Reply-To: <1319594131.5095777.1439627373982.JavaMail.yahoo@mail.yahoo.com>
References: <1319594131.5095777.1439627373982.JavaMail.yahoo@mail.yahoo.com>
MIME-Version: 1.0
Subject: Re: libgles-omap3 error | BeagleBoneBlack | sgx-omap.h: No such file or directory
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
X-List-Received-Date: Sun, 16 Aug 2015 15:04:49 -0000
Content-Type: multipart/alternative; 
	boundary="----=_Part_5605768_1237456081.1439737469464"

------=_Part_5605768_1237456081.1439737469464
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

>>Denys>>Version 5.1.1.2 of libgles-omap3 only builds and works against ver=
sion 3.14 of=C2=A0 linux-ti-staging kernel in meta-ti
>Benjamin
>Three=C2=A0Questions:>1. What=C2=A0must I add / change to build with the K=
ernel 3.14?
I have found it out, I think.I have added to the local.conf :PREFERRED_VERS=
ION_linux-yocto =3D "3.14%"
PREFERRED_VERSION_linux-ti-staging =3D "3.14%"
I think now he builds the 3.14 Kernel ;).=20

But now I have a warning and I don't know exactly what it means and what I =
should do.The Warning :WARNING: QA Issue: libgles-omap3-frontwsegl-es3 requ=
ires libpvr2d.so, but no providers in its RDEPENDS [file-rdeps]
I think that means, that I can get a possible Runtime-Error, because libgle=
s-omap3 needs at the runtime libpvr2d.
Three more Questions:
1.:How can I check that bitbake has build the libpvr2d ?2.: What I can add =
to the local.conf to be sure that the libpvr2d is build every time ?3.: Is =
there an unstable / inprogress libgles-omap3 Version for the Kernel 4.1 whi=
ch I can try?=20
=C2=A0=C2=A0=C2=A0=C2=A0 Is it possible to be involved in the programming o=
f the libgles-omap3 driver ?

Have a nice day.


---------------------------------------------------------------------------=
-----------------------


The Log:
PC@PC:~/bbb/build_spain$ bitbake libgles-omap3
WARNING: Host distribution "Ubuntu-15.04" has not been validated with this =
version of the build system; you may possibly experience unexpected failure=
s. It is recommended that you use a tested distribution.
Parsing recipes: 100% |####################################################=
###########################################################################=
#######################################| Time: 00:00:51
Parsing of 1788 .bb files complete (0 cached, 1788 parsed). 2296 targets, 3=
51 skipped, 1 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "1.26.0"
BUILD_SYS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "x86_64-linux=
"
NATIVELSBSTRING=C2=A0=C2=A0 =3D "Ubuntu-15.04"
TARGET_SYS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "arm-poky-linux-gn=
ueabi"
MACHINE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "be=
aglebone"
DISTRO=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D "poky"
DISTRO_VERSION=C2=A0=C2=A0=C2=A0 =3D "1.8"
TUNE_FEATURES=C2=A0=C2=A0=C2=A0=C2=A0 =3D "arm armv7a vfp thumb neon callco=
nvention-hard cortexa8"
TARGET_FPU=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "vfp-neon"
meta-embarcados=C2=A0=C2=A0=20
meta-bbb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "fido:df=
b2e27bf26b109fc6ccb3bc91924fb3bb24f655"
meta-ti=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "fi=
do:a666b94e9c676711f1389c0628e6c883ef20d5b3"
meta-qt5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "fido:fc=
026381545650e10fdd488d5b2a3b2d78f87793"
meta-oe=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
meta-ruby=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
meta-perl=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
meta-efl=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
meta-multimedia=C2=A0=C2=A0 =3D "fido:10d3c8f85280a0bf867a8e4f84bcda81c290d=
28e"
meta=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=20
meta-yocto=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "fido:08d325904115=
68e7bf11612ac695a6e9c6df6286"

NOTE: Preparing RunQueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
WARNING: /home/PC/bbb/build_spain/tmp/work/beaglebone-poky-linux-gnueabi/fb=
set-modes/0.1.0-r6/fbset-modes-0.1.0 ('S') doesn't exist, please set 'S' to=
 a proper value
WARNING: /home/PC/bbb/build_spain/tmp/work/beaglebone-poky-linux-gnueabi/om=
ap3-sgx-modules/5.01.01.02-r22b/Graphics_SDK_5_01_01_02/GFX_Linux_KM ('S') =
doesn't exist, please set 'S' to a proper value
WARNING: /home/PC/bbb/build_spain/tmp/work/cortexa8hf-vfp-neon-poky-linux-g=
nueabi/libgles-omap3/5.01.01.02-r38.1/Graphics_SDK_5_01_01_02 ('S') doesn't=
 exist, please set 'S' to a proper value
WARNING: QA Issue: libgles-omap3-blitwsegl-es3 requires libpvr2d.so, but no=
 providers in its RDEPENDS [file-rdeps]
WARNING: QA Issue: libgles-omap3-blitwsegl-es5 requires libpvr2d.so, but no=
 providers in its RDEPENDS [file-rdeps]
WARNING: QA Issue: libgles-omap3-blitwsegl-es6 requires libpvr2d.so, but no=
 providers in its RDEPENDS [file-rdeps]
WARNING: QA Issue: libgles-omap3-blitwsegl-es8 requires libpvr2d.so, but no=
 providers in its RDEPENDS [file-rdeps]
WARNING: QA Issue: libgles-omap3-blitwsegl-es9 requires libpvr2d.so, but no=
 providers in its RDEPENDS [file-rdeps]
WARNING: QA Issue: libgles-omap3-flipwsegl-es3 requires libpvr2d.so, but no=
 providers in its RDEPENDS [file-rdeps]
WARNING: QA Issue: libgles-omap3-flipwsegl-es5 requires libpvr2d.so, but no=
 providers in its RDEPENDS [file-rdeps]
WARNING: QA Issue: libgles-omap3-flipwsegl-es6 requires libpvr2d.so, but no=
 providers in its RDEPENDS [file-rdeps]
WARNING: QA Issue: libgles-omap3-flipwsegl-es8 requires libpvr2d.so, but no=
 providers in its RDEPENDS [file-rdeps]
WARNING: QA Issue: libgles-omap3-flipwsegl-es9 requires libpvr2d.so, but no=
 providers in its RDEPENDS [file-rdeps]
WARNING: QA Issue: libgles-omap3-frontwsegl-es3 requires libpvr2d.so, but n=
o providers in its RDEPENDS [file-rdeps]
WARNING: QA Issue: libgles-omap3-frontwsegl-es5 requires libpvr2d.so, but n=
o providers in its RDEPENDS [file-rdeps]
WARNING: QA Issue: libgles-omap3-frontwsegl-es6 requires libpvr2d.so, but n=
o providers in its RDEPENDS [file-rdeps]
WARNING: QA Issue: libgles-omap3-frontwsegl-es8 requires libpvr2d.so, but n=
o providers in its RDEPENDS [file-rdeps]
WARNING: QA Issue: libgles-omap3-frontwsegl-es9 requires libpvr2d.so, but n=
o providers in its RDEPENDS [file-rdeps]
WARNING: QA Issue: libgles-omap3-linuxfbwsegl-es3 requires libpvr2d.so, but=
 no providers in its RDEPENDS [file-rdeps]
WARNING: QA Issue: libgles-omap3-linuxfbwsegl-es5 requires libpvr2d.so, but=
 no providers in its RDEPENDS [file-rdeps]
WARNING: QA Issue: libgles-omap3-linuxfbwsegl-es6 requires libpvr2d.so, but=
 no providers in its RDEPENDS [file-rdeps]
WARNING: QA Issue: libgles-omap3-linuxfbwsegl-es8 requires libpvr2d.so, but=
 no providers in its RDEPENDS [file-rdeps]
WARNING: QA Issue: libgles-omap3-linuxfbwsegl-es9 requires libpvr2d.so, but=
 no providers in its RDEPENDS [file-rdeps]
WARNING: QA Issue: libgles-omap3-blitwsegl requires libpvr2d.so, but no pro=
viders in its RDEPENDS [file-rdeps]
WARNING: QA Issue: libgles-omap3-flipwsegl requires libpvr2d.so, but no pro=
viders in its RDEPENDS [file-rdeps]
WARNING: QA Issue: libgles-omap3-frontwsegl requires libpvr2d.so, but no pr=
oviders in its RDEPENDS [file-rdeps]
WARNING: QA Issue: libgles-omap3-linuxfbwsegl requires libpvr2d.so, but no =
providers in its RDEPENDS [file-rdeps]
WARNING: QA Issue: libgles-omap3-es3 requires libEGL.so, libIMGegl.so, libe=
ws.so, libXext.so.6, libusc.so, libpvr2d.so, libsrv_init.so, libX11.so.6, l=
ibdrm.so.2, libGLES_CM.so, libGLESv2.so, libsrv_um.so, libXfixes.so.3, but =
no providers in its RDEPENDS [file-rdeps]
WARNING: QA Issue: libgles-omap3-es5 requires libEGL.so, libIMGegl.so, libe=
ws.so, libXext.so.6, libusc.so, libpvr2d.so, libsrv_init.so, libX11.so.6, l=
d-linux.so.3(GLIBC_2.4), ld-linux.so.3, libdrm.so.2, libGLES_CM.so, libGLES=
v2.so, libsrv_um.so, libXfixes.so.3, but no providers in its RDEPENDS [file=
-rdeps]
WARNING: QA Issue: libgles-omap3-es6 requires libIMGegl.so, libXext.so.6, l=
ibusc.so, libpvr2d.so, libsrv_init.so, libX11.so.6, libdrm.so.2, libsrv_um.=
so, libXfixes.so.3, but no providers in its RDEPENDS [file-rdeps]
WARNING: QA Issue: libgles-omap3-es8 requires libIMGegl.so, libXext.so.6, l=
ibusc.so, libpvr2d.so, libsrv_init.so, libX11.so.6, libdrm.so.2, libsrv_um.=
so, libXfixes.so.3, but no providers in its RDEPENDS [file-rdeps]
WARNING: QA Issue: libgles-omap3-es9 requires libIMGegl.so, libXext.so.6, l=
ibusc.so, libpvr2d.so, libsrv_init.so, libX11.so.6, libdrm.so.2, libsrv_um.=
so, libXfixes.so.3, but no providers in its RDEPENDS [file-rdeps]
WARNING: QA Issue: libgles-omap3-rawdemos requires libEGL.so, libGLESv2.so,=
 libGLES_CM.so, but no providers in its RDEPENDS [file-rdeps]
WARNING: QA Issue: libgles-omap3-tests requires libpvr2d.so, libsrv_um.so, =
but no providers in its RDEPENDS [file-rdeps]
NOTE: Tasks Summary: Attempted 791 tasks of which 0 didn't need to be rerun=
 and all succeeded.

Summary: There were 35 WARNING messages shown.
PC@PC:~/bbb/build_spain$=20
PC@PC:~/bbb/build_spain$=20
PC@PC:~/bbb/build_spain$=20


=20


     Benjamin Bimmermann <b.bimmermann@yahoo.de> schrieb am 10:30 Samstag, =
15.August 2015:
  =20

 Denys,=C2=A0ok. So if I like to use libgles-omap3 I must use the old Linux=
 3.14 Kernel?=C2=A0Three=C2=A0Questions:1. What=C2=A0I must=C2=A0add / Chan=
ge to build with the Kernel 3.14?2. Is for the new=C2=A0Kernel a Driver, wi=
th full grafic support that worked with QT5 ?
2.1.: Best without X11.3. What would you think it=C2=A0is better the Driver=
 with the=E2=80=9Dold=E2=80=9D Kernel 3.14 or theanswer of question two?=C2=
=A0Thanks for the fast answer.=C2=A0=C2=A0Benjamin=20


     Denys Dmytriyenko <denys@ti.com> schrieb am 2:50 Samstag, 15.August 20=
15:
  =20

 Benjamin,

Version 5.1.1.2 of libgles-omap3 only builds and works against version 3.14=
 of=20
linux-ti-staging kernel in meta-ti. The corresponding update to libgles-oma=
p3=20
to build against 4.1 kernel hasn't been released yet.

--=20
Denys


On Sat, Aug 15, 2015 at 12:41:50AM +0000, Benjamin Bimmermann wrote:
> Hello,
> i like to build the libgles-omap3 for the BeagleBoneBlack, but i get the =
error :=20
> sgx-omap.h: No such file or directory
> |=C2=A0 #include <linux/platform_data/sgx-omap.h>.
> I try to create QT5 for the BeagleboneBlack. I have found and work on thi=
s tutorial:http://www.embarcados.com.br/beaglebone-black-qt5-yocto-parte-1/=
Code: https://bitbucket.org/embarcados/meta-embarcados/src
>=20
> He has the error in part2 of the tutorial and say that i must make :bitba=
ke -c cleansstate libgles-omap3bitbake libgles-omap3
> but that not solve the Problem. Every Time I get this Error.
> I have only change the bblayer.conf and the local.conf file. All other Fi=
les are from git and I have not change anything.
> I hope you can help me.
>=20
>=20
>=20
> -------------------------------------------------------------------------=
--------------------------------------------------
> My bblayer.conf:LCONF_VERSION =3D "6"
> BBPATH =3D "${TOPDIR}"
> BBFILES ?=3D ""
> BBLAYERS ?=3D " \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${HOME}/bbb/meta-e=
mbarcados \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${HOME}/bbb/meta-e=
mbarcados/meta-bbb \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${HOME}/bbb/meta-t=
i \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${HOME}/poky-fido/=
meta-qt5 \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${HOME}/poky-fido/=
meta-openembedded/meta-oe \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${HOME}/poky-fido/=
meta-openembedded/meta-ruby \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${HOME}/poky-fido/=
meta-openembedded/meta-perl \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${HOME}/poky-fido/=
meta-openembedded/meta-efl \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${HOME}/poky-fido/=
meta-openembedded/meta-multimedia \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${HOME}/poky-fido/=
meta \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${HOME}/poky-fido/=
meta-yocto \ "
> BBLAYERS_NON_REMOVABLE ?=3D " \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${HOME}/poky-fido/meta \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${HOME}/poky-fido/meta-y=
octo \
> =C2=A0 "
> -------------------------------------------------------------------------=
--------------------------------------------------
> My local.conf:BB_NUMBER_THREADS =3D "7"
> PARALLEL_MAKE =3D "-j7"
> LICENSE_FLAGS_WHITELIST =3D "commercial"
> MACHINE =3D "beaglebone"
> DISTRO =3D "poky"
> PACKAGE_CLASSES =3D "package_deb"
> EXTRA_IMAGE_FEATURES =3D "debug-tweaks"
> CONF_VERSION =3D "1"
> DISTRO_FEATURES_remove =3D "x11 wayland"
> BBMASK =3D "meta-embarcados/recipes-browser/chromium/chromium_%.bbappend"
>=20
> -------------------------------------------------------------------------=
--------------------------------------------------
> And the complete LOG:
> PC@PC:~/bbb/build_spain$ bitbake libgles-omap3
> WARNING: Host distribution "Ubuntu-15.04" has not been validated with thi=
s version of the build system; you may possibly experience unexpected failu=
res. It is recommended that you use a tested distribution.
> Parsing recipes: 100% |##################################################=
###########################################################################=
#########################################| Time: 00:00:29
> Parsing of 1788 .bb files complete (0 cached, 1788 parsed). 2296 targets,=
 351 skipped, 1 masked, 0 errors.
> NOTE: Resolving any missing task queue dependencies
>=20
> Build Configuration:
> BB_VERSION=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "1.26.0"
> BUILD_SYS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "x86_64-lin=
ux"
> NATIVELSBSTRING=C2=A0=C2=A0 =3D "Ubuntu-15.04"
> TARGET_SYS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "arm-poky-linux-=
gnueabi"
> MACHINE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "=
beaglebone"
> DISTRO=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D "poky"
> DISTRO_VERSION=C2=A0=C2=A0=C2=A0 =3D "1.8"
> TUNE_FEATURES=C2=A0=C2=A0=C2=A0=C2=A0 =3D "arm armv7a vfp thumb neon call=
convention-hard cortexa8"
> TARGET_FPU=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "vfp-neon"
> meta-embarcados=C2=A0=C2=A0=20
> meta-bbb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "fido:=
dfb2e27bf26b109fc6ccb3bc91924fb3bb24f655"
> meta-ti=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "=
fido:a666b94e9c676711f1389c0628e6c883ef20d5b3"
> meta-qt5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "fido:=
fc026381545650e10fdd488d5b2a3b2d78f87793"
> meta-oe=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> meta-ruby=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> meta-perl=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> meta-efl=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> meta-multimedia=C2=A0=C2=A0 =3D "fido:10d3c8f85280a0bf867a8e4f84bcda81c29=
0d28e"
> meta=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=20
> meta-yocto=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "fido:08d3259041=
1568e7bf11612ac695a6e9c6df6286"
>=20
> NOTE: Preparing RunQueue
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> ERROR: Function failed: do_compile (log file is located at /home/PC/bbb/b=
uild_spain/tmp/work/beaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01=
.02-r22b/temp/log.do_compile.25613)
> ERROR: Logfile of failure stored in: /home/PC/bbb/build_spain/tmp/work/be=
aglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.02-r22b/temp/log.do_c=
ompile.25613
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | NOTE: make -j7 -e MAKEFLAGS=3D KERNEL_SRC=3D/home/PC/bbb/build_spain/tm=
p/work-shared/beaglebone/kernel-source KERNEL_PATH=3D/home/PC/bbb/build_spa=
in/tmp/work-shared/beaglebone/kernel-source KERNEL_VERSION=3D4.1.5 CC=3Darm=
-poky-linux-gnueabi-gcc=C2=A0 -mno-thumb-interwork -marm LD=3Darm-poky-linu=
x-gnueabi-ld.bfd=C2=A0=C2=A0 AR=3Darm-poky-linux-gnueabi-ar=C2=A0 O=3D/home=
/PC/bbb/build_spain/tmp/work-shared/beaglebone/kernel-build-artifacts BUILD=
=3Drelease TI_PLATFORM=3Dti335x SUPPORT_XORG=3D
> | make -C /home/PC/bbb/build_spain/tmp/work-shared/beaglebone/kernel-sour=
ce M=3D`pwd`
> | make[1]: Entering directory '/home/PC/bbb/build_spain/tmp/work-shared/b=
eaglebone/kernel-source'
> | make[2]: Entering directory '/home/PC/bbb/build_spain/tmp/work-shared/b=
eaglebone/kernel-build-artifacts'
> |=C2=A0=C2=A0 CC [M]=C2=A0 /home/PC/bbb/build_spain/tmp/work/beaglebone-p=
oky-linux-gnueabi/omap3-sgx-modules/5.01.01.02-r22b/Graphics_SDK_5_01_01_02=
/GFX_Linux_KM/services4/srvkm/env/linux/module.o
> | /home/PC/bbb/build_spain/tmp/work/beaglebone-poky-linux-gnueabi/omap3-s=
gx-modules/5.01.01.02-r22b/Graphics_SDK_5_01_01_02/GFX_Linux_KM/services4/s=
rvkm/env/linux/module.c:51:42: fatal error: linux/platform_data/sgx-omap.h:=
 No such file or directory
> |=C2=A0 #include <linux/platform_data/sgx-omap.h>
> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^
> | compilation terminated.
> | /home/PC/bbb/build_spain/tmp/work-shared/beaglebone/kernel-source/scrip=
ts/Makefile.build:258: recipe for target '/home/PC/bbb/build_spain/tmp/work=
/beaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.02-r22b/Graphics_S=
DK_5_01_01_02/GFX_Linux_KM/services4/srvkm/env/linux/module.o' failed
> | make[3]: *** [/home/PC/bbb/build_spain/tmp/work/beaglebone-poky-linux-g=
nueabi/omap3-sgx-modules/5.01.01.02-r22b/Graphics_SDK_5_01_01_02/GFX_Linux_=
KM/services4/srvkm/env/linux/module.o] Error 1
> | /home/PC/bbb/build_spain/tmp/work-shared/beaglebone/kernel-source/Makef=
ile:1384: recipe for target '_module_/home/PC/bbb/build_spain/tmp/work/beag=
lebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.02-r22b/Graphics_SDK_5_=
01_01_02/GFX_Linux_KM' failed
> | make[2]: *** [_module_/home/PC/bbb/build_spain/tmp/work/beaglebone-poky=
-linux-gnueabi/omap3-sgx-modules/5.01.01.02-r22b/Graphics_SDK_5_01_01_02/GF=
X_Linux_KM] Error 2
> | make[2]: Leaving directory '/home/PC/bbb/build_spain/tmp/work-shared/be=
aglebone/kernel-build-artifacts'
> | Makefile:146: recipe for target 'sub-make' failed
> | make[1]: *** [sub-make] Error 2
> | make[1]: Leaving directory '/home/PC/bbb/build_spain/tmp/work-shared/be=
aglebone/kernel-source'
> | Makefile:478: recipe for target 'all' failed
> | make: *** [all] Error 2
> | ERROR: oe_runmake failed
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_compile (log file is located at /home/PC/bbb=
/build_spain/tmp/work/beaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.=
01.02-r22b/temp/log.do_compile.25613)
> ERROR: Task 119 (/home/PC/bbb/meta-ti/recipes-bsp/powervr-drivers/omap3-s=
gx-modules_5.01.01.02.bb, do_compile) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 731 tasks of which 720 didn't need to be r=
erun and 1 failed.
> Waiting for 0 running tasks to finish:
>=20
> Summary: 1 task failed:
> =C2=A0 /home/PC/bbb/meta-ti/recipes-bsp/powervr-drivers/omap3-sgx-modules=
_5.01.01.02.bb, do_compile
> Summary: There was 1 WARNING message shown.
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
> PC@PC:~/bbb/build_spain
>=20
> -------------------------------------------------------------------------=
--------------------------------------------------
>=20
> Thank you for your Time and I hope you can help me.Have a nice day.

> --=20
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti



  =20
--=20
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti


  

------=_Part_5605768_1237456081.1439737469464
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><body><div style=3D"color:#000; background-color:#fff; font-family:ti=
mes new roman, new york, times, serif;font-size:16px"><div id=3D"yui_3_16_0=
_1_1439736393909_9390"></div><div class=3D"" id=3D"yui_3_16_0_1_14397363939=
09_5089" dir=3D"ltr">&gt;&gt;Denys</div><div class=3D"" id=3D"yui_3_16_0_1_=
1439736393909_5727">&gt;&gt;Version 5.1.1.2 of libgles-omap3 only builds an=
d works against version 3.14 of&nbsp; linux-ti-staging kernel in meta-ti</d=
iv><div class=3D"" id=3D"yui_3_16_0_1_1439736393909_5726"><br class=3D""></=
div><div class=3D"" id=3D"yui_3_16_0_1_1439736393909_5114">&gt;Benjamin<br =
class=3D""></div><div class=3D"" dir=3D"ltr" id=3D"yui_3_16_0_1_14397363939=
09_5475">&gt;<span class=3D"" id=3D"yiv8794131222yui_3_16_0_1_1439627250773=
_4103" style=3D"font-size:12pt;" lang=3D"EN-US"><font class=3D"" id=3D"yiv8=
794131222yui_3_16_0_1_1439627250773_4102" face=3D"Calibri Regular">Three&nb=
sp;Questions:</font></span></div><div class=3D"" dir=3D"ltr" id=3D"yui_3_16=
_0_1_1439736393909_5115">&gt;<span class=3D"" id=3D"yiv8794131222yui_3_16_0=
_1_1439600919800_16170" style=3D"font-size:12pt;" lang=3D"EN-US"><font clas=
s=3D"" id=3D"yiv8794131222yui_3_16_0_1_1439600919800_16169" face=3D"Calibri=
 Regular">1. What&nbsp;</font></span><span class=3D"" id=3D"yiv8794131222yu=
i_3_16_0_1_1439600919800_16170" style=3D"font-size:12pt;" lang=3D"EN-US"><f=
ont class=3D"" id=3D"yiv8794131222yui_3_16_0_1_1439600919800_16169" face=3D=
"Calibri Regular">must </font></span><span class=3D"" id=3D"yiv8794131222yu=
i_3_16_0_1_1439600919800_16170" style=3D"font-size:12pt;" lang=3D"EN-US"><f=
ont class=3D"" id=3D"yiv8794131222yui_3_16_0_1_1439600919800_16169" face=3D=
"Calibri Regular">I add / change to build with the Kernel 3.14?</font></spa=
n></div><div class=3D"" id=3D"yui_3_16_0_1_1439736393909_8269" dir=3D"ltr">=
<br class=3D""><span class=3D"" id=3D"yiv8794131222yui_3_16_0_1_14396009198=
00_16170" style=3D"font-size:12pt;" lang=3D"EN-US"></span></div><div class=
=3D"" id=3D"yui_3_16_0_1_1439736393909_8019" dir=3D"ltr"><span class=3D"" i=
d=3D"yiv8794131222yui_3_16_0_1_1439600919800_16170" style=3D"font-size:12pt=
;" lang=3D"EN-US"><font class=3D"" id=3D"yiv8794131222yui_3_16_0_1_14396009=
19800_16169" face=3D"Calibri Regular">I have found it out, I think.</font><=
/span></div><div class=3D"" id=3D"yui_3_16_0_1_1439736393909_6364" dir=3D"l=
tr"><span class=3D"" id=3D"yiv8794131222yui_3_16_0_1_1439600919800_16170" s=
tyle=3D"font-size:12pt;" lang=3D"EN-US"><font class=3D"" id=3D"yiv879413122=
2yui_3_16_0_1_1439600919800_16169" face=3D"Calibri Regular">I have added to=
 the local.conf :</font></span></div><span class=3D"" id=3D"yiv8794131222yu=
i_3_16_0_1_1439600919800_16170" style=3D"font-size:12pt;" lang=3D"EN-US"><f=
ont class=3D"" id=3D"yiv8794131222yui_3_16_0_1_1439600919800_16169" face=3D=
"Calibri Regular">PREFERRED_VERSION_linux-yocto =3D "3.14%"<br class=3D""><=
/font></span><div id=3D"yui_3_16_0_1_1439736393909_9416" dir=3D"ltr"><span =
class=3D"" id=3D"yiv8794131222yui_3_16_0_1_1439600919800_16170" style=3D"fo=
nt-size:12pt;" lang=3D"EN-US"><font class=3D"" id=3D"yiv8794131222yui_3_16_=
0_1_1439600919800_16169" face=3D"Calibri Regular">PREFERRED_VERSION_linux-t=
i-staging =3D "3.14%"</font></span></div><div id=3D"yui_3_16_0_1_1439736393=
909_9528" dir=3D"ltr"><br></div><div id=3D"yui_3_16_0_1_1439736393909_10041=
" dir=3D"ltr">I think now he builds the 3.14 Kernel ;). <br></div><div id=
=3D"yui_3_16_0_1_1439736393909_10688" dir=3D"ltr"><br></div><div id=3D"yui_=
3_16_0_1_1439736393909_10689" dir=3D"ltr">But now I have a warning and I do=
n't know exactly what it means and what I should do.</div><div id=3D"yui_3_=
16_0_1_1439736393909_11344" dir=3D"ltr">The Warning :</div><div id=3D"yui_3=
_16_0_1_1439736393909_11991" dir=3D"ltr">WARNING: QA Issue: libgles-omap3-f=
rontwsegl-es3 requires libpvr2d.so, but no providers in its RDEPENDS [file-=
rdeps]</div><div id=3D"yui_3_16_0_1_1439736393909_11992" dir=3D"ltr"><br></=
div><div id=3D"yui_3_16_0_1_1439736393909_14030" dir=3D"ltr">I think that m=
eans, that I can get a possible Runtime-Error, because libgles-omap3 needs =
at the runtime libpvr2d.</div><div id=3D"yui_3_16_0_1_1439736393909_15340" =
dir=3D"ltr"><br></div><div id=3D"yui_3_16_0_1_1439736393909_15342" dir=3D"l=
tr">Three more Questions:<br></div><div id=3D"yui_3_16_0_1_1439736393909_15=
341" dir=3D"ltr">1.:How can I check that bitbake has build the libpvr2d ?</=
div><div id=3D"yui_3_16_0_1_1439736393909_16656" dir=3D"ltr">2.: What I can=
 add to the <span class=3D"" id=3D"yiv8794131222yui_3_16_0_1_1439600919800_=
16170" style=3D"font-size:12pt;" lang=3D"EN-US"><font class=3D"" id=3D"yiv8=
794131222yui_3_16_0_1_1439600919800_16169" face=3D"Calibri Regular">local.c=
onf to be sure that the </font></span>libpvr2d is build every time ?</div><=
div id=3D"yui_3_16_0_1_1439736393909_16664" dir=3D"ltr">3.: Is there an uns=
table / inprogress libgles-omap3 Version for the Kernel 4.1 which I can try=
? <br></div><div id=3D"yui_3_16_0_1_1439736393909_20613" dir=3D"ltr">&nbsp;=
&nbsp;&nbsp;&nbsp; Is it possible to be involved in the programming of the =
libgles-omap3 driver ?</div><div id=3D"yui_3_16_0_1_1439736393909_21948" di=
r=3D"ltr"><br></div><div id=3D"yui_3_16_0_1_1439736393909_25209" dir=3D"ltr=
"><br></div><div id=3D"yui_3_16_0_1_1439736393909_25463" dir=3D"ltr">Have a=
 nice day.<br></div><div id=3D"yui_3_16_0_1_1439736393909_14031" dir=3D"ltr=
"><br></div><div id=3D"yui_3_16_0_1_1439736393909_14032" dir=3D"ltr"><br></=
div><div id=3D"yui_3_16_0_1_1439736393909_25462" dir=3D"ltr">--------------=
---------------------------------------------------------------------------=
---------<br></div><div id=3D"yui_3_16_0_1_1439736393909_25459" dir=3D"ltr"=
><br></div><div id=3D"yui_3_16_0_1_1439736393909_25460" dir=3D"ltr"><br></d=
iv><div id=3D"yui_3_16_0_1_1439736393909_25461" dir=3D"ltr">The Log:<br></d=
iv><div id=3D"yui_3_16_0_1_1439736393909_11346" dir=3D"ltr">PC@PC:~/bbb/bui=
ld_spain$ bitbake libgles-omap3<br class=3D"">WARNING: Host distribution "U=
buntu-15.04" has not been validated with this version of the build system; =
you may possibly experience unexpected failures. It is recommended that you=
 use a tested distribution.<br class=3D"">Parsing recipes: 100% |##########=
###########################################################################=
###########################################################################=
######| Time: 00:00:51<br class=3D"">Parsing of 1788 .bb files complete (0 =
cached, 1788 parsed). 2296 targets, 351 skipped, 1 masked, 0 errors.<br cla=
ss=3D"">NOTE: Resolving any missing task queue dependencies<br class=3D""><=
br class=3D"">Build Configuration:<br class=3D"">BB_VERSION&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; =3D "1.26.0"<br class=3D"">BUILD_SYS&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D "x86_64-linux"<br class=3D"">NATIV=
ELSBSTRING&nbsp;&nbsp; =3D "Ubuntu-15.04"<br class=3D"">TARGET_SYS&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D "arm-poky-linux-gnueabi"<br class=3D"=
">MACHINE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D "=
beaglebone"<br class=3D"">DISTRO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; =3D "poky"<br class=3D"">DISTRO_VERSION&nbsp;&nbsp;=
&nbsp; =3D "1.8"<br class=3D"">TUNE_FEATURES&nbsp;&nbsp;&nbsp;&nbsp; =3D "a=
rm armv7a vfp thumb neon callconvention-hard cortexa8"<br class=3D"">TARGET=
_FPU&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D "vfp-neon"<br class=3D""=
>meta-embarcados&nbsp;&nbsp; <br class=3D"">meta-bbb&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D "fido:dfb2e27bf26b109fc6ccb3bc91924fb3b=
b24f655"<br class=3D"">meta-ti&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; =3D "fido:a666b94e9c676711f1389c0628e6c883ef20d5b3"<br clas=
s=3D"">meta-qt5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D "=
fido:fc026381545650e10fdd488d5b2a3b2d78f87793"<br class=3D"">meta-oe&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br class=3D"">meta-r=
uby&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br class=3D"">meta-per=
l&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br class=3D"">meta-efl&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br class=3D"">meta-mu=
ltimedia&nbsp;&nbsp; =3D "fido:10d3c8f85280a0bf867a8e4f84bcda81c290d28e"<br=
 class=3D"">meta&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; <br class=3D"">meta-yocto&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; =3D "fido:08d32590411568e7bf11612ac695a6e9c6df6286"<br class=
=3D""><br class=3D"">NOTE: Preparing RunQueue<br class=3D"">NOTE: Executing=
 SetScene Tasks<br class=3D"">NOTE: Executing RunQueue Tasks<br class=3D"">=
WARNING: /home/PC/bbb/build_spain/tmp/work/beaglebone-poky-linux-gnueabi/fb=
set-modes/0.1.0-r6/fbset-modes-0.1.0 ('S') doesn't exist, please set 'S' to=
 a proper value<br class=3D"">WARNING: /home/PC/bbb/build_spain/tmp/work/be=
aglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.02-r22b/Graphics_SDK_=
5_01_01_02/GFX_Linux_KM ('S') doesn't exist, please set 'S' to a proper val=
ue<br class=3D"">WARNING: /home/PC/bbb/build_spain/tmp/work/cortexa8hf-vfp-=
neon-poky-linux-gnueabi/libgles-omap3/5.01.01.02-r38.1/Graphics_SDK_5_01_01=
_02 ('S') doesn't exist, please set 'S' to a proper value<br class=3D"">WAR=
NING: QA Issue: libgles-omap3-blitwsegl-es3 requires libpvr2d.so, but no pr=
oviders in its RDEPENDS [file-rdeps]<br class=3D"">WARNING: QA Issue: libgl=
es-omap3-blitwsegl-es5 requires libpvr2d.so, but no providers in its RDEPEN=
DS [file-rdeps]<br class=3D"">WARNING: QA Issue: libgles-omap3-blitwsegl-es=
6 requires libpvr2d.so, but no providers in its RDEPENDS [file-rdeps]<br cl=
ass=3D"">WARNING: QA Issue: libgles-omap3-blitwsegl-es8 requires libpvr2d.s=
o, but no providers in its RDEPENDS [file-rdeps]<br class=3D"">WARNING: QA =
Issue: libgles-omap3-blitwsegl-es9 requires libpvr2d.so, but no providers i=
n its RDEPENDS [file-rdeps]<br class=3D"">WARNING: QA Issue: libgles-omap3-=
flipwsegl-es3 requires libpvr2d.so, but no providers in its RDEPENDS [file-=
rdeps]<br class=3D"">WARNING: QA Issue: libgles-omap3-flipwsegl-es5 require=
s libpvr2d.so, but no providers in its RDEPENDS [file-rdeps]<br class=3D"">=
WARNING: QA Issue: libgles-omap3-flipwsegl-es6 requires libpvr2d.so, but no=
 providers in its RDEPENDS [file-rdeps]<br class=3D"">WARNING: QA Issue: li=
bgles-omap3-flipwsegl-es8 requires libpvr2d.so, but no providers in its RDE=
PENDS [file-rdeps]<br class=3D"">WARNING: QA Issue: libgles-omap3-flipwsegl=
-es9 requires libpvr2d.so, but no providers in its RDEPENDS [file-rdeps]<br=
 class=3D"">WARNING: QA Issue: libgles-omap3-frontwsegl-es3 requires libpvr=
2d.so, but no providers in its RDEPENDS [file-rdeps]<br class=3D"">WARNING:=
 QA Issue: libgles-omap3-frontwsegl-es5 requires libpvr2d.so, but no provid=
ers in its RDEPENDS [file-rdeps]<br class=3D"">WARNING: QA Issue: libgles-o=
map3-frontwsegl-es6 requires libpvr2d.so, but no providers in its RDEPENDS =
[file-rdeps]<br class=3D"">WARNING: QA Issue: libgles-omap3-frontwsegl-es8 =
requires libpvr2d.so, but no providers in its RDEPENDS [file-rdeps]<br clas=
s=3D"">WARNING: QA Issue: libgles-omap3-frontwsegl-es9 requires libpvr2d.so=
, but no providers in its RDEPENDS [file-rdeps]<br class=3D"">WARNING: QA I=
ssue: libgles-omap3-linuxfbwsegl-es3 requires libpvr2d.so, but no providers=
 in its RDEPENDS [file-rdeps]<br class=3D"">WARNING: QA Issue: libgles-omap=
3-linuxfbwsegl-es5 requires libpvr2d.so, but no providers in its RDEPENDS [=
file-rdeps]<br class=3D"">WARNING: QA Issue: libgles-omap3-linuxfbwsegl-es6=
 requires libpvr2d.so, but no providers in its RDEPENDS [file-rdeps]<br cla=
ss=3D"">WARNING: QA Issue: libgles-omap3-linuxfbwsegl-es8 requires libpvr2d=
.so, but no providers in its RDEPENDS [file-rdeps]<br class=3D"">WARNING: Q=
A Issue: libgles-omap3-linuxfbwsegl-es9 requires libpvr2d.so, but no provid=
ers in its RDEPENDS [file-rdeps]<br class=3D"">WARNING: QA Issue: libgles-o=
map3-blitwsegl requires libpvr2d.so, but no providers in its RDEPENDS [file=
-rdeps]<br class=3D"">WARNING: QA Issue: libgles-omap3-flipwsegl requires l=
ibpvr2d.so, but no providers in its RDEPENDS [file-rdeps]<br class=3D"">WAR=
NING: QA Issue: libgles-omap3-frontwsegl requires libpvr2d.so, but no provi=
ders in its RDEPENDS [file-rdeps]<br class=3D"">WARNING: QA Issue: libgles-=
omap3-linuxfbwsegl requires libpvr2d.so, but no providers in its RDEPENDS [=
file-rdeps]<br class=3D"">WARNING: QA Issue: libgles-omap3-es3 requires lib=
EGL.so, libIMGegl.so, libews.so, libXext.so.6, libusc.so, libpvr2d.so, libs=
rv_init.so, libX11.so.6, libdrm.so.2, libGLES_CM.so, libGLESv2.so, libsrv_u=
m.so, libXfixes.so.3, but no providers in its RDEPENDS [file-rdeps]<br clas=
s=3D"">WARNING: QA Issue: libgles-omap3-es5 requires libEGL.so, libIMGegl.s=
o, libews.so, libXext.so.6, libusc.so, libpvr2d.so, libsrv_init.so, libX11.=
so.6, ld-linux.so.3(GLIBC_2.4), ld-linux.so.3, libdrm.so.2, libGLES_CM.so, =
libGLESv2.so, libsrv_um.so, libXfixes.so.3, but no providers in its RDEPEND=
S [file-rdeps]<br class=3D"">WARNING: QA Issue: libgles-omap3-es6 requires =
libIMGegl.so, libXext.so.6, libusc.so, libpvr2d.so, libsrv_init.so, libX11.=
so.6, libdrm.so.2, libsrv_um.so, libXfixes.so.3, but no providers in its RD=
EPENDS [file-rdeps]<br class=3D"">WARNING: QA Issue: libgles-omap3-es8 requ=
ires libIMGegl.so, libXext.so.6, libusc.so, libpvr2d.so, libsrv_init.so, li=
bX11.so.6, libdrm.so.2, libsrv_um.so, libXfixes.so.3, but no providers in i=
ts RDEPENDS [file-rdeps]<br class=3D"">WARNING: QA Issue: libgles-omap3-es9=
 requires libIMGegl.so, libXext.so.6, libusc.so, libpvr2d.so, libsrv_init.s=
o, libX11.so.6, libdrm.so.2, libsrv_um.so, libXfixes.so.3, but no providers=
 in its RDEPENDS [file-rdeps]<br class=3D"">WARNING: QA Issue: libgles-omap=
3-rawdemos requires libEGL.so, libGLESv2.so, libGLES_CM.so, but no provider=
s in its RDEPENDS [file-rdeps]<br class=3D"">WARNING: QA Issue: libgles-oma=
p3-tests requires libpvr2d.so, libsrv_um.so, but no providers in its RDEPEN=
DS [file-rdeps]<br class=3D"">NOTE: Tasks Summary: Attempted 791 tasks of w=
hich 0 didn't need to be rerun and all succeeded.<br class=3D""><br class=
=3D"">Summary: There were 35 WARNING messages shown.<br class=3D"">PC@PC:~/=
bbb/build_spain$ <br class=3D"">PC@PC:~/bbb/build_spain$ <br class=3D"">PC@=
PC:~/bbb/build_spain$ <br class=3D""><br><span class=3D"" id=3D"yiv87941312=
22yui_3_16_0_1_1439600919800_16170" style=3D"font-size:12pt;" lang=3D"EN-US=
"></span></div><div id=3D"yui_3_16_0_1_1439736393909_10687" dir=3D"ltr"><sp=
an class=3D"" id=3D"yiv8794131222yui_3_16_0_1_1439600919800_16170" style=3D=
"font-size:12pt;" lang=3D"EN-US"><font class=3D"" id=3D"yiv8794131222yui_3_=
16_0_1_1439600919800_16169" face=3D"Calibri Regular"><br></font></span>  </=
div><br><div class=3D"qtdSeparateBR"><br><br></div><div style=3D"display: b=
lock;" class=3D"yahoo_quoted"> <div style=3D"font-family: times new roman, =
new york, times, serif; font-size: 16px;"> <div style=3D"font-family: Helve=
ticaNeue, Helvetica Neue, Helvetica, Arial, Lucida Grande, sans-serif; font=
-size: 16px;"> <div dir=3D"ltr"> <font face=3D"Arial" size=3D"2"> Benjamin =
Bimmermann &lt;b.bimmermann@yahoo.de&gt; schrieb am 10:30 Samstag, 15.Augus=
t 2015:<br> </font> </div>  <br><br> <div class=3D"y_msg_container"><div id=
=3D"yiv8794131222"><div><div style=3D"color:#000;background-color:#fff;font=
-family:times new roman, new york, times, serif;font-size:16px;"><div id=3D=
"yiv8794131222yui_3_16_0_1_1439627250773_4099"></div><div class=3D"yiv87941=
31222" id=3D"yiv8794131222yui_3_16_0_1_1439627250773_3010" style=3D"margin:=
0cm 0cm 0pt;line-height:normal;"><span class=3D"yiv8794131222" id=3D"yiv879=
4131222yui_3_16_0_1_1439627250773_3009" style=3D"font-size:12pt;" lang=3D"E=
N-US"><font class=3D"yiv8794131222" id=3D"yiv8794131222yui_3_16_0_1_1439627=
250773_3008" face=3D"Calibri Regular">Denys,</font></span></div><div class=
=3D"yiv8794131222"><font class=3D"yiv8794131222" face=3D"Times New Roman">

</font></div><div class=3D"yiv8794131222" id=3D"yiv8794131222yui_3_16_0_1_1=
439627250773_3012" style=3D"margin:0cm 0cm 0pt;line-height:normal;"><span c=
lass=3D"yiv8794131222" id=3D"yiv8794131222yui_3_16_0_1_1439627250773_4101" =
style=3D"font-size:12pt;" lang=3D"EN-US"><font class=3D"yiv8794131222" id=
=3D"yiv8794131222yui_3_16_0_1_1439627250773_4100" face=3D"Calibri Regular">=
&nbsp;</font></span></div><div class=3D"yiv8794131222"><font class=3D"yiv87=
94131222" face=3D"Times New Roman">

</font></div><div class=3D"yiv8794131222" id=3D"yiv8794131222yui_3_16_0_1_1=
439627250773_3015" style=3D"margin:0cm 0cm 0pt;line-height:normal;"><span c=
lass=3D"yiv8794131222" id=3D"yiv8794131222yui_3_16_0_1_1439627250773_3014" =
style=3D"font-size:12pt;" lang=3D"EN-US"><font class=3D"yiv8794131222" id=
=3D"yiv8794131222yui_3_16_0_1_1439627250773_3013" face=3D"Calibri Regular">=
ok. So if I like to use libgles-omap3 I must use the old Linux 3.14 Kernel?=
</font></span></div><div class=3D"yiv8794131222"><font class=3D"yiv87941312=
22" face=3D"Times New Roman">

</font></div><div class=3D"yiv8794131222" id=3D"yiv8794131222yui_3_16_0_1_1=
439627250773_3016" style=3D"margin:0cm 0cm 0pt;line-height:normal;"><span c=
lass=3D"yiv8794131222" style=3D"font-size:12pt;" lang=3D"EN-US"><font class=
=3D"yiv8794131222" face=3D"Calibri Regular">&nbsp;</font></span></div><div =
class=3D"yiv8794131222"><font class=3D"yiv8794131222" face=3D"Times New Rom=
an">

</font></div><div class=3D"yiv8794131222" id=3D"yiv8794131222yui_3_16_0_1_1=
439600919800_16172" style=3D"margin:0cm 0cm 0pt;line-height:normal;"><span =
class=3D"yiv8794131222" id=3D"yiv8794131222yui_3_16_0_1_1439627250773_4103"=
 style=3D"font-size:12pt;" lang=3D"EN-US"><font class=3D"yiv8794131222" id=
=3D"yiv8794131222yui_3_16_0_1_1439627250773_4102" face=3D"Calibri Regular">=
Three&nbsp;Questions:</font></span></div><div class=3D"yiv8794131222"><font=
 class=3D"yiv8794131222" face=3D"Times New Roman">

</font></div><div class=3D"yiv8794131222" id=3D"yiv8794131222yui_3_16_0_1_1=
439600919800_16171" style=3D"margin:0cm 0cm 0pt;line-height:normal;"><span =
class=3D"yiv8794131222" id=3D"yiv8794131222yui_3_16_0_1_1439600919800_16170=
" style=3D"font-size:12pt;" lang=3D"EN-US"><font class=3D"yiv8794131222" id=
=3D"yiv8794131222yui_3_16_0_1_1439600919800_16169" face=3D"Calibri Regular"=
>1. What&nbsp;I must&nbsp;add / Change to build with the Kernel 3.14?</font=
></span></div><div class=3D"yiv8794131222"><font class=3D"yiv8794131222" fa=
ce=3D"Times New Roman">

</font></div><div class=3D"yiv8794131222" id=3D"yiv8794131222yui_3_16_0_1_1=
439600919800_16167" style=3D"margin:0cm 0cm 0pt;line-height:normal;"><span =
class=3D"yiv8794131222" id=3D"yiv8794131222yui_3_16_0_1_1439600919800_16166=
" style=3D"font-size:12pt;" lang=3D"EN-US"><font class=3D"yiv8794131222" id=
=3D"yiv8794131222yui_3_16_0_1_1439600919800_16165" face=3D"Calibri Regular"=
>2. Is for the new&nbsp;Kernel a Driver, with full grafic support that work=
ed with QT5 ?<br clear=3D"none"></font></span></div><div class=3D"yiv879413=
1222"><font class=3D"yiv8794131222" face=3D"Times New Roman">

</font></div><div class=3D"yiv8794131222" id=3D"yiv8794131222yui_3_16_0_1_1=
439627250773_3007" style=3D"margin:0cm 0cm 0pt;line-height:normal;"><span c=
lass=3D"yiv8794131222" id=3D"yiv8794131222yui_3_16_0_1_1439627250773_3006" =
style=3D"font-size:12pt;" lang=3D"EN-US"><font class=3D"yiv8794131222" id=
=3D"yiv8794131222yui_3_16_0_1_1439627250773_3005" face=3D"Calibri Regular">=
2.1.: Best without X11.</font></span></div><div class=3D"yiv8794131222"><fo=
nt class=3D"yiv8794131222" face=3D"Times New Roman">

</font></div><div class=3D"yiv8794131222" id=3D"yiv8794131222yui_3_16_0_1_1=
439627250773_3004" style=3D"margin:0cm 0cm 0pt;line-height:normal;"><span c=
lass=3D"yiv8794131222" id=3D"yiv8794131222yui_3_16_0_1_1439627250773_3003" =
style=3D"font-size:12pt;" lang=3D"EN-US"><font class=3D"yiv8794131222" id=
=3D"yiv8794131222yui_3_16_0_1_1439627250773_3002" face=3D"Calibri Regular">=
3. What would you think it&nbsp;is better the Driver with the=E2=80=9Dold=
=E2=80=9D Kernel 3.14 or the
answer of question two?</font></span></div><div class=3D"yiv8794131222"><fo=
nt class=3D"yiv8794131222" face=3D"Times New Roman">

</font></div><div class=3D"yiv8794131222" id=3D"yiv8794131222yui_3_16_0_1_1=
439627250773_3001" style=3D"margin:0cm 0cm 0pt;line-height:normal;"><span c=
lass=3D"yiv8794131222" style=3D"font-size:12pt;" lang=3D"EN-US"><font class=
=3D"yiv8794131222" face=3D"Calibri Regular">&nbsp;</font></span></div><div =
class=3D"yiv8794131222"><font class=3D"yiv8794131222" face=3D"Times New Rom=
an">

</font></div><div class=3D"yiv8794131222" id=3D"yiv8794131222yui_3_16_0_1_1=
439600919800_16173" style=3D"margin:0cm 0cm 0pt;line-height:normal;"><span =
class=3D"yiv8794131222" id=3D"yiv8794131222yui_3_16_0_1_1439627250773_3000"=
 style=3D"font-size:12pt;" lang=3D"EN-US"><font class=3D"yiv8794131222" id=
=3D"yiv8794131222yui_3_16_0_1_1439627250773_2999" face=3D"Calibri Regular">=
Thanks for the fast answer.&nbsp;</font></span></div><div class=3D"yiv87941=
31222"><font class=3D"yiv8794131222" face=3D"Times New Roman">

</font></div><div class=3D"yiv8794131222" id=3D"yiv8794131222yui_3_16_0_1_1=
439600919800_16174" style=3D"margin:0cm 0cm 0pt;line-height:normal;"><span =
class=3D"yiv8794131222" style=3D"font-size:12pt;" lang=3D"EN-US"><font clas=
s=3D"yiv8794131222" face=3D"Calibri Regular">&nbsp;</font></span></div><div=
 class=3D"yiv8794131222"><font class=3D"yiv8794131222" face=3D"Times New Ro=
man">

</font></div><div class=3D"yiv8794131222" dir=3D"ltr" id=3D"yiv8794131222yu=
i_3_16_0_1_1439600919800_16175" style=3D"margin:0cm 0cm 0pt;line-height:nor=
mal;"><div dir=3D"ltr" id=3D"yiv8794131222yui_3_16_0_1_1439627250773_3738">=
<span class=3D"yiv8794131222" id=3D"yiv8794131222yui_3_16_0_1_1439627250773=
_4105" style=3D"font-size:12pt;"><font class=3D"yiv8794131222" id=3D"yiv879=
4131222yui_3_16_0_1_1439627250773_4104" face=3D"Calibri Regular">Benjamin</=
font></span></div></div>  <br clear=3D"none"><div class=3D"yiv8794131222qtd=
SeparateBR"><br clear=3D"none"><br clear=3D"none"></div><div class=3D"yiv87=
94131222yahoo_quoted" style=3D"display:block;"> <div style=3D"font-family:t=
imes new roman, new york, times, serif;font-size:16px;"> <div style=3D"font=
-family:HelveticaNeue, Helvetica Neue, Helvetica, Arial, Lucida Grande, san=
s-serif;font-size:16px;"> <div dir=3D"ltr"> <font face=3D"Arial" size=3D"2"=
> Denys Dmytriyenko &lt;denys@ti.com&gt; schrieb am 2:50 Samstag, 15.August=
 2015:<br clear=3D"none"> </font> </div>  <br clear=3D"none"><br clear=3D"n=
one"> <div class=3D"yiv8794131222yqt8445567175" id=3D"yiv8794131222yqt23370=
"><div class=3D"yiv8794131222y_msg_container">Benjamin,<br clear=3D"none"><=
br clear=3D"none">Version 5.1.1.2 of libgles-omap3 only builds and works ag=
ainst version 3.14 of <br clear=3D"none">linux-ti-staging kernel in meta-ti=
. The corresponding update to libgles-omap3 <br clear=3D"none">to build aga=
inst 4.1 kernel hasn't been released yet.<br clear=3D"none"><br clear=3D"no=
ne">-- <br clear=3D"none">Denys<br clear=3D"none"><br clear=3D"none"><div c=
lass=3D"yiv8794131222yqt1621541879" id=3D"yiv8794131222yqtfd10571"><br clea=
r=3D"none">On Sat, Aug 15, 2015 at 12:41:50AM +0000, Benjamin Bimmermann wr=
ote:<br clear=3D"none">&gt; Hello,<br clear=3D"none">&gt; i like to build t=
he libgles-omap3 for the BeagleBoneBlack, but i get the error : <br clear=
=3D"none">&gt; sgx-omap.h: No such file or directory<br clear=3D"none">&gt;=
 |&nbsp; #include &lt;linux/platform_data/sgx-omap.h&gt;.<br clear=3D"none"=
>&gt; I try to create QT5 for the BeagleboneBlack. I have found and work on=
 this tutorial:<a rel=3D"nofollow" shape=3D"rect" target=3D"_blank" href=3D=
"http://www.embarcados.com.br/beaglebone-black-qt5-yocto-parte-1/Code:">htt=
p://www.embarcados.com.br/beaglebone-black-qt5-yocto-parte-1/Code: </a><a r=
el=3D"nofollow" shape=3D"rect" target=3D"_blank" href=3D"https://bitbucket.=
org/embarcados/meta-embarcados/src">https://bitbucket.org/embarcados/meta-e=
mbarcados/src</a><br clear=3D"none">&gt; <br clear=3D"none">&gt; He has the=
 error in part2 of the tutorial and say that i must make :bitbake -c cleans=
state libgles-omap3bitbake libgles-omap3<br clear=3D"none">&gt; but that no=
t solve the Problem. Every Time I get this Error.<br clear=3D"none">&gt; I =
have only change the bblayer.conf and the local.conf file. All other Files =
are from git and I have not change anything.<br clear=3D"none">&gt; I hope =
you can help me.<br clear=3D"none">&gt; <br clear=3D"none">&gt; <br clear=
=3D"none">&gt; <br clear=3D"none">&gt; ------------------------------------=
---------------------------------------------------------------------------=
------------<br clear=3D"none">&gt; My bblayer.conf:LCONF_VERSION =3D "6"<b=
r clear=3D"none">&gt; BBPATH =3D "${TOPDIR}"<br clear=3D"none">&gt; BBFILES=
 ?=3D ""<br clear=3D"none">&gt; BBLAYERS ?=3D " \<br clear=3D"none">&gt; &n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${HOME}/bbb/meta-embar=
cados \<br clear=3D"none">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; ${HOME}/bbb/meta-embarcados/meta-bbb \<br clear=3D"none">&gt; &n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${HOME}/bbb/meta-ti \<=
br clear=3D"none">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; ${HOME}/poky-fido/meta-qt5 \<br clear=3D"none">&gt; &nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${HOME}/poky-fido/meta-openembedded/meta=
-oe \<br clear=3D"none">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; ${HOME}/poky-fido/meta-openembedded/meta-ruby \<br clear=3D"none">=
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${HOME}/poky-fi=
do/meta-openembedded/meta-perl \<br clear=3D"none">&gt; &nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${HOME}/poky-fido/meta-openembedded/met=
a-efl \<br clear=3D"none">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; ${HOME}/poky-fido/meta-openembedded/meta-multimedia \<br clear=
=3D"none">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${HOM=
E}/poky-fido/meta \<br clear=3D"none">&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; ${HOME}/poky-fido/meta-yocto \ "<br clear=3D"none">&=
gt; BBLAYERS_NON_REMOVABLE ?=3D " \<br clear=3D"none">&gt; &nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${HOME}/poky-fido/meta \<br clear=3D"none"=
>&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${HOME}/poky-fido/me=
ta-yocto \<br clear=3D"none">&gt; &nbsp; "<br clear=3D"none">&gt; ---------=
---------------------------------------------------------------------------=
---------------------------------------<br clear=3D"none">&gt; My local.con=
f:BB_NUMBER_THREADS =3D "7"<br clear=3D"none">&gt; PARALLEL_MAKE =3D "-j7"<=
br clear=3D"none">&gt; LICENSE_FLAGS_WHITELIST =3D "commercial"<br clear=3D=
"none">&gt; MACHINE =3D "beaglebone"<br clear=3D"none">&gt; DISTRO =3D "pok=
y"<br clear=3D"none">&gt; PACKAGE_CLASSES =3D "package_deb"<br clear=3D"non=
e">&gt; EXTRA_IMAGE_FEATURES =3D "debug-tweaks"<br clear=3D"none">&gt; CONF=
_VERSION =3D "1"<br clear=3D"none">&gt; DISTRO_FEATURES_remove =3D "x11 way=
land"<br clear=3D"none">&gt; BBMASK =3D "meta-embarcados/recipes-browser/ch=
romium/chromium_%.bbappend"<br clear=3D"none">&gt; <br clear=3D"none">&gt; =
---------------------------------------------------------------------------=
------------------------------------------------<br clear=3D"none">&gt; And=
 the complete LOG:<br clear=3D"none">&gt; <a rel=3D"nofollow" shape=3D"rect=
" ymailto=3D"mailto:PC@PC" target=3D"_blank" href=3D"mailto:PC@PC">PC@PC</a=
>:~/bbb/build_spain$ bitbake libgles-omap3<br clear=3D"none">&gt; WARNING: =
Host distribution "Ubuntu-15.04" has not been validated with this version o=
f the build system; you may possibly experience unexpected failures. It is =
recommended that you use a tested distribution.<br clear=3D"none">&gt; Pars=
ing recipes: 100% |########################################################=
###########################################################################=
###################################| Time: 00:00:29<br clear=3D"none">&gt; =
Parsing of 1788 .bb files complete (0 cached, 1788 parsed). 2296 targets, 3=
51 skipped, 1 masked, 0 errors.<br clear=3D"none">&gt; NOTE: Resolving any =
missing task queue dependencies<br clear=3D"none">&gt; <br clear=3D"none">&=
gt; Build Configuration:<br clear=3D"none">&gt; BB_VERSION&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; =3D "1.26.0"<br clear=3D"none">&gt; BUILD_SYS&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D "x86_64-linux"<br clear=3D=
"none">&gt; NATIVELSBSTRING&nbsp;&nbsp; =3D "Ubuntu-15.04"<br clear=3D"none=
">&gt; TARGET_SYS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D "arm-poky-l=
inux-gnueabi"<br clear=3D"none">&gt; MACHINE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D "beaglebone"<br clear=3D"none">&gt; DISTR=
O&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D "po=
ky"<br clear=3D"none">&gt; DISTRO_VERSION&nbsp;&nbsp;&nbsp; =3D "1.8"<br cl=
ear=3D"none">&gt; TUNE_FEATURES&nbsp;&nbsp;&nbsp;&nbsp; =3D "arm armv7a vfp=
 thumb neon callconvention-hard cortexa8"<br clear=3D"none">&gt; TARGET_FPU=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D "vfp-neon"<br clear=3D"none"=
>&gt; meta-embarcados&nbsp;&nbsp; <br clear=3D"none">&gt; meta-bbb&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D "fido:dfb2e27bf26b109fc6c=
cb3bc91924fb3bb24f655"<br clear=3D"none">&gt; meta-ti&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D "fido:a666b94e9c676711f1389c0628=
e6c883ef20d5b3"<br clear=3D"none">&gt; meta-qt5&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; =3D "fido:fc026381545650e10fdd488d5b2a3b2d78f877=
93"<br clear=3D"none">&gt; meta-oe&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; <br clear=3D"none">&gt; meta-ruby&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; <br clear=3D"none">&gt; meta-perl&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br clear=3D"none">&gt; meta-efl&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br clear=3D"none">&gt; meta-=
multimedia&nbsp;&nbsp; =3D "fido:10d3c8f85280a0bf867a8e4f84bcda81c290d28e"<=
br clear=3D"none">&gt; meta&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br clear=3D"none">&gt; meta-yocto&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D "fido:08d32590411568e7bf11612ac695a6e9=
c6df6286"<br clear=3D"none">&gt; <br clear=3D"none">&gt; NOTE: Preparing Ru=
nQueue<br clear=3D"none">&gt; NOTE: Executing SetScene Tasks<br clear=3D"no=
ne">&gt; NOTE: Executing RunQueue Tasks<br clear=3D"none">&gt; ERROR: Funct=
ion failed: do_compile (log file is located at /home/PC/bbb/build_spain/tmp=
/work/beaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.02-r22b/temp/=
log.do_compile.25613)<br clear=3D"none">&gt; ERROR: Logfile of failure stor=
ed in: /home/PC/bbb/build_spain/tmp/work/beaglebone-poky-linux-gnueabi/omap=
3-sgx-modules/5.01.01.02-r22b/temp/log.do_compile.25613<br clear=3D"none">&=
gt; Log data follows:<br clear=3D"none">&gt; | DEBUG: Executing shell funct=
ion do_compile<br clear=3D"none">&gt; | NOTE: make -j7 -e MAKEFLAGS=3D KERN=
EL_SRC=3D/home/PC/bbb/build_spain/tmp/work-shared/beaglebone/kernel-source =
KERNEL_PATH=3D/home/PC/bbb/build_spain/tmp/work-shared/beaglebone/kernel-so=
urce KERNEL_VERSION=3D4.1.5 CC=3Darm-poky-linux-gnueabi-gcc&nbsp; -mno-thum=
b-interwork -marm LD=3Darm-poky-linux-gnueabi-ld.bfd&nbsp;&nbsp; AR=3Darm-p=
oky-linux-gnueabi-ar&nbsp; O=3D/home/PC/bbb/build_spain/tmp/work-shared/bea=
glebone/kernel-build-artifacts BUILD=3Drelease TI_PLATFORM=3Dti335x SUPPORT=
_XORG=3D<br clear=3D"none">&gt; | make -C /home/PC/bbb/build_spain/tmp/work=
-shared/beaglebone/kernel-source M=3D`pwd`<br clear=3D"none">&gt; | make[1]=
: Entering directory '/home/PC/bbb/build_spain/tmp/work-shared/beaglebone/k=
ernel-source'<br clear=3D"none">&gt; | make[2]: Entering directory '/home/P=
C/bbb/build_spain/tmp/work-shared/beaglebone/kernel-build-artifacts'<br cle=
ar=3D"none">&gt; |&nbsp;&nbsp; CC [M]&nbsp; /home/PC/bbb/build_spain/tmp/wo=
rk/beaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.02-r22b/Graphics=
_SDK_5_01_01_02/GFX_Linux_KM/services4/srvkm/env/linux/module.o<br clear=3D=
"none">&gt; | /home/PC/bbb/build_spain/tmp/work/beaglebone-poky-linux-gnuea=
bi/omap3-sgx-modules/5.01.01.02-r22b/Graphics_SDK_5_01_01_02/GFX_Linux_KM/s=
ervices4/srvkm/env/linux/module.c:51:42: fatal error: linux/platform_data/s=
gx-omap.h: No such file or directory<br clear=3D"none">&gt; |&nbsp; #includ=
e &lt;linux/platform_data/sgx-omap.h&gt;<br clear=3D"none">&gt; |&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; ^<br clear=3D"none">&gt; | compilation terminated.<br cle=
ar=3D"none">&gt; | /home/PC/bbb/build_spain/tmp/work-shared/beaglebone/kern=
el-source/scripts/Makefile.build:258: recipe for target '/home/PC/bbb/build=
_spain/tmp/work/beaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.02-=
r22b/Graphics_SDK_5_01_01_02/GFX_Linux_KM/services4/srvkm/env/linux/module.=
o' failed<br clear=3D"none">&gt; | make[3]: *** [/home/PC/bbb/build_spain/t=
mp/work/beaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.02-r22b/Gra=
phics_SDK_5_01_01_02/GFX_Linux_KM/services4/srvkm/env/linux/module.o] Error=
 1<br clear=3D"none">&gt; | /home/PC/bbb/build_spain/tmp/work-shared/beagle=
bone/kernel-source/Makefile:1384: recipe for target '_module_/home/PC/bbb/b=
uild_spain/tmp/work/beaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01=
.02-r22b/Graphics_SDK_5_01_01_02/GFX_Linux_KM' failed<br clear=3D"none">&gt=
; | make[2]: *** [_module_/home/PC/bbb/build_spain/tmp/work/beaglebone-poky=
-linux-gnueabi/omap3-sgx-modules/5.01.01.02-r22b/Graphics_SDK_5_01_01_02/GF=
X_Linux_KM] Error 2<br clear=3D"none">&gt; | make[2]: Leaving directory '/h=
ome/PC/bbb/build_spain/tmp/work-shared/beaglebone/kernel-build-artifacts'<b=
r clear=3D"none">&gt; | Makefile:146: recipe for target 'sub-make' failed<b=
r clear=3D"none">&gt; | make[1]: *** [sub-make] Error 2<br clear=3D"none">&=
gt; | make[1]: Leaving directory '/home/PC/bbb/build_spain/tmp/work-shared/=
beaglebone/kernel-source'<br clear=3D"none">&gt; | Makefile:478: recipe for=
 target 'all' failed<br clear=3D"none">&gt; | make: *** [all] Error 2<br cl=
ear=3D"none">&gt; | ERROR: oe_runmake failed<br clear=3D"none">&gt; | WARNI=
NG: exit code 1 from a shell command.<br clear=3D"none">&gt; | ERROR: Funct=
ion failed: do_compile (log file is located at /home/PC/bbb/build_spain/tmp=
/work/beaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.02-r22b/temp/=
log.do_compile.25613)<br clear=3D"none">&gt; ERROR: Task 119 (/home/PC/bbb/=
meta-ti/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.02.bb, do_com=
pile) failed with exit code '1'<br clear=3D"none">&gt; NOTE: Tasks Summary:=
 Attempted 731 tasks of which 720 didn't need to be rerun and 1 failed.<br =
clear=3D"none">&gt; Waiting for 0 running tasks to finish:<br clear=3D"none=
">&gt; <br clear=3D"none">&gt; Summary: 1 task failed:<br clear=3D"none">&g=
t; &nbsp; /home/PC/bbb/meta-ti/recipes-bsp/powervr-drivers/omap3-sgx-module=
s_5.01.01.02.bb, do_compile<br clear=3D"none">&gt; Summary: There was 1 WAR=
NING message shown.<br clear=3D"none">&gt; Summary: There was 1 ERROR messa=
ge shown, returning a non-zero exit code.<br clear=3D"none">&gt; <a rel=3D"=
nofollow" shape=3D"rect" ymailto=3D"mailto:PC@PC" target=3D"_blank" href=3D=
"mailto:PC@PC">PC@PC</a>:~/bbb/build_spain<br clear=3D"none">&gt; <br clear=
=3D"none">&gt; ------------------------------------------------------------=
---------------------------------------------------------------<br clear=3D=
"none">&gt; <br clear=3D"none">&gt; Thank you for your Time and I hope you =
can help me.Have a nice day.<br clear=3D"none"><br clear=3D"none">&gt; -- <=
br clear=3D"none">&gt; _______________________________________________<br c=
lear=3D"none">&gt; meta-ti mailing list<br clear=3D"none">&gt; <a rel=3D"no=
follow" shape=3D"rect" ymailto=3D"mailto:meta-ti@yoctoproject.org" target=
=3D"_blank" href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.o=
rg</a><br clear=3D"none">&gt; <a rel=3D"nofollow" shape=3D"rect" target=3D"=
_blank" href=3D"https://lists.yoctoproject.org/listinfo/meta-ti">https://li=
sts.yoctoproject.org/listinfo/meta-ti</a><br clear=3D"none"><br clear=3D"no=
ne"></div><br clear=3D"none"><br clear=3D"none"></div></div>  </div> </div>=
  </div></div></div></div><br><div class=3D"yqt8445567175" id=3D"yqt37709">=
-- <br clear=3D"none">_______________________________________________<br cl=
ear=3D"none">meta-ti mailing list<br clear=3D"none"><a shape=3D"rect" ymail=
to=3D"mailto:meta-ti@yoctoproject.org" href=3D"mailto:meta-ti@yoctoproject.=
org">meta-ti@yoctoproject.org</a><br clear=3D"none"><a shape=3D"rect" href=
=3D"https://lists.yoctoproject.org/listinfo/meta-ti" target=3D"_blank">http=
s://lists.yoctoproject.org/listinfo/meta-ti</a><br clear=3D"none"></div><br=
><br></div>  </div> </div>  </div></div></body></html>

------=_Part_5605768_1237456081.1439737469464--
