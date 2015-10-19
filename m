Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C46E3E0049B; Mon, 19 Oct 2015 11:40:25 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 43474E00343
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 11:40:21 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t9JIeKVw005291
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 13:40:20 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9JIeKBr030850
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 13:40:20 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 19 Oct 2015 13:40:20 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9JIeJ98016264;
	Mon, 19 Oct 2015 13:40:20 -0500
Date: Mon, 19 Oct 2015 14:40:04 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20151019184004.GD5620@edge>
References: <1443107610-28736-1-git-send-email-h-gou@ti.com>
	<561FAC9A.2060408@ti.com>
MIME-Version: 1.0
In-Reply-To: <561FAC9A.2060408@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH v4] dspdce-fw: add recipe to build dspdce-fw from git source and remove recipe which uses prebuilt firmware
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
X-List-Received-Date: Mon, 19 Oct 2015 18:40:25 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Also, please show the difference between the old and the new recipes. You may 
need to lower the threshold, as it seems the new recipe grew almost 50% in size.


On Thu, Oct 15, 2015 at 09:39:38AM -0400, Jacob Stiffler wrote:
> Can you use "update-alternatives" here?
> 
> On 9/24/2015 11:13 AM, Hongmei Gou wrote:
> >Signed-off-by: Hongmei Gou <h-gou@ti.com>
> >
> >v4 changes:
> >1) Remove recipe which uses prebuilt firmware
> >2) Update PV to use version number only, "git+[commit]" is not needed any more
> >
> >---
> >  recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.05.bb | 26 -------------
> >  recipes-bsp/dspdce-fw/dspdce-fw_git.bb        | 56 +++++++++++++++++++++++++++
> >  2 files changed, 56 insertions(+), 26 deletions(-)
> >  delete mode 100644 recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.05.bb
> >  create mode 100644 recipes-bsp/dspdce-fw/dspdce-fw_git.bb
> >
> >diff --git a/recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.05.bb b/recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.05.bb
> >deleted file mode 100644
> >index 777c221..0000000
> >--- a/recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.05.bb
> >+++ /dev/null
> >@@ -1,26 +0,0 @@
> >-DESCRIPTION = "Firmware for DSP for an example application called copycodectest"
> >-LICENSE = "TI-TSPA"
> >-LIC_FILES_CHKSUM = "file://DSPDCE-${PV}-Manifest.doc;md5=386d1802eefc2fcf00ab01a5b4556277"
> >-
> >-COMPATIBLE_MACHINE = "dra7xx-evm"
> >-PACKAGE_ARCH = "${MACHINE_ARCH}"
> >-
> >-SRC_URI = "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/dspdce/1_00_00_05/exports/dspdce-${MACHINE}-1.00.00.05.tar.gz;protocol=ftp"
> >-
> >-S = "${WORKDIR}/dspdce-${MACHINE}-${PV}"
> >-
> >-SRC_URI[md5sum] = "4f3d5c6ef088019aa4804eaaedc8e949"
> >-SRC_URI[sha256sum] = "8d99c4f149613448a6d72c62a18cc7445c63c687b786658da1762c4e1c03a6a0"
> >-
> >-TARGET = "dra7-dsp1-fw.xe66"
> >-
> >-do_install() {
> >-        mkdir -p ${D}${base_libdir}/firmware
> >-        cp ${S}/firmware/${TARGET} ${D}${base_libdir}/firmware/${TARGET}
> >-}
> >-
> >-FILES_${PN} += "${base_libdir}/firmware/${TARGET}"
> >-
> >-INSANE_SKIP_${PN} = "arch"
> >-
> >-PR = "r1"
> >diff --git a/recipes-bsp/dspdce-fw/dspdce-fw_git.bb b/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
> >new file mode 100644
> >index 0000000..594f330
> >--- /dev/null
> >+++ b/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
> >@@ -0,0 +1,56 @@
> >+DESCRIPTION = "Firmware for DSP for an example application called copycodectest"
> >+LICENSE = "TI-TSPA"
> >+LIC_FILES_CHKSUM = "file://src/ti/framework/dce/dce.c;startline=1;endline=31;md5=2c6e9aba6ed75f22b1a2b7544b1c809d"
> >+
> >+COMPATIBLE_MACHINE = "dra7xx"
> >+
> >+SRC_URI = "git://git.ti.com/glsdk/dspdce.git;protocol=git"
> >+
> >+SRCREV = "71e8fbf8e4f91b60680cf18a0c202a222e9ae3ba"
> >+
> >+PV = "1.00.00.06"
> >+
> >+S = "${WORKDIR}/git"
> >+
> >+require recipes-ti/includes/ti-paths.inc
> >+require recipes-ti/includes/ti-staging.inc
> >+
> >+PR = "r0"
> >+
> >+DEPENDS = "ti-xdctools ti-sysbios ti-codec-engine ti-framework-components ti-xdais ti-ipc-rtos ti-osal ti-cgt6x-native"
> >+
> >+export HWVERSION="ES10"
> >+export BIOSTOOLSROOT="${STAGING_DIR_TARGET}/usr/share/ti"
> >+
> >+export XDCVERSION="ti-xdctools-tree"
> >+export BIOSVERSION="ti-sysbios-tree"
> >+export IPCVERSION="ti-ipc-tree"
> >+export CEVERSION="ti-codec-engine-tree"
> >+export FCVERSION="ti-framework-components-tree"
> >+export XDAISVERSION="ti-xdais-tree"
> >+export OSALVERSION="ti-osal-tree"
> >+
> >+export IPCSRC="${STAGING_DIR_TARGET}/usr/share/ti/ti-ipc-tree"
> >+export C66XCGTOOLSPATH="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
> >+
> >+do_configure() {
> >+    cd ${S}
> >+    make unconfig
> >+    make vayu_config
> >+}
> >+
> >+do_compile() {
> >+    cd ${S}
> >+    make dspbin
> >+}
> >+
> >+TARGET = "dra7-dsp1-fw.xe66.dce"
> >+
> >+do_install() {
> >+        mkdir -p ${D}${base_libdir}/firmware
> >+        cp ${S}/dra7xx-c66x-dsp.xe66 ${D}${base_libdir}/firmware/${TARGET}
> >+}
> >+
> >+INSANE_SKIP_${PN} = "arch"
> >+
> >+FILES_${PN} += "${base_libdir}/firmware/${TARGET}"
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

