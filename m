Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C348AC38145
	for <webhook@archiver.kernel.org>; Thu,  8 Sep 2022 16:51:26 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.1697.1662655885538885468
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 08 Sep 2022 09:51:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=hw3f4uqj;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 288GpM0e044292;
	Thu, 8 Sep 2022 11:51:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1662655882;
	bh=TQXdZY9WYI7EV1hhr5WSdD91ZkK/rFh9x02G797pvEs=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=hw3f4uqjoZoyNVomQmpdYakOQ0CzGzuZ+prWTLtLk6vn+3tfjD+b1SAiyDiUe0jZy
	 hj3thfTZYbbr09MyKPZ3YPc4mvhCHi22pdR/EG3HKKtmrMCy7PgYz3DMh4m6bGBpKc
	 uTZRDNgnu98+MxiAoKX7e+U58zzd0jl2SgrOd/6Y=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 288GpM36043268
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Sep 2022 11:51:22 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Thu, 8 Sep
 2022 11:51:22 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Thu, 8 Sep 2022 11:51:21 -0500
Received: from [10.250.32.221] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 288GpL40125092;
	Thu, 8 Sep 2022 11:51:21 -0500
Message-ID: <1cffb71e-3da4-9f75-af2b-a49d676458c7@ti.com>
Date: Thu, 8 Sep 2022 11:51:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [meta-ti][dunfell][PATCH v2 1/2] conf: machine: am64xx-evm:
 Switch to SR2.0 HS-FS build by default
Content-Language: en-US
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Praneeth Bajjuri <praneeth@ti.com>, Anand Gadiyar <gadiyar@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20220907160315.24535-1-afd@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20220907160315.24535-1-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 08 Sep 2022 16:51:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15005

On 9/7/22 11:03 AM, Andrew Davis wrote:
> AM64x devices will only be available as SR2.0 HS-FS. Set this as the
> default type provided by the SDK. To allow SR2.0 HS-SE to continue to
> boot, like we did with GP, we add an extra machine to build SR2.0 HS-SE
> SYSFW. To use on SR2.0 HS-SE boards simply switch out the SYSFW image:
> 
> $ cd /mnt/sd-card/boot
> $ mv tiboot3-am64x_sr2-hs-evm.bin tiboot3.bin
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---

The firmware has been updated in ti-linux-fw, this series can be
taken now. Would be good to get this in so we can start auto testing
on the SR2.0 HS-FS farm boards. This patch is the final bit to un-gate
the 08.04.01 release and a lot of folks are waiting on that :)

Andrew

>   conf/machine/am64xx-evm-k3r5-hs-se.conf       | 14 -------------
>   conf/machine/am64xx-evm-k3r5-sr2-hs-fs.conf   | 14 +++++++++++++
>   conf/machine/am64xx-evm-k3r5-sr2-hs-se.conf   | 20 +++++++++++++++++++
>   conf/machine/am64xx-evm.conf                  |  8 +++++++-
>   conf/machine/include/am64xx.inc               |  6 +++---
>   conf/multiconfig/k3r5-sr2-hs-fs.conf          |  3 +++
>   .../{k3r5-hs-se.conf => k3r5-sr2-hs-se.conf}  |  2 +-
>   7 files changed, 48 insertions(+), 19 deletions(-)
>   delete mode 100644 conf/machine/am64xx-evm-k3r5-hs-se.conf
>   create mode 100644 conf/machine/am64xx-evm-k3r5-sr2-hs-fs.conf
>   create mode 100644 conf/machine/am64xx-evm-k3r5-sr2-hs-se.conf
>   create mode 100644 conf/multiconfig/k3r5-sr2-hs-fs.conf
>   rename conf/multiconfig/{k3r5-hs-se.conf => k3r5-sr2-hs-se.conf} (55%)
> 
> diff --git a/conf/machine/am64xx-evm-k3r5-hs-se.conf b/conf/machine/am64xx-evm-k3r5-hs-se.conf
> deleted file mode 100644
> index 7cab7d15..00000000
> --- a/conf/machine/am64xx-evm-k3r5-hs-se.conf
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -#@TYPE: Machine
> -#@NAME: AM64xx HS-SE EVM (R5F)
> -#@DESCRIPTION: Machine configuration for the TI AM64xx HS-SE EVM (R5F core)
> -
> -# Booting HS-SE requires different SYSFW, the rest is handled at runtime
> -
> -require conf/machine/include/k3r5.inc
> -SOC_FAMILY_append = ":k3r5-hs-se"
> -
> -SYSFW_SOC = "am64x"
> -SYSFW_CONFIG = "evm"
> -SYSFW_SUFFIX = "hs"
> -
> -UBOOT_MACHINE = "am64x_evm_r5_defconfig"
> diff --git a/conf/machine/am64xx-evm-k3r5-sr2-hs-fs.conf b/conf/machine/am64xx-evm-k3r5-sr2-hs-fs.conf
> new file mode 100644
> index 00000000..1139fe4a
> --- /dev/null
> +++ b/conf/machine/am64xx-evm-k3r5-sr2-hs-fs.conf
> @@ -0,0 +1,14 @@
> +#@TYPE: Machine
> +#@NAME: AM64xx SR2.0 HS-FS EVM (R5F)
> +#@DESCRIPTION: Machine configuration for the TI AM64xx SR2.0 HS-FS EVM (R5F core)
> +
> +# Booting SR2.0 HS-FS requires different SYSFW, the rest is handled at runtime
> +
> +require conf/machine/include/k3r5.inc
> +SOC_FAMILY_append = ":k3r5-sr2-hs-fs"
> +
> +SYSFW_SOC = "am64x_sr2"
> +SYSFW_CONFIG = "evm"
> +SYSFW_SUFFIX = "hs-fs"
> +
> +UBOOT_MACHINE = "am64x_evm_r5_defconfig"
> diff --git a/conf/machine/am64xx-evm-k3r5-sr2-hs-se.conf b/conf/machine/am64xx-evm-k3r5-sr2-hs-se.conf
> new file mode 100644
> index 00000000..f2aeca6d
> --- /dev/null
> +++ b/conf/machine/am64xx-evm-k3r5-sr2-hs-se.conf
> @@ -0,0 +1,20 @@
> +#@TYPE: Machine
> +#@NAME: AM64xx SR2.0 HS-SE EVM (R5F)
> +#@DESCRIPTION: Machine configuration for the TI AM64xx SR2.0 HS-SE EVM (R5F core)
> +
> +# Booting SR2.0 HS-SE requires different SYSFW, the rest is handled at runtime
> +
> +require conf/machine/include/k3r5.inc
> +SOC_FAMILY_append = ":k3r5-sr2-hs-se"
> +
> +SYSFW_SOC = "am64x_sr2"
> +SYSFW_CONFIG = "evm"
> +SYSFW_SUFFIX = "hs"
> +SYSFW_TIBOOT3_SYMLINK = ""
> +
> +UBOOT_MACHINE = "am64x_evm_r5_defconfig"
> +
> +SPL_BINARY = ""
> +UBOOT_BINARY = "u-boot-spl.${UBOOT_SUFFIX}"
> +UBOOT_IMAGE = "u-boot-r5spl-sr2-hs-se-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
> +UBOOT_SYMLINK = "u-boot-r5spl-sr2-hs-se.${UBOOT_SUFFIX}"
> diff --git a/conf/machine/am64xx-evm.conf b/conf/machine/am64xx-evm.conf
> index f150f532..d9afb08e 100644
> --- a/conf/machine/am64xx-evm.conf
> +++ b/conf/machine/am64xx-evm.conf
> @@ -6,8 +6,14 @@ require conf/machine/include/am64xx.inc
>   
>   UBOOT_MACHINE = "am64x_evm_a53_defconfig"
>   
> -# Since default tiboot3.bin on AM64x is for HS-SE, add a version for GP
> +# Since default tiboot3.bin on AM64x is for SR2.0 HS-FS, add a version for GP
>   BBMULTICONFIG += "k3r5-gp"
>   IMAGE_BOOT_FILES += " tiboot3-am64x-gp-evm.bin"
>   do_image_wic[mcdepends] += "mc::k3r5-gp:ti-sci-fw:do_deploy"
>   do_image_tar[mcdepends] += "mc::k3r5-gp:ti-sci-fw:do_deploy"
> +
> +# Since default tiboot3.bin on AM64x is for SR2.0 HS-FS, add a version for SR2.0 HS-SE
> +BBMULTICONFIG += "k3r5-sr2-hs-se"
> +IMAGE_BOOT_FILES += " tiboot3-am64x_sr2-hs-evm.bin"
> +do_image_wic[mcdepends] += "mc::k3r5-sr2-hs-se:ti-sci-fw:do_deploy"
> +do_image_tar[mcdepends] += "mc::k3r5-sr2-hs-se:ti-sci-fw:do_deploy"
> diff --git a/conf/machine/include/am64xx.inc b/conf/machine/include/am64xx.inc
> index becc79d4..0b9a3e59 100644
> --- a/conf/machine/include/am64xx.inc
> +++ b/conf/machine/include/am64xx.inc
> @@ -14,9 +14,9 @@ KERNEL_DEVICETREE = " \
>       ti/k3-am642-evm-nand.dtbo \
>   "
>   
> -BBMULTICONFIG = "k3r5-hs-se"
> -do_image_wic[mcdepends] = "mc::k3r5-hs-se:ti-sci-fw:do_deploy"
> -do_image_tar[mcdepends] = "mc::k3r5-hs-se:ti-sci-fw:do_deploy"
> +BBMULTICONFIG = "k3r5-sr2-hs-fs"
> +do_image_wic[mcdepends] = "mc::k3r5-sr2-hs-fs:ti-sci-fw:do_deploy"
> +do_image_tar[mcdepends] = "mc::k3r5-sr2-hs-fs:ti-sci-fw:do_deploy"
>   
>   TFA_BOARD = "lite"
>   OPTEEMACHINE = "k3-am64x"
> diff --git a/conf/multiconfig/k3r5-sr2-hs-fs.conf b/conf/multiconfig/k3r5-sr2-hs-fs.conf
> new file mode 100644
> index 00000000..8e6b5c68
> --- /dev/null
> +++ b/conf/multiconfig/k3r5-sr2-hs-fs.conf
> @@ -0,0 +1,3 @@
> +require k3r5-sr2.conf
> +
> +MACHINE_append = "-hs-fs"
> diff --git a/conf/multiconfig/k3r5-hs-se.conf b/conf/multiconfig/k3r5-sr2-hs-se.conf
> similarity index 55%
> rename from conf/multiconfig/k3r5-hs-se.conf
> rename to conf/multiconfig/k3r5-sr2-hs-se.conf
> index 701f8e88..69e6d0c8 100644
> --- a/conf/multiconfig/k3r5-hs-se.conf
> +++ b/conf/multiconfig/k3r5-sr2-hs-se.conf
> @@ -1,3 +1,3 @@
> -require k3r5.conf
> +require k3r5-sr2.conf
>   
>   MACHINE_append = "-hs-se"

