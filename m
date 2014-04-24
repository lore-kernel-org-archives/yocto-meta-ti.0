Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C89EAE00B6E
	for <meta-ti@yoctoproject.org>; Thu, 24 Apr 2014 08:13:57 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s3OFDtGI026121;
	Thu, 24 Apr 2014 10:13:56 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s3OFDta4032187;
	Thu, 24 Apr 2014 10:13:55 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 24 Apr 2014 10:13:55 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s3OFDt40005359;
	Thu, 24 Apr 2014 10:13:55 -0500
Date: Thu, 24 Apr 2014 11:13:55 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20140424151355.GN18053@edge>
References: <1398290092-20034-1-git-send-email-denis@denix.org>
	<1398290092-20034-2-git-send-email-denis@denix.org>
	<7D46E86EC0A8354091174257B2FED1015CFB211C@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015CFB211C@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 2/3] am33x-cm3, ti-msp430: update license from TI-BSD to BSD-3-Clause
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
X-List-Received-Date: Thu, 24 Apr 2014 15:14:00 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Apr 24, 2014 at 12:44:03PM +0000, Maupin, Chase wrote:
> 
> >-----Original Message-----
> >From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> >bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
> >Sent: Wednesday, April 23, 2014 4:55 PM
> >To: meta-ti@yoctoproject.org
> >Subject: [meta-ti] [PATCH 2/3] am33x-cm3, ti-msp430: update
> >license from TI-BSD to BSD-3-Clause
> >
> >From: Denys Dmytriyenko <denys@ti.com>
> >
> >Per recommendation from OSRB and Legal.
> >
> >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >---
> > recipes-bsp/ti/am33x-cm3_git.bb                   | 4 ++--
> > recipes-ti/msp430/ti-msp430-chronos_1.05.00.00.bb | 2 +-
> > 2 files changed, 3 insertions(+), 3 deletions(-)
> >
> >diff --git a/recipes-bsp/ti/am33x-cm3_git.bb b/recipes-
> >bsp/ti/am33x-cm3_git.bb
> >index 01d1273..42f20da 100644
> >--- a/recipes-bsp/ti/am33x-cm3_git.bb
> >+++ b/recipes-bsp/ti/am33x-cm3_git.bb
> >@@ -1,10 +1,10 @@
> > DESCRIPTION = "Cortex-M3 binary blob for suspend-resume"
> >
> >-LICENSE = "TI-BSD"
> >+LICENSE = "BSD-3-Clause"
> > LIC_FILES_CHKSUM =
> >"file://License.txt;md5=7bdc54a749ab7a7dea999d25d99a41b8"
> >
> > PV = "05.00.00.03"
> >-PR = "r0"
> >+PR = "r1"
> >
> > # Make package machine specific due to different init scripts
> > PACKAGE_ARCH = "${MACHINE_ARCH}"
> >diff --git a/recipes-ti/msp430/ti-msp430-chronos_1.05.00.00.bb
> >b/recipes-ti/msp430/ti-msp430-chronos_1.05.00.00.bb
> >index 0a48b17..dd493f8 100644
> >--- a/recipes-ti/msp430/ti-msp430-chronos_1.05.00.00.bb
> >+++ b/recipes-ti/msp430/ti-msp430-chronos_1.05.00.00.bb
> >@@ -1,6 +1,6 @@
> > DESCRIPTION = "eZ430 Chronos Tools - MSP430 Development
> >Kit/Watch"
> > HOMEPAGE = "http://processors.wiki.ti.com/index.php/EZ430-
> >Chronos"
> >-LICENSE = "TI-BSD"
> >+LICENSE = "BSD-3-Clause"
> 
> Why no PR bump here?

Just lazily going away from bumping PRs for non-critical packages... :)


> And as we look at Dora should we enable the PR service?

Yes, that is next on my list, but is not related to meta-ti. We'll need to do 
it in our distro.


> > # We can't use the actualy source file, since it has space in its
> >name :(
> > LIC_FILES_CHKSUM = "file://eZ430-
> >Chronos_CC_1_1.tcl;md5=59ba6ee0a26650ec660a4e65a9462806"
> >
> >--
> >1.9.2
> >
> >--
> >_______________________________________________
> >meta-ti mailing list
> >meta-ti@yoctoproject.org
> >https://lists.yoctoproject.org/listinfo/meta-ti
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

