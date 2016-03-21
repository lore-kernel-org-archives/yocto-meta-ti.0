Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5C35EE00973; Mon, 21 Mar 2016 08:23:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0FAFCE00948
	for <meta-ti@yoctoproject.org>; Mon, 21 Mar 2016 08:23:10 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u2LFN9fn025602
	for <meta-ti@yoctoproject.org>; Mon, 21 Mar 2016 10:23:09 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2LFN9WB024687
	for <meta-ti@yoctoproject.org>; Mon, 21 Mar 2016 10:23:09 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 21 Mar 2016 10:23:08 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2LFN9Ja030044;
	Mon, 21 Mar 2016 10:23:09 -0500
Date: Mon, 21 Mar 2016 11:22:53 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20160321152253.GE3298@edge>
References: <1458571873-12889-1-git-send-email-j-stiffler@ti.com>
	<1458571873-12889-4-git-send-email-j-stiffler@ti.com>
	<20160321150826.GB3298@edge> <56F01198.3040607@ti.com>
MIME-Version: 1.0
In-Reply-To: <56F01198.3040607@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 03/10] qmss-lld: Upgrade to version 2.1.0.14
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
X-List-Received-Date: Mon, 21 Mar 2016 15:23:15 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Mar 21, 2016 at 11:22:00AM -0400, Jacob Stiffler wrote:
> 
> 
> On 3/21/2016 11:08 AM, Denys Dmytriyenko wrote:
> >On Mon, Mar 21, 2016 at 10:51:06AM -0400, Jacob Stiffler wrote:
> >>* Update license with TI_TFL license
> >>
> >>Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> >>---
> >>  recipes-bsp/qmss-lld/qmss-lld.inc                        | 16 +++++-----------
> >>  .../qmss-lld/qmss-ld-fix-firmware-installation.patch     | 13 -------------
> >>  2 files changed, 5 insertions(+), 24 deletions(-)
> >>  delete mode 100644 recipes-bsp/qmss-lld/qmss-lld/qmss-ld-fix-firmware-installation.patch
> >>
> >>diff --git a/recipes-bsp/qmss-lld/qmss-lld.inc b/recipes-bsp/qmss-lld/qmss-lld.inc
> >>index fae58e1..1ed77a0 100644
> >>--- a/recipes-bsp/qmss-lld/qmss-lld.inc
> >>+++ b/recipes-bsp/qmss-lld/qmss-lld.inc
> >>@@ -1,5 +1,5 @@
> >>-LICENSE = "BSD-3-Clause"
> >>-LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/qmss/COPYING.txt;md5=e8f6789acdcda76d02ed9203fc2e603d"
> >>+LICENSE = "BSD-3-Clause & TI_TFL"
> >It's dash, not underscore ^^^
> >
> >Also, I haven't looked at the new COPYING file, but is it parts BSD and parts
> >TFL or is it dual-licensed i.e. one or another?
> 
> Parts BSD and parts TI-TFL. The firmware is TI-TFL, and the
> remaining is BSD.
> 
> This is the case for qmss-lld as well as sa-lld and pa-lld.

Ok, thanks. Just fix the license name to TI-TFL in those patches.


> >>+LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/qmss/COPYING.txt;md5=cd04fb087063a2a82c4ce61983836871"
> >>  COMPATIBLE_MACHINE = "keystone"
> >>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> >>@@ -9,14 +9,14 @@ QMSS_LLD_GIT_PROTOCOL = "git"
> >>  QMSS_LLD_GIT_BRANCH = "master"
> >>  QMSS_LLD_GIT_DESTSUFFIX = "git/ti/drv/qmss"
> >>-# commit ID corresponding to DEV.QMSS_LLD.02.01.00.12
> >>-QMSS_LLD_SRCREV = "6b093515f38c6e4d3a8014903a563a9b89fd7c98"
> >>+# commit ID corresponding to DEV.QMSS_LLD.02.01.00.14
> >>+QMSS_LLD_SRCREV = "4cc3a3f1bcddfc19e2e7d8dd4208ca215e7ecbae"
> >>  BRANCH ="${QMSS_LLD_GIT_BRANCH}"
> >>  SRC_URI = "${QMSS_LLD_GIT_URI};destsuffix=${QMSS_LLD_GIT_DESTSUFFIX};protocol=${QMSS_LLD_GIT_PROTOCOL};branch=${BRANCH}"
> >>  SRCREV = "${QMSS_LLD_SRCREV}"
> >>-PV = "02.01.00.12"
> >>+PV = "02.01.00.14"
> >>  INC_PR = "r0"
> >>  DEVICELIST = "k2h k2k k2l k2e"
> >>@@ -25,9 +25,3 @@ DEVICELIST_k2l-evm = "k2l"
> >>  DEVICELIST_k2e-evm = "k2e"
> >>  S = "${WORKDIR}/${QMSS_LLD_GIT_DESTSUFFIX}"
> >>-
> >>-FILESEXTRAPATHS_prepend := "${THISDIR}/qmss-lld:"
> >>-
> >>-SRC_URI_append = " \
> >>-    file://qmss-ld-fix-firmware-installation.patch \
> >>-"
> >>diff --git a/recipes-bsp/qmss-lld/qmss-lld/qmss-ld-fix-firmware-installation.patch b/recipes-bsp/qmss-lld/qmss-lld/qmss-ld-fix-firmware-installation.patch
> >>deleted file mode 100644
> >>index a48aae1..0000000
> >>--- a/recipes-bsp/qmss-lld/qmss-lld/qmss-ld-fix-firmware-installation.patch
> >>+++ /dev/null
> >>@@ -1,13 +0,0 @@
> >>-diff --git a/makefile_armv7 b/makefile_armv7
> >>-index a1fd5c0..d050ace 100644
> >>---- a/makefile_armv7
> >>-+++ b/makefile_armv7
> >>-@@ -117,7 +117,7 @@ install:
> >>- 	install -d $(INSTALL_LIB_BASE_DIR)
> >>- 	$(CP) ./*.h                $(INSTALL_INC_BASE_DIR)/ti/drv/qmss
> >>- 	$(CP) ./include/*.h        $(INSTALL_INC_BASE_DIR)/ti/drv/qmss/include
> >>--	$(CP) ./firmware/*.h       $(INSTALL_INC_BASE_DIR)/ti/drv/qmss/firmware
> >>-+	$(CP) -r ./firmware/*      $(INSTALL_INC_BASE_DIR)/ti/drv/qmss/firmware
> >>- 	$(CP) -r ./device $(INSTALL_INC_BASE_DIR)/ti/drv/qmss/
> >>- 	@$(CP) -r $(ARMV7LIBDIR)/*.a         $(INSTALL_LIB_BASE_DIR)
> >>- 	@$(CP) -r $(ARMV7LIBDIR)/*.so        $(INSTALL_LIB_BASE_DIR)
> >>-- 
> >>1.9.1
> >>
> >>-- 
> >>_______________________________________________
> >>meta-ti mailing list
> >>meta-ti@yoctoproject.org
> >>https://lists.yoctoproject.org/listinfo/meta-ti
> 

