Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E8CEC54731
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 19:38:59 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.5647.1724787534609677488
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 27 Aug 2024 12:38:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 95ED740CCB;
	Tue, 27 Aug 2024 19:38:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZhKUwufKm0K1; Tue, 27 Aug 2024 19:38:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 649CC40CC5;
	Tue, 27 Aug 2024 19:38:50 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 82E21164064; Tue, 27 Aug 2024 15:38:49 -0400 (EDT)
Date: Tue, 27 Aug 2024 15:38:49 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/scarthgap][PATCH v2] trusted-firmware-a:
 Update to v2.11 release tag
Message-ID: <20240827193849.GC17572@denix.org>
References: <20240816185307.15808-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240816185307.15808-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 27 Aug 2024 19:38:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17953

On Fri, Aug 16, 2024 at 01:53:07PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> From: Kamlesh Gurudasani <kamlesh@ti.com>
> 
> Update to latest release tag, i.e. v2.11.
> 
> Also update the LIC_FILES_CHKSUM since the license file changed since
> the last SRCREV change.

Changed in what way? It is recommended to briefly describe license changes in 
the commit log - it forces one to review the changes to ensure there are no 
license incompatibilities or even in the worst case complete re-licensing of 
the product.

In this case the changes were not too bad, but apparently the list of licenses 
did change - see this discussion:

https://lists.yoctoproject.org/g/meta-arm/topic/106488067#msg6004


> Commit:
> https://git.trustedfirmware.org/TF-A/trusted-firmware-a/+/f2735ebccf5173f74c0458736ec526276106097e
> 
> Tag:
> https://git.trustedfirmware.org/TF-A/trusted-firmware-a/+/refs/tags/v2.11
> 
> Signed-off-by: Kamlesh Gurudasani <kamlesh@ti.com>
> Tested-by: Manorit Chawdhry <m-chawdhry@ti.com>
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
> index 291259c0..157bdbc5 100644
> --- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
> +++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
> @@ -1,5 +1,6 @@
> -PV:k3 = "2.10+git"
> -SRCREV_tfa:k3 = "00f1ec6b8740ccd403e641131e294aabacf2a48b"
> +PV:k3 = "2.11+git"
> +SRCREV_tfa:k3 = "f2735ebccf5173f74c0458736ec526276106097e"
> +LIC_FILES_CHKSUM:k3 = "file://docs/license.rst;md5=b5fbfdeb6855162dded31fadcd5d4dc5"
>  SRC_URI:k3 = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa;branch=master"
>  COMPATIBLE_MACHINE:k3 = "k3"
>  TFA_BUILD_TARGET:k3 = "all"
> -- 
> 2.17.1

