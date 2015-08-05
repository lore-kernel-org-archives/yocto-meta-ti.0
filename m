Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C5C36E00AB4; Tue,  4 Aug 2015 19:24:09 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7CC7BE00AA2
	for <meta-ti@yoctoproject.org>; Tue,  4 Aug 2015 19:24:05 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t752O4ID013944
	for <meta-ti@yoctoproject.org>; Tue, 4 Aug 2015 21:24:04 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t752O403008688
	for <meta-ti@yoctoproject.org>; Tue, 4 Aug 2015 21:24:04 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 4 Aug 2015 21:24:04 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t752O4Kr010469;
	Tue, 4 Aug 2015 21:24:04 -0500
Date: Tue, 4 Aug 2015 22:23:48 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150805022348.GU1040@edge>
References: <1436274269-31734-1-git-send-email-j-stiffler@ti.com>
	<55B79DB4.8070404@ti.com> <20150728191435.GK1040@edge>
MIME-Version: 1.0
In-Reply-To: <20150728191435.GK1040@edge>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] ti-xdctools: Add version 3.31.02.38.
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
X-List-Received-Date: Wed, 05 Aug 2015 02:24:09 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Jake,

Will you resubmit this one with the necessary flags?

-- 
Denys


On Tue, Jul 28, 2015 at 03:14:36PM -0400, Denys Dmytriyenko wrote:
> I was holding it together with bios update patches.
> 
> BTW, this patch will also benefit from -C --find-copies-harder flags, as it 
> moves majority of code from one file to another, basically clobbering the 
> patch with unnecessary duplication in additions and deletions.
> 
> -- 
> Denys
> 
> 
> On Tue, Jul 28, 2015 at 11:20:20AM -0400, Jacob Stiffler wrote:
> > Ping.
> > 
> > On 7/7/2015 9:04 AM, Jacob Stiffler wrote:
> > >* This version adheres to the new "core" package format.
> > >* Add the version-indepedent include file for the core packages
> > >* Extract common information between the core and legacy packages
> > >   into the ti-xdctools-common.inc file.
> > >
> > >Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> > >---
> > >  recipes-ti/devtools/ti-xdctools-common.inc    |   54 +++++++++++++++++++++++++
> > >  recipes-ti/devtools/ti-xdctools-core.inc      |    5 +++
> > >  recipes-ti/devtools/ti-xdctools.inc           |   54 +------------------------
> > >  recipes-ti/devtools/ti-xdctools_3.31.02.38.bb |    9 +++++
> > >  4 files changed, 69 insertions(+), 53 deletions(-)
> > >  create mode 100644 recipes-ti/devtools/ti-xdctools-common.inc
> > >  create mode 100644 recipes-ti/devtools/ti-xdctools-core.inc
> > >  create mode 100644 recipes-ti/devtools/ti-xdctools_3.31.02.38.bb
> > >
> > >diff --git a/recipes-ti/devtools/ti-xdctools-common.inc b/recipes-ti/devtools/ti-xdctools-common.inc
> > >new file mode 100644
> > >index 0000000..2d5f2d7
> > >--- /dev/null
> > >+++ b/recipes-ti/devtools/ti-xdctools-common.inc
> > >@@ -0,0 +1,54 @@
> > >+DESCRIPTION = "TI XDCtools (RTSC - Real Time Software Components - http://rtsc.eclipse.org)"
> > >+HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/rtsc"
> > >+SECTION = "devel"
> > >+LICENSE = "BSD & GPLv2"
> > >+
> > >+require recipes-ti/includes/ti-paths.inc
> > >+require recipes-ti/includes/ti-staging.inc
> > >+
> > >+do_install() {
> > >+    install -d ${D}${XDC_INSTALL_DIR_RECIPE}
> > >+    cp -pPrf ${S}/* ${D}${XDC_INSTALL_DIR_RECIPE}
> > >+}
> > >+
> > >+INSANE_SKIP_${PN} = "installed-vs-shipped"
> > >+
> > >+# Prevent internal libs from getting picked up
> > >+PRIVATE_LIBS = " \
> > >+libncdb.so \
> > >+libcdb.so \
> > >+libjavaplugin_oji.so \
> > >+libjavaplugin_jni.so \
> > >+libjsound.so \
> > >+libinstrument.so \
> > >+libjawt.so \
> > >+libzip.so \
> > >+libjava_crw_demo.so \
> > >+libjavaplugin_nscp_gcc29.so \
> > >+libhprof.so \
> > >+libcmm.so \
> > >+libjdwp.so \
> > >+libmlib_image.so \
> > >+libjpeg.so \
> > >+libverify.so \
> > >+libjavaplugin_nscp.so \
> > >+libmanagement.so \
> > >+libunpack.so \
> > >+librmi.so \
> > >+libJdbcOdbc.so \
> > >+libawt.so \
> > >+libnet.so \
> > >+libjaas_unix.so \
> > >+libnio.so \
> > >+libdcpr.so \
> > >+libioser12.so \
> > >+libjsoundalsa.so \
> > >+libjava.so \
> > >+libfontmanager.so \
> > >+libdt_socket.so \
> > >+libmawt.so \
> > >+libjvm.so \
> > >+libhpi.so \
> > >+lib.so \
> > >+libcairo.so.2 \
> > >+"
> > >diff --git a/recipes-ti/devtools/ti-xdctools-core.inc b/recipes-ti/devtools/ti-xdctools-core.inc
> > >new file mode 100644
> > >index 0000000..47f73b6
> > >--- /dev/null
> > >+++ b/recipes-ti/devtools/ti-xdctools-core.inc
> > >@@ -0,0 +1,5 @@
> > >+require ti-xdctools-common.inc
> > >+
> > >+S = "${WORKDIR}/xdctools_${PV}_core"
> > >+
> > >+SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/rtsc/${PV}/exports/xdccore/xdctools_${PV}_core_linux.zip;name=xdczip"
> > >diff --git a/recipes-ti/devtools/ti-xdctools.inc b/recipes-ti/devtools/ti-xdctools.inc
> > >index 547a555..1415f83 100644
> > >--- a/recipes-ti/devtools/ti-xdctools.inc
> > >+++ b/recipes-ti/devtools/ti-xdctools.inc
> > >@@ -1,10 +1,4 @@
> > >-DESCRIPTION = "TI XDCtools (RTSC - Real Time Software Components - http://rtsc.eclipse.org)"
> > >-HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/rtsc"
> > >-SECTION = "devel"
> > >-LICENSE = "BSD & GPLv2"
> > >-
> > >-require ../includes/ti-paths.inc
> > >-require ../includes/ti-staging.inc
> > >+require ti-xdctools-common.inc
> > >  require ../includes/ti-eula-unpack.inc
> > >  S = "${WORKDIR}/xdctools_${PV}"
> > >@@ -14,49 +8,3 @@ SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/rt
> > >  BINFILE="xdctools_setuplinux_${PV}.bin"
> > >  TI_BIN_UNPK_CMDS="Y:workdir:Y"
> > >  TI_BIN_UNPK_WDEXT="/ti"
> > >-
> > >-do_install() {
> > >-    install -d ${D}${XDC_INSTALL_DIR_RECIPE}
> > >-    cp -pPrf ${S}/* ${D}${XDC_INSTALL_DIR_RECIPE}
> > >-}
> > >-
> > >-# Prevent internal libs from getting picked up
> > >-PRIVATE_LIBS = " \
> > >-libncdb.so \
> > >-libcdb.so \
> > >-libjavaplugin_oji.so \
> > >-libjavaplugin_jni.so \
> > >-libjsound.so \
> > >-libinstrument.so \
> > >-libjawt.so \
> > >-libzip.so \
> > >-libjava_crw_demo.so \
> > >-libjavaplugin_nscp_gcc29.so \
> > >-libhprof.so \
> > >-libcmm.so \
> > >-libjdwp.so \
> > >-libmlib_image.so \
> > >-libjpeg.so \
> > >-libverify.so \
> > >-libjavaplugin_nscp.so \
> > >-libmanagement.so \
> > >-libunpack.so \
> > >-librmi.so \
> > >-libJdbcOdbc.so \
> > >-libawt.so \
> > >-libnet.so \
> > >-libjaas_unix.so \
> > >-libnio.so \
> > >-libdcpr.so \
> > >-libioser12.so \
> > >-libjsoundalsa.so \
> > >-libjava.so \
> > >-libfontmanager.so \
> > >-libdt_socket.so \
> > >-libmawt.so \
> > >-libjvm.so \
> > >-libhpi.so \
> > >-lib.so \
> > >-libcairo.so.2 \
> > >-"
> > >-
> > >diff --git a/recipes-ti/devtools/ti-xdctools_3.31.02.38.bb b/recipes-ti/devtools/ti-xdctools_3.31.02.38.bb
> > >new file mode 100644
> > >index 0000000..5e970ee
> > >--- /dev/null
> > >+++ b/recipes-ti/devtools/ti-xdctools_3.31.02.38.bb
> > >@@ -0,0 +1,9 @@
> > >+require ti-xdctools-core.inc
> > >+
> > >+PV = "3_31_02_38"
> > >+PR = "r0"
> > >+
> > >+LIC_FILES_CHKSUM = "file://docs/license/xdc/shelf/package.html;md5=9dbb0095cdb8b35508b344aa4f1de333"
> > >+
> > >+SRC_URI[xdczip.md5sum] = "c76b3d90c3e25d199765557e393d165b"
> > >+SRC_URI[xdczip.sha256sum] = "c0e1f6911f2294bfb76471fac1a0ceac3e89c7eb1300f84d2571bf78cb62a7d2"
> > 
> > -- 
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

