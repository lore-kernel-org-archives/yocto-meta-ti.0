Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D798C4332F
	for <webhook@archiver.kernel.org>; Tue, 18 Oct 2022 19:35:55 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.1316.1666121750427279317
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 18 Oct 2022 12:35:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9B73640D92;
	Tue, 18 Oct 2022 19:35:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4HweryogoOHJ; Tue, 18 Oct 2022 19:35:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6ABA140D91;
	Tue, 18 Oct 2022 19:35:46 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 5774E174A3C; Tue, 18 Oct 2022 15:35:44 -0400 (EDT)
Date: Tue, 18 Oct 2022 15:35:44 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: reatmon@ti.com, Praneeth Bajjuri <praneeth@ti.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master][PATCH] upstream: Add support for building
 upstream
Message-ID: <20221018193544.GR22689@denix.org>
References: <20221018174044.21049-1-reatmon@ti.com>
 <a5b54e5b-47d9-4abe-c501-829c9702b259@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5b54e5b-47d9-4abe-c501-829c9702b259@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 18 Oct 2022 19:35:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15183

On Tue, Oct 18, 2022 at 01:41:23PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> On 10/18/22 12:40 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
> >We want to start running upstream testing on a daily basis and reporting
> >the reuslts of our test plan.  To do that we need some recipes that
> >point to the upstream of the repositories that need to be tracked.
> >
> >Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> >---
> >  .../u-boot/u-boot-ti-upstream_git.bb          | 19 +++++
> >  .../linux/linux-ti-upstream_git.bb            | 75 +++++++++++++++++++
> >  2 files changed, 94 insertions(+)
> >  create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-upstream_git.bb
> >  create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-upstream_git.bb
> >
> >diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-upstream_git.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-upstream_git.bb
> >new file mode 100644
> >index 00000000..52c3c293
> >--- /dev/null
> >+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-upstream_git.bb
> >@@ -0,0 +1,19 @@
> >+require u-boot-ti.inc
> >+
> >+LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
> >+
> >+PR = "r0"
> >+
> >+PV = "upstream"
> >+
> >+# For the un-initiated:
> >+# The actual URL you'd use with a git clone for example would be:
> >+# https://source.denx.de/u-boot/u-boot.git/
> >+# However, in the context of OE, we have to explicitly split things up:
> >+# a) we want it to use git fetcher - hence git:// prefix in GIT_URI (if we
> >+#  used https here, we'd endup attempting wget instead of git)
> >+# b) and we want git fetcher to use https protocol, hence GIT_PROTOCOL as https
> >+UBOOT_GIT_URI = "git://source.denx.de/u-boot/u-boot.git"
> >+UBOOT_GIT_PROTOCOL = "https"
> >+SRCREV = "${AUTOREV}"
> >+
> >diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-upstream_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-upstream_git.bb
> >new file mode 100644
> >index 00000000..33778199
> >--- /dev/null
> >+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-upstream_git.bb
> >@@ -0,0 +1,75 @@
> >+SECTION = "kernel"
> >+SUMMARY = "Mainline Linux kernel for TI devices (with ti-upstream-tools)"
> >+LICENSE = "GPL-2.0-only"
> >+LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
> >+
> >+inherit kernel
> >+
> >+DEFCONFIG_BUILDER = "${WORKDIR}/ti-upstream-tools/config/defconfig_builder.sh"
> 
> Nak, this is not upstream. Use the upstream defconfigs only, "multi_v7_defconfig"
> for all pre-K3, and "defconfig" for K3/ARM64.
> 
> Same for the below DTBOs, if the DTBO is not in upstream then it
> should not be working here.
> 
> Both DTBO and extra TI defconfig support are going upstream now, so I
> don't expect this to be a problem for much longer. However we need to
> track that progress. Patching around our missing stuff in this integration
> layer defeats the purpose of upstream testing.

If this is the case, I would suggest repurposing the ti-mainline recipes, 
instead of creating new ones.

-- 
Denys


> Andrew
> 
> >+require recipes-kernel/linux/setup-defconfig.inc
> >+require recipes-kernel/linux/kernel-rdepends.inc
> >+require recipes-kernel/linux/ti-kernel.inc
> >+
> >+DEPENDS += "gmp-native libmpc-native"
> >+
> >+KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} \
> >+		      ${EXTRA_DTC_ARGS}"
> >+
> >+S = "${WORKDIR}/git"
> >+
> >+BRANCH = "master"
> >+TOOLS_BRANCH = "master"
> >+
> >+# 5.15 Mainline version
> >+SRCREV = "${AUTOREV}"
> >+PV = "upstream+git${SRCPV}"
> >+
> >+# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
> >+MACHINE_KERNEL_PR:append = "b"
> >+PR = "${MACHINE_KERNEL_PR}"
> >+
> >+KERNEL_GIT_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git"
> >+KERNEL_GIT_PROTOCOL = "https"
> >+SRC_URI += " \
> >+    ${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH};name=linux \
> >+    git://git.ti.com/ti-linux-kernel/ti-upstream-tools.git;branch=${TOOLS_BRANCH};protocol=${KERNEL_GIT_PROTOCOL};name=ti-upstream-tools;destsuffix=ti-upstream-tools \
> >+    file://defconfig \
> >+"
> >+
> >+SRCREV_ti-upstream-tools = "${AUTOREV}"
> >+SRCREV_FORMAT = "linux"
> >+
> >+KERNEL_DEVICETREE = ""
> >+
> >+kernel_do_compile:append() {
> >+	oe_runmake dtbs CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
> >+	oe_runmake -C ${WORKDIR}/ti-upstream-tools LINUX=${S} DTC=${B}/scripts/dtc/dtc O=${B} CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
> >+}
> >+
> >+do_install:append() {
> >+	for dtbf in `find arch/${ARCH}/boot/dts/ \( -name '*.dtb' -or -name '*.dtbo' \)`; do
> >+		dtb="$dtbf"
> >+		dtb_ext=${dtb##*.}
> >+		dtb_base_name=`basename $dtb .$dtb_ext`
> >+		dtb_path=`get_real_dtb_path_in_kernel "$dtb"`
> >+		install -m 0644 $dtbf ${D}/${KERNEL_IMAGEDEST}/$dtb_base_name.$dtb_ext
> >+	done
> >+}
> >+
> >+do_deploy:append() {
> >+	for dtbf in `find arch/${ARCH}/boot/dts/ \( -name '*.dtb' -or -name '*.dtbo' \) -printf '%P\n'`; do
> >+		dtb="$dtbf"
> >+		dtb_ext=${dtb##*.}
> >+		dtb_base_name=`basename $dtb .$dtb_ext`
> >+		dtb_dir=`dirname $dtb`
> >+		install -d ${DEPLOYDIR}
> >+		install -m 0644 ${D}/${KERNEL_IMAGEDEST}/$dtb_base_name.$dtb_ext ${DEPLOYDIR}/$dtb_base_name.$dtb_ext
> >+	done
> >+}
> >+
> >+do_shared_workdir:prepend() {
> >+	cd ${B}
> >+	echo >> Module.symvers
> >+}
> >+
> >+FILES:${KERNEL_PACKAGE_NAME}-devicetree += "/${KERNEL_IMAGEDEST}/*.itb"
> >
> >
> >
> >
> >

