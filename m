Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.3630.1636759596225833037
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 12 Nov 2021 15:26:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A7F3A40C6C;
	Fri, 12 Nov 2021 23:26:34 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OgjPSXlBOeKc; Fri, 12 Nov 2021 23:26:34 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 841A640C16;
	Fri, 12 Nov 2021 23:26:31 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id D94A91746CB; Fri, 12 Nov 2021 18:26:30 -0500 (EST)
Date: Fri, 12 Nov 2021 18:26:30 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: yogeshs@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][dunfell][PATCH 1/3] conf: machine: add new am64x hs platform
Message-ID: <20211112232630.GS10132@denix.org>
References: <20211112231800.64167-1-yogeshs@ti.com>
 <20211112231800.64167-2-yogeshs@ti.com>
MIME-Version: 1.0
In-Reply-To: <20211112231800.64167-2-yogeshs@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 12, 2021 at 11:17:58PM +0000, Yogesh Siraswar via lists.yoctoproject.org wrote:
> Add new am64x hs platform. This requires two files to be created.
> Used am65x and j7  hs platform for reference.
> 
> Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
> ---
>  conf/machine/am64xx-hs-evm-k3r5.conf | 14 ++++++++++++++
>  conf/machine/am64xx-hs-evm.conf      | 22 ++++++++++++++++++++++
>  2 files changed, 36 insertions(+)
>  create mode 100644 conf/machine/am64xx-hs-evm-k3r5.conf
>  create mode 100644 conf/machine/am64xx-hs-evm.conf
> 
> diff --git a/conf/machine/am64xx-hs-evm-k3r5.conf b/conf/machine/am64xx-hs-evm-k3r5.conf
> new file mode 100644
> index 00000000..69c6cada
> --- /dev/null
> +++ b/conf/machine/am64xx-hs-evm-k3r5.conf
> @@ -0,0 +1,14 @@
> +#@TYPE: Machine
> +#@NAME: AM65xx HS EVM (R5F)

AM64?

> +#@DESCRIPTION: Machine configuration for the TI AM65xx HS EVM (R5F core)

AM64?

Both are just comments, so not a functional issue.


> +require conf/machine/include/k3r5.inc
> +
> +SYSFW_SOC = "am64x"
> +SYSFW_CONFIG = "evm"
> +SYSFW_SUFFIX = "hs"
> +SYSFW_SYMLINK = ""
> +
> +UBOOT_MACHINE = "am64x_hs_evm_r5_defconfig"
> +
> +TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
> diff --git a/conf/machine/am64xx-hs-evm.conf b/conf/machine/am64xx-hs-evm.conf
> new file mode 100644
> index 00000000..44e81463
> --- /dev/null
> +++ b/conf/machine/am64xx-hs-evm.conf
> @@ -0,0 +1,22 @@
> +#@TYPE: Machine
> +#@NAME: AM64xx HS EVM
> +#@DESCRIPTION: Machine configuration for the TI AM64xx HS EVM
> +
> +require conf/machine/include/am64xx.inc
> +
> +UBOOT_MACHINE = "am64x_hs_evm_a53_defconfig"
> +
> +UBOOT_ENTRYPOINT =       "0x80080000"
> +UBOOT_LOADADDRESS =      "0x80080000"
> +UBOOT_RD_LOADADDRESS =   "0x84000000"
> +UBOOT_RD_ENTRYPOINT =    "0x84000000"
> +UBOOT_DTB_LOADADDRESS =  "0x83000000"
> +UBOOT_DTBO_LOADADDRESS = "0x83080000"
> +UBOOT_DTBO_OFFSET =      "0x00010000"
> +
> +SPL_BINARY = "tispl.bin_HS"
> +SPL_BINARYNAME = "tispl.bin"
> +UBOOT_BINARY = "u-boot.img_HS"
> +IMAGE_BOOT_FILES = "${UBOOT_BINARY}"
> +
> +TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
> -- 
> 2.17.1
> 

> 
> 
> 


-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
