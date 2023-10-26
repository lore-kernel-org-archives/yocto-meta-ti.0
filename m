Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7473C25B47
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 03:27:53 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.192440.1698290866840320719
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 25 Oct 2023 20:27:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BF58F40CC4;
	Thu, 26 Oct 2023 03:27:45 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LZOqf_J82azO; Thu, 26 Oct 2023 03:27:45 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B9E8F40C6C;
	Thu, 26 Oct 2023 03:27:41 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id EE57C163D25; Wed, 25 Oct 2023 23:27:40 -0400 (EDT)
Date: Wed, 25 Oct 2023 23:27:40 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][PATCH 8/8] recipes-bsp: Do not use
 MACHINE_ARCH when package is not machine specific
Message-ID: <20231026032740.GD2408@denix.org>
References: <20231025165630.2274889-1-afd@ti.com>
 <20231025165630.2274889-8-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231025165630.2274889-8-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 26 Oct 2023 03:27:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17194

On Wed, Oct 25, 2023 at 11:56:30AM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb | 2 --
>  meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb         | 2 --
>  meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb     | 1 -
>  meta-ti-bsp/recipes-bsp/goodix-fw/goodix-fw_git.bb             | 2 --
>  meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb   | 2 --
>  meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb       | 2 --
>  meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw-am65x-sr2_git.bb   | 2 --
>  meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb     | 2 --
>  meta-ti-bsp/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb | 2 --
>  meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb              | 1 -
>  meta-ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb           | 1 -
>  11 files changed, 19 deletions(-)

Overall I agree and fully support the first 7 patches in this series.

But for this last one I wanted to open a discussion.

On one hand I understand the desire to make components as generic as possible 
and reduce the number of machine-specific components to a bare minimum.

But on another hand, marking the resulting package as machine-specific when it 
has a short list of compatible machines is a standard practice. The reason is 
that the list of compatible machines controls only compile time filtering, but 
doesn't have any effect on run time. And marking packages as machine specific 
helps with that. That closes the loophole of installing incompatible packages.

For example, first recipe below specifies that Cadence MHDP firmware is 
compatible with 3 J7 platforms only (or their SoC families, to be exact).
But w/o marking resulting binary package as machine-specific (therefore 
producing separate packages for those platforms), there will be a single 
generic Aarch64 package made. And there's no protection from installing 
this generic package on non-compatible platforms, like J7200 or AM65xx, 
either manullay or by pulling it into a rootfs for those incompatible 
platforms.

And you normally want to prevent this for regular components. But I guess 
this doesn't fully apply to FW images that are loaded by corresponding 
drivers anyway. Moreover, there's no compilation involved, just packaging 
the binary blob.

In that case, should we also remove COMPATIBLE_MACHINE from these firmware 
recipes?



> diff --git a/meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb b/meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
> index d88bca6e..ed1c7817 100644
> --- a/meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
> +++ b/meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
> @@ -10,8 +10,6 @@ PR = "${INC_PR}.0"
>  
>  COMPATIBLE_MACHINE = "j721e|j721s2|j784s4"
>  
> -PACKAGE_ARCH = "${MACHINE_ARCH}"
> -
>  TARGET = "mhdp8546.bin"
>  
>  do_install() {
> diff --git a/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb b/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
> index 5b1d8be1..ef7bc2ad 100644
> --- a/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
> +++ b/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
> @@ -12,8 +12,6 @@ PR = "${INC_PR}.1"
>  
>  COMPATIBLE_MACHINE = "j721s2|j784s4|am62axx"
>  
> -PACKAGE_ARCH = "${MACHINE_ARCH}"
> -
>  TARGET_WAVE521C = "wave521c_codec_fw.bin"
>  
>  SOURCE_WAVE521C = "wave521c_k3_codec_fw.bin"
> diff --git a/meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb b/meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
> index 6e2996ce..e333d212 100755
> --- a/meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
> +++ b/meta-ti-bsp/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
> @@ -4,7 +4,6 @@ LICENSE = "TI-TFL"
>  LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=04ad0a015d4bb63c2b9e7b112debf3db"
>  
>  PV = "6.2+git${SRCPV}"
> -PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  inherit update-alternatives
>  
> diff --git a/meta-ti-bsp/recipes-bsp/goodix-fw/goodix-fw_git.bb b/meta-ti-bsp/recipes-bsp/goodix-fw/goodix-fw_git.bb
> index e58f2d58..ee3a94dc 100644
> --- a/meta-ti-bsp/recipes-bsp/goodix-fw/goodix-fw_git.bb
> +++ b/meta-ti-bsp/recipes-bsp/goodix-fw/goodix-fw_git.bb
> @@ -10,8 +10,6 @@ PR = "${INC_PR}.0"
>  
>  COMPATIBLE_MACHINE = "dra7xx"
>  
> -PACKAGE_ARCH = "${MACHINE_ARCH}"
> -
>  ORIGIN = "DRA71x-RevA-GT9271_SpecDig_Config.bin"
>  TARGET = "goodix_9271_cfg.bin"
>  
> diff --git a/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb b/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
> index 2c0736ed..4b6ef75d 100644
> --- a/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
> +++ b/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
> @@ -7,8 +7,6 @@ PR = "${INC_PR}.0"
>  
>  COMPATIBLE_MACHINE = "am65xx-evm|am64xx"
>  
> -PACKAGE_ARCH = "${MACHINE_ARCH}"
> -
>  TARGET = " \
>      am65x-sr2-pru0-prueth-fw.elf \
>      am65x-sr2-pru1-prueth-fw.elf \
> diff --git a/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb b/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
> index 8b15ab7f..20b2bfb9 100644
> --- a/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
> +++ b/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
> @@ -7,8 +7,6 @@ PR = "${INC_PR}.0"
>  
>  COMPATIBLE_MACHINE = "am65xx"
>  
> -PACKAGE_ARCH = "${MACHINE_ARCH}"
> -
>  TARGET = " \
>      am65x-pru0-prueth-fw.elf \
>      am65x-pru1-prueth-fw.elf \
> diff --git a/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw-am65x-sr2_git.bb b/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw-am65x-sr2_git.bb
> index ea39d73d..bc731094 100644
> --- a/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw-am65x-sr2_git.bb
> +++ b/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw-am65x-sr2_git.bb
> @@ -7,8 +7,6 @@ PR = "${INC_PR}.0"
>  
>  COMPATIBLE_MACHINE = "am65xx-evm|am64xx"
>  
> -PACKAGE_ARCH = "${MACHINE_ARCH}"
> -
>  TARGET = " \
>      am65x-sr2-pru0-pruhsr-fw.elf \
>      am65x-sr2-pru1-pruhsr-fw.elf \
> diff --git a/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb b/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb
> index 63c2d311..6e296e7c 100644
> --- a/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb
> +++ b/meta-ti-bsp/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb
> @@ -7,8 +7,6 @@ PR = "${INC_PR}.0"
>  
>  COMPATIBLE_MACHINE = "am65xx-evm|am64xx"
>  
> -PACKAGE_ARCH = "${MACHINE_ARCH}"
> -
>  TARGET = " \
>      am65x-sr2-pru0-prusw-fw.elf \
>      am65x-sr2-pru1-prusw-fw.elf \
> diff --git a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
> index d295a1c1..74729c16 100644
> --- a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
> +++ b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
> @@ -9,8 +9,6 @@ PR = "${INC_PR}.0"
>  
>  COMPATIBLE_MACHINE = "j721e"
>  
> -PACKAGE_ARCH = "${MACHINE_ARCH}"
> -
>  TARGET = "pvdec_full_bin.fw"
>  
>  do_install() {
> diff --git a/meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb b/meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb
> index 7d16ae39..4ec09a70 100644
> --- a/meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb
> +++ b/meta-ti-bsp/recipes-bsp/vis-fw/vis_01.50.07.15.bb
> @@ -3,7 +3,6 @@ LICENSE = "TI-TSPA"
>  LIC_FILES_CHKSUM = "file://${S}/J6_VIS_DEMO_LINUX_BINARY_01.50.07.15-Manifest.html;md5=a59aa54b9470f555cf086b91dca0afa3"
>  
>  COMPATIBLE_MACHINE = "dra7xx"
> -PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  PR = "r1"
>  
> diff --git a/meta-ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb b/meta-ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb
> index 2452d111..8af49577 100644
> --- a/meta-ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb
> +++ b/meta-ti-bsp/recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb
> @@ -4,7 +4,6 @@ LICENSE = "TI-TSPA"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=fd463c9500441ed91d07a0331baa635c"
>  
>  COMPATIBLE_MACHINE = "dra7xx"
> -PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  SRC_URI = "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/vpdma-fw/03-2012/exports/vpdma-fw_03-2012.tar.gz;protocol=http;name=dra7xx-evm"
>  SRC_URI[dra7xx-evm.md5sum] = "80176df1350c21d9efa90171789c546e"
> -- 
> 2.39.2

