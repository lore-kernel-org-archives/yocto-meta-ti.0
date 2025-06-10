Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B3C2C61DB2
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 21:08:46 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.155.1749589718090892932
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 10 Jun 2025 14:08:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ZMc7C7Vl;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55AL8bs01175055;
	Tue, 10 Jun 2025 16:08:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749589717;
	bh=OHZtMG8oVV7KHM8V0hGyn1l3NxZNW5PgX7D/sMUToMk=;
	h=From:To:Subject:Date;
	b=ZMc7C7VlG5xI5wF64uJgvcqOXA7RrpQIDOF+i7EtR44lNlTN12qyy7k/HcbaAdBuW
	 e7xPS3YPFh3LGzoMnNj+cE9aHqBIE/YWS6x5xbRCX1K2qYo/NkfZgdrhWHG/QGqgux
	 OhfxaUztjnoRAqYYxvC5/1mZKyJV/3ktSbX62JZQ=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55AL8bSU1199583
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 10 Jun 2025 16:08:37 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 10
 Jun 2025 16:08:36 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 10 Jun 2025 16:08:36 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55AL8a3Y3476342;
	Tue, 10 Jun 2025 16:08:36 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uP6Cy-0004Pg-Nz; Tue, 10 Jun 2025 16:08:36 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] meta-beagle: linux: Add INSANE_SKIP debug-deps
Date: Tue, 10 Jun 2025 16:08:36 -0500
Message-ID: <20250610210836.16917-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 10 Jun 2025 21:08:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18641

We are seeing an error related to a check from oe-core wanting to make
sure that a package does not RDEPEND on a debug package.

ERROR: linux-bb.org-6.12.22+git-r0 do_package_qa: QA Issue: kernel-modules rdepends on kernel-module-g-dbgp-6.12.22-ti [debug-deps]

A bug has been filed:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=15901

In the meantime, add debug-deps to the INSANE_SKIP list.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-beagle/recipes-kernel/linux/linux-bb.org_6.1.bb  | 2 ++
 meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb | 2 ++
 meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb  | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.1.bb b/meta-beagle/recipes-kernel/linux/linux-bb.org_6.1.bb
index ceb9787e..805c3a84 100644
--- a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.1.bb
+++ b/meta-beagle/recipes-kernel/linux/linux-bb.org_6.1.bb
@@ -66,3 +66,5 @@ PV:aarch64 = "6.1.83+git"
 BRANCH:aarch64 = "v6.1.83-ti-arm64-r64"
 
 KERNEL_GIT_URI = "git://github.com/beagleboard/linux.git"
+
+INSANE_SKIP:kernel-modules += "debug-deps"
diff --git a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb b/meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb
index 57f7d983..e3521505 100644
--- a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb
+++ b/meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb
@@ -66,3 +66,5 @@ PV:aarch64 = "6.12.22+git"
 BRANCH:aarch64 = "v6.12.22-ti-arm64-r35"
 
 KERNEL_GIT_URI = "git://github.com/beagleboard/linux.git"
+
+INSANE_SKIP:kernel-modules += "debug-deps"
diff --git a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb b/meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb
index d6a4ae96..c6dcdfd2 100644
--- a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb
+++ b/meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb
@@ -69,3 +69,5 @@ KERNEL_GIT_URI = "git://github.com/beagleboard/linux.git"
 
 SRC_URI += "file://no-fortify.cfg"
 KERNEL_CONFIG_FRAGMENTS += "${UNPACKDIR}/no-fortify.cfg"
+
+INSANE_SKIP:kernel-modules += "debug-deps"
-- 
2.17.1


