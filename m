Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62BD6C77B7A
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 17:24:18 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.1565.1685726653492832572
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 02 Jun 2023 10:24:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=SP7uj5/2;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 352HOCGM050785;
	Fri, 2 Jun 2023 12:24:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685726652;
	bh=TbXpKQ3ji6vhh4grjjNjgqhmYF3vFdrqV9xbkwhBi48=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=SP7uj5/2SljcNFWLxyhqz46XxukWAsmNWqVlPC7+lzGhmww4FaSuZWwV9/H30F1cU
	 rmv7643KEJe9XaeGE8yEJWnnbZIlxT/gAzvamh5Qdgg3Q07mGbOQFqDVCB9lWKEXvB
	 rLb6VCkW4PxB0eHHeqZhD50cKEVlEln0u9PBhItE=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 352HOCJQ027237
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 Jun 2023 12:24:12 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 Jun 2023 12:24:12 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 Jun 2023 12:24:11 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 352HOB6A111134;
	Fri, 2 Jun 2023 12:24:11 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1q58VX-00058u-Q5; Fri, 02 Jun 2023 12:24:11 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][kirkstone][PATCH 2/2] Revert "linux-ti-*: Use vendored kernel-devicetree.bbclass"
Date: Fri, 2 Jun 2023 12:24:11 -0500
Message-ID: <20230602172411.19726-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230602172411.19726-1-reatmon@ti.com>
References: <20230602172411.19726-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 02 Jun 2023 17:24:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16660

This reverts commit a4f0f492f14059171ba515944bd9be3caf97c1d2.

The file was updated in upstream oe-core for kirkstone.  This commit is
no longer needed.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb     | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
index 74a4a860..dfa46f48 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
@@ -3,7 +3,7 @@ SUMMARY = "Mainline Linux kernel for TI devices"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
-inherit kernel_vendor_dtb
+inherit kernel
 
 require recipes-kernel/linux/kernel-rdepends.inc
 require recipes-kernel/linux/ti-kernel.inc
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
index e1e1eb5e..9138c7c5 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-next_git.bb
@@ -3,7 +3,7 @@ SUMMARY = "Linux-next kernel for TI devices"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
-inherit kernel_vendor_dtb
+inherit kernel
 
 require recipes-kernel/linux/ti-kernel.inc
 
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
index 3d0ec289..8a12984a 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
@@ -3,7 +3,7 @@ SUMMARY = "Linux kernel for TI devices"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
-inherit kernel_vendor_dtb
+inherit kernel
 
 require recipes-kernel/linux/setup-defconfig.inc
 require recipes-kernel/linux/kernel-rdepends.inc
-- 
2.17.1


