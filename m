Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73519C5472E
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 18:46:34 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.60568.1724697989278319794
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 26 Aug 2024 11:46:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7411840C67;
	Mon, 26 Aug 2024 18:46:28 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MlPvubWOvDhG; Mon, 26 Aug 2024 18:46:28 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 44C8940A03;
	Mon, 26 Aug 2024 18:46:26 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 66F1C164061; Mon, 26 Aug 2024 14:46:25 -0400 (EDT)
Date: Mon, 26 Aug 2024 14:46:25 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Andrew Davis <afd@ti.com>
Cc: meta-ti@lists.yoctoproject.org, Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [meta-ti] [master][RFC PATCH] openmp-rtos: deprecate
Message-ID: <20240826184625.GA17572@denix.org>
References: <20240805043654.172479-1-denis@denix.org>
 <56b01c2b-80f2-46b0-b3bd-794591c69177@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56b01c2b-80f2-46b0-b3bd-794591c69177@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 26 Aug 2024 18:46:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17948

On Thu, Aug 08, 2024 at 12:17:45PM -0500, Andrew Davis wrote:
> On 8/4/24 11:36 PM, Denys Dmytriyenko wrote:
> >From: Denys Dmytriyenko <denys@konsulko.com>
> >
> >Remove openmp-rtos component as deprecated and not maintained.
> >
> >This used to provide OpenMP DSP runtime components for legacy devices.
> >
> 
> With all the OpenCL stuff gone from meta-arago, dsplib/mathlib/imglib/swtools
> can also be dropped.

None of those use OpenCL and are rather self-contained (either prebuilt 
binaries, or use existing components from meta-ti, like CGT).

But they are in the same bucket of deprecated DSP-programming enablement in 
TI-SDK. Moreover, we are seeing deeper issues with old CGT versions generating 
non-reproducible code, so this class of components was pending a second round 
of clean ups...


> On the side, dspdce-fw and ipumm-fw should be updated
> to be shipped as binaries, same as we do with all other sysbios/ti-rtos firmware.
> Then we could also drop out all the remaining sysbios/xdc bits.

Yes, that was the thinking. Someone needs to add prebuilt FW binaries to 
ti-linux-firmware repo before the rest of dependencies can finally be dropped 
from meta-ti.


> Andrew
> 
> >Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> >---
> >  .../recipes-ti/openmp-rtos/openmp-rtos_git.bb | 62 -------------------
> >  1 file changed, 62 deletions(-)
> >  delete mode 100644 meta-ti-extras/recipes-ti/openmp-rtos/openmp-rtos_git.bb
> >
> >diff --git a/meta-ti-extras/recipes-ti/openmp-rtos/openmp-rtos_git.bb b/meta-ti-extras/recipes-ti/openmp-rtos/openmp-rtos_git.bb
> >deleted file mode 100644
> >index aa4bc6cd..00000000
> >--- a/meta-ti-extras/recipes-ti/openmp-rtos/openmp-rtos_git.bb
> >+++ /dev/null
> >@@ -1,62 +0,0 @@
> >-DESCRIPTION = "TI OpenMP RTOS"
> >-HOMEPAGE = "git://git.ti.com/git/openmp/ti-openmp-dsp-runtime.git"
> >-LICENSE = "BSD-3-Clause"
> >-
> >-require recipes-ti/includes/ti-paths.inc
> >-
> >-inherit features_check
> >-
> >-REQUIRED_MACHINE_FEATURES = "dsp"
> >-REQUIRED_DISTRO_FEATURES = "openmp"
> >-
> >-PV = "2_06_03_00"
> >-PR = "r0"
> >-
> >-OPENMP_RTOS_GIT_URI = "git://git.ti.com/git/openmp/ti-openmp-dsp-runtime.git"
> >-OPENMP_RTOS_GIT_PROTOCOL = "https"
> >-OPENMP_RTOS_GIT_BRANCH = "master"
> >-
> >-BRANCH = "${OPENMP_RTOS_GIT_BRANCH}"
> >-SRC_URI = "${OPENMP_RTOS_GIT_URI};protocol=${OPENMP_RTOS_GIT_PROTOCOL};branch=${BRANCH}"
> >-
> >-SRCREV = "c090eb664d9815a36ead0e14f31e102590680fb8"
> >-
> >-LIC_FILES_CHKSUM = "file://docs/license/omp_manifest_template.html;md5=61a6972303c0447b7c056195d7ebafee"
> >-
> >-DEPENDS = "common-csl-ip-rtos doxygen-native libulm ti-xdctools-native ti-ipc-rtos ti-sysbios ti-cgt6x-native zip-native"
> >-
> >-COMPATIBLE_MACHINE = "omap-a15"
> >-PACKAGE_ARCH = "${MACHINE_ARCH}"
> >-
> >-S = "${WORKDIR}/git"
> >-export IPC_DIR = "${IPC_INSTALL_DIR}"
> >-export XDC_DIR = "${XDC_INSTALL_DIR}"
> >-export BIOS_DIR = "${SYSBIOS_INSTALL_DIR}"
> >-export ULM_DIR ="${STAGING_DIR_TARGET}/usr/share/ti/ulm"
> >-export C6636_PDK_DIR ="${PDK_INSTALL_DIR}"
> >-export AM572_PDK_DIR ="${PDK_INSTALL_DIR}"
> >-export XDCCGROOT = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
> >-
> >-export BUILD_AM572 = "0"
> >-
> >-BUILD_AM572:omap-a15 = "1"
> >-
> >-RELEASE_TARGET = ""
> >-RELEASE_TARGET:omap-a15 = "am57xx"
> >-
> >-do_compile() {
> >-    make -f utils/product/Makefile .zipfile
> >-}
> >-
> >-do_install() {
> >-    install -d ${D}${OMP_INSTALL_DIR_RECIPE}
> >-    cp -r ${S}/exports/openmp_dsp_${RELEASE_TARGET}_*/. -d  ${D}${OMP_INSTALL_DIR_RECIPE}
> >-}
> >-
> >-ALLOW_EMPTY:${PN} = "1"
> >-
> >-FILES:${PN}-dev += " \
> >-    ${OMP_INSTALL_DIR_RECIPE}/ \
> >-"
> >-
> >-INSANE_SKIP:${PN}-dev = "arch"

