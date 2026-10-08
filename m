Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23774CA600C
	for <webhook@archiver.kernel.org>; Thu,  8 Oct 2026 19:04:56 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2279.1791486288805487349
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 08 Oct 2026 12:04:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F019240CD3;
	Thu,  8 Oct 2026 19:04:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wq_gg_WwZ1PN; Thu,  8 Oct 2026 19:04:46 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B3A8240CD1;
	Thu,  8 Oct 2026 19:04:44 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id B0B7017EEF2; Thu,  8 Oct 2026 15:04:43 -0400 (EDT)
Date: Thu, 8 Oct 2026 15:04:43 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: b-brnich@ti.com
Cc: meta-ti@lists.yoctoproject.org, Ryan Eatmon <reatmon@ti.com>
Subject: Re: [meta-ti][master/wrynose][PATCH] meta-ti-test: Add gstreamer
 to multimedia packagegroup
Message-ID: <20261008190443.GR4190@denix.org>
References: <20261007165126.797434-1-b-brnich@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007165126.797434-1-b-brnich@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 08 Oct 2026 19:04:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20445

On Wed, Oct 07, 2026 at 11:51:26AM -0500, Brandon Brnich via lists.yoctoproject.org wrote:
> Any automated test for the HW accelerated video codecs require gstreamer
> to build the pipelines and handle passing data to the driver. Add these
> requirements to the ti-test-multimedia packagegroup.
> 
> Signed-off-by: Brandon Brnich <b-brnich@ti.com>
> ---
>  meta-ti-test/recipes-core/packagegroups/ti-test.bb | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-ti-test/recipes-core/packagegroups/ti-test.bb b/meta-ti-test/recipes-core/packagegroups/ti-test.bb
> index 8a348c26..b7474894 100644
> --- a/meta-ti-test/recipes-core/packagegroups/ti-test.bb
> +++ b/meta-ti-test/recipes-core/packagegroups/ti-test.bb
> @@ -94,6 +94,10 @@ TI_TEST_GRAPHICS = " \
>  "
>  
>  TI_TEST_MULTIMEDIA = "\
> +    gstreamer1.0 \
> +    gstreamer1.0-plugins-good \
> +    gstreamer1.0-plugins-base \
> +    gstreamer1.0-plugins-bad \
>      gst-devtools \
>      v4l-utils \
>      yavta \
> @@ -183,7 +187,7 @@ TI_TEST_TI_TOOLS:append:am65xx   = " \
>  "
>  
>  # Disable due to breakage
> -#    viddec-test-app 
> +#    viddec-test-app

Probably need to drop this chunk that changes the whitespace?


>  TI_TEST_TI_TOOLS:append:j721e = " \
>      pru-icss \
>      ufs-utils \
> -- 
> 2.43.0

