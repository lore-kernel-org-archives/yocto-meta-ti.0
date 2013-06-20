Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1952CE0141B
	for <meta-ti@yoctoproject.org>; Wed, 19 Jun 2013 21:39:02 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5K4d1dO020748
	for <meta-ti@yoctoproject.org>; Wed, 19 Jun 2013 23:39:01 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5K4d1MV005943
	for <meta-ti@yoctoproject.org>; Wed, 19 Jun 2013 23:39:01 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 19 Jun 2013 23:39:01 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r5K4d11t017192;
	Wed, 19 Jun 2013 23:39:01 -0500
Date: Thu, 20 Jun 2013 00:39:00 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Prabindh Sundareson <prabu@ti.com>
Message-ID: <20130620043900.GQ13356@edge>
References: <prabu@ti.com>
 <1371057762-17055-1-git-send-email-prabu@ti.com>
MIME-Version: 1.0
In-Reply-To: <1371057762-17055-1-git-send-email-prabu@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 0/9] Graphics SDK cleanup
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
X-List-Received-Date: Thu, 20 Jun 2013 04:39:03 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Prabu,

There were few issues I found when testing your patches, but I've been working 
on the fixes past few days and should have it ready to be pushed shortly.

Not to force you to re-send the patches again, but ligles-omap3-x11 was 
actually missing. But even when added manually, it was causing conflicts with 
no-X11 version, breaking the parsing for distros w/o X11. Moreover, as was 
discussed long time ago, having both X11 and Raw variants of libraries and 
apps built and installed together is very useful for all-inclusive distros, so 
making those recipes conflict and replace each other is not a right way...

Having said all the above, I've done the necessary mods and am testing 
building different configurations at the moment. I'll let you know if I see 
any other issues. Thanks.

-- 
Denys


On Wed, Jun 12, 2013 at 10:52:33PM +0530, Prabindh Sundareson wrote:
> Patch-set removes unsupported features, and separates X11 and non-X11 
> builds, and enables support for Qt5 builds. This patch-set also squashes 2 
> commits together per discussion at 
> https://lists.yoctoproject.org/pipermail/meta-ti/2013-May/002774.html
> 
> Prabindh Sundareson (9):
>   libgles-omap3: Remove X11 related build and packaging
>   omap3-sgx-modules: Remove X11 related build and packaging
>   libgles-omap3: Remove unsupported core build option ES2.0
>   libgles-omap3: Remove OpenVG references
>   libgles-omap3: Remove copying of unused header files
>   libgles-omap3: Add missing RPROVIDES
>   libgles-omap3: Package files with right permission
>   libgles-omap3-x11: Separate X11 SGX driver package into new recipe
>   omap3-sgx-modules-x11: Separate X11 SGX driver package into new
>     recipe
> 
>  .../Compile-fixes-for-38-kernel.patch              |  346 ++++++++++++++++++++
>  .../omap3-sgx-modules-x11/kernel-30.patch          |   38 +++
>  .../omap3-sgx-modules-x11_4.09.00.01.bb            |   74 +++++
>  .../omap3-sgx-modules_4.09.00.01.bb                |    9 +-
>  recipes-graphics/libgles/libgles-omap3-no-x.inc    |  318 ++++++++++++++++++
>  .../libgles/libgles-omap3-x11-4.09.00.01/rc.pvr    |  125 +++++++
>  .../libgles-omap3-x11-4.09.00.01/rc_dri.pvr        |  137 ++++++++
>  recipes-graphics/libgles/libgles-omap3-x11.inc     |  323 ++++++++++++++++++
>  .../libgles/libgles-omap3_4.09.00.01.bb            |   45 +---
>  9 files changed, 1365 insertions(+), 50 deletions(-)
>  create mode 100644 recipes-bsp/powervr-drivers/omap3-sgx-modules-x11/Compile-fixes-for-38-kernel.patch
>  create mode 100644 recipes-bsp/powervr-drivers/omap3-sgx-modules-x11/kernel-30.patch
>  create mode 100644 recipes-bsp/powervr-drivers/omap3-sgx-modules-x11_4.09.00.01.bb
>  create mode 100644 recipes-graphics/libgles/libgles-omap3-no-x.inc
>  create mode 100644 recipes-graphics/libgles/libgles-omap3-x11-4.09.00.01/rc.pvr
>  create mode 100644 recipes-graphics/libgles/libgles-omap3-x11-4.09.00.01/rc_dri.pvr
>  create mode 100644 recipes-graphics/libgles/libgles-omap3-x11.inc
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

