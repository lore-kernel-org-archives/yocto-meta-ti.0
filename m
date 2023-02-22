Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69BCFC636D6
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 19:37:28 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.2810.1677094645505160894
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Feb 2023 11:37:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 83FAC40C2E;
	Wed, 22 Feb 2023 19:37:24 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ls2QwXdMnUv9; Wed, 22 Feb 2023 19:37:24 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6278440AC9;
	Wed, 22 Feb 2023 19:37:22 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id EA4D6163764; Wed, 22 Feb 2023 14:36:56 -0500 (EST)
Date: Wed, 22 Feb 2023 14:36:56 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][PATCH v2 01/15] meta-ti-bsp: Add
 helper class for TI Security Development Tools
Message-ID: <20230222193656.GS22689@denix.org>
References: <20230215193355.9676-1-afd@ti.com>
 <20230215193355.9676-2-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230215193355.9676-2-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 22 Feb 2023 19:37:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15907

On Wed, Feb 15, 2023 at 01:33:41PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> The setup here is common to all packages that require signing with
> the TI Security Development Tools. Add a helper class to factor out
> this commonality.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>

Tested-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  meta-ti-bsp/classes/ti-secdev.bbclass | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 meta-ti-bsp/classes/ti-secdev.bbclass
> 
> diff --git a/meta-ti-bsp/classes/ti-secdev.bbclass b/meta-ti-bsp/classes/ti-secdev.bbclass
> new file mode 100644
> index 00000000..b3d70e5c
> --- /dev/null
> +++ b/meta-ti-bsp/classes/ti-secdev.bbclass
> @@ -0,0 +1,21 @@
> +# Helper class to prepare correct environment for signing with TI Security Development Tools
> +
> +# K3 SECDEV scripts use OpenSSL
> +DEPENDS:append:k3 = " openssl-native"
> +DEPENDS:append:k3r5 = " openssl-native"
> +
> +# Use package version of TI SECDEV for K3 if one is not provided through the environment
> +DEPENDS:append:k3 = "${@ '' if d.getVar('TI_SECURE_DEV_PKG_K3') else ' ti-k3-secdev-native' }"
> +DEPENDS:append:k3r5 = "${@ '' if d.getVar('TI_SECURE_DEV_PKG_K3') else ' ti-k3-secdev-native' }"
> +TI_K3_SECDEV_INSTALL_DIR = "${STAGING_DIR_NATIVE}${datadir}/ti/ti-k3-secdev"
> +TI_SECURE_DEV_PKG:k3 = "${@ d.getVar('TI_SECURE_DEV_PKG_K3') or d.getVar('TI_K3_SECDEV_INSTALL_DIR') }"
> +TI_SECURE_DEV_PKG:k3r5 = "${@ d.getVar('TI_SECURE_DEV_PKG_K3') or d.getVar('TI_K3_SECDEV_INSTALL_DIR') }"
> +
> +# For non-K3 we require the SECDEV tools be provided through the environment with the following vars
> +TI_SECURE_DEV_PKG:ti33x = "${TI_SECURE_DEV_PKG_CAT}/am3x"
> +TI_SECURE_DEV_PKG:ti43x = "${TI_SECURE_DEV_PKG_CAT}/am4x"
> +TI_SECURE_DEV_PKG:am57xx = "${TI_SECURE_DEV_PKG_AUTO}/am5x"
> +TI_SECURE_DEV_PKG:dra7xx = "${TI_SECURE_DEV_PKG_AUTO}/dra7"
> +
> +# The SECDEV scripts may need their own location provided through the environment
> +export TI_SECURE_DEV_PKG
> -- 
> 2.39.1

