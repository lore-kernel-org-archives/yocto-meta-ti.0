Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 331CBE00831; Fri, 19 Aug 2016 18:56:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9B4BDE007B1
	for <meta-ti@yoctoproject.org>; Fri, 19 Aug 2016 18:56:03 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u7K1u2g8013727;
	Fri, 19 Aug 2016 20:56:02 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u7K1u1HP032455;
	Fri, 19 Aug 2016 20:56:01 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 19 Aug 2016 20:56:00 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u7K1u0Rq004775;
	Fri, 19 Aug 2016 20:56:01 -0500
Date: Fri, 19 Aug 2016 21:55:58 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Christian Litjes <cflitjes@gmail.com>
Message-ID: <20160820015558.GH18333@edge>
References: <CA+1SGi9iTiTOAt77B7kZXzD+QUGbiQ7g6rKZJFo0BUyPGrqnog@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+1SGi9iTiTOAt77B7kZXzD+QUGbiQ7g6rKZJFo0BUyPGrqnog@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: Patch loadaddr for linux-ti-staging_4.4.bb
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
X-List-Received-Date: Sat, 20 Aug 2016 01:56:06 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Aug 04, 2016 at 09:07:34AM +0100, Christian Litjes wrote:
> Hi,
> 
> I've been using the linux-ti-staging_4.4.bb recipe from the master. When I
> decided to swap back to the stable krogoth. The build failed because
> uImages are not supported anymore because the LOADADDR was missing.

LOADADDR was dropped couple months ago both in krogoth and master, as zImage 
and/or fitImage formats are preferred over uImage. If you still need to use 
uImage, please set LOADADDR in either .bbappend or machine/local.conf.

-- 
Denys


> From 5f57bce61317da76b42389a658475dd00b207278 Mon Sep 17 00:00:00 2001
> From: Christian Litjes <christianlitjes@hotmail.com>
> Date: Thu, 4 Aug 2016 08:59:21 +0100
> Subject: [PATCH 1/1] Added missing LOADADDR to support building uImages again
> 
> ---
>  recipes-kernel/linux/linux-ti-staging_4.4.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/recipes-kernel/linux/linux-ti-staging_4.4.bb b/recipes-kernel/linux/linux-ti-staging_4.4.bb
> index 0200715..6772c3e 100644
> --- a/recipes-kernel/linux/linux-ti-staging_4.4.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_4.4.bb
> @@ -67,6 +67,8 @@ KERNEL_DEVICETREE_k2e-evm = "keystone-k2e-evm.dtb"
>  KERNEL_DEVICETREE_k2g-evm = "keystone-k2g-evm.dtb"
>  KERNEL_DEVICETREE_k2l-evm = "keystone-k2l-evm.dtb"
>  
> +KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
> +
>  COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|omap3|omap4|keystone"
>  
>  S = "${WORKDIR}/git"
> -- 
> 2.7.4
> 

> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


