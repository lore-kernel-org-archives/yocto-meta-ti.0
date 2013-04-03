Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4C05CE01423
	for <meta-ti@yoctoproject.org>; Wed,  3 Apr 2013 09:56:10 -0700 (PDT)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r33Gu8Ch025690
	for <meta-ti@yoctoproject.org>; Wed, 3 Apr 2013 11:56:09 -0500
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r33Gu672028766
	for <meta-ti@yoctoproject.org>; Wed, 3 Apr 2013 22:26:07 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 3 Apr 2013 22:26:06 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r33Gu3IP024547;
	Wed, 3 Apr 2013 22:26:05 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 3 Apr 2013 11:56:00 -0500
Message-ID: <1365008161-14609-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 1/2] omap5-evm: Add DTB filter for building SDKs
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
X-List-Received-Date: Wed, 03 Apr 2013 16:56:10 -0000
Content-Type: text/plain

* Add a DTB_FILTER variable to only package the omap5 DTB files
  in the SDK.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 conf/machine/omap5-evm.conf |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/conf/machine/omap5-evm.conf b/conf/machine/omap5-evm.conf
index ba60e7c..80e6ee1 100644
--- a/conf/machine/omap5-evm.conf
+++ b/conf/machine/omap5-evm.conf
@@ -29,6 +29,8 @@ MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 3836"
 # UBI: VID header offset:          2048 (aligned 2048)
 UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512 -O 2048"
 
+DTB_FILTER = "omap5"
+
 UBOOT_MACHINE = "omap5_uevm_config"
 
 # Currently removing the sgx machine feature because there is no SGX package
-- 
1.7.0.4


