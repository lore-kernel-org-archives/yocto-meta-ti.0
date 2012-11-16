Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E1C8EE006B3
	for <meta-ti@yoctoproject.org>; Fri, 16 Nov 2012 08:54:02 -0800 (PST)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id qAGGs0rU008000
	for <meta-ti@yoctoproject.org>; Fri, 16 Nov 2012 10:54:01 -0600
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id qAGGrx7A012114
	for <meta-ti@yoctoproject.org>; Fri, 16 Nov 2012 22:24:00 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 16 Nov 2012 22:23:59 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id qAGGrvHI032479;
	Fri, 16 Nov 2012 22:23:58 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 16 Nov 2012 10:53:55 -0600
Message-ID: <1353084835-13700-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] am335x-evm: Increase UBI max size to 500MB
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
X-List-Received-Date: Fri, 16 Nov 2012 16:54:03 -0000
Content-Type: text/plain

* Based on the EVM and beaglebone + NAND memory cape we can
  increase the base file system size to 500MB since by default
  there is about 504MB of space allocated to the file system
  partition in the NAND.
* The max size in LEBs was determined using the formula at
  http://processors.wiki.ti.com/index.php/UBIFS_Support

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 conf/machine/am335x-evm.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/am335x-evm.conf b/conf/machine/am335x-evm.conf
index e86c41b..69e5e78 100644
--- a/conf/machine/am335x-evm.conf
+++ b/conf/machine/am335x-evm.conf
@@ -29,7 +29,7 @@ PREFERRED_PROVIDER_virtual/kernel = "linux-ti33x-psp"
 # UBI: logical eraseblock size:    126976 bytes
 # from ubiattach stdout:
 # UBI device number 0, total 1988 LEBs
-MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 1988"
+MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 3836"
 
 # do ubiattach /dev/ubi_ctrl -m 7 -O 2048
 # from dmesg:
-- 
1.7.0.4


