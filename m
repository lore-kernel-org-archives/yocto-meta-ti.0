Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 623CCE01601
	for <meta-ti@yoctoproject.org>; Wed, 25 Sep 2013 12:09:18 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8PJ9HXB001817;
	Wed, 25 Sep 2013 14:09:17 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8PJ9Hrj005342;
	Wed, 25 Sep 2013 14:09:17 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Wed, 25 Sep 2013 14:09:17 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, Denys Dmytriyenko <denis@denix.org>,
	"meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH] linux-ti-staging: fix missing kernel image
	in	/boot
Thread-Index: AQHOuiJsuP+aBsIRZUqQNlEzL/rWW5nW0SPQ
Date: Wed, 25 Sep 2013 19:09:16 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C55EE13@DFLE08.ent.ti.com>
References: <1380135454-5044-1-git-send-email-denis@denix.org>
	<7D46E86EC0A8354091174257B2FED1015974ECC0@DLEE11.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015974ECC0@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] linux-ti-staging: fix missing kernel image	in	/boot
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
X-List-Received-Date: Wed, 25 Sep 2013 19:09:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Maupin, Chase
> Sent: Wednesday, September 25, 2013 2:07 PM
> To: Denys Dmytriyenko; meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH] linux-ti-staging: fix missing kernel image=
 in /boot
>=20
> Acked-by: Chase Maupin <chase.maupin@ti.com>
>=20
>=20
>=20
> >-----Original Message-----
> >From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> >bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
> >Sent: Wednesday, September 25, 2013 1:58 PM
> >To: meta-ti@yoctoproject.org
> >Subject: [meta-ti] [PATCH] linux-ti-staging: fix missing kernel image
> >in /boot
> >
> >From: Denys Dmytriyenko <denys@ti.com>
> >
> >We rely on kernel-base having run-time dependency on kernel-image,
> >which normally would pull uImage/zImage into /boot directory of rootfs.
> >Thanks to Chase for pointing me in the right direction by noticing that
> >our addition of cm3 firmware breaks that dependency for ti33x.
> >The reason for that is RDEPENDS is being conditionally assigned with ?=
=3D
> >in kernel.bbclass and using +=3D with that is unsafe/racy and _append
> >should be used instead.
> >
> >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >---
> > recipes-kernel/linux/linux-ti-staging_3.8.bb | 2 +-
> >recipes-kernel/linux/linux-ti-staging_git.bb | 2 +-
> > 2 files changed, 2 insertions(+), 2 deletions(-)
> >
> >diff --git a/recipes-kernel/linux/linux-ti-staging_3.8.bb
> >b/recipes-kernel/linux/linux-ti-staging_3.8.bb
> >index fd7b671..833fb48 100644
> >--- a/recipes-kernel/linux/linux-ti-staging_3.8.bb
> >+++ b/recipes-kernel/linux/linux-ti-staging_3.8.bb
> >@@ -11,7 +11,7 @@ require recipes-kernel/linux/setup-defconfig.inc
> >
> > # Add a run-time dependency for the PM firmware to be installed  # on
> >the target file system.
> >-RDEPENDS_kernel-base_ti33x +=3D "am33x-cm3 am33x-cm3-initscript"
> >+RDEPENDS_kernel-base_append_ti33x =3D " am33x-cm3 am33x-cm3-
> >initscript"
> >
> > # Default is to package all dtb files for ti33x devices unless
> >building  # for the specific beaglebone machine.
> >diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb
> >b/recipes-kernel/linux/linux-ti-staging_git.bb
> >index e903215..778ea7f 100644
> >--- a/recipes-kernel/linux/linux-ti-staging_git.bb
> >+++ b/recipes-kernel/linux/linux-ti-staging_git.bb
> >@@ -10,7 +10,7 @@ require recipes-kernel/linux/setup-defconfig.inc
> >
> > # Add a run-time dependency for the PM firmware to be installed  # on
> >the target file system.
> >-RDEPENDS_kernel-base_ti33x +=3D "am33x-cm3 am33x-cm3-initscript"
> >+RDEPENDS_kernel-base_append_ti33x =3D " am33x-cm3 am33x-cm3-
> >initscript"
> >
> > # Default is to package all dtb files for ti33x devices unless
> >building  # for the specific beaglebone machine.
> >--
> >1.8.3.2
> >
> >_______________________________________________
> >meta-ti mailing list
> >meta-ti@yoctoproject.org
> >https://lists.yoctoproject.org/listinfo/meta-ti
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

