Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0204E7718E
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 21:54:06 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.139713.1734645245150942458
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Dec 2024 13:54:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=yqeasijf;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BJLs4b0377443
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Dec 2024 15:54:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734645244;
	bh=foblp9nEKSJytNHEQAHmG/+2CLT9zRzdkbBrMP3bytE=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=yqeasijfoFmFrYcP/Ek+bduxZOakXCDtAZtr8E3uQGBx5iwuwZtD1zY7DLXEM30VE
	 d59K0u023Ex8Q2H0e7sVL7igmTkzswsql7IsBcjwNWshyBg4TlMxI+fJQCW5FEDObU
	 ftwx7moRDgQudwyUoFYDgkL70kNhaQiacd7mmE0M=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BJLs4sl071299
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 19 Dec 2024 15:54:04 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 19
 Dec 2024 15:54:04 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 19 Dec 2024 15:54:03 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BJLs4bQ066833;
	Thu, 19 Dec 2024 15:54:04 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tOOT5-0007df-Sj; Thu, 19 Dec 2024 15:54:03 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH 12/13] linux-bb.org_6.6: disable FORTIFY_SOURCE for now
Date: Thu, 19 Dec 2024 15:54:01 -0600
Message-ID: <20241219215402.28324-13-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241219215402.28324-1-reatmon@ti.com>
References: <20241219215402.28324-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Dec 2024 21:54:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18156

From: Denys Dmytriyenko <denys@konsulko.com>

Rogue graphics driver 24.1 currently fails to build against the kernel
that enables FORTIFY_SOURCE, such as bb.org. Disable this config for now,
until the driver is fixed.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-kernel/linux/linux-bb.org-6.6/no-fortify.cfg       | 1 +
 meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb           | 3 +++
 2 files changed, 4 insertions(+)
 create mode 100644 meta-beagle/recipes-kernel/linux/linux-bb.org-6.6/no-fortify.cfg

diff --git a/meta-beagle/recipes-kernel/linux/linux-bb.org-6.6/no-fortify.cfg b/meta-beagle/recipes-kernel/linux/linux-bb.org-6.6/no-fortify.cfg
new file mode 100644
index 00000000..808f9519
--- /dev/null
+++ b/meta-beagle/recipes-kernel/linux/linux-bb.org-6.6/no-fortify.cfg
@@ -0,0 +1 @@
+CONFIG_FORTIFY_SOURCE=n
diff --git a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb b/meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb
index bf8f8a24..056142d9 100644
--- a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb
+++ b/meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb
@@ -66,3 +66,6 @@ PV:aarch64 = "6.6.58+git"
 BRANCH:aarch64 = "v6.6.58-ti-arm64-r16"
 
 KERNEL_GIT_URI = "git://github.com/beagleboard/linux.git"
+
+SRC_URI += "file://no-fortify.cfg"
+KERNEL_CONFIG_FRAGMENTS += "${WORKDIR}/no-fortify.cfg"
-- 
2.17.1


