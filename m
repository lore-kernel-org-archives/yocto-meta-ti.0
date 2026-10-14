Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CF86CC6B2D
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 21:44:07 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25804.1792014236345906159
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 14 Oct 2026 14:43:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 108C440C85;
	Wed, 14 Oct 2026 21:43:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AVYwVghZ022e; Wed, 14 Oct 2026 21:43:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9ECCB40031;
	Wed, 14 Oct 2026 21:43:49 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 9BA8117EEF5; Wed, 14 Oct 2026 17:43:48 -0400 (EDT)
Date: Wed, 14 Oct 2026 17:43:48 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: t-lannynd@ti.com
Cc: meta-ti@lists.yoctoproject.org, reatmon@ti.com, rs@ti.com,
	detheridge@ti.com, b-brnich@ti.com
Subject: Re: [meta-ti][scarthgap][PATCH] meta-ti-bsp: flutter: fix
 nativesdk-flutter-engine-sdk build failures
Message-ID: <20261014214348.GS4190@denix.org>
References: <20261014204330.2837679-1-t-lannynd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014204330.2837679-1-t-lannynd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 14 Oct 2026 21:44:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20459

On Wed, Oct 14, 2026 at 03:43:30PM -0500, Thorsten Lannynd via lists.yoctoproject.org wrote:
> Without BB_DEFER_BBCLASSES, :ti-soc is missing from OVERRIDES from a
> nativesdk context so DEPLOY_DIR_IMAGE results in an incorrect path.
> 
> Add :class-nativesdk to layer.conf and a flutter dynamic layer bbappend to
> skip file-rdeps on the bundled host binaries.
> 
> Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
> ---
>  meta-ti-bsp/conf/layer.conf                                    | 2 ++
>  .../flutter-engine/flutter-engine-sdk_git.bbappend             | 3 +++
>  2 files changed, 5 insertions(+)
>  create mode 100644 meta-ti-bsp/dynamic-layers/flutter-layer/recipes-graphics/flutter-engine/flutter-engine-sdk_git.bbappend
> 
> diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
> index d87d040b..ef4d233f 100644
> --- a/meta-ti-bsp/conf/layer.conf
> +++ b/meta-ti-bsp/conf/layer.conf
> @@ -24,6 +24,7 @@ LAYERRECOMMENDS_meta-ti-bsp = " \
>  
>  BBFILES_DYNAMIC += " \
>      openembedded-layer:${LAYERDIR}/dynamic-layers/openembedded-layer/recipes*/*/*.bbappend \
> +    flutter-layer:${LAYERDIR}/dynamic-layers/flutter-layer/recipes*/*/*.bbappend \
>  "
>  
>  SIGGEN_EXCLUDERECIPES_ABISAFE += " \
> @@ -34,6 +35,7 @@ HOSTTOOLS_NONFATAL += "truncate xxd comm"
>  
>  TI_COMMON_DEPLOY ?= "${TOPDIR}/deploy-ti"
>  DEPLOY_DIR_IMAGE:ti-soc = "${TI_COMMON_DEPLOY}/images/${MACHINE}"
> +DEPLOY_DIR_IMAGE:class-nativesdk = "${TI_COMMON_DEPLOY}/images/${MACHINE}"

I don't think this is correct.
What nativesdk package are you trying to deploy to the target image deploy 
area?


>  SDK_DEPLOY:ti-soc = "${TI_COMMON_DEPLOY}/sdk"
>  PSEUDO_IGNORE_PATHS:append:ti-soc = ",${TI_COMMON_DEPLOY}"
>  
> diff --git a/meta-ti-bsp/dynamic-layers/flutter-layer/recipes-graphics/flutter-engine/flutter-engine-sdk_git.bbappend b/meta-ti-bsp/dynamic-layers/flutter-layer/recipes-graphics/flutter-engine/flutter-engine-sdk_git.bbappend
> new file mode 100644
> index 00000000..92e38f1e
> --- /dev/null
> +++ b/meta-ti-bsp/dynamic-layers/flutter-layer/recipes-graphics/flutter-engine/flutter-engine-sdk_git.bbappend
> @@ -0,0 +1,3 @@
> +# Pre-built x86-64 host binaries that link against libc/libm from the build
> +# host, not a packaged nativesdk dep.
> +INSANE_SKIP:class-nativesdk:append = " file-rdeps"
> -- 
> 2.34.1

