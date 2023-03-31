Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A69E6C7619A
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 00:21:04 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.43210.1680222063232097685
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 30 Mar 2023 17:21:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 954D340C5D;
	Fri, 31 Mar 2023 00:21:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id US3tt8lOBLoi; Fri, 31 Mar 2023 00:21:02 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6A8DC40C24;
	Fri, 31 Mar 2023 00:20:59 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 952281637E5; Thu, 30 Mar 2023 20:20:24 -0400 (EDT)
Date: Thu, 30 Mar 2023 20:20:24 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][PATCH v6 3/3] u-boot-ti-staging:
 Add 2023.04 in prep for LTS migration
Message-ID: <20230331002024.GG18050@denix.org>
References: <20230330213347.20656-1-reatmon@ti.com>
 <20230330213347.20656-4-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230330213347.20656-4-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 31 Mar 2023 00:21:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16275

On Thu, Mar 30, 2023 at 04:33:47PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> We are preparing to migrate our u-boot version to 2023.04.  As we are still
> working on the migration, mark the default preference low for this
> version.  We will enable building with this u-boot in a meta-arago brand
> in the near future.  Once the migration is complete, we will remove the
> 2021.01 u-boot and make this the default.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
> v6: Change from 2023.01 to 2023.04.
> 
>  .../recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb   | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>  create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
> 
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
> new file mode 100644
> index 00000000..6a46e812
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
> @@ -0,0 +1,11 @@
> +require u-boot-ti.inc
> +
> +LIC_FILES_CHKSUM = "file://Licenses/README;md5=2ca5f2c35c8cc335f0a19756634782f1"
> +
> +PR = "r0"
> +
> +BRANCH = "ti-u-boot-2023.04"
> +
> +SRCREV = "41a88ad529b3943b1e465846eb24fe2c29203e35"
> +
> +DEFAULT_PREFERENCE = "-1"
> -- 
> 2.17.1

