Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4E2D3E00BB1; Fri, 13 Jun 2014 09:55:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.25 listed in list.dnswl.org]
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F04ABE0073D
	for <meta-ti@yoctoproject.org>; Fri, 13 Jun 2014 09:55:40 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N7400K4Y9O15G41@vms173025.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 13 Jun 2014 11:55:13 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 1502D2009B; Fri,
	13 Jun 2014 12:55:13 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri, 13 Jun 2014 12:55:12 -0400
Message-id: <1402678512-31160-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.0
Subject: [PATCH] am180x-evm: don't request ubi FS w/o setting MKUBIFS and UBINIZE vars
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
X-List-Received-Date: Fri, 13 Jun 2014 16:55:50 -0000

From: Denys Dmytriyenko <denys@ti.com>

It was ignored previously, but now it breaks the build.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/am180x-evm.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/machine/am180x-evm.conf b/conf/machine/am180x-evm.conf
index cff1565..44ca0c6 100644
--- a/conf/machine/am180x-evm.conf
+++ b/conf/machine/am180x-evm.conf
@@ -9,7 +9,7 @@ UBOOT_MACHINE = "da850evm_config"
 UBOOT_ENTRYPOINT = "0xc0008000"
 UBOOT_LOADADDRESS = "0xc0008000"
 
-IMAGE_FSTYPES += "tar.gz ubi"
+IMAGE_FSTYPES += "tar.gz"
 
 SERIAL_CONSOLE = "115200 ttyS2"
 
-- 
2.0.0


