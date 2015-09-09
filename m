Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C1016E00D80; Wed,  9 Sep 2015 12:55:14 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 696D0E00B56
	for <meta-ti@yoctoproject.org>; Wed,  9 Sep 2015 12:55:09 -0700 (PDT)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NUF00344DZBD330@vms173017.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 09 Sep 2015 14:54:52 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=ff-B7xzCdYMA:10 a=sozttTNsAAAA:8
	a=bfhwXOY0L3v3LC2x3doA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 5ED20161BE4;	Wed,
	9 Sep 2015 15:54:47 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Wed, 09 Sep 2015 15:54:47 -0400
Message-id: <1441828487-18686-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] vpe-tests: resolve conflict with vpdma-fw
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
X-List-Received-Date: Wed, 09 Sep 2015 19:55:14 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/vpe-tests/vpe-tests_git.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/vpe-tests/vpe-tests_git.bb b/recipes-bsp/vpe-tests/vpe-tests_git.bb
index 776bda5..951544b 100644
--- a/recipes-bsp/vpe-tests/vpe-tests_git.bb
+++ b/recipes-bsp/vpe-tests/vpe-tests_git.bb
@@ -3,9 +3,9 @@ DESCRIPTION = "VPE test program"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=74d2f71d8898c54e3d1c9d0058c484aa"
 
-DEPENDS = "virtual/kernel"
+DEPENDS = "virtual/kernel vpdma-fw"
 
-PR = "r2"
+PR = "r3"
 
 COMPATIBLE_MACHINE = "dra7xx"
 
@@ -25,4 +25,6 @@ EXTRA_OEMAKE = 'CROSS_COMPILE="${TARGET_PREFIX}" CC="${TARGET_PREFIX}gcc ${FLOAT
 
 do_install() {
     oe_runmake DESTDIR="${D}" install
+    rm -rf ${D}${base_libdir}/firmware/vpdma-*.bin
+    rmdir -p ${D}${base_libdir}/firmware || true
 }
-- 
2.2.0


