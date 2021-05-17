Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.517.1621291135148522913
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 17 May 2021 15:38:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=hF7xJz0w;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14HMcsoK063222
	for <meta-ti@lists.yoctoproject.org>; Mon, 17 May 2021 17:38:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1621291134;
	bh=S9V1d8DuTz8tP2zh3naiJ9Uc4pceFjB//9jHZ/BMD+k=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=hF7xJz0wqPhGMhyD7xuSQZ6ra15w2hquUlEQTsEpvmjgqEPKcfMQhbLZdgTxA3krj
	 PGr2HdLi3qheGmOvc/ZE89DeUFwZdx+qtCiNfCzYLC5+bVgPzLb1Y4FkPYjI5Tu+Qe
	 /De77DKm6WikcHzv21OjzxeaPY1+46sfRoIeVstU=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14HMcs1q038980
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 17 May 2021 17:38:54 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 17
 May 2021 17:38:53 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 17 May 2021 17:38:53 -0500
Received: from [10.247.25.23] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14HMcru6032540;
	Mon, 17 May 2021 17:38:53 -0500
Subject: Re: [dunfell/master PATCH] machine: am64xx-sk: Drop am64xx-sk Machine support
To: "Vutla, Lokesh" <lokeshvutla@ti.com>,
        "meta-ti@lists.yoctoproject.org"
	<meta-ti@lists.yoctoproject.org>
References: <20210517165611.17212-1-lokeshvutla@ti.com>
From: "praneeth" <praneeth@ti.com>
Message-ID: <6f38b62f-7140-e316-563c-431a45fe5033@ti.com>
Date: Mon, 17 May 2021 17:38:53 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210517165611.17212-1-lokeshvutla@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/17/2021 11:56 AM, Vutla, Lokesh wrote:
> With U-Boot supporting both am64xx-evm and am64xx-sk with single defocnfig,
> there is not need for a new machine for am64xx-sk. So, drop support for
> am64xx-sk machine.

made some corrections in commit message and pushed to dunfell-next.

> 
> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> ---
>   conf/machine/am64xx-sk-k3r5.conf       | 11 -----------
>   conf/machine/am64xx-sk.conf            | 11 -----------
>   recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 17 -----------------
>   recipes-bsp/u-boot/u-boot-ti.inc       |  6 ------
>   4 files changed, 45 deletions(-)
>   delete mode 100644 conf/machine/am64xx-sk-k3r5.conf
>   delete mode 100644 conf/machine/am64xx-sk.conf
> 
> diff --git a/conf/machine/am64xx-sk-k3r5.conf b/conf/machine/am64xx-sk-k3r5.conf
> deleted file mode 100644
> index 07ca5902..00000000
> --- a/conf/machine/am64xx-sk-k3r5.conf
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -#@TYPE: Machine
> -#@NAME: AM64xx SK (R5F)
> -#@DESCRIPTION: Machine configuration for the TI AM64xx SK (R5F core)
> -
> -require conf/machine/include/k3r5.inc
> -
> -SYSFW_SOC = "am64x"
> -SYSFW_CONFIG = "evm"
> -SYSFW_SUFFIX = "gp"
> -
> -UBOOT_MACHINE = "am64x_sk_r5_defconfig"
> diff --git a/conf/machine/am64xx-sk.conf b/conf/machine/am64xx-sk.conf
> deleted file mode 100644
> index 445ff723..00000000
> --- a/conf/machine/am64xx-sk.conf
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -#@TYPE: Machine
> -#@NAME: AM64xx SK
> -#@DESCRIPTION: Machine configuration for the TI AM64xx SK board
> -
> -require conf/machine/include/am64xx.inc
> -
> -UBOOT_MACHINE = "am64x_sk_a53_defconfig"
> -
> -KERNEL_DEVICETREE = " \
> -    ti/k3-am642-sk.dtb \
> -"
> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> index e6fa460c..87fdec68 100644
> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> @@ -3,7 +3,6 @@ require recipes-bsp/ti-sci-fw/ti-sci-fw.inc
>   DEPENDS = "openssl-native u-boot-mkimage-native dtc-native"
>   DEPENDS_append_j7200-evm-k3r5 = " virtual/bootloader"
>   DEPENDS_append_am64xx-evm-k3r5 = " virtual/bootloader"
> -DEPENDS_append_am64xx-sk-k3r5 = " virtual/bootloader"
>   
>   CLEANBROKEN = "1"
>   PR = "r1"
> @@ -54,7 +53,6 @@ EXTRA_OEMAKE_append = "${@['',' ${EXTRA_OEMAKE_HS}']['${SYSFW_SUFFIX}' == 'hs']}
>   
>   EXTRA_OEMAKE_append_j7200-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
>   EXTRA_OEMAKE_append_am64xx-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
> -EXTRA_OEMAKE_append_am64xx-sk-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
>   
>   do_compile() {
>   	cd ${WORKDIR}/imggen/
> @@ -117,19 +115,4 @@ do_deploy_am64xx-evm-k3r5() {
>   	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
>   }
>   
> -do_install_am64xx-sk-k3r5() {
> -	install -d ${D}/boot
> -	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
> -	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_SYMLINK}
> -	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
> -}
> -
> -do_deploy_am64xx-sk-k3r5() {
> -	install -d ${DEPLOYDIR}
> -	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
> -	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
> -	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
> -	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
> -}
> -
>   addtask deploy before do_build after do_compile
> diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
> index e5f92f4b..dc8d6b06 100644
> --- a/recipes-bsp/u-boot/u-boot-ti.inc
> +++ b/recipes-bsp/u-boot/u-boot-ti.inc
> @@ -66,7 +66,6 @@ SPL_UART_BINARY_k3r5 = ""
>   SPL_UART_BINARY_lego-ev3 = ""
>   SPL_UART_BINARY_j7200-evm-k3r5 = "u-boot-spl.bin"
>   SPL_UART_BINARY_am64xx-evm-k3r5 = "u-boot-spl.bin"
> -SPL_UART_BINARY_am64xx-sk-k3r5 = "u-boot-spl.bin"
>   
>   SPL_UART_IMAGE ?= "${SPL_UART_BINARY}-${MACHINE}-${PV}-${PR}"
>   SPL_UART_SYMLINK ?= "${SPL_UART_BINARY}-${MACHINE}"
> @@ -402,9 +401,4 @@ do_deploy_append_am64xx-evm-k3r5 () {
>   	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || true
>   }
>   
> -do_deploy_append_am64xx-sk-k3r5 () {
> -	mv ${DEPLOYDIR}/tiboot3.bin ${DEPLOYDIR}/tiboot3-r5spl.bin || true
> -	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || true
> -}
> -
>   TOOLCHAIN = "gcc"
> 
