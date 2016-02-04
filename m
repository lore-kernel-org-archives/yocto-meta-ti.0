Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E12A0E00C56; Thu,  4 Feb 2016 09:20:55 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 86BABE00A9C
	for <meta-ti@yoctoproject.org>; Thu,  4 Feb 2016 09:20:48 -0800 (PST)
Received: from gandalf.denix.org ([100.15.86.14]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPSA id <0O21002389HTKJ20@vms173017.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 04 Feb 2016 11:20:33 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=xDJgBcBrK5EN9DJ6g74wNQ==:117
	a=jFJIQSaiL_oA:10 a=sozttTNsAAAA:8	a=s41lqccTdG-oX_K6kMMA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 5608A161E69;	Thu,
	4 Feb 2016 12:20:17 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Thu, 04 Feb 2016 12:20:16 -0500
Message-id: <1454606416-24551-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] netapi: disable debian naming for consistency
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
X-List-Received-Date: Thu, 04 Feb 2016 17:20:56 -0000

From: Denys Dmytriyenko <denys@ti.com>

Libraries have SOC in the name, but some machines (k2hk) build multiple variants.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-ti/netapi/netapi.inc | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/recipes-ti/netapi/netapi.inc b/recipes-ti/netapi/netapi.inc
index 0e7b04b..d710a22 100644
--- a/recipes-ti/netapi/netapi.inc
+++ b/recipes-ti/netapi/netapi.inc
@@ -4,13 +4,18 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/git/COPYING.txt;md5=f2b4f162358b1ffaf3f230
 COMPATIBLE_MACHINE = "keystone"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+DEBIAN_NOAUTONAME_${PN} = "1"
+DEBIAN_NOAUTONAME_${PN}-dev = "1"
+DEBIAN_NOAUTONAME_${PN}-dbg = "1"
+DEBIAN_NOAUTONAME_${PN}-staticdev = "1"
+
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/keystone-rtos/netapi.git;protocol=git;branch=${BRANCH}"
 
 # Below Commit ID corresponds to "DEV.NETAPI.01.01.00.06"
 SRCREV = "8180b61615965954eaaedc26053f9a8939d9a273"
 PV = "01.01.00.06"
-INC_PR = "r3"
+INC_PR = "r4"
 
 DEVICELIST_k2hk-evm = "k2h k2k"
 DEVICELIST_k2l-evm  = "k2l"
-- 
2.2.0


