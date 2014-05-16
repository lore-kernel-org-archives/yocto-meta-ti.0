Return-Path: <chase.maupin@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1323EE00716; Fri, 16 May 2014 11:39:49 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=RCVD_IN_DNSWL_HI,RDNS_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	*  1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from bear.ext.ti.com (unknown [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4BDC3E006EC
	for <meta-ti@yoctoproject.org>; Fri, 16 May 2014 11:39:39 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4GIdcbx028320
	for <meta-ti@yoctoproject.org>; Fri, 16 May 2014 13:39:38 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4GIdctJ006557
	for <meta-ti@yoctoproject.org>; Fri, 16 May 2014 13:39:38 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0174.001; Fri, 16 May 2014 13:39:38 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH] cmem: Update to new version of cmem  4.0.2.11
Thread-Index: AQHPcTMjj66JKX10hkifoUy70fWPQZtDiI1w
Date: Fri, 16 May 2014 18:39:37 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015D022862@DLEE11.ent.ti.com>
References: <1400264234-24709-1-git-send-email-sam.nelson@ti.com>
In-Reply-To: <1400264234-24709-1-git-send-email-sam.nelson@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] cmem: Update to new version of cmem 4.0.2.11
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
X-List-Received-Date: Fri, 16 May 2014 18:39:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>bounces@yoctoproject.org] On Behalf Of Nelson, Sam
>Sent: Friday, May 16, 2014 1:17 PM
>To: meta-ti@yoctoproject.org
>Subject: [meta-ti] [PATCH] cmem: Update to new version of cmem
>4.0.2.11
>
>- updated PR prefix to be common
>- Updated license file checksum
>- Updated SRCREV commit Id
>
>Signed-off-by: Sam Nelson <sam.nelson@ti.com>
>---
> recipes-bsp/cmem/cmem-mod_git.bb |    2 +-
> recipes-bsp/cmem/cmem.inc        |    8 +++++---
> recipes-bsp/cmem/cmem_git.bb     |    2 +-

Can these recipes be combined into one that splits out the different parts?=
 May not be worth the effort but just curious of that has been looked at.

Aside from that:

Reviewed-by: Chase Maupin <chase.maupin@ti.com>

> 3 files changed, 7 insertions(+), 5 deletions(-)
>
>diff --git a/recipes-bsp/cmem/cmem-mod_git.bb b/recipes-
>bsp/cmem/cmem-mod_git.bb
>index 2bdf9c0..f926fef 100644
>--- a/recipes-bsp/cmem/cmem-mod_git.bb
>+++ b/recipes-bsp/cmem/cmem-mod_git.bb
>@@ -3,7 +3,7 @@ DESCRIPTION =3D "Kernel module for contiguous memory
>allocation from userspace"
> include cmem.inc
>
> # This package builds a kernel module, use kernel PR as base and
>append a local
>-MACHINE_KERNEL_PR_append =3D "a+gitr${SRCPV}"
>+MACHINE_KERNEL_PR_append =3D "${CMEM_PR_PREFIX}+gitr${SRCPV}"
> PR =3D "${MACHINE_KERNEL_PR}"
>
> inherit module
>diff --git a/recipes-bsp/cmem/cmem.inc b/recipes-bsp/cmem/cmem.inc
>index 7927839..ef57bb5 100644
>--- a/recipes-bsp/cmem/cmem.inc
>+++ b/recipes-bsp/cmem/cmem.inc
>@@ -1,11 +1,13 @@
> HOMEPAGE =3D
>"http://processors.wiki.ti.com/index.php/Category:CMEM"
>
> LICENSE =3D "GPLv2"
>-LIC_FILES_CHKSUM =3D
>"file://include/ti/cmem.h;beginline=3D1;endline=3D30;md5=3Db86138d4028fb
>8310b3b983024edc620"
>+LIC_FILES_CHKSUM =3D
>"file://include/ti/cmem.h;beginline=3D1;endline=3D30;md5=3D9b745e2765a6b
>a8a636c91aed4b02ac1"
>
> BRANCH ?=3D "master"
>-# This corresponds to version 4.00.01.08
>-SRCREV =3D "0b68dfe9f155a1978cdb2178e052dc0d6f1e705b"
>+# This corresponds to version 4.00.02.11
>+SRCREV =3D "317792d2c18c1144401e2aee689aadebbd3a9b12"
>+CMEM_PR_PREFIX =3D "b"
>+PV=3D"4.0.2.11"
>
> SRC_URI =3D
>"git://git.ti.com/ipc/ludev.git;protocol=3Dgit;branch=3D${BRANCH}"
>
>diff --git a/recipes-bsp/cmem/cmem_git.bb b/recipes-
>bsp/cmem/cmem_git.bb
>index b633d74..2382451 100644
>--- a/recipes-bsp/cmem/cmem_git.bb
>+++ b/recipes-bsp/cmem/cmem_git.bb
>@@ -4,7 +4,7 @@ include cmem.inc
>
> RDEPENDS_${PN} =3D "cmem-mod"
>
>-PR =3D "r0+gitr${SRCPV}"
>+PR =3D "${CMEM_PR_PREFIX}+gitr${SRCPV}"
>
> PACKAGES =3D+ "${PN}-test"
>
>--
>1.7.9.5
>
>--
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti

