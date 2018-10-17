Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8A9D5E00AB9; Wed, 17 Oct 2018 15:34:52 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D3515E00A0C
	for <meta-ti@yoctoproject.org>; Wed, 17 Oct 2018 15:34:51 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w9HMYod5101123;
	Wed, 17 Oct 2018 17:34:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1539815690;
	bh=k3Uu/3phtxB8Ml9ZXsk51Kb/njILaPOqb0MR7ewoWbY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=QMaTjnhqvf3YQUOzw6NtcC/zclXr2RKB7euOkFE6hWaijIdiEzVp0sAFUfX8V5byI
	73IGQYbJs34y/8qy6G6JpMnIG+QYWE6nd5Fl5fivE4GTdnMVnB+nnXs5aotX6CrfMJ
	hzMFlZlP+vYfqa1hZtZQZnkDBO9KZtH0uSlVaTvk=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w9HMYoEJ023001;
	Wed, 17 Oct 2018 17:34:50 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 17 Oct 2018 17:34:50 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 17 Oct 2018 17:34:50 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w9HMYohC020101;
	Wed, 17 Oct 2018 17:34:50 -0500
Date: Wed, 17 Oct 2018 18:34:50 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20181017223449.GO4031@beryl>
References: <20181017192853.42942-1-raj.khem@gmail.com>
	<20181017192853.42942-3-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20181017192853.42942-3-raj.khem@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org, Tom Rini <trini@konsulko.com>
Subject: Re: [PATCH 3/5] u-boot: reduce the SPL `.rodata' size
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Oct 2018 22:34:52 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Oct 17, 2018 at 12:28:51PM -0700, Khem Raj wrote:
> Fixes errors e.g.
> 
> | arm-yoe-linux-gnueabi-ld.bfd: u-boot-spl section `.rodata' will not fit in region `.sram'
> | arm-yoe-linux-gnueabi-ld.bfd: region `.sram' overflowed by 5772 bytes
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Tom Rini <trini@konsulko.com>
> Cc: Denys Dmytriyenko <trini@konsulko.com>

Hmm, interesting email I got here... :)


Anyway, I'm going to hold on this one for now. Let's see if we can patch 
U-boot build instead.


> ---
>  ...vm_defconfig-Reduce-SPL-.rodata-size.patch | 36 +++++++++++++++++++
>  .../u-boot/u-boot-ti-staging_2018.01.bb       |  2 ++
>  2 files changed, 38 insertions(+)
>  create mode 100644 recipes-bsp/u-boot/files/0001-am335x_evm_defconfig-Reduce-SPL-.rodata-size.patch
> 
> diff --git a/recipes-bsp/u-boot/files/0001-am335x_evm_defconfig-Reduce-SPL-.rodata-size.patch b/recipes-bsp/u-boot/files/0001-am335x_evm_defconfig-Reduce-SPL-.rodata-size.patch
> new file mode 100644
> index 00000000..6244a56a
> --- /dev/null
> +++ b/recipes-bsp/u-boot/files/0001-am335x_evm_defconfig-Reduce-SPL-.rodata-size.patch
> @@ -0,0 +1,36 @@
> +From 45ead566ebf63999f07e966fa4962bb9bbe3ed4a Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Tue, 16 Oct 2018 17:11:13 -0700
> +Subject: [PATCH] Disable usb-gadget usb-eth support in SPL
> +
> +This helps in shedding some size to fit in into SRAM
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + configs/am335x_evm_defconfig | 5 ++---
> + 1 file changed, 2 insertions(+), 3 deletions(-)
> +
> +diff --git a/configs/am335x_evm_defconfig b/configs/am335x_evm_defconfig
> +index 4908099431..8342089dee 100644
> +--- a/configs/am335x_evm_defconfig
> ++++ b/configs/am335x_evm_defconfig
> +@@ -12,14 +12,13 @@ CONFIG_SYS_CONSOLE_INFO_QUIET=y
> + CONFIG_VERSION_VARIABLE=y
> + CONFIG_ARCH_MISC_INIT=y
> + CONFIG_SPL=y
> +-CONFIG_SPL_ETH_SUPPORT=y
> ++# CONFIG_SPL_ENV_SUPPORT is not set
> + CONFIG_SPL_MTD_SUPPORT=y
> + CONFIG_SPL_MUSB_NEW_SUPPORT=y
> + CONFIG_SPL_NET_SUPPORT=y
> + CONFIG_SPL_NET_VCI_STRING="AM335x U-Boot SPL"
> + CONFIG_SPL_OS_BOOT=y
> +-CONFIG_SPL_USB_GADGET_SUPPORT=y
> +-CONFIG_SPL_USBETH_SUPPORT=y
> ++# CONFIG_SPL_YMODEM_SUPPORT is not set
> + CONFIG_FASTBOOT=y
> + CONFIG_CMD_SPL=y
> + CONFIG_CMD_SPL_NAND_OFS=0x00080000
> +-- 
> +2.19.1
> +
> diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb
> index cbb8857a..46a26480 100644
> --- a/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb
> +++ b/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb
> @@ -5,3 +5,5 @@ PR = "r24"
>  BRANCH = "ti-u-boot-2018.01"
>  
>  SRCREV = "2cc52408bf1357f11b96548e78223a1df321c1ae"
> +
> +SRC_URI += "file://0001-am335x_evm_defconfig-Reduce-SPL-.rodata-size.patch"
> -- 
> 2.19.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

