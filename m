Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0A47CF9C6F
	for <webhook@archiver.kernel.org>; Mon, 23 Sep 2024 14:59:54 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.38707.1727103590778710858
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 23 Sep 2024 07:59:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=pnWRXN0g;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 48NExmDJ123279;
	Mon, 23 Sep 2024 09:59:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1727103588;
	bh=N60Hjis6Zci1o0bGI1sRvfjFYROzR57GozrCHkrzbdg=;
	h=From:To:CC:Subject:Date;
	b=pnWRXN0gMhz5hkulfg30LtkpAFZoqOibhAntnPMTp53b3O9DUwf2hN8+Snl0EnmKs
	 bpIFADyhSfBM/XnomcoK92GutAdKpo+IbcJrGBVDN0VQbfaqfM4gTkpkNifn+hAXWL
	 DCuzYVCKJP0LunwYcvQJoREjIkAX7hKs5h4TJN3g=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 48NExmvv100293
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 23 Sep 2024 09:59:48 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 23
 Sep 2024 09:59:48 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 23 Sep 2024 09:59:48 -0500
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 48NExm9k102691;
	Mon, 23 Sep 2024 09:59:48 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master][PATCH] cmem: Remove CMEM userspace library
Date: Mon, 23 Sep 2024 09:59:47 -0500
Message-ID: <20240923145947.77326-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 23 Sep 2024 14:59:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17968

CMEM has been deprecated for removal for some time now. All users should
have migrated to the Linux upstream DMA-BUF Heaps framework. Remove CMEM.

We have already removed the CMEM kernel module but left the CMEM userspace
recipe to prevent breaking meta-arago builds which had some leftover
packages that still had a dependency on it. Nothing we now build still
needs this now so drop it out also.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/recipes-bsp/cmem/cmem.inc    | 16 ----------------
 meta-ti-bsp/recipes-bsp/cmem/cmem_git.bb | 11 -----------
 2 files changed, 27 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-bsp/cmem/cmem.inc
 delete mode 100644 meta-ti-bsp/recipes-bsp/cmem/cmem_git.bb

diff --git a/meta-ti-bsp/recipes-bsp/cmem/cmem.inc b/meta-ti-bsp/recipes-bsp/cmem/cmem.inc
deleted file mode 100644
index e8dbbe8f..00000000
--- a/meta-ti-bsp/recipes-bsp/cmem/cmem.inc
+++ /dev/null
@@ -1,16 +0,0 @@
-HOMEPAGE = "http://processors.wiki.ti.com/index.php/Category:CMEM"
-
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://include/ti/cmem.h;beginline=1;endline=30;md5=26be509e4bb413905bda8309e338e2b1"
-
-BRANCH = "master"
-# This corresponds to version 4.20.00.01
-SRCREV = "86269258a48e0a9008dd9d5ebfae9da7ce843393"
-
-PV = "4.20.00.01+git"
-
-SRC_URI = "git://git.ti.com/git/ipc/ludev.git;protocol=https;branch=${BRANCH}"
-
-S = "${WORKDIR}/git"
-COMPATIBLE_HOST ?= "null"
-COMPATIBLE_HOST:ti-soc = "(.*)"
diff --git a/meta-ti-bsp/recipes-bsp/cmem/cmem_git.bb b/meta-ti-bsp/recipes-bsp/cmem/cmem_git.bb
deleted file mode 100644
index 2042b08a..00000000
--- a/meta-ti-bsp/recipes-bsp/cmem/cmem_git.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-DESCRIPTION = "The cmem component supports contiguous memory allocation from userspace"
-
-include cmem.inc
-
-PR = "r0"
-
-PACKAGES =+ "${PN}-test"
-
-FILES:${PN}-test = "${bindir}/*"
-
-inherit autotools
-- 
2.39.2


