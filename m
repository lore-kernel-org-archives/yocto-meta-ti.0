Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2B05EE006DB; Wed, 23 Jul 2014 13:39:57 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [206.46.173.17 listed in list.dnswl.org]
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 16B32E006B7
	for <meta-ti@yoctoproject.org>; Wed, 23 Jul 2014 13:39:52 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N9600E86MPLMHC0@vms173017.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 23 Jul 2014 15:39:37 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 7A2FB2001F; Wed,
	23 Jul 2014 16:39:21 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Wed, 23 Jul 2014 16:39:19 -0400
Message-id: <1406147959-31875-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.2
Subject: [PATCH v2] u-boot: update to 2014.07 release version
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
X-List-Received-Date: Wed, 23 Jul 2014 20:39:57 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - also drop comment about RC version

 recipes-bsp/u-boot/u-boot_2014.07.bb | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot_2014.07.bb b/recipes-bsp/u-boot/u-boot_2014.07.bb
index 9da6f7d..91406f9 100644
--- a/recipes-bsp/u-boot/u-boot_2014.07.bb
+++ b/recipes-bsp/u-boot/u-boot_2014.07.bb
@@ -11,17 +11,14 @@ DEFAULT_PREFERENCE = "-1"
 
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=025bf9f768cbcb1a165dbe1a110babfb"
 
-# This is still an RC so set the PV accordingly to allow proper version
-# ordering when the RC is dropped.
-PV = "2014.04+2014.07-rc3"
-PR = "r0"
+PV = "2014.07"
 
 SRC_URI = "git://git.denx.de/u-boot.git;protocol=git;branch=${BRANCH}"
 
 BRANCH ?= "master"
 
-# Corresponds to tag v2014.07-rc3
-SRCREV = "76b21026ceb5a6a83fc53b0ecdf425f240318022"
+# Corresponds to tag v2014.07
+SRCREV = "524123a70761110c5cf3ccc5f52f6d4da071b959"
 
 SPL_BINARY = "MLO"
 SPL_UART_BINARY = "u-boot-spl.bin"
-- 
2.0.2


