Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9BE03E00B5E; Wed, 17 Oct 2018 16:12:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BA06DE00AB9
	for <meta-ti@yoctoproject.org>; Wed, 17 Oct 2018 16:12:04 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w9HNC33C114664;
	Wed, 17 Oct 2018 18:12:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1539817923;
	bh=v+rKFU5DoAKSX2Gk/HMfoegVFHdi8J4PwfxMv+Zrea4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=RCmMSTfoQdrfjvw01pC8gOw+wNErwEgXJgSgWw+UGZ5CvLMktHlusw/NAFXOQLa8Q
	DWTy7+X2r98V+FqlNeC8T4hoAoA4+EDbRcoEHQpvBgjVMxwClvNFHgJdxpuTXAn5lx
	15mjhXjXiN3BwQAqcA34xvBlzXHiHBTf5LZsnc/0=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w9HNC3bH017541;
	Wed, 17 Oct 2018 18:12:03 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 17 Oct 2018 18:12:03 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 17 Oct 2018 18:12:03 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w9HNC3BI011349;
	Wed, 17 Oct 2018 18:12:03 -0500
Date: Wed, 17 Oct 2018 19:12:03 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jeremy Grosser <jeremy@synack.me>
Message-ID: <20181017231203.GP4031@beryl>
References: <CANg34PkEbA1B1q+3dK4TWCHzg6RhPD6skB8bgCqWGU8VCUx1xw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANg34PkEbA1B1q+3dK4TWCHzg6RhPD6skB8bgCqWGU8VCUx1xw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] lego-ev3: Add support for LEGO Mindstorms EV3 (AM1808)
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
X-List-Received-Date: Wed, 17 Oct 2018 23:12:05 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks! Looks very intersting. Please see comments inline.


On Mon, Oct 15, 2018 at 08:19:02PM -0700, Jeremy Grosser wrote:
> Signed-off-by: Jeremy Grosser <jeremy@synack.me>
> ---
>  conf/machine/lego-ev3.conf                    | 21 ++++++++++++++++
>  recipes-bsp/u-boot/u-boot-ti.inc              |  2 ++
>  recipes-kernel/linux/bundle-devicetree.inc    | 24 +++++++++++++++++++
>  recipes-kernel/linux/linux-ti-staging_4.14.bb |  1 +
>  4 files changed, 48 insertions(+)
>  create mode 100644 conf/machine/lego-ev3.conf
>  create mode 100644 recipes-kernel/linux/bundle-devicetree.inc
> 
> diff --git a/conf/machine/lego-ev3.conf b/conf/machine/lego-ev3.conf
> new file mode 100644
> index 00000000..18626001
> --- /dev/null
> +++ b/conf/machine/lego-ev3.conf
> @@ -0,0 +1,21 @@
> +#@TYPE: Machine
> +#@NAME: LEGO Mindstorms EV3
> +#@DESCRIPTION: Machine configuration for the LEGO Mindstorms EV3
> +
> +require conf/machine/include/davinci.inc
> +require conf/machine/include/omapl138.inc
> +
> +UBOOT_MACHINE = "legoev3_config"
> +UBOOT_SUFFIX = "bin"
> +UBOOT_ENTRYPOINT = "0xC0008000"
> +UBOOT_LOADADDRESS = "0xC0008000"
> +
> +KERNEL_DEVICETREE = "da850-lego-ev3.dtb"
> +KERNEL_IMAGETYPES = "uImage"
> +KERNEL_DEVICETREE_BUNDLE = "1"
> +SERIAL_CONSOLE ?= "115200 ttyS1"

Can you please rebase with recent changes to deprecate SERIAL_CONSOLE.


> +
> +IMAGE_FSTYPES += " wic"
> +WKS_FILE = "sdimage-bootpart.wks"
> +WIC_CREATE_EXTRA_ARGS += " --no-fstab-update"
> +IMAGE_BOOT_FILES = "${KERNEL_IMAGETYPES}"
> diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
> index f22fcb4d..aba5e90c 100644
> --- a/recipes-bsp/u-boot/u-boot-ti.inc
> +++ b/recipes-bsp/u-boot/u-boot-ti.inc
> @@ -57,12 +57,14 @@ SPL_BINARY_k2hk-hs-evm = ""
>  SPL_BINARY_k2g-hs-evm = ""
>  SPL_BINARY_k2l-hs-evm = ""
>  SPL_BINARY_omapl138 = ""
> +SPL_BINARY_lego-ev3 = ""

Sorry, this has also just changed, please move to machine config.


>  SPL_BINARY_k3 = "tispl.bin"
> 
>  # SPL (Second Program Loader) to be loaded over UART
>  SPL_UART_BINARY = "u-boot-spl.bin"
>  SPL_UART_BINARY_keystone = ""
>  SPL_UART_BINARY_k3 = ""
> +SPL_UART_BINARY_lego-ev3 = ""
> 
>  SPL_UART_IMAGE ?= "${SPL_UART_BINARY}-${MACHINE}-${PV}-${PR}"
>  SPL_UART_SYMLINK ?= "${SPL_UART_BINARY}-${MACHINE}"
> diff --git a/recipes-kernel/linux/bundle-devicetree.inc
> b/recipes-kernel/linux/bundle-devicetree.inc
> new file mode 100644
> index 00000000..ce159878
> --- /dev/null
> +++ b/recipes-kernel/linux/bundle-devicetree.inc
> @@ -0,0 +1,24 @@
> +# Upstream kernel-devicetree.bbclass only supports bundling the DTB with
> +# zImage. The factory u-boot on lego-ev3 EEPROM only supports uImage, so we
> +# append the DTB to the final uImage here.
> +
> +do_deploy_append() {

Can you check for KERNEL_DEVICETREE_BUNDLE being set right away here, so 
normally it won't even go into all the loops inside.


> +    for dtbf in ${KERNEL_DEVICETREE}; do
> +        dtb=`normalize_dtb "$dtbf"`
> +        dtb_ext=${dtb##*.}
> +        dtb_base_name=`basename $dtb .$dtb_ext`
> +        install -d ${DEPLOYDIR}

For all the DTBs listed (and some platforms have tens of them!) you'd be 
creating DEPLOYDIR over and over again...


> +        for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
> +            if [ "$type" = "uImage" ] && [
> "${KERNEL_DEVICETREE_BUNDLE}" = "1" ]; then
> +                cat ${D}/${KERNEL_IMAGEDEST}/$type \
> +                    ${DEPLOYDIR}/$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext \
> +                    >
> ${DEPLOYDIR}/$type-$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext.bin
> +                ln -sf $type-$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext.bin \
> +
> ${DEPLOYDIR}/$type-$dtb_base_name-${KERNEL_DTB_LINK_NAME}.$dtb_ext.bin
> +                cat ${D}/${KERNEL_IMAGEDEST}/$type \
> +                    ${DEPLOYDIR}/$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext \
> +                    > ${DEPLOYDIR}/$type
> +            fi
> +        done
> +    done
> +}
> diff --git a/recipes-kernel/linux/linux-ti-staging_4.14.bb
> b/recipes-kernel/linux/linux-ti-staging_4.14.bb
> index 5ee206ec..13b94ffe 100644
> --- a/recipes-kernel/linux/linux-ti-staging_4.14.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_4.14.bb
> @@ -8,6 +8,7 @@ inherit kernel
>  require recipes-kernel/linux/setup-defconfig.inc
>  require recipes-kernel/linux/cmem.inc
>  require recipes-kernel/linux/ti-uio.inc
> +require recipes-kernel/linux/bundle-devicetree.inc
> 
>  # Look in the generic major.minor directory for files
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.14:"
> --
> 2.19.1
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

