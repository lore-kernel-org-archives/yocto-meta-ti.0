Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD147CCF9EE
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 20:11:40 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web01.13546.1761768697309195710
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Oct 2025 13:11:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 09D7A40C56;
	Wed, 29 Oct 2025 20:11:36 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bIRE8YgCexkU; Wed, 29 Oct 2025 20:11:36 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D49BB407DA;
	Wed, 29 Oct 2025 20:11:33 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2D61016EC68; Wed, 29 Oct 2025 16:11:33 -0400 (EDT)
Date: Wed, 29 Oct 2025 16:11:33 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: v-singh1@ti.com
Cc: meta-ti@lists.yoctoproject.org, reatmon@ti.com
Subject: Re: [meta-ti][scarthgap][PATCH v5] ti-librpmsg-dma: update
 ti-librpmsg-dma SRCREV & LICENSE
Message-ID: <20251029201133.GH3125@denix.org>
References: <20251029060209.707510-1-v-singh1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029060209.707510-1-v-singh1@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Oct 2025 20:11:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19208

On Wed, Oct 29, 2025 at 11:32:09AM +0530, Vishnu Singh via lists.yoctoproject.org wrote:
> From: Vishnu Singh <v-singh1@ti.com>
> 
> Replace MIT license with TI-TFL to align with TI release policy
> and product requirements. Legal approval: SRAS00013045
> Update scarthgap srcrev and disable 2dfft example from lib build.
> 
> License-Update: Replace MIT to TI-TFL license

Sorry to be pedantic and blunt, but that's not the reason, that's tautology.

License-Update tag (and the commit message in general) must answer the "Why?" 
question, not the "What?" question. We can all see the "What?" question being 
answered by the code change itself. There's no need to repeat that with the 
"changing X to Y". You need to explain why you are changing X to Y...


> Signed-off-by: Vishnu Singh <v-singh1@ti.com>
> ---
> Change log:
>        v1->v2:
>               - Update commit message with license-update
>        v2->v3:
>               - Update SRCREV (license updated in README) 
>        v3->v4:
>               - Add branch name in patch subject 
>        v4->v5:
>               - Update latest SRCREV 
> 
>  meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
> index b624871d..7600f867 100644
> --- a/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
> +++ b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
> @@ -1,9 +1,9 @@
>  SUMMARY = "RPMsg DMA shared library"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=744e63d2bb8c6151dcdd97f49aa02c53"
> +LICENSE = "TI-TFL"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=91dc4ee6d125d0aaba4e5bd2fcc50ed3"
>  
> -SRC_URI = "git://github.com/TexasInstruments/rpmsg-dma.git;protocol=https;branch=main"
> -SRCREV = "609fd72f458ba56f80d06810509ef88d010d2c03"
> +SRC_URI = "git://github.com/TexasInstruments/rpmsg-dma.git;protocol=https;branch=scarthgap"
> +SRCREV = "153951932925a72346b76d98b2774952c48a82fc"
>  
>  S = "${WORKDIR}/git"
>  
> @@ -11,6 +11,6 @@ inherit cmake
>  
>  DEPENDS = "ti-rpmsg-char"
>  
> -EXTRA_OECMAKE += "-DBUILD_LIB=ON -DBUILD_EXAMPLE=OFF"
> +EXTRA_OECMAKE += "-DBUILD_LIB=ON -DBUILD_AUDIO_OFFLOAD_EXAMPLE=OFF -DBUILD_2DFFT_OFFLOAD_EXAMPLE=OFF"
>  
>  COMPATIBLE_MACHINE = "^(k3)$"
> -- 
> 2.50.1

