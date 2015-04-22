Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8E186E009AE; Wed, 22 Apr 2015 15:16:14 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A51B5E00994
	for <meta-ti@yoctoproject.org>; Wed, 22 Apr 2015 15:16:12 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3MMFdZR002670;
	Wed, 22 Apr 2015 17:15:39 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3MMFcPK028883;
	Wed, 22 Apr 2015 17:15:38 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 22 Apr 2015 17:15:37 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3MMFbSr013505;
	Wed, 22 Apr 2015 17:15:37 -0500
Date: Wed, 22 Apr 2015 18:15:37 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Cody P Schafer <dev@codyps.com>
Message-ID: <20150422221537.GM25236@edge>
References: <1406684113-18232-2-git-send-email-denis@denix.org>
	<1406842426-28955-1-git-send-email-denis@denix.org>
	<CAPoQQ-0r2tnPZ0Zk-FSiOYqA_TYmXz5hMxrbWpTGW79KdJpLiA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPoQQ-0r2tnPZ0Zk-FSiOYqA_TYmXz5hMxrbWpTGW79KdJpLiA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH v2 2/2] omap3-sgx-modules 5.01.01.01: add Darren's patches to work with 3.14 kernel
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
X-List-Received-Date: Wed, 22 Apr 2015 22:16:14 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Apr 22, 2015 at 05:57:56PM -0400, Cody P Schafer wrote:
> On Thu, Jul 31, 2014 at 5:33 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> > From: Denys Dmytriyenko <denys@ti.com>
> >
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> > v2 - update patch #4 to not break builds against 3.12 kernel
> >
> >  ...SDK-Make-5_01_01_01-work-against-3.14-LTS.patch |  52 +++++++
> >  ...x-use-platform-data-to-provide-reset-info.patch | 121 ++++++++++++++++
> >  ...class-am335x-am437x-fix-mutex-deadlock-wa.patch | 153 +++++++++++++++++++++
> >  ...-make-it-building-against-ti-linux-3.14.y.patch |  45 ++++++
> >  .../omap3-sgx-modules_5.01.01.01.bb                |   7 +-
> >  5 files changed, 377 insertions(+), 1 deletion(-)
> >  create mode 100644 recipes-bsp/powervr-drivers/omap3-sgx-modules-5.01.01.01/0001-PoC-GFX-SDK-Make-5_01_01_01-work-against-3.14-LTS.patch
> >  create mode 100644 recipes-bsp/powervr-drivers/omap3-sgx-modules-5.01.01.01/0002-SGX-linux-use-platform-data-to-provide-reset-info.patch
> >  create mode 100644 recipes-bsp/powervr-drivers/omap3-sgx-modules-5.01.01.01/0003-SGX-displayclass-am335x-am437x-fix-mutex-deadlock-wa.patch
> >  create mode 100644 recipes-bsp/powervr-drivers/omap3-sgx-modules-5.01.01.01/0004-SGX-linux-make-it-building-against-ti-linux-3.14.y.patch
> >
> [snip]
> 
> It looks like the new 5.01.01.02 also needs some of these patches:

Those patches got merged into the recent staging kernel. So, no, they are no 
longer needed.


> | /home/cody/obj/y/tmp/work/beaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.02-b/Graphics_SDK_5_01_01_02/GFX_Linux_KM/services4/srvkm/env/linux/module.c:411:2:
> error: implicit declaration of function 'reset_control_clear_reset'
> [-Werror=implicit-function-declaration]
> |   ret = reset_control_clear_reset(rstc);
> |   ^
> | /home/cody/obj/y/tmp/work/beaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.02-b/Graphics_SDK_5_01_01_02/GFX_Linux_KM/services4/srvkm/env/linux/module.c:471:17:
> error: implicit declaration of function 'reset_control_is_reset'
> [-Werror=implicit-function-declaration]
> |                  ret = reset_control_is_reset(rstc);
> |                  ^
> | /home/cody/obj/y/tmp/work/beaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.02-b/Graphics_SDK_5_01_01_02/GFX_Linux_KM/services4/srvkm/env/linux/module.c:399:32:
> warning: unused variable 'pdata' [-Wunused-variable]
> |   struct gfx_sgx_platform_data *pdata = dev->platform_data;
> |                                 ^
> | cc1: some warnings being treated as errors
> | /home/cody/obj/y/tmp/work-shared/beaglebone/kernel-source/scripts/Makefile.build:257:
> recipe for target
> '/home/cody/obj/y/tmp/work/beaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.02-b/Graphics_SDK_5_01_01_02/GFX_Linux_KM/services4/srvkm/env/linux/module.o'
> failed
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

