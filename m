Return-Path: <m-chawdhry@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C831C4332F
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 05:52:25 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web08.7054.1666331540083806740
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 20 Oct 2022 22:52:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Goe3lGCm;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: m-chawdhry@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29L5qIZv056515;
	Fri, 21 Oct 2022 00:52:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1666331538;
	bh=jfRmgr5MM7X1v1ruhs3HB0NlsoOzkcVc82SGNbZlE9I=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Goe3lGCmGuXr955zkj1T4W0qs9aWFqaLizCxtpDGAgBjq4Da9cZDPMeo9aVw/M2xt
	 KPa+decWYVso2LuG3DB8cOD3ZS3m8JHh74CucgcdLts2d7hZr0JJvzR4bXHge+Gw1V
	 ts5tI+jkFN7erwf8N1qYdAywPtWy1IGbQmeQ4Ei8=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29L5qIDX078421
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 21 Oct 2022 00:52:18 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Fri, 21
 Oct 2022 00:52:18 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Fri, 21 Oct 2022 00:52:18 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29L5qHQk038585;
	Fri, 21 Oct 2022 00:52:18 -0500
Date: Fri, 21 Oct 2022 11:22:16 +0530
From: Manorit Chawdhry <m-chawdhry@ti.com>
To: <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] upstream: Add support for building
 upstream
Message-ID: <20221021055216.aeyc2qq57edjxit6@ula0497581>
References: <20221018174044.21049-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221018174044.21049-1-reatmon@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 21 Oct 2022 05:52:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15191

On 12:40-20221018, Ryan Eatmon via lists.yoctoproject.org wrote:
> We want to start running upstream testing on a daily basis and reporting
> the reuslts of our test plan.  To do that we need some recipes that

results*

Manorit

> point to the upstream of the repositories that need to be tracked.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  .../u-boot/u-boot-ti-upstream_git.bb          | 19 +++++
>  .../linux/linux-ti-upstream_git.bb            | 75 +++++++++++++++++++
>  2 files changed, 94 insertions(+)
>  create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-upstream_git.bb
>  create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-upstream_git.bb
> 
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-upstream_git.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-upstream_git.bb
> new file mode 100644
> index 00000000..52c3c293
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-upstream_git.bb
> @@ -0,0 +1,19 @@
> +require u-boot-ti.inc
> +
> +LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
> +
> +PR = "r0"
> +
> +PV = "upstream"
> +
> +# For the un-initiated:
> +# The actual URL you'd use with a git clone for example would be:
> +# https://source.denx.de/u-boot/u-boot.git/
> +# However, in the context of OE, we have to explicitly split things up:
> +# a) we want it to use git fetcher - hence git:// prefix in GIT_URI (if we
> +#  used https here, we'd endup attempting wget instead of git)
> +# b) and we want git fetcher to use https protocol, hence GIT_PROTOCOL as https
> +UBOOT_GIT_URI = "git://source.denx.de/u-boot/u-boot.git"
> +UBOOT_GIT_PROTOCOL = "https"
> +SRCREV = "${AUTOREV}"
> +
> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-upstream_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-upstream_git.bb
> new file mode 100644
> index 00000000..33778199
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-upstream_git.bb
> @@ -0,0 +1,75 @@
> +SECTION = "kernel"
> +SUMMARY = "Mainline Linux kernel for TI devices (with ti-upstream-tools)"
> +LICENSE = "GPL-2.0-only"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
> +
> +inherit kernel
> +
> +DEFCONFIG_BUILDER = "${WORKDIR}/ti-upstream-tools/config/defconfig_builder.sh"
> +require recipes-kernel/linux/setup-defconfig.inc
> +require recipes-kernel/linux/kernel-rdepends.inc
> +require recipes-kernel/linux/ti-kernel.inc
> +
> +DEPENDS += "gmp-native libmpc-native"
> +
> +KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} \
> +		      ${EXTRA_DTC_ARGS}"
> +
> +S = "${WORKDIR}/git"
> +
> +BRANCH = "master"
> +TOOLS_BRANCH = "master"
> +
> +# 5.15 Mainline version
> +SRCREV = "${AUTOREV}"
> +PV = "upstream+git${SRCPV}"
> +
> +# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
> +MACHINE_KERNEL_PR:append = "b"
> +PR = "${MACHINE_KERNEL_PR}"
> +
> +KERNEL_GIT_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git"
> +KERNEL_GIT_PROTOCOL = "https"
> +SRC_URI += " \
> +    ${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH};name=linux \
> +    git://git.ti.com/ti-linux-kernel/ti-upstream-tools.git;branch=${TOOLS_BRANCH};protocol=${KERNEL_GIT_PROTOCOL};name=ti-upstream-tools;destsuffix=ti-upstream-tools \
> +    file://defconfig \
> +"
> +
> +SRCREV_ti-upstream-tools = "${AUTOREV}"
> +SRCREV_FORMAT = "linux"
> +
> +KERNEL_DEVICETREE = ""
> +
> +kernel_do_compile:append() {
> +	oe_runmake dtbs CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
> +	oe_runmake -C ${WORKDIR}/ti-upstream-tools LINUX=${S} DTC=${B}/scripts/dtc/dtc O=${B} CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
> +}
> +
> +do_install:append() {
> +	for dtbf in `find arch/${ARCH}/boot/dts/ \( -name '*.dtb' -or -name '*.dtbo' \)`; do
> +		dtb="$dtbf"
> +		dtb_ext=${dtb##*.}
> +		dtb_base_name=`basename $dtb .$dtb_ext`
> +		dtb_path=`get_real_dtb_path_in_kernel "$dtb"`
> +		install -m 0644 $dtbf ${D}/${KERNEL_IMAGEDEST}/$dtb_base_name.$dtb_ext
> +	done
> +}
> +
> +do_deploy:append() {
> +	for dtbf in `find arch/${ARCH}/boot/dts/ \( -name '*.dtb' -or -name '*.dtbo' \) -printf '%P\n'`; do
> +		dtb="$dtbf"
> +		dtb_ext=${dtb##*.}
> +		dtb_base_name=`basename $dtb .$dtb_ext`
> +		dtb_dir=`dirname $dtb`
> +		install -d ${DEPLOYDIR}
> +		install -m 0644 ${D}/${KERNEL_IMAGEDEST}/$dtb_base_name.$dtb_ext ${DEPLOYDIR}/$dtb_base_name.$dtb_ext
> +	done
> +}
> +
> +do_shared_workdir:prepend() {
> +	cd ${B}
> +	echo >> Module.symvers
> +}
> +
> +FILES:${KERNEL_PACKAGE_NAME}-devicetree += "/${KERNEL_IMAGEDEST}/*.itb"
> -- 
> 2.17.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15181): https://lists.yoctoproject.org/g/meta-ti/message/15181
> Mute This Topic: https://lists.yoctoproject.org/mt/94413827/6945827
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [m-chawdhry@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


