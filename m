Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7770AC71153
	for <webhook@archiver.kernel.org>; Mon, 28 Aug 2023 20:39:25 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.2465.1693255160589047302
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 28 Aug 2023 13:39:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7ABA240CB3;
	Mon, 28 Aug 2023 20:39:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 74udNVDWsupQ; Mon, 28 Aug 2023 20:39:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-110-236.washdc.fios.verizon.net [100.15.110.236])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4765F40C7B;
	Mon, 28 Aug 2023 20:39:16 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 072F6163C94; Mon, 28 Aug 2023 16:39:16 -0400 (EDT)
Date: Mon, 28 Aug 2023 16:39:15 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master][PATCH] ti-img-rogue-umlibs: Add DEPENDS on
 BASE_DEFAULT_DEPS
Message-ID: <20230828203915.GQ3359@denix.org>
References: <20230828202211.22475-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230828202211.22475-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 28 Aug 2023 20:39:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16896

On Mon, Aug 28, 2023 at 03:22:11PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> A recent change to oe-core [1], has caused a pile of QA errors during
> packaging for this binary package.  The effect of the change in oe-core
> was to remove the dependency on the compiler and other compiler adjacent
> libraries.  But the binary packages need some of the compiler tools as
> part of the packaging flow (ie. objdump).
> 
> Until the above gets reverted, this patch will fix the issue and can be
> reverted itself once oe-core is fixed.
> 
> [1] https://git.openembedded.org/openembedded-core/commit/?h=master&id=d1d09bd4d7be88f0e341d5fccbfbefeb98d4b727

Why not simply reset INHIBIT_DEFAULT_DEPS in the recipe?


> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  .../powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb          | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
> index f748bd0f..73de93e5 100644
> --- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
> +++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
> @@ -37,6 +37,8 @@ PACKAGECONFIG[opengl] = ",,,,${GLES_PACKAGES}"
>  PACKAGECONFIG[vulkan] = ",,,,${VULKAN_PACKAGES}"
>  PACKAGECONFIG[opencl] = ",,,,${OPENCL_PACKAGES}"
>  
> +DEPENDS:prepend = "${BASE_DEFAULT_DEPS} "
> +
>  def get_file_list(package_list_var, d):
>      file_list = []
>      package_list = d.getVar(package_list_var)
> -- 
> 2.17.1

