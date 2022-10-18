Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB4DEC433FE
	for <webhook@archiver.kernel.org>; Tue, 18 Oct 2022 18:41:34 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web09.702.1666118487201431954
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 18 Oct 2022 11:41:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=GyYXVGM/;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29IIfPMY071168;
	Tue, 18 Oct 2022 13:41:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1666118485;
	bh=x2/oqFXghAvCTdqTU286MB31tx+Wyz/4HB3SDvw4VQk=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=GyYXVGM/9eRBlBQiL4y8gw5+SmJaPpQkqqKRywLsHJChxrNsK8mIh7n8e7Dl5t/Jr
	 zNtkylCuCdRPQnyc4TyzYBPMmNeHI6aVTC+R26PlHWImqjuSm9QkrdFphH0c+hJhhG
	 tdhFV6Xao/pwlCgbllDF25DZSqY8oJ/yNni0I14A=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29IIfPXa056116
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 18 Oct 2022 13:41:25 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Tue, 18
 Oct 2022 13:41:25 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Tue, 18 Oct 2022 13:41:25 -0500
Received: from [10.250.33.68] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29IIfObM005492;
	Tue, 18 Oct 2022 13:41:25 -0500
Message-ID: <a5b54e5b-47d9-4abe-c501-829c9702b259@ti.com>
Date: Tue, 18 Oct 2022 13:41:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [meta-ti][master][PATCH] upstream: Add support for building
 upstream
Content-Language: en-US
To: <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20221018174044.21049-1-reatmon@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20221018174044.21049-1-reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 18 Oct 2022 18:41:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15182

On 10/18/22 12:40 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
> We want to start running upstream testing on a daily basis and reporting
> the reuslts of our test plan.  To do that we need some recipes that
> point to the upstream of the repositories that need to be tracked.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>   .../u-boot/u-boot-ti-upstream_git.bb          | 19 +++++
>   .../linux/linux-ti-upstream_git.bb            | 75 +++++++++++++++++++
>   2 files changed, 94 insertions(+)
>   create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-upstream_git.bb
>   create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-upstream_git.bb
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

Nak, this is not upstream. Use the upstream defconfigs only, "multi_v7_defconfig"
for all pre-K3, and "defconfig" for K3/ARM64.

Same for the below DTBOs, if the DTBO is not in upstream then it
should not be working here.

Both DTBO and extra TI defconfig support are going upstream now, so I
don't expect this to be a problem for much longer. However we need to
track that progress. Patching around our missing stuff in this integration
layer defeats the purpose of upstream testing.

Andrew

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
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15181): https://lists.yoctoproject.org/g/meta-ti/message/15181
> Mute This Topic: https://lists.yoctoproject.org/mt/94413827/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

