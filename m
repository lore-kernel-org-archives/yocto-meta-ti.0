Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96F5AC76196
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 20:29:03 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.6382.1680294538794417240
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 31 Mar 2023 13:28:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 21A7140C6C;
	Fri, 31 Mar 2023 20:28:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9TyMrYs4CVvH; Fri, 31 Mar 2023 20:28:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id F380740C24;
	Fri, 31 Mar 2023 20:28:55 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C1CAD1637E8; Fri, 31 Mar 2023 16:28:20 -0400 (EDT)
Date: Fri, 31 Mar 2023 16:28:20 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Robert Nelson <robertcnelson@gmail.com>
Cc: meta-ti@lists.yoctoproject.org, denys@konsulko.com
Subject: Re: [meta-ti] [PATCH] meta-ti-bsp: BeagleBoard switch to GitHub
 mirror
Message-ID: <20230331202820.GI18050@denix.org>
References: <20230331200753.333849-1-robertcnelson@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230331200753.333849-1-robertcnelson@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 31 Mar 2023 20:29:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16282

On Fri, Mar 31, 2023 at 03:07:53PM -0500, Robert Nelson wrote:
> BeagleBoard.org's GitLab instance: https://git.beagleboard.org/
> easily becomes overloaded, switch to GitHub mirror.

Thanks!


> Signed-off-by: Robert Nelson <robertcnelson@gmail.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
> index 35fb40cd..07d06e21 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
> @@ -25,7 +25,7 @@ SRCREV:k3 = "11ebcc09f32669fac8254dff56d500f86c4c2caf"
>  PV:k3 = "5.10.153+git${SRCPV}"
>  BRANCH:k3 = "5.10-arm64"
>  
> -SRC_URI = "git://git.beagleboard.org/beagleboard/linux.git;protocol=https;branch=${BRANCH} \
> +SRC_URI = "git://github.com/beagleboard/linux.git;protocol=https;branch=${BRANCH} \
>             file://init_disassemble_info-signature-changes-causes-compile-failures.patch"
>  
>  DEFCONFIG_NAME = "bb.org_defconfig"
> -- 
> 2.39.2

