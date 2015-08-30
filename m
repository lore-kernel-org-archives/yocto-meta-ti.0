Return-Path: <b.bimmermann@yahoo.de>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F20A7E00B43; Sat, 29 Aug 2015 19:34:27 -0700 (PDT)
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
	*      [212.82.96.103 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from nm4-vm5.bullet.mail.ir2.yahoo.com
	(nm4-vm5.bullet.mail.ir2.yahoo.com [212.82.96.103])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2BA5DE00AC5
	for <meta-ti@yoctoproject.org>; Sat, 29 Aug 2015 19:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.de; s=s2048;
	t=1440902062; bh=5T+ar94zDYm6uR4q/RD7MnqmiCSpzAV+dltfskTd2F4=;
	h=Date:From:Reply-To:To:Subject:From:Subject;
	b=TyabfTo/lwosiEX3JjUS8t/A+siPgJUw9pzIIjLGNlxtJk81z9Xec8f7OqoLN/1dcuXUgh6wjwq184WQ3ALApPSmVa6U++N9B5NrzPfvlLLvZC7b6woZ6FIm91GOPXcFG9qBCy3NEQWPzRPeHY8AupD/iVZ5b4KpNtlC270qYuUKCams74lisOK/0roZQGO5H5cpZl1iVTicNTfWwU6KtXRHal+naCe23dcAy9aoTIELHp8q5lBSOFo5S2r7TS0IHnPfsfynvmXuTT7zklamdASX97bAaaf3CnOA70O9MiweTOMDpUTIYyzoJ6sgvhJwLcMMA2sK48bkhf/yfrcuyQ==
Received: from [212.82.98.52] by nm4.bullet.mail.ir2.yahoo.com with NNFMP;
	30 Aug 2015 02:34:22 -0000
Received: from [212.82.98.87] by tm5.bullet.mail.ir2.yahoo.com with NNFMP;
	30 Aug 2015 02:34:22 -0000
Received: from [127.0.0.1] by omp1024.mail.ir2.yahoo.com with NNFMP;
	30 Aug 2015 02:34:22 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 387897.8644.bm@omp1024.mail.ir2.yahoo.com
X-YMail-OSG: xDg71UoVM1l5rkRo1BVuMbJ8DuqvjpPAp2EyAErGsgsnKWkNxwQ1DR8nCZf9mZ4
	T9dozvoR5VhIOKxNLkW2JreiMBvE9mm1npobPnCBQfgPAc7oHXfdLsJds769pfpBFZUvvYHKgJMd
	eicp1R5skR_tREXXcJRxQNvhxLXjhaVkVOgJopNADwJ5OoJm0FcDfdO_rh6FKyqJGQY2Qhnsssmf
	lpA7rBsjGzoTYSAeS3XRUD1gWK.JAqbP29VZIaIbcfjq8Hlv3bWW_BSD_eMf9bgiFi.PZY0Gj.qo
	A1wCFQf9CoriE6Jq7jmkfq759lhkjg_S_IxH1dAQmst3RFsmzhIqKYit_Jhh8FP1G5WQ0mCXZqUJ
	.zBs6gBygW0joStcGI5SXYCr08tSBk._NRzsofiiTLkgTDCZ.eUCnlsFt0VLt_OJXrozNAtbuMWP
	4ia9NnbS2ydlErPPcj.7knJl.YxmzjDj3KlFWWlY_3lbdScw2i04Mayx5B6iIPOLXjwq7ndraQC3
	CCEDCxPipqJ79c.2nf9RJhT6vm4JoqAc-
Received: by 217.12.8.245; Sun, 30 Aug 2015 02:34:21 +0000 
Date: Sun, 30 Aug 2015 02:34:04 +0000 (UTC)
From: Benjamin Bimmermann <b.bimmermann@yahoo.de>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Message-ID: <108025423.3250300.1440902044605.JavaMail.yahoo@mail.yahoo.com>
MIME-Version: 1.0
Subject: [bug] libdrm-2.4.41-r4.2 | ERROR: Fetcher failure: Unable to find file file://GNU_SOURCE_definition.patch anywhere
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
X-List-Received-Date: Sun, 30 Aug 2015 02:34:28 -0000
Content-Type: multipart/alternative; 
	boundary="----=_Part_3250299_1128807612.1440902044599"

------=_Part_3250299_1128807612.1440902044599
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,
i try to build a new Image and i get this error.
libdrm-2.4.41-r4.2 | ERROR: Fetcher failure: Unable to find file file://GNU=
_SOURCE_definition.patch anywhere
I think it is a bug so i think i should post it here.
---------------------------------------------------------------------------=
---------------

I would like to help to fix it, but I doun't now how ...=20
SORRY.

---------------------------------------------------------------------------=
----------------
LOG :
WARNING: Unable to get checksum for libdrm SRC_URI entry GNU_SOURCE_definit=
ion.patch: file could not be found
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
meta-ti=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "fi=
do:854403f60a1a74fe187f364cf43c07e95ad0656e"
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
meta-yocto=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "fido:cd2c9acdbd75=
c83790e8144d2a834f5b5de35df0"
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
NOTE: Running task 209 of 5036 (ID: 2284, /home/PC/poky-fido/meta/recipes-d=
evtools/gcc/gcc-cross_4.9.bb, do_compile)
NOTE: Running task 384 of 5036 (ID: 4310, virtual:native:/home/PC/poky-fido=
/meta/recipes-devtools/rpm/rpm_5.4.14.bb, do_install)
NOTE: Running task 459 of 5036 (ID: 2291, virtual:nativesdk:/home/PC/poky-f=
ido/meta/recipes-core/glibc/glibc-initial_2.21.bb, do_install_locale)
NOTE: Running task 460 of 5036 (ID: 2290, virtual:nativesdk:/home/PC/poky-f=
ido/meta/recipes-core/glibc/glibc-initial_2.21.bb, do_evacuate_scripts)
NOTE: Running task 478 of 5036 (ID: 4764, virtual:native:/home/PC/poky-fido=
/meta/recipes-core/libxml/libxml2_2.9.2.bb, do_install)
NOTE: Running task 551 of 5036 (ID: 4730, virtual:native:/home/PC/poky-fido=
/meta/recipes-core/dbus/dbus-glib_0.102.bb, do_populate_sysroot)
NOTE: Running task 620 of 5036 (ID: 4324, virtual:native:/home/PC/poky-fido=
/meta/recipes-devtools/dpkg/dpkg_1.17.21.bb, do_install)
NOTE: recipe nativesdk-glibc-initial-2.21-r0: task do_evacuate_scripts: Suc=
ceeded
NOTE: recipe nativesdk-glibc-initial-2.21-r0: task do_install_locale: Succe=
eded
NOTE: Running task 647 of 5036 (ID: 2293, virtual:nativesdk:/home/PC/poky-f=
ido/meta/recipes-core/glibc/glibc-initial_2.21.bb, do_populate_sysroot)
NOTE: Running task 648 of 5036 (ID: 2301, virtual:nativesdk:/home/PC/poky-f=
ido/meta/recipes-core/glibc/glibc-initial_2.21.bb, do_package)
NOTE: recipe dbus-glib-native-0.102-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nativesdk-glibc-initial-2.21-r0: task do_populate_sysroot: Suc=
ceeded
NOTE: Running task 649 of 5036 (ID: 1380, virtual:nativesdk:/home/PC/poky-f=
ido/meta/recipes-core/glibc/glibc_2.21.bb, do_configure)
NOTE: Running task 670 of 5036 (ID: 676, /home/PC/poky-fido/meta-ti/recipes=
-graphics/drm/libdrm_2.4.41.bb, do_fetch)
NOTE: recipe libxml2-native-2.9.2-r0: task do_install: Succeeded
NOTE: Running task 671 of 5036 (ID: 4765, virtual:native:/home/PC/poky-fido=
/meta/recipes-core/libxml/libxml2_2.9.2.bb, do_populate_sysroot)
WARNING: Failed to fetch URL file://GNU_SOURCE_definition.patch, attempting=
 MIRRORS if available
ERROR: Fetcher failure: Unable to find file file://GNU_SOURCE_definition.pa=
tch anywhere. The paths that were searched were:
=C2=A0=C2=A0=C2=A0 /home/PC/poky-fido/meta/recipes-graphics/drm/libdrm/poky
=C2=A0=C2=A0=C2=A0 /home/PC/poky-fido/meta-ti/recipes-graphics/drm/libdrm-2=
.4.41/poky
=C2=A0=C2=A0=C2=A0 /home/PC/poky-fido/meta-ti/recipes-graphics/drm/libdrm/p=
oky
=C2=A0=C2=A0=C2=A0 /home/PC/poky-fido/meta-ti/recipes-graphics/drm/files/po=
ky
=C2=A0=C2=A0=C2=A0 /home/PC/poky-fido/meta/recipes-graphics/drm/libdrm/beag=
lebone
=C2=A0=C2=A0=C2=A0 /home/PC/poky-fido/meta-ti/recipes-graphics/drm/libdrm-2=
.4.41/beaglebone
=C2=A0=C2=A0=C2=A0 /home/PC/poky-fido/meta-ti/recipes-graphics/drm/libdrm/b=
eaglebone
=C2=A0=C2=A0=C2=A0 /home/PC/poky-fido/meta-ti/recipes-graphics/drm/files/be=
aglebone
=C2=A0=C2=A0=C2=A0 /home/PC/poky-fido/meta/recipes-graphics/drm/libdrm/ti33=
x
=C2=A0=C2=A0=C2=A0 /home/PC/poky-fido/meta-ti/recipes-graphics/drm/libdrm-2=
.4.41/ti33x
=C2=A0=C2=A0=C2=A0 /home/PC/poky-fido/meta-ti/recipes-graphics/drm/libdrm/t=
i33x
=C2=A0=C2=A0=C2=A0 /home/PC/poky-fido/meta-ti/recipes-graphics/drm/files/ti=
33x
=C2=A0=C2=A0=C2=A0 /home/PC/poky-fido/meta/recipes-graphics/drm/libdrm/armv=
7a
=C2=A0=C2=A0=C2=A0 /home/PC/poky-fido/meta-ti/recipes-graphics/drm/libdrm-2=
.4.41/armv7a
=C2=A0=C2=A0=C2=A0 /home/PC/poky-fido/meta-ti/recipes-graphics/drm/libdrm/a=
rmv7a
=C2=A0=C2=A0=C2=A0 /home/PC/poky-fido/meta-ti/recipes-graphics/drm/files/ar=
mv7a
=C2=A0=C2=A0=C2=A0 /home/PC/poky-fido/meta/recipes-graphics/drm/libdrm/arm
=C2=A0=C2=A0=C2=A0 /home/PC/poky-fido/meta-ti/recipes-graphics/drm/libdrm-2=
.4.41/arm
=C2=A0=C2=A0=C2=A0 /home/PC/poky-fido/meta-ti/recipes-graphics/drm/libdrm/a=
rm
=C2=A0=C2=A0=C2=A0 /home/PC/poky-fido/meta-ti/recipes-graphics/drm/files/ar=
m
=C2=A0=C2=A0=C2=A0 /home/PC/poky-fido/meta/recipes-graphics/drm/libdrm/
=C2=A0=C2=A0=C2=A0 /home/PC/poky-fido/meta-ti/recipes-graphics/drm/libdrm-2=
.4.41/
=C2=A0=C2=A0=C2=A0 /home/PC/poky-fido/meta-ti/recipes-graphics/drm/libdrm/
=C2=A0=C2=A0=C2=A0 /home/PC/poky-fido/meta-ti/recipes-graphics/drm/files/
=C2=A0=C2=A0=C2=A0 /home/PC/poky-fido/build_new/downloads
ERROR: Function failed: Fetcher failure for URL: 'file://GNU_SOURCE_definit=
ion.patch'. Unable to fetch URL from any source.
NOTE: recipe libdrm-2.4.41-r4.2: task do_fetch: Failed
ERROR: Task 676 (/home/PC/poky-fido/meta-ti/recipes-graphics/drm/libdrm_2.4=
.41.bb, do_fetch) failed with exit code '1'
NOTE: recipe nativesdk-glibc-initial-2.21-r0: task do_package: Succeeded
NOTE: recipe libxml2-native-2.9.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe dpkg-native-1.17.21-r0: task do_install: Succeeded
NOTE: recipe rpm-native-5.4.14-r0: task do_install: Succeeded
NOTE: recipe nativesdk-glibc-2.21-r0: task do_configure: Succeeded
NOTE: recipe gcc-cross-arm-4.9.2-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 672 tasks of which 660 didn't need to be rer=
un and 1 failed

---------------------------------------------------------------------------=
----------------


Have a nice day

------=_Part_3250299_1128807612.1440902044599
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><body><div style=3D"color:#000; background-color:#fff; font-family:ti=
mes new roman, new york, times, serif;font-size:16px"><div id=3D"yui_3_16_0=
_1_1440901090259_4084">Hello,</div><div id=3D"yui_3_16_0_1_1440901090259_45=
60"><br></div><div id=3D"yui_3_16_0_1_1440901090259_4559" dir=3D"ltr">i try=
 to build a new Image and i get this error.</div><div id=3D"yui_3_16_0_1_14=
40901090259_4946" dir=3D"ltr"><br></div><div class=3D"" id=3D"yui_3_16_0_1_=
1440901090259_4521" dir=3D"ltr">libdrm-2.4.41-r4.2 | ERROR: Fetcher failure=
: Unable to find file file://GNU_SOURCE_definition.patch anywhere</div><div=
 id=3D"yui_3_16_0_1_1440901090259_4948" dir=3D"ltr"><br></div><div id=3D"yu=
i_3_16_0_1_1440901090259_4949" dir=3D"ltr">I think it is a bug so i think i=
 should post it here.</div><div id=3D"yui_3_16_0_1_1440901090259_4571" dir=
=3D"ltr"><br></div><div id=3D"yui_3_16_0_1_1440901090259_4924" dir=3D"ltr">=
---------------------------------------------------------------------------=
---------------<br></div><div id=3D"yui_3_16_0_1_1440901090259_4925" dir=3D=
"ltr"><br></div><div id=3D"yui_3_16_0_1_1440901090259_4926" dir=3D"ltr">I w=
ould like to help to fix it, but I doun't now how ... <br></div><div id=3D"=
yui_3_16_0_1_1440901090259_4927" dir=3D"ltr">SORRY.<br></div><div id=3D"yui=
_3_16_0_1_1440901090259_4962" dir=3D"ltr"><br></div><div id=3D"yui_3_16_0_1=
_1440901090259_4569" dir=3D"ltr">------------------------------------------=
-------------------------------------------------</div><div id=3D"yui_3_16_=
0_1_1440901090259_4570" dir=3D"ltr"><br></div><div id=3D"yui_3_16_0_1_14409=
01090259_4911" dir=3D"ltr">LOG :</div><div id=3D"yui_3_16_0_1_1440901090259=
_4637" dir=3D"ltr"><br></div><div id=3D"yui_3_16_0_1_1440901090259_4636" di=
r=3D"ltr">WARNING: Unable to get checksum for libdrm SRC_URI entry GNU_SOUR=
CE_definition.patch: file could not be found<br class=3D"">NOTE: Resolving =
any missing task queue dependencies<br class=3D""><br class=3D"">Build Conf=
iguration:<br class=3D"">BB_VERSION&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; =3D "1.26.0"<br class=3D"">BUILD_SYS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; =3D "x86_64-linux"<br class=3D"">NATIVELSBSTRING&nbsp;&nbsp; =
=3D "Ubuntu-15.04"<br class=3D"">TARGET_SYS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; =3D "arm-poky-linux-gnueabi"<br class=3D"">MACHINE&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D "beaglebone"<br class=3D=
"">DISTRO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 =3D "poky"<br class=3D"">DISTRO_VERSION&nbsp;&nbsp;&nbsp; =3D "1.8"<br cla=
ss=3D"">TUNE_FEATURES&nbsp;&nbsp;&nbsp;&nbsp; =3D "arm armv7a vfp thumb neo=
n callconvention-hard cortexa8"<br class=3D"">TARGET_FPU&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; =3D "vfp-neon"<br class=3D"">meta-ti&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D "fido:854403f60a1a74fe187=
f364cf43c07e95ad0656e"<br class=3D"">meta-qt5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; =3D "fido:fc026381545650e10fdd488d5b2a3b2d78f87793=
"<br class=3D"">meta-oe&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; <br class=3D"">meta-ruby&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; <br class=3D"">meta-perl&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; <br class=3D"">meta-efl&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; <br class=3D"">meta-multimedia&nbsp;&nbsp; =3D "fido:10d3c8f85280a0=
bf867a8e4f84bcda81c290d28e"<br class=3D"">meta&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br class=3D"">meta-yocto=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D "fido:cd2c9acdbd75c83790e814=
4d2a834f5b5de35df0"</div><div id=3D"yui_3_16_0_1_1440901090259_4683" dir=3D=
"ltr"><br></div>NOTE: Executing SetScene Tasks<br class=3D"">NOTE: Executin=
g RunQueue Tasks<br class=3D"">NOTE: Running task 209 of 5036 (ID: 2284, /h=
ome/PC/poky-fido/meta/recipes-devtools/gcc/gcc-cross_4.9.bb, do_compile)<br=
 class=3D"">NOTE: Running task 384 of 5036 (ID: 4310, virtual:native:/home/=
PC/poky-fido/meta/recipes-devtools/rpm/rpm_5.4.14.bb, do_install)<br class=
=3D"">NOTE: Running task 459 of 5036 (ID: 2291, virtual:nativesdk:/home/PC/=
poky-fido/meta/recipes-core/glibc/glibc-initial_2.21.bb, do_install_locale)=
<br class=3D"">NOTE: Running task 460 of 5036 (ID: 2290, virtual:nativesdk:=
/home/PC/poky-fido/meta/recipes-core/glibc/glibc-initial_2.21.bb, do_evacua=
te_scripts)<br class=3D"">NOTE: Running task 478 of 5036 (ID: 4764, virtual=
:native:/home/PC/poky-fido/meta/recipes-core/libxml/libxml2_2.9.2.bb, do_in=
stall)<br class=3D"">NOTE: Running task 551 of 5036 (ID: 4730, virtual:nati=
ve:/home/PC/poky-fido/meta/recipes-core/dbus/dbus-glib_0.102.bb, do_populat=
e_sysroot)<br class=3D"">NOTE: Running task 620 of 5036 (ID: 4324, virtual:=
native:/home/PC/poky-fido/meta/recipes-devtools/dpkg/dpkg_1.17.21.bb, do_in=
stall)<br class=3D"">NOTE: recipe nativesdk-glibc-initial-2.21-r0: task do_=
evacuate_scripts: Succeeded<br class=3D"">NOTE: recipe nativesdk-glibc-init=
ial-2.21-r0: task do_install_locale: Succeeded<br class=3D"">NOTE: Running =
task 647 of 5036 (ID: 2293, virtual:nativesdk:/home/PC/poky-fido/meta/recip=
es-core/glibc/glibc-initial_2.21.bb, do_populate_sysroot)<br class=3D"">NOT=
E: Running task 648 of 5036 (ID: 2301, virtual:nativesdk:/home/PC/poky-fido=
/meta/recipes-core/glibc/glibc-initial_2.21.bb, do_package)<br class=3D"">N=
OTE: recipe dbus-glib-native-0.102-r0: task do_populate_sysroot: Succeeded<=
br class=3D"">NOTE: recipe nativesdk-glibc-initial-2.21-r0: task do_populat=
e_sysroot: Succeeded<br class=3D"">NOTE: Running task 649 of 5036 (ID: 1380=
, virtual:nativesdk:/home/PC/poky-fido/meta/recipes-core/glibc/glibc_2.21.b=
b, do_configure)<br class=3D"">NOTE: Running task 670 of 5036 (ID: 676, /ho=
me/PC/poky-fido/meta-ti/recipes-graphics/drm/libdrm_2.4.41.bb, do_fetch)<br=
 class=3D"">NOTE: recipe libxml2-native-2.9.2-r0: task do_install: Succeede=
d<br class=3D"">NOTE: Running task 671 of 5036 (ID: 4765, virtual:native:/h=
ome/PC/poky-fido/meta/recipes-core/libxml/libxml2_2.9.2.bb, do_populate_sys=
root)<br class=3D"">WARNING: Failed to fetch URL file://GNU_SOURCE_definiti=
on.patch, attempting MIRRORS if available<br class=3D"">ERROR: Fetcher fail=
ure: Unable to find file file://GNU_SOURCE_definition.patch anywhere. The p=
aths that were searched were:<br class=3D"">&nbsp;&nbsp;&nbsp; /home/PC/pok=
y-fido/meta/recipes-graphics/drm/libdrm/poky<br class=3D"">&nbsp;&nbsp;&nbs=
p; /home/PC/poky-fido/meta-ti/recipes-graphics/drm/libdrm-2.4.41/poky<br cl=
ass=3D"">&nbsp;&nbsp;&nbsp; /home/PC/poky-fido/meta-ti/recipes-graphics/drm=
/libdrm/poky<br class=3D"">&nbsp;&nbsp;&nbsp; /home/PC/poky-fido/meta-ti/re=
cipes-graphics/drm/files/poky<br class=3D"">&nbsp;&nbsp;&nbsp; /home/PC/pok=
y-fido/meta/recipes-graphics/drm/libdrm/beaglebone<br class=3D"">&nbsp;&nbs=
p;&nbsp; /home/PC/poky-fido/meta-ti/recipes-graphics/drm/libdrm-2.4.41/beag=
lebone<br class=3D"">&nbsp;&nbsp;&nbsp; /home/PC/poky-fido/meta-ti/recipes-=
graphics/drm/libdrm/beaglebone<br class=3D"">&nbsp;&nbsp;&nbsp; /home/PC/po=
ky-fido/meta-ti/recipes-graphics/drm/files/beaglebone<br class=3D"">&nbsp;&=
nbsp;&nbsp; /home/PC/poky-fido/meta/recipes-graphics/drm/libdrm/ti33x<br cl=
ass=3D"">&nbsp;&nbsp;&nbsp; /home/PC/poky-fido/meta-ti/recipes-graphics/drm=
/libdrm-2.4.41/ti33x<br class=3D"">&nbsp;&nbsp;&nbsp; /home/PC/poky-fido/me=
ta-ti/recipes-graphics/drm/libdrm/ti33x<br class=3D"">&nbsp;&nbsp;&nbsp; /h=
ome/PC/poky-fido/meta-ti/recipes-graphics/drm/files/ti33x<br class=3D"">&nb=
sp;&nbsp;&nbsp; /home/PC/poky-fido/meta/recipes-graphics/drm/libdrm/armv7a<=
br class=3D"">&nbsp;&nbsp;&nbsp; /home/PC/poky-fido/meta-ti/recipes-graphic=
s/drm/libdrm-2.4.41/armv7a<br class=3D"">&nbsp;&nbsp;&nbsp; /home/PC/poky-f=
ido/meta-ti/recipes-graphics/drm/libdrm/armv7a<br class=3D"">&nbsp;&nbsp;&n=
bsp; /home/PC/poky-fido/meta-ti/recipes-graphics/drm/files/armv7a<br class=
=3D"">&nbsp;&nbsp;&nbsp; /home/PC/poky-fido/meta/recipes-graphics/drm/libdr=
m/arm<br class=3D"">&nbsp;&nbsp;&nbsp; /home/PC/poky-fido/meta-ti/recipes-g=
raphics/drm/libdrm-2.4.41/arm<br class=3D"">&nbsp;&nbsp;&nbsp; /home/PC/pok=
y-fido/meta-ti/recipes-graphics/drm/libdrm/arm<br class=3D"">&nbsp;&nbsp;&n=
bsp; /home/PC/poky-fido/meta-ti/recipes-graphics/drm/files/arm<br class=3D"=
">&nbsp;&nbsp;&nbsp; /home/PC/poky-fido/meta/recipes-graphics/drm/libdrm/<b=
r class=3D"">&nbsp;&nbsp;&nbsp; /home/PC/poky-fido/meta-ti/recipes-graphics=
/drm/libdrm-2.4.41/<br class=3D"">&nbsp;&nbsp;&nbsp; /home/PC/poky-fido/met=
a-ti/recipes-graphics/drm/libdrm/<br class=3D"">&nbsp;&nbsp;&nbsp; /home/PC=
/poky-fido/meta-ti/recipes-graphics/drm/files/<br class=3D"">&nbsp;&nbsp;&n=
bsp; /home/PC/poky-fido/build_new/downloads<br class=3D"">ERROR: Function f=
ailed: Fetcher failure for URL: 'file://GNU_SOURCE_definition.patch'. Unabl=
e to fetch URL from any source.<br class=3D"">NOTE: recipe libdrm-2.4.41-r4=
.2: task do_fetch: Failed<br class=3D"">ERROR: Task 676 (/home/PC/poky-fido=
/meta-ti/recipes-graphics/drm/libdrm_2.4.41.bb, do_fetch) failed with exit =
code '1'<br class=3D"">NOTE: recipe nativesdk-glibc-initial-2.21-r0: task d=
o_package: Succeeded<br class=3D"">NOTE: recipe libxml2-native-2.9.2-r0: ta=
sk do_populate_sysroot: Succeeded<br class=3D"">NOTE: recipe dpkg-native-1.=
17.21-r0: task do_install: Succeeded<br class=3D"">NOTE: recipe rpm-native-=
5.4.14-r0: task do_install: Succeeded<br class=3D"">NOTE: recipe nativesdk-=
glibc-2.21-r0: task do_configure: Succeeded<br class=3D"">NOTE: recipe gcc-=
cross-arm-4.9.2-r0: task do_compile: Succeeded<br class=3D""><div id=3D"yui=
_3_16_0_1_1440901090259_4976" dir=3D"ltr">NOTE: Tasks Summary: Attempted 67=
2 tasks of which 660 didn't need to be rerun and 1 failed</div><div id=3D"y=
ui_3_16_0_1_1440901090259_4978" dir=3D"ltr"><br></div><div id=3D"yui_3_16_0=
_1_1440901090259_4979" dir=3D"ltr"><br></div><div class=3D"" id=3D"yui_3_16=
_0_1_1440901090259_4569" dir=3D"ltr">--------------------------------------=
-----------------------------------------------------</div><div id=3D"yui_3=
_16_0_1_1440901090259_4982" class=3D"" dir=3D"ltr"><br></div><div id=3D"yui=
_3_16_0_1_1440901090259_4983" class=3D"" dir=3D"ltr"><br></div><div id=3D"y=
ui_3_16_0_1_1440901090259_4984" class=3D"" dir=3D"ltr"><br></div><div id=3D=
"yui_3_16_0_1_1440901090259_4985" class=3D"" dir=3D"ltr">Have a nice day<br=
></div></div></body></html>

------=_Part_3250299_1128807612.1440902044599--
