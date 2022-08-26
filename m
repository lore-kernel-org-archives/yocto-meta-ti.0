Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41F0DECAAA3
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 20:52:38 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.42191.1661547152755252023
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 26 Aug 2022 13:52:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=H0OlqFwQ;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 27QKqQwU043902;
	Fri, 26 Aug 2022 15:52:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1661547146;
	bh=NxPQ3jSGaQmIYSI8ngbN7Cc3xIRbjAycx2d+os8BCcY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=H0OlqFwQssOp0Jc/JhbI/WyXyjnFNV3/SsXeHW7xk7nNIX1FrwoyXGL/W8K84qM0V
	 Qb168/kDF9ISR6u34RqDls5JMETzsfSNqiICnAscFTLN+XseyXB/5U7UFECZJfidua
	 9EjatFB0oNpyOJtY4VykrxEhYoNSO32NMRX5TsmU=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 27QKqQH8011901
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 26 Aug 2022 15:52:26 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Fri, 26
 Aug 2022 15:52:25 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Fri, 26 Aug 2022 15:52:26 -0500
Received: from [10.249.39.108] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 27QKqPUm105688;
	Fri, 26 Aug 2022 15:52:25 -0500
Message-ID: <c69f0615-a9a8-b4da-a006-62c68f66396f@ti.com>
Date: Fri, 26 Aug 2022 15:52:25 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [dunfell][PATCH] machine: add am62xx-lp-skevm configuration
Content-Language: en-US
To: Anand Gadiyar <gadiyar@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Hari Nagalla <hnagalla@ti.com>,
        Andrew Davis <afd@ti.com>, Praneeth Bajjuri <praneeth@ti.com>
References: <20220826185638.1030640-1-gadiyar@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20220826185638.1030640-1-gadiyar@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 26 Aug 2022 20:52:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14972


On 8/26/2022 13:56, Anand Gadiyar wrote:
> This platform is similar to the currently supported am62xx-evm, except
> that we currently need new defconfigs for u-boot and new dtbs in the
> filesystem.
> 
> Signed-off-by: Anand Gadiyar <gadiyar@ti.com>
> Cc: Hari Nagalla <hnagalla@ti.com>
> Cc: Andrew Davis <afd@ti.com>
> Cc: Praneeth Bajjuri <praneeth@ti.com>
> Cc: Ryan Eatmon <reatmon@ti.com>
> ---
> For yocto purposes, this machine is nearly identical to the AM62x SK,
> and we will have more similar machines in the future.
> 
> Mainly, we just need to add more dtbs in the filesystem and to build
> u-boot/spl/tiboot3.bin with different defconfigs than the AM62x SK.
> 
> If there's a better way to add support for this, let me know. Now's a
> better time than later.


Even though the first board that came out was an SK board, in the long 
run the boards will eventually be called EVM boards.  We typically pick 
the names for the long run, and not the short term.  Please change the 
name of the platform to am62xx-lp-evm (remove the sk).

This means changing the name of the conf files, and the various places 
in the other files that reference the machine name in variable settings.

So to restate:

am62xx-lp-skevm --> am62xx-lp-evm



>   conf/machine/am62xx-lp-skevm-k3r5.conf         | 11 +++++++++++
>   conf/machine/am62xx-lp-skevm.conf              | 16 ++++++++++++++++
>   recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb         |  1 +
>   recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb |  2 +-
>   recipes-kernel/linux/kernel-rdepends.inc       |  1 +
>   recipes-security/optee/optee-os_%.bbappend     |  1 +
>   6 files changed, 31 insertions(+), 1 deletion(-)
>   create mode 100644 conf/machine/am62xx-lp-skevm-k3r5.conf
>   create mode 100644 conf/machine/am62xx-lp-skevm.conf
> 
> diff --git a/conf/machine/am62xx-lp-skevm-k3r5.conf b/conf/machine/am62xx-lp-skevm-k3r5.conf
> new file mode 100644
> index 00000000..8e3b04d0
> --- /dev/null
> +++ b/conf/machine/am62xx-lp-skevm-k3r5.conf
> @@ -0,0 +1,11 @@
> +#@TYPE: Machine
> +#@NAME: AM62XX EVM (R5F)
> +#@DESCRIPTION: Machine configuration for the TI AM62xx EVM (R5F core)

Copy paste error?  Need to add LP to the description?

 > +
> +require conf/machine/include/k3r5.inc
> +
> +SYSFW_SOC = "am62x"
> +SYSFW_CONFIG = "evm"
> +SYSFW_SUFFIX = "gp"
> +
> +UBOOT_MACHINE = "am62x_lpsk_r5_defconfig"
> diff --git a/conf/machine/am62xx-lp-skevm.conf b/conf/machine/am62xx-lp-skevm.conf
> new file mode 100644
> index 00000000..1bed1ff0
> --- /dev/null
> +++ b/conf/machine/am62xx-lp-skevm.conf
> @@ -0,0 +1,16 @@
> +#@TYPE: Machine
> +#@NAME: AM62XX EVM
> +#@DESCRIPTION: Machine configuration for the TI AM62XX EVM


Copy paste error?  Need to add LP to the description?


 > +
> +require conf/machine/include/am62xx.inc
> +
> +MACHINE_FEATURES += "gpu"
> +
> +KERNEL_DEVICETREE = " \
> +    ti/k3-am62x-lp-sk.dtb \
> +    ti/k3-am625-skeleton.dtb \
> +    ti/k3-am625-sk-lpmdemo.dtb \
> +    ti/k3-am625-sk-csi2-ov5640.dtbo \
> +"
> +
> +UBOOT_MACHINE = "am62x_lpsk_a53_defconfig"
> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> index 18652dd4..6ee6b09a 100644
> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> @@ -34,6 +34,7 @@ SYSFW_PREFIX_j7200-hs-evm-k3r5 = "fs"
>   SYSFW_PREFIX_j721s2-evm-k3r5 = "fs"
>   SYSFW_PREFIX_j721s2-hs-evm-k3r5 = "fs"
>   SYSFW_PREFIX_am62xx-evm-k3r5 = "fs"
> +SYSFW_PREFIX_am62xx-lp-skevm-k3r5 = "fs"
>   
>   SYSFW_TISCI = "${S}/ti-sysfw/ti-${SYSFW_PREFIX}-firmware-${SYSFW_SOC}-*.bin"
>   
> diff --git a/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb b/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb
> index 642a8d3a..cfd6e767 100644
> --- a/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb
> +++ b/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb
> @@ -7,7 +7,7 @@ PR = "${INC_PR}.0"
>   
>   CLEANBROKEN = "1"
>   
> -COMPATIBLE_MACHINE = "am62xx-evm"
> +COMPATIBLE_MACHINE = "am62xx-evm|am62xx-lp-skevm"
>   
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>   
> diff --git a/recipes-kernel/linux/kernel-rdepends.inc b/recipes-kernel/linux/kernel-rdepends.inc
> index 143e6545..f78afaa0 100644
> --- a/recipes-kernel/linux/kernel-rdepends.inc
> +++ b/recipes-kernel/linux/kernel-rdepends.inc
> @@ -50,4 +50,5 @@ RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j721s2-hs-evm = " cnm-wave-fw"
>   
>   # Add run-time dependency for TIFS Low Power Module stub
>   RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am62xx-evm = " tifs-lpm-stub"
> +RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am62xx-lp-skevm = " tifs-lpm-stub"
>   
> diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-security/optee/optee-os_%.bbappend
> index 5a25bd99..196ef71e 100644
> --- a/recipes-security/optee/optee-os_%.bbappend
> +++ b/recipes-security/optee/optee-os_%.bbappend
> @@ -7,6 +7,7 @@ DEPENDS_append_ti-soc = " python3-cryptography-native"
>   EXTRA_OEMAKE_append_k3 = "${@ 'CFG_CONSOLE_UART='+ d.getVar('OPTEE_K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
>   
>   EXTRA_OEMAKE_append_am62xx-evm = " CFG_WITH_SOFTWARE_PRNG=y"
> +EXTRA_OEMAKE_append_am62xx-lp-skevm = " CFG_WITH_SOFTWARE_PRNG=y"
>   EXTRA_OEMAKE_append_j721s2-evm = " CFG_WITH_SOFTWARE_PRNG=y"
>   EXTRA_OEMAKE_append_j721s2-hs-evm = " CFG_WITH_SOFTWARE_PRNG=y"
>   

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

