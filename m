Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6401C77B7C
	for <webhook@archiver.kernel.org>; Sat,  6 May 2023 01:48:32 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.14598.1683337702985704066
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 05 May 2023 18:48:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EAB0640C61;
	Sat,  6 May 2023 01:48:21 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DyjzaBBdbKVz; Sat,  6 May 2023 01:48:21 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C9F0C40A3D;
	Sat,  6 May 2023 01:48:20 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 7A5FA1638C9; Fri,  5 May 2023 21:47:38 -0400 (EDT)
Date: Fri, 5 May 2023 21:47:38 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Daniel Schultz <d.schultz@phytec.de>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [PATCH kirkstone+ 1/2] conf: machine: include: k3:
 Select correct WKS file
Message-ID: <20230506014738.GK9226@denix.org>
References: <20230504123736.1475746-1-d.schultz@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230504123736.1475746-1-d.schultz@phytec.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 06 May 2023 01:48:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16491

On Thu, May 04, 2023 at 05:37:35AM -0700, Daniel Schultz wrote:
> Select the correct WKS file according to the MACHINE_FEATURE efi.
> 
> Right now, the sdimage-2part-efi.wks is set by default. Switch to the
> sdimage-2part.wks file, if efi was removed from MACHINE_FEATURES to allow
> non-efi boot methods.
> 
> Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
> ---
>  meta-ti-bsp/conf/machine/include/k3.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
> index 31da2ca9..fff15505 100644
> --- a/meta-ti-bsp/conf/machine/include/k3.inc
> +++ b/meta-ti-bsp/conf/machine/include/k3.inc
> @@ -50,7 +50,8 @@ IMAGE_EFI_BOOT_FILES ?= "${IMAGE_BOOT_FILES}"
>  EFI_PROVIDER ?= "grub-efi"
>  MACHINE_FEATURES += "efi"
>  
> -WKS_FILE ?= "sdimage-2part-efi.wks"
> +WKS_FILE ?= "${@bb.utils.contains("MACHINE_FEATURES", "efi", "sdimage-2part-efi.wks", "sdimage-2part.wks", d)}"

Well, "efi" gets added to MACHINE_FEATURES just one line above. So, in order 
to disable it, you'd have to modify MACHINE_FEATURES in your configuration, at 
which point it is even more easier to set WKS_FILE there too, as it's weakly 
assigned here anyway...

But I guess I don't mind a little bit more automation either, even if it gets 
the code more complicated.


>  do_image_wic[depends] += "virtual/bootloader:do_deploy"
>  do_image_complete[mcdepends] += "mc::k3r5:ti-sci-fw:do_deploy"
>  
> -- 
> 2.25.1

