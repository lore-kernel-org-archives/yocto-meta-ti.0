Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A58EECAAA1
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 00:11:11 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.1955.1662509464375422870
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 06 Sep 2022 17:11:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4E5C440CDC;
	Wed,  7 Sep 2022 00:11:03 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aTKZWVifnMcB; Wed,  7 Sep 2022 00:11:03 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0D36A40C7F;
	Wed,  7 Sep 2022 00:10:58 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 09D721749CE; Tue,  6 Sep 2022 20:10:56 -0400 (EDT)
Date: Tue, 6 Sep 2022 20:10:55 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	Praneeth Bajjuri <praneeth@ti.com>, Anand Gadiyar <gadiyar@ti.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][dunfell][PATCH 2/2] conf: machine: am64xx: Move
 multi-config targets into base SoC include
Message-ID: <20220907001055.GL18429@denix.org>
References: <20220906231119.29102-1-afd@ti.com>
 <20220906231119.29102-2-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220906231119.29102-2-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 07 Sep 2022 00:11:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15001

On Tue, Sep 06, 2022 at 06:11:19PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> The supported device types depends on the SoC, not on any specific
> board or EVM. Any board can be populated with any of the 3 supported
> AM64x types. Move these into the AM64x common include.

The reason multiconfigs were originally added in the machine config, instead 
of a base SoC include, is because SR2.0 was initially only available for GP 
and not HS variant of AM65x.


> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  conf/machine/am64xx-evm.conf    | 26 +++++++-------------------
>  conf/machine/include/am64xx.inc | 13 +++++++++++++
>  2 files changed, 20 insertions(+), 19 deletions(-)
>  rewrite conf/machine/am64xx-evm.conf (76%)
> 
> diff --git a/conf/machine/am64xx-evm.conf b/conf/machine/am64xx-evm.conf
> dissimilarity index 76%
> index d9afb08e..c6ba2a87 100644
> --- a/conf/machine/am64xx-evm.conf
> +++ b/conf/machine/am64xx-evm.conf
> @@ -1,19 +1,7 @@
> -#@TYPE: Machine
> -#@NAME: AM64xx EVM
> -#@DESCRIPTION: Machine configuration for the TI AM64xx EVM
> -
> -require conf/machine/include/am64xx.inc
> -
> -UBOOT_MACHINE = "am64x_evm_a53_defconfig"
> -
> -# Since default tiboot3.bin on AM64x is for SR2.0 HS-FS, add a version for GP
> -BBMULTICONFIG += "k3r5-gp"
> -IMAGE_BOOT_FILES += " tiboot3-am64x-gp-evm.bin"
> -do_image_wic[mcdepends] += "mc::k3r5-gp:ti-sci-fw:do_deploy"
> -do_image_tar[mcdepends] += "mc::k3r5-gp:ti-sci-fw:do_deploy"
> -
> -# Since default tiboot3.bin on AM64x is for SR2.0 HS-FS, add a version for SR2.0 HS-SE
> -BBMULTICONFIG += "k3r5-sr2-hs-se"
> -IMAGE_BOOT_FILES += " tiboot3-am64x_sr2-hs-evm.bin"
> -do_image_wic[mcdepends] += "mc::k3r5-sr2-hs-se:ti-sci-fw:do_deploy"
> -do_image_tar[mcdepends] += "mc::k3r5-sr2-hs-se:ti-sci-fw:do_deploy"
> +#@TYPE: Machine
> +#@NAME: AM64xx EVM
> +#@DESCRIPTION: Machine configuration for the TI AM64xx EVM
> +
> +require conf/machine/include/am64xx.inc
> +
> +UBOOT_MACHINE = "am64x_evm_a53_defconfig"

This diff is very weird - the first 7 lines aren't changing, yet they are 
removed and then added back. Can you please check what went wrong and 
resubmit?


> diff --git a/conf/machine/include/am64xx.inc b/conf/machine/include/am64xx.inc
> index 0b9a3e59..913d95e6 100644
> --- a/conf/machine/include/am64xx.inc
> +++ b/conf/machine/include/am64xx.inc
> @@ -14,10 +14,23 @@ KERNEL_DEVICETREE = " \
>      ti/k3-am642-evm-nand.dtbo \
>  "
>  
> +# Default tiboot3.bin on AM64x is for SR2.0 HS-FS
>  BBMULTICONFIG = "k3r5-sr2-hs-fs"
>  do_image_wic[mcdepends] = "mc::k3r5-sr2-hs-fs:ti-sci-fw:do_deploy"
>  do_image_tar[mcdepends] = "mc::k3r5-sr2-hs-fs:ti-sci-fw:do_deploy"
>  
> +# Since default tiboot3.bin on AM64x is for SR2.0 HS-FS, add a version for GP
> +BBMULTICONFIG += "k3r5-gp"
> +IMAGE_BOOT_FILES += " tiboot3-am64x-gp-evm.bin"
> +do_image_wic[mcdepends] += "mc::k3r5-gp:ti-sci-fw:do_deploy"
> +do_image_tar[mcdepends] += "mc::k3r5-gp:ti-sci-fw:do_deploy"
> +
> +# Since default tiboot3.bin on AM64x is for SR2.0 HS-FS, add a version for SR2.0 HS-SE
> +BBMULTICONFIG += "k3r5-sr2-hs-se"
> +IMAGE_BOOT_FILES += " tiboot3-am64x_sr2-hs-evm.bin"
> +do_image_wic[mcdepends] += "mc::k3r5-sr2-hs-se:ti-sci-fw:do_deploy"
> +do_image_tar[mcdepends] += "mc::k3r5-sr2-hs-se:ti-sci-fw:do_deploy"
> +
>  TFA_BOARD = "lite"
>  OPTEEMACHINE = "k3-am64x"
>  OPTEEOUTPUTMACHINE = "k3"
> -- 
> 2.36.1

