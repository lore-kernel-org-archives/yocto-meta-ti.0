Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 98544E008DC; Tue, 10 Feb 2015 13:28:25 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 37E31E00815
	for <meta-ti@yoctoproject.org>; Tue, 10 Feb 2015 13:28:23 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1ALSM3F025779
	for <meta-ti@yoctoproject.org>; Tue, 10 Feb 2015 15:28:22 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1ALSLjW032278
	for <meta-ti@yoctoproject.org>; Tue, 10 Feb 2015 15:28:21 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 10 Feb 2015 15:28:21 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t1ALSCZj030822;	Tue, 10 Feb 2015 15:28:20 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 10 Feb 2015 16:28:08 -0500
Message-ID: <1423603690-30013-2-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1423603690-30013-1-git-send-email-sam.nelson@ti.com>
References: <1423603690-30013-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
Subject: [PATCH v2 2/4] iqn2-lld: Add recipes for TI iqn2 peripheral module low level driver
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
X-List-Received-Date: Tue, 10 Feb 2015 21:28:25 -0000
Content-Type: text/plain

- Provides low level driver for TI iqn2 peripheral module
- Supports k2l device

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
Changes from previous version of patch
- test recipe removed to be a separate patch
---
---
 recipes-bsp/iqn2-lld/iqn2-lld.inc                  |   13 +++++++++++++
 .../dfe-lld_git.bb => iqn2-lld/iqn2-lld_git.bb}    |    7 ++++---
 2 files changed, 17 insertions(+), 3 deletions(-)
 create mode 100644 recipes-bsp/iqn2-lld/iqn2-lld.inc
 copy recipes-bsp/{dfe-lld/dfe-lld_git.bb => iqn2-lld/iqn2-lld_git.bb} (67%)

diff --git a/recipes-bsp/iqn2-lld/iqn2-lld.inc b/recipes-bsp/iqn2-lld/iqn2-lld.inc
new file mode 100644
index 0000000..c5b1511
--- /dev/null
+++ b/recipes-bsp/iqn2-lld/iqn2-lld.inc
@@ -0,0 +1,13 @@
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5bdceac872dffdec915b819654ee23ea"
+LICENSE = "BSD-3-Clause"
+
+BRANCH = "master"
+SRC_URI = "git://git.ti.com/keystone-rtos/iqn2-lld.git;destsuffix=git/ti/drv/iqn2;protocol=git;branch=${BRANCH}"
+# Following commit corresponds to DEV.IQN_LLD.01.00.00.05B
+SRCREV = "ca35079f41d06259be39f992f55a9f815d305ef5"
+
+PV = "1.0.0.5"
+
+COMPATIBLE_MACHINE = "k2l-evm"
+
+S = "${WORKDIR}/git/ti/drv/iqn2"
diff --git a/recipes-bsp/dfe-lld/dfe-lld_git.bb b/recipes-bsp/iqn2-lld/iqn2-lld_git.bb
similarity index 67%
copy from recipes-bsp/dfe-lld/dfe-lld_git.bb
copy to recipes-bsp/iqn2-lld/iqn2-lld_git.bb
index a2477ca..19ffc05 100644
--- a/recipes-bsp/dfe-lld/dfe-lld_git.bb
+++ b/recipes-bsp/iqn2-lld/iqn2-lld_git.bb
@@ -1,13 +1,14 @@
-DESCRIPTION = "Digital Radio Front End low level driver"
+DESCRIPTION = "TI IQN2 peripheral module low level driver"
 
 DEPENDS = "common-csl-ip"
 
-include dfe-lld.inc
+include iqn2-lld.inc
 
 EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
 
 do_compile () {
-	oe_runmake lib DEVICE=k2l
+	oe_runmake clean
+	oe_runmake lib
 }
 
 do_install () {
-- 
1.7.9.5


