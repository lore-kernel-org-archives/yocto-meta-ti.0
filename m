Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DFAF8E00C3E; Tue, 11 Jul 2017 16:02:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.16 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 615CEE00BD0
	for <meta-ti@yoctoproject.org>; Tue, 11 Jul 2017 16:02:28 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6BN2IaX020888
	for <meta-ti@yoctoproject.org>; Tue, 11 Jul 2017 18:02:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499814138;
	bh=PIXWRA3UhWr4kfqzT3H8akNOYeT2rvoqlRew0Vri9H8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=DAIRQTH7FE+S//XxVTScykUaD1kfU/Wzpfai5O3O94wUI1Iief7B451sE0Fg/L5Vc
	8mmJyOSTnSYugOFB04nnolx3KZmpo0gEe6WpjjXLgVPE+vP3QcXLDChi3oKmvSdAJ4
	EoRXxqbf1NPZ1KjLhdA7NdxWgClE/jiVE2rdrSpk=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6BN2D38026077
	for <meta-ti@yoctoproject.org>; Tue, 11 Jul 2017 18:02:13 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 11 Jul 2017 18:02:12 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6BN2C7W012121;
	Tue, 11 Jul 2017 18:02:12 -0500
Date: Tue, 11 Jul 2017 19:02:10 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20170711230210.GJ10230@edge>
References: <1498854500-43685-1-git-send-email-m-radhakrishnan2@ti.com>
	<2afa6b07-9fd6-51d8-3ca9-adb837e29916@ti.com>
MIME-Version: 1.0
In-Reply-To: <2afa6b07-9fd6-51d8-3ca9-adb837e29916@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] edma3-lld-rtos: Add support for omapl1
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
X-List-Received-Date: Tue, 11 Jul 2017 23:02:31 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Jul 05, 2017 at 11:48:33AM -0400, Jacob Stiffler wrote:
> Do you need to add the PLATFORMLIST and TARGETLIST for omapl?

ping


> On 6/30/2017 4:28 PM, Mahesh Radhakrishnan wrote:
> >Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> >---
> >  recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> >diff --git a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
> >index f524478..a31aa2d 100644
> >--- a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
> >+++ b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
> >@@ -1,11 +1,11 @@
> >  require edma3-lld.inc
> >  require recipes-ti/includes/ti-paths.inc
> >-PR = "${INC_PR}.1"
> >+PR = "${INC_PR}.2"
> >  DEPENDS = "ti-sysbios ti-xdctools gcc-arm-none-eabi-native ti-cgt-arm-native ti-cgt6x-native"
> >-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone"
> >+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|omapl1"
> >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> >  PLATFORMLIST = ""
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

