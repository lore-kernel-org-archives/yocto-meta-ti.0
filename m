Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41DC1D68BD1
	for <webhook@archiver.kernel.org>; Fri, 15 Nov 2024 20:15:15 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.1259.1731701711179331982
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 15 Nov 2024 12:15:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=vgqDtpi5;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4AFKF9MQ3238509
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 15 Nov 2024 14:15:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1731701709;
	bh=Pm4n+E73ta349oWSuHrE3uBtYvE4N1dZXsS6XRxrgK0=;
	h=From:To:Subject:Date;
	b=vgqDtpi5qFFq98RdfiNHmnik96IbBV/33Ij51gzTc2q1M054p2U8Pk7GsNDV1s7rR
	 Da0313GLEZllskqLCK2QNL5/QGFpvGYAHuhchS37H8oIYnCePef7eOGEn4OyY7G142
	 YlptDRPSis33wd6fSIk6BWHMPv3khcVjHOW57fec=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4AFKF9D8044318
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 15 Nov 2024 14:15:09 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 15
 Nov 2024 14:15:09 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 15 Nov 2024 14:15:09 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4AFKF9ng093156;
	Fri, 15 Nov 2024 14:15:09 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tC2ij-0006AF-3f; Fri, 15 Nov 2024 14:15:09 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap/kirkstone][PATCH] SECURITY: Add file
Date: Fri, 15 Nov 2024 14:15:09 -0600
Message-ID: <20241115201509.23655-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 15 Nov 2024 20:15:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18070

Add a SECURITY file with hints for security researchers and other
parties who might report potential security vulnerabilities.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/SECURITY    | 21 +++++++++++++++++++++
 meta-ti-extras/SECURITY | 21 +++++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 meta-ti-bsp/SECURITY
 create mode 100644 meta-ti-extras/SECURITY

diff --git a/meta-ti-bsp/SECURITY b/meta-ti-bsp/SECURITY
new file mode 100644
index 00000000..784bb209
--- /dev/null
+++ b/meta-ti-bsp/SECURITY
@@ -0,0 +1,21 @@
+How to Report a Potential Vulnerability?
+========================================
+
+If you would like to report a public issue (for example, one with a released
+CVE number), please report it to the mailing list:
+
+  https://lists.yoctoproject.org/g/meta-ti
+
+If you are dealing with a not-yet released or urgent issue, please send a
+message to one of the maintainers listed in the README.  Include as many
+details as possible:
+  - the layer or software module affected
+  - the recipe and its version
+  - any example code, if available
+
+Branches maintained with security fixes
+---------------------------------------
+
+See https://wiki.yoctoproject.org/wiki/Releases for the list of current
+releases.  We only accept patches for the LTS releases and the master branch.
+
diff --git a/meta-ti-extras/SECURITY b/meta-ti-extras/SECURITY
new file mode 100644
index 00000000..784bb209
--- /dev/null
+++ b/meta-ti-extras/SECURITY
@@ -0,0 +1,21 @@
+How to Report a Potential Vulnerability?
+========================================
+
+If you would like to report a public issue (for example, one with a released
+CVE number), please report it to the mailing list:
+
+  https://lists.yoctoproject.org/g/meta-ti
+
+If you are dealing with a not-yet released or urgent issue, please send a
+message to one of the maintainers listed in the README.  Include as many
+details as possible:
+  - the layer or software module affected
+  - the recipe and its version
+  - any example code, if available
+
+Branches maintained with security fixes
+---------------------------------------
+
+See https://wiki.yoctoproject.org/wiki/Releases for the list of current
+releases.  We only accept patches for the LTS releases and the master branch.
+
-- 
2.17.1


