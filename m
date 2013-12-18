Return-Path: <sam.nelson@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1E8A2E00802
	for <meta-ti@yoctoproject.org>; Wed, 18 Dec 2013 15:30:13 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id rBINUCp7003114
	for <meta-ti@yoctoproject.org>; Wed, 18 Dec 2013 17:30:12 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rBINUCYo019604
	for <meta-ti@yoctoproject.org>; Wed, 18 Dec 2013 17:30:12 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Wed, 18 Dec 2013 17:30:12 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH v4] cmem: Adding New recipe for cmem
Thread-Index: AQHO/DedO2E8seqmVU6Rm3i5qJIfi5pa562A//+xvFA=
Date: Wed, 18 Dec 2013 23:30:11 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F490549C315D@DLEE11.ent.ti.com>
References: <1387401901-20406-1-git-send-email-sam.nelson@ti.com>
	<7D46E86EC0A8354091174257B2FED101598AAD1B@DLEE11.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED101598AAD1B@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH v4] cmem: Adding New recipe for cmem
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Dec 2013 23:30:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sorry, this is a fresh commit for meta-ti. I will  resubmit again as the wh=
ole patch.
With regards,
sam
> -----Original Message-----
> From: Maupin, Chase
> Sent: Wednesday, December 18, 2013 5:09 PM
> To: Nelson, Sam; meta-ti@yoctoproject.org
> Subject: RE: [meta-ti] [PATCH v4] cmem: Adding New recipe for cmem
>=20
> Sam,
>=20
> Can you please include patch version notes in the patch?  i.e.
>=20
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
> Fixed in Version 4:
> 	* Item 1
> 	* Item 2
>=20
> ---
>  recipes-bsp/cmem/cmem-mod_git.bb |    4 ++--
>  recipes-bsp/cmem/cmem.inc        |    4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>=20
> Without that reviewing multiple patch revisions, particularly over time i=
s
> extremely difficult.
>=20
>=20
> Sincerely,
> Chase Maupin
> Integration Team Manager
> Linux Core Product Development
> e-mail: chase.maupin@ti.com
> phone: (214) 567-2950
>=20
> For support:
> Forums - http://community.ti.com/forums/
> Wiki - http://wiki.davincidsp.com/
>=20
>=20
> >-----Original Message-----
> >From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> >bounces@yoctoproject.org] On Behalf Of Nelson, Sam
> >Sent: Wednesday, December 18, 2013 3:25 PM
> >To: meta-ti@yoctoproject.org
> >Subject: [meta-ti] [PATCH v4] cmem: Adding New recipe for cmem
> >
> >- Cmem module is used for user space contiguous memory alloation
> >
> >Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> >---
> > recipes-bsp/cmem/cmem-mod_git.bb |    4 ++--
> > recipes-bsp/cmem/cmem.inc        |    4 ++--
> > 2 files changed, 4 insertions(+), 4 deletions(-)
> >
> >diff --git a/recipes-bsp/cmem/cmem-mod_git.bb b/recipes-
> >bsp/cmem/cmem-mod_git.bb
> >index a072f77..bbd81d4 100644
> >--- a/recipes-bsp/cmem/cmem-mod_git.bb
> >+++ b/recipes-bsp/cmem/cmem-mod_git.bb
> >@@ -13,13 +13,13 @@ inherit module
> > do_compile () {
> >     unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
> >     cd ${S}
> >-    make -f lu.mak module_clean
> >+    make -f lu.mak modules_clean
> >     make -f lu.mak module
> >KERNEL_INSTALL_DIR=3D${STAGING_KERNEL_DIR}
> >TOOLCHAIN_PREFIX=3D${CROSS_COMPILE}
> > }
> >
> > do_install () {
> >     unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
> >     cd ${S}
> >-    make -f lu.mak module_install
> >KERNEL_INSTALL_DIR=3D"${STAGING_KERNEL_DIR}"
> >EXEC_DIR=3D"${D}/lib/modules/${KERNEL_VERSION}/extra"
> >INSTALL_MOD_PATH=3D"${D}"
> >+    make -f lu.mak modules_install
> >KERNEL_INSTALL_DIR=3D"${STAGING_KERNEL_DIR}"
> >EXEC_DIR=3D"${D}/lib/modules/${KERNEL_VERSION}/extra"
> >INSTALL_MOD_PATH=3D"${D}"
> > }
> >
> >diff --git a/recipes-bsp/cmem/cmem.inc b/recipes-bsp/cmem/cmem.inc
> >index 094b2dc..b1f441a 100644
> >--- a/recipes-bsp/cmem/cmem.inc
> >+++ b/recipes-bsp/cmem/cmem.inc
> >@@ -4,7 +4,7 @@ LICENSE =3D "GPLv2"
> > LIC_FILES_CHKSUM =3D
> >"file://include/ti/cmem.h;beginline=3D1;endline=3D30;md5=3Db86138d4028fb
> >8310b3b983024edc620"
> >
> > BRANCH ?=3D "master"
> >-# This corresponds to version 4.00.00.06
> >-SRCREV =3D "c2cf2406702bcb889c10d0e6e7d298ba7b84ae7d"
> >+# This corresponds to version 4.00.01.08
> >+SRCREV =3D "0b68dfe9f155a1978cdb2178e052dc0d6f1e705b"
> >
> > SRC_URI =3D
> >"git://git.ti.com/ipc/ludev.git;protocol=3Dgit;branch=3D${BRANCH}"
> >--
> >1.7.9.5
> >
> >_______________________________________________
> >meta-ti mailing list
> >meta-ti@yoctoproject.org
> >https://lists.yoctoproject.org/listinfo/meta-ti

