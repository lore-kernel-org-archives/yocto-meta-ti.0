Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6FCBEE007F8
	for <meta-ti@yoctoproject.org>; Wed, 15 Jan 2014 14:33:36 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0FMXYUD005613;
	Wed, 15 Jan 2014 16:33:35 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0FMXYSu020388;
	Wed, 15 Jan 2014 16:33:34 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 15 Jan 2014 16:33:34 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0FMXYCh020710;
	Wed, 15 Jan 2014 16:33:34 -0600
Date: Wed, 15 Jan 2014 17:33:34 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20140115223333.GF12727@edge>
References: <1389820588-17906-1-git-send-email-denis@denix.org>
	<7D46E86EC0A8354091174257B2FED101598FA0D1@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED101598FA0D1@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] vpe-vpdma: update SRCREV and pass CROSS_COMPILE
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
X-List-Received-Date: Wed, 15 Jan 2014 22:33:41 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Jan 15, 2014 at 10:25:01PM +0000, Maupin, Chase wrote:
> >-----Original Message-----
> >From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> >bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
> >Sent: Wednesday, January 15, 2014 3:16 PM
> >To: meta-ti@yoctoproject.org
> >Subject: [meta-ti] [PATCH] vpe-vpdma: update SRCREV and pass
> >CROSS_COMPILE
> >
> >From: Denys Dmytriyenko <denys@ti.com>
> >
> >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >---
> > recipes-bsp/ti/vpe-vpdma_git.bb | 6 +++---
> > 1 file changed, 3 insertions(+), 3 deletions(-)
> >
> >diff --git a/recipes-bsp/ti/vpe-vpdma_git.bb b/recipes-bsp/ti/vpe-
> >vpdma_git.bb
> >index d506791..fb3012a 100644
> >--- a/recipes-bsp/ti/vpe-vpdma_git.bb
> >+++ b/recipes-bsp/ti/vpe-vpdma_git.bb
> >@@ -8,9 +8,9 @@ LIC_FILES_CHKSUM =
> >"file://COPYING;md5=74d2f71d8898c54e3d1c9d0058c484aa"
> > COMPATIBLE_MACHINE = "dra7xx-evm"
> >
> > PV = "1b8"
> >-PR = "r0"
> >+PR = "r1"
> >
> >-SRCREV = "24a5487ec13bf560f0e7fb24a9d4747f9f358be2"
> >+SRCREV = "e3d8db1aa935775f9d196ad7428e0cd9864a36ca"
> > BRANCH ?= "master"
> >
> > SRC_URI =
> >"git://git.ti.com/vpe_tests/vpe_tests.git;protocol=git;branch=${BR
> >ANCH}"
> >@@ -18,7 +18,7 @@ SRC_URI =
> >"git://git.ti.com/vpe_tests/vpe_tests.git;protocol=git;branch=${BR
> >ANCH
> > S = "${WORKDIR}/git"
> >
> > # The test application needs additional include headers from the
> >kernel
> >-EXTRA_OEMAKE = 'KDIR="${STAGING_KERNEL_DIR}/include/uapi -
> >I${STAGING_KERNEL_DIR}/include"'
> >+EXTRA_OEMAKE = 'CROSS_COMPILE="${TARGET_PREFIX}"
> >KDIR="${STAGING_KERNEL_DIR}/include/uapi -
> >I${STAGING_KERNEL_DIR}/include"'
> 
> Shouldn't the setting of CC in OE already take care of this?  Or did the rebase affect the Makefile?

I believe it has been affected by this commit:
http://git.ti.com/gitweb/?p=vpe_tests/vpe_tests.git;a=commitdiff;h=e3d8db1aa935775f9d196ad7428e0cd9864a36ca

It overrides CC in the Makefile and the simplest way is to pass CROSS_COMPILE.


> > do_install() {
> >     oe_runmake DESTDIR="${D}" install
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

