Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E63F0CEFC3F
	for <webhook@archiver.kernel.org>; Tue,  8 Oct 2024 19:06:13 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.4132.1728414367300888948
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 08 Oct 2024 12:06:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6660C40C50;
	Tue,  8 Oct 2024 19:06:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A6-5VYj9KELZ; Tue,  8 Oct 2024 19:06:06 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 39BDB40B66;
	Tue,  8 Oct 2024 19:06:03 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 505C91640AC; Tue,  8 Oct 2024 15:06:02 -0400 (EDT)
Date: Tue, 8 Oct 2024 15:06:02 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master][PATCH] optee: Update to v4.3.0
Message-ID: <20241008190602.GI14676@denix.org>
References: <20241004190825.24897-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004190825.24897-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 08 Oct 2024 19:06:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17986

I was wondering if OPTEE and TFA should also be made BSP-aware. Maybe even 
SYSFW and/or other FWs.

How much backward compatibility is ensured and tested here? Will 4.3.0 version 
here work with BSP 6.1?


On Fri, Oct 04, 2024 at 02:08:25PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> Update all of the components to the upstream 4.3.0 version.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  .../recipes-security/optee/optee-client-ti-version.inc        | 4 ++--
>  .../recipes-security/optee/optee-examples-ti-version.inc      | 2 +-
>  meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc    | 4 ++--
>  meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc  | 4 ++--
>  4 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
> index 22a363f4..5f06fa03 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
> @@ -1,2 +1,2 @@
> -PV = "4.2.0+git"
> -SRCREV = "3eac340a781c00ccd61b151b0e9c22a8c6e9f9f0"
> +PV = "4.3.0+git"
> +SRCREV = "a5b1ffcd26e328af0bbf18ab448a38ecd558e05c"
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
> index 2d7a95bd..4d9897a7 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
> @@ -1,2 +1,2 @@
> -PV = "4.2.0+git"
> +PV = "4.3.0+git"
>  SRCREV = "378dc0db2d5dd279f58a3b6cb3f78ffd6b165035"
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
> index 790f5f5f..a79e5702 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
> @@ -1,2 +1,2 @@
> -PV = "4.2.0+git"
> -SRCREV = "12d7c4ee4642d2d761e39fbcf21a06fb77141dea"
> +PV = "4.3.0+git"
> +SRCREV = "1c0d52ace3c237ca6276cafb5c73f699a75c1d40"
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
> index fdfa420c..0b902d69 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
> @@ -1,2 +1,2 @@
> -PV = "4.2.0+git"
> -SRCREV = "526d5bac1b65f907f67c05cd07beca72fbab88dd"
> +PV = "4.3.0+git"
> +SRCREV = "9d4c4fb9638fb533211037016b6da12fbbcc4bb6"
> -- 
> 2.17.1

