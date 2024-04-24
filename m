Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9D1DC10F15
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 13:23:46 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.16322.1713965017884661616
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 24 Apr 2024 06:23:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=CRYZ8FKT;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43ODNb5b080775
	for <meta-ti@lists.yoctoproject.org>; Wed, 24 Apr 2024 08:23:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1713965017;
	bh=2FDD/bQcshqk9wSCBejtZavMiyl5zX82UPFTEG8ozK4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=CRYZ8FKTN7wYbngEA4bV/5nNP93WK+CcEfatd41QQs6Rt/OrG4SLjeEkl/kecENcx
	 kKVi2dTsjehd1ShhcsBXIeCdLrF0XVvnyXbexEeTbWMkmyHF75PsLrDtiBAYWE+j4o
	 PqfriCjbhdUj4egWBw2KOUin2U4vCgHHFKgnb6w0=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43ODNbB7024434
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 24 Apr 2024 08:23:37 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 24
 Apr 2024 08:23:36 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 24 Apr 2024 08:23:36 -0500
Received: from [10.249.35.173] ([10.249.35.173])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43ODNakg112515;
	Wed, 24 Apr 2024 08:23:36 -0500
Message-ID: <33f34e2b-ab8b-469e-b2f3-6261a5067428@ti.com>
Date: Wed, 24 Apr 2024 08:23:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH] conf: machine: add AM69-SK
 machine configuration
To: Aniket Limaye <a-limaye@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <b-padhi@ti.com>
References: <20240424083546.2190336-1-a-limaye@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20240424083546.2190336-1-a-limaye@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 24 Apr 2024 13:23:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17597


We have consistently named the machines with -evm and not -sk.  Is there 
a good reason to not name this am69-evm?



On 4/24/2024 3:35 AM, Aniket Limaye wrote:
> From: Beleswar Padhi <b-padhi@ti.com>
> 
> As of commits [1] and [2] in ti-u-boot-2024.04 and upstream respectively
> there is a separate defconfig to build u-boot for j784s4-evm and am69-sk
> 
> Hence, introduce new yocto machine configs for am69-sk. Also remove am69
> devicetree builds from the j784s4-evm conf
> 
> [1]: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/commit/?h=ti-u-boot-2024.04&id=8a46af7a39e6218e4de5c6195697af36201c778c
> [2]: https://source.denx.de/u-boot/u-boot/-/commit/740759d558e632e1540d620baadbcc46fdf24db2
> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> Signed-off-by: Aniket Limaye <a-limaye@ti.com>
> ---
>   meta-ti-bsp/conf/machine/am69-sk-k3r5.conf | 11 +++++++++++
>   meta-ti-bsp/conf/machine/am69-sk.conf      | 20 ++++++++++++++++++++
>   meta-ti-bsp/conf/machine/j784s4-evm.conf   |  1 -
>   3 files changed, 31 insertions(+), 1 deletion(-)
>   create mode 100644 meta-ti-bsp/conf/machine/am69-sk-k3r5.conf
>   create mode 100644 meta-ti-bsp/conf/machine/am69-sk.conf
> 
> diff --git a/meta-ti-bsp/conf/machine/am69-sk-k3r5.conf b/meta-ti-bsp/conf/machine/am69-sk-k3r5.conf
> new file mode 100644
> index 00000000..9d2b4cd6
> --- /dev/null
> +++ b/meta-ti-bsp/conf/machine/am69-sk-k3r5.conf
> @@ -0,0 +1,11 @@
> +#@TYPE: Machine
> +#@NAME: AM69 SK (R5F)
> +#@DESCRIPTION: Machine configuration for the TI AM69 SK (R5F core)
> +
> +require conf/machine/include/k3r5.inc
> +
> +SYSFW_SOC = "j784s4"
> +SYSFW_CONFIG = "evm"
> +SYSFW_SUFFIX = "hs-fs"
> +
> +UBOOT_MACHINE = "am69_sk_r5_defconfig"
> diff --git a/meta-ti-bsp/conf/machine/am69-sk.conf b/meta-ti-bsp/conf/machine/am69-sk.conf
> new file mode 100644
> index 00000000..233a4618
> --- /dev/null
> +++ b/meta-ti-bsp/conf/machine/am69-sk.conf
> @@ -0,0 +1,20 @@
> +#@TYPE: Machine
> +#@NAME: AM69 SK
> +#@DESCRIPTION: Machine configuration for the TI AM69 SK
> +
> +require conf/machine/include/j784s4.inc
> +
> +TFA_K3_USART = "0x8"
> +OPTEE_K3_USART = "0x8"
> +
> +KERNEL_DEVICETREE_PREFIX = " \
> +    ti/k3-am69-sk \
> +    ti/k3-fpdlink \
> +    ti/k3-v3link \
> +"
> +
> +KERNEL_DEVICETREE = " \
> +    ti/k3-am69-sk.dtb \
> +"
> +
> +UBOOT_MACHINE = "am69_sk_a72_defconfig"
> diff --git a/meta-ti-bsp/conf/machine/j784s4-evm.conf b/meta-ti-bsp/conf/machine/j784s4-evm.conf
> index e451bf47..6573e5c5 100644
> --- a/meta-ti-bsp/conf/machine/j784s4-evm.conf
> +++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf
> @@ -11,7 +11,6 @@ KERNEL_DEVICETREE_PREFIX = " \
>       ti/k3-j784s4 \
>       ti/k3-fpdlink \
>       ti/k3-j7200-evm-mcspi-loopback \
> -    ti/k3-am69-sk \
>       ti/k3-v3link \
>   "
>   

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

