Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AB9CCE00509; Wed, 25 Jun 2014 09:11:10 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [206.46.173.23 listed in list.dnswl.org]
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 854FFE003D8
	for <meta-ti@yoctoproject.org>; Wed, 25 Jun 2014 09:11:07 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N7Q00HEFFLLCCG0@vms173023.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 25 Jun 2014 11:10:33 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 0910620091; Wed,
	25 Jun 2014 12:10:33 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Wed, 25 Jun 2014 12:10:32 -0400
Message-id: <1403712632-26072-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.0
Subject: [PATCH] u-boot: disable SPL/MLO processing for omapl138 SOCs
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
X-List-Received-Date: Wed, 25 Jun 2014 16:11:10 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/u-boot/u-boot_2014.07.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-bsp/u-boot/u-boot_2014.07.bb b/recipes-bsp/u-boot/u-boot_2014.07.bb
index b326aa1..9da6f7d 100644
--- a/recipes-bsp/u-boot/u-boot_2014.07.bb
+++ b/recipes-bsp/u-boot/u-boot_2014.07.bb
@@ -25,3 +25,6 @@ SRCREV = "76b21026ceb5a6a83fc53b0ecdf425f240318022"
 
 SPL_BINARY = "MLO"
 SPL_UART_BINARY = "u-boot-spl.bin"
+
+SPL_BINARY_omapl138 = ""
+SPL_UART_BINARY_omapl138 = ""
-- 
2.0.0


