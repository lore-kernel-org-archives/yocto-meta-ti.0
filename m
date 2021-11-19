Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.13515.1637348273233505216
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 19 Nov 2021 10:57:53 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id AEAEE40C37;
	Fri, 19 Nov 2021 18:57:51 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GJwfzOtulJhx; Fri, 19 Nov 2021 18:57:51 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8926740BA8;
	Fri, 19 Nov 2021 18:57:49 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id D93D31746D2; Fri, 19 Nov 2021 13:57:48 -0500 (EST)
Date: Fri, 19 Nov 2021 13:57:48 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: yogeshs@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][dunfell][PATCH 2/3] ti-sci-fw: changes to build combined boot image for hs build
Message-ID: <20211119185748.GL18191@denix.org>
References: <20211112231800.64167-1-yogeshs@ti.com>
 <20211112231800.64167-3-yogeshs@ti.com>
MIME-Version: 1.0
In-Reply-To: <20211112231800.64167-3-yogeshs@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Yogesh,

Is this still the correct SECDEV to use with am64xx HS?
https://git.ti.com/cgit/security-development-tools/core-secdev-k3/

I'm getting this error in ti-sci-fw do_compile():

| NOTE: make -j 56 CROSS_COMPILE=arm-none-linux-gnueabihf- SYSFW_DL_URL= SYSFW_HS_DL_URL= SYSFW_HS_INNER_CERT_DL_URL= SYSFW_PATH=/OE/arago-dunfell/build/arago-tmp-external-arm-glibc/work/am64xx_hs_evm_k3r5-linux-gnueabi/ti-sci-fw/2021.09a-r1.1/git/ti-sysfw/ti-sci-firmware-am64x-hs*.bin SOC=am64x CONFIG=evm HS=1 SW_REV=1 SYSFW_HS_PATH=/OE/arago-dunfell/build/arago-tmp-external-arm-glibc/work/am64xx_hs_evm_k3r5-linux-gnueabi/ti-sci-fw/2021.09a-r1.1/git/ti-sysfw/ti-sci-firmware-am64x-hs*-enc.bin SYSFW_HS_INNER_CERT_PATH=/OE/arago-dunfell/build/arago-tmp-external-arm-glibc/work/am64xx_hs_evm_k3r5-linux-gnueabi/ti-sci-fw/2021.09a-r1.1/git/ti-sysfw/ti-sci-firmware-am64x-hs*-cert.bin SBL=/OE/arago-dunfell/build/arago-tmp-external-arm-glibc/work/am64xx_hs_evm_k3r5-linux-gnueabi/ti-sci-fw/2021.09a-r1.1/recipe-sysroot/boot/u-boot-spl.bin
| Makefile:139: warning: overriding recipe for target '/OE/arago-dunfell/build/arago-tmp-external-arm-glibc/work/am64xx_hs_evm_k3r5-linux-gnueabi/ti-sci-fw/2021.09a-r1.1/git/ti-sysfw/ti-sci-firmware-am64x-hs-enc.bin'
| Makefile:134: warning: ignoring old recipe for target '/OE/arago-dunfell/build/arago-tmp-external-arm-glibc/work/am64xx_hs_evm_k3r5-linux-gnueabi/ti-sci-fw/2021.09a-r1.1/git/ti-sysfw/ti-sci-firmware-am64x-hs-enc.bin'
| Makefile:144: warning: overriding recipe for target '/OE/arago-dunfell/build/arago-tmp-external-arm-glibc/work/am64xx_hs_evm_k3r5-linux-gnueabi/ti-sci-fw/2021.09a-r1.1/git/ti-sysfw/ti-sci-firmware-am64x-hs-cert.bin'
| Makefile:134: warning: ignoring old recipe for target '/OE/arago-dunfell/build/arago-tmp-external-arm-glibc/work/am64xx_hs_evm_k3r5-linux-gnueabi/ti-sci-fw/2021.09a-r1.1/git/ti-sysfw/ti-sci-firmware-am64x-hs-cert.bin'
| ./gen_its.sh am64x evm sysfw.bin board-cfg.bin pm-cfg.bin rm-cfg.bin sec-cfg.bin > out/soc/am64x/evm/sysfw-am64x-evm.its
| ./scripts/gen_x509_combined_cert.sh -b /OE/arago-dunfell/build/arago-tmp-external-arm-glibc/work/am64xx_hs_evm_k3r5-linux-gnueabi/ti-sci-fw/2021.09a-r1.1/recipe-sysroot/boot/u-boot-spl.bin -l 0x70000000 -s /OE/arago-dunfell/build/arago-tmp-external-arm-glibc/work/am64xx_hs_evm_k3r5-linux-gnueabi/ti-sci-fw/2021.09a-r1.1/git/ti-sysfw/ti-sci-firmware-am64x-hs*.bin -m 0x44000 -d out/soc/am64x/evm/combined-sysfw-cfg.bin -n 0x7b000 -k /opt/secdev-k3//keys/custMpk.pem -o tiboot3.bin
| ERROR: SYSFW and its loadaddr are compulsory
| Usage: ./scripts/gen_x509_combined_cert.sh [-b Boot Loader] [-d SYSFW_DATA] [-k key_file] [-l SBL loadaddress] [-m SYSFW loadaddress] [-n SYSFW_DATA loadaddr] [-s SYSFW] [-t DM_DATA] [-y DM_DATA loadaddr]

Any pointers?

-- 
Denys


On Fri, Nov 12, 2021 at 11:17:59PM +0000, Yogesh Siraswar via lists.yoctoproject.org wrote:
> Added support to build combined boot image for hs build.
> This required k3 image gen patch that is already merged.
> 
> Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
> ---
>  recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> index a1a7446b..9c70120c 100644
> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> @@ -3,9 +3,10 @@ require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>  DEPENDS = "openssl-native u-boot-mkimage-native dtc-native"
>  DEPENDS_append_j7200-evm-k3r5 = " virtual/bootloader"
>  DEPENDS_append_am64xx-evm-k3r5 = " virtual/bootloader"
> +DEPENDS_append_am64xx-hs-evm-k3r5 = " virtual/bootloader"
>  
>  CLEANBROKEN = "1"
> -PR = "${INC_PR}.0"
> +PR = "${INC_PR}.1"
>  
>  # Loaded by R5F core
>  COMPATIBLE_MACHINE = "k3r5"
> @@ -48,12 +49,13 @@ EXTRA_OEMAKE = "\
>      SYSFW_PATH="${SYSFW_TISCI}" SOC=${SYSFW_SOC} CONFIG=${SYSFW_CONFIG} \
>  "
>  EXTRA_OEMAKE_HS = " \
> -    HS=1 SYSFW_HS_PATH="${S}/ti-sysfw/${SYSFW_BASE}-enc.bin" SYSFW_HS_INNER_CERT_PATH="${S}/ti-sysfw/${SYSFW_BASE}-cert.bin" \
> +    HS=1 SW_REV=1 SYSFW_HS_PATH="${S}/ti-sysfw/${SYSFW_BASE}-enc.bin" SYSFW_HS_INNER_CERT_PATH="${S}/ti-sysfw/${SYSFW_BASE}-cert.bin" \
>  "
>  EXTRA_OEMAKE_append = "${@['',' ${EXTRA_OEMAKE_HS}']['${SYSFW_SUFFIX}' == 'hs']}"
>  
>  EXTRA_OEMAKE_append_j7200-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
>  EXTRA_OEMAKE_append_am64xx-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
> +EXTRA_OEMAKE_append_am64xx-hs-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
>  
>  do_compile() {
>  	cd ${WORKDIR}/imggen/
> @@ -116,4 +118,18 @@ do_deploy_am64xx-evm-k3r5() {
>  	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
>  }
>  
> +do_install_am64xx-hs-evm-k3r5() {
> +        install -d ${D}/boot
> +        install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
> +        ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_SYMLINK}
> +        ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
> +}
> +
> +do_deploy_am64xx-hs-evm-k3r5() {
> +        install -d ${DEPLOYDIR}
> +        install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
> +        ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
> +        ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
> +        install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
> +}
>  addtask deploy before do_build after do_compile
> -- 
> 2.17.1
> 
