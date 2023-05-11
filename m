Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDFC4C7EE22
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 15:48:36 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.60.1683820111879334912
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 May 2023 08:48:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 228B040C68;
	Thu, 11 May 2023 15:48:31 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K5Ytw12j9vI4; Thu, 11 May 2023 15:48:31 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B013B40A77;
	Thu, 11 May 2023 15:48:22 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id AA0B81638CA; Thu, 11 May 2023 11:47:39 -0400 (EDT)
Date: Thu, 11 May 2023 11:47:39 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: m-chawdhry@ti.com
Cc: meta-ti@lists.yoctoproject.org, Ryan Eatmon <reatmon@ti.com>,
	Denys Dmytriyenko <denys@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>,
	Andrew Davis <afd@ti.com>, Kamlesh Gurudasani <kamlesh@ti.com>
Subject: Re: [meta-ti][master/kirkstone][RFC PATCH] conf: machine: include:
 k3 enable fit signing for uboot
Message-ID: <20230511154739.GZ9226@denix.org>
References: <20230509-b4-k3-fit-signing-v1-1-2e335869bec8@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230509-b4-k3-fit-signing-v1-1-2e335869bec8@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 11 May 2023 15:48:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16512

On Thu, May 11, 2023 at 11:54:00AM +0530, Manorit Chawdhry via lists.yoctoproject.org wrote:
> Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
> ---
> To: Ryan Eatmon <reatmon@ti.com>
> To: Denys Dmytriyenko <denys@ti.com>
> Cc: meta-ti@lists.yoctoproject.org
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: Praneeth Bajjuri <praneeth@ti.com>
> Cc: Udit Kumar <u-kumar1@ti.com>
> Cc: Andrew Davis <afd@ti.com>
> Cc: Kamlesh Gurudasani <kamlesh@ti.com>
> ---
>  meta-ti-bsp/conf/machine/include/k3.inc | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
> index fff1550564b3..ab7e45a8016f 100644
> --- a/meta-ti-bsp/conf/machine/include/k3.inc
> +++ b/meta-ti-bsp/conf/machine/include/k3.inc
> @@ -31,6 +31,12 @@ SPL_BINARY = "tispl.bin"
>  SPL_BINARYNAME = "tispl.bin"
>  UBOOT_SUFFIX = "img"
>  
> +UBOOT_SIGN_ENABLE = "1"
> +UBOOT_MKIMAGE_DTCOPTS = "-I dts -O dtb"
> +UBOOT_SIGN_KEYNAME = "uboot_signing_dev_key"
> +UBOOT_SIGN_KEYDIR = "${DEPLOY_DIR_IMAGE}/u-boot-keys"

How are the keys get into there? Are there extra docs/instructions?


> +FIT_GENERATE_KEYS = "1"
> +
>  EXTRA_IMAGEDEPENDS += "virtual/bootloader"
>  
>  TFA_PLATFORM = "k3"
> 
> ---
> base-commit: a9b35f1e7c3a7746fb4f6807166bcb27ba9ca5eb
> change-id: 20230509-b4-k3-fit-signing-316ca2af859c
> 
> Best regards,
> -- 
> Manorit Chawdhry <m-chawdhry@ti.com>

