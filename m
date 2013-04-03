Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BAE07E01423
	for <meta-ti@yoctoproject.org>; Wed,  3 Apr 2013 09:56:10 -0700 (PDT)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r33Gu8dm031065
	for <meta-ti@yoctoproject.org>; Wed, 3 Apr 2013 11:56:09 -0500
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r33Gu831028771
	for <meta-ti@yoctoproject.org>; Wed, 3 Apr 2013 22:26:08 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 3 Apr 2013 22:26:07 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r33Gu3IQ024547;
	Wed, 3 Apr 2013 22:26:06 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 3 Apr 2013 11:56:01 -0500
Message-ID: <1365008161-14609-2-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1365008161-14609-1-git-send-email-Chase.Maupin@ti.com>
References: <1365008161-14609-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] ti33x: Add DTB filter for building SDKs
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

* Add a DTB_FILTER variable to only package the am335x DTB files
  in the SDK.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 conf/machine/include/ti33x.inc |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
index e8aa2ba..50844d1 100644
--- a/conf/machine/include/ti33x.inc
+++ b/conf/machine/include/ti33x.inc
@@ -25,6 +25,8 @@ PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
 
 KERNEL_IMAGETYPE = "uImage"
 
+DTB_FILTER = "am335x"
+
 UBOOT_ARCH = "arm"
 UBOOT_MACHINE = "am335x_evm_config"
 
-- 
1.7.0.4


