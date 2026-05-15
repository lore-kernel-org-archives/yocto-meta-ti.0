Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1A7FCD4F25
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 14:51:02 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36705.1778856660871764472
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 15 May 2026 07:51:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EA51340CC3;
	Fri, 15 May 2026 14:50:59 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RjASZkojiMsA; Fri, 15 May 2026 14:50:59 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8133340CCA;
	Fri, 15 May 2026 14:50:52 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C55C617DAE2; Fri, 15 May 2026 10:50:51 -0400 (EDT)
Date: Fri, 15 May 2026 10:50:51 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: s-joshi@ti.com
Cc: meta-ti@lists.yoctoproject.org, kamlesh@ti.com, k-malarvizhi@ti.com,
	s-tripathi1@ti.com, praneeth@ti.com, m-chawdhry@ti.com,
	vishalm@ti.com
Subject: Re: [meta-ti][master][PATCH] meta-ti: optee: Update to 4.10.0 tag
Message-ID: <20260515145051.GC7941@denix.org>
References: <20260515062818.1468076-1-s-joshi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515062818.1468076-1-s-joshi@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 15 May 2026 14:51:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19935

Should this also go into wrynose besides master?


On Fri, May 15, 2026 at 11:58:18AM +0530, Suhaas Joshi via lists.yoctoproject.org wrote:
> Update optee_os, optee_test, optee_client, optee_examples and optee_ftpm to
> 4.10.0 tag.
> 
> Signed-off-by: Suhaas Joshi <s-joshi@ti.com>
> ---
> Tested this on AM62L using `xtest`.
> ---
>  .../recipes-security/optee/optee-client-ti-version.inc        | 2 +-
>  .../recipes-security/optee/optee-examples-ti-version.inc      | 2 +-
>  meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc  | 2 +-
>  meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc    | 4 ++--
>  meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc  | 4 ++--
>  5 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
> index 68b6b262..7968f3fb 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
> @@ -1,2 +1,2 @@
> -PV = "4.9.0+git"
> +PV = "4.10.0+git"
>  SRCREV = "9f5e90918093c1d1cd264d8149081b64ab7ba672"
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
> index 6ec2a83d..eea7762f 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
> @@ -1,2 +1,2 @@
> -PV = "4.9.0+git"
> +PV = "4.10.0+git"
>  SRCREV = "934c7edb74a26e90f68024cf441073528444177f"
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc
> index 350eb9c9..b961c70f 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc
> @@ -1,3 +1,3 @@
> -PV = "4.9.0+git"
> +PV = "4.10.0+git"
>  OPTEE_TA_GIT_TAG = "${@'branch=master' if d.getVar('PV') == 'git' or d.getVar('PV').endswith('+git') else 'tag=%s;nobranch=1' % d.getVar('PV')}"
>  SRCREV_optee-ta = "a09269b15de635e1816fe832e26adfbfb44c5455"
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
> index db18c696..473c5282 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
> @@ -1,2 +1,2 @@
> -PV = "4.9.0+git"
> -SRCREV = "f2a7ad0638aeff5243593b33cc56ad064cae7615"
> +PV = "4.10.0+git"
> +SRCREV = "753afbbee1682f5d16fd30e87b31058a4fd4f4b8"
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
> index 15b43063..8a8e9ac8 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
> @@ -1,4 +1,4 @@
>  FILESEXTRAPATHS:prepend := "${THISDIR}/optee-test:"
>  
> -PV = "4.9.0+git"
> -SRCREV = "b27648ea8472cceceb8dda368a965c709066f7aa"
> +PV = "4.10.0+git"
> +SRCREV = "88c93e87a5c172363ee986ded036a25cafcc9d2c"
> -- 
> 2.34.1

