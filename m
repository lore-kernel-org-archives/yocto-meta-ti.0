Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AB22CCFA13
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 15:23:13 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13921.1777476184398395197
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Apr 2026 08:23:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=ETn1sbcj;
 spf=pass (domain: ti.com, ip: 40.93.195.41, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a0nrxGRFxbtr3S1iio9/Emg/uQpd5H64iA4xLp6kc5Ohu1dZAv15+Hvaac9uKfGqb1C95zXTFgsSfxXrSxLuYymRLB1b/gDk8kbheLuVmWM/RWoXtomLRyaAKt0pFke1xv8E301sTIyzGw2oc3ylygVQgHCob1eC2+NsgklKD1nRgd6cB1UuULYgmmAbDW6nLerbb/S/at4wqNn7rJzHVqO/nEZL66l20J0+ROdJ36bV4Fa9JNSm24rM+L8ysfmzHEW6qWfbjz1EUbRdiz7nfGulX+gZ6wMqo/ShCd2tlW0i0yM4OHRaQ8OgYrZVgFz6JCvxoRVZiJVTme5d34JMJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uQh2hR4j8ICkJqJS1hwwJF3VG7CRo134z9VxvbJzzgQ=;
 b=Sa0M2Vww7ptrx7bfJ49IhYX43quxlZD3KuZG5qBz4AnWH1tPTAkfC55EzuAGRM9Xm9cpZ4c3CJ/pa5VEjqZ7iLMU9gZZ3iXhGGuUqDYX2hacj9t8Eas0O3pQyi09xLFUqzKFIX1Af6s8Giy/dx+l2jtCtkriwIm2dAnbwehW8l/u2AHpbrl/gV2mIgQIYKk01RwlUmhBtRH5SyVtgYQuOsIezEMBHFMUwDgqKtTMW9LJ0EI2TQMpB+VzshLP/zRCkt7HEjOsSaLgk/bgPSIhEhyi1RtXxqWCUbkAPTPR9LAnXkDBHcUYkS9nkeHbfkuZ2KsmjKlCgCC1gLm/orvLTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uQh2hR4j8ICkJqJS1hwwJF3VG7CRo134z9VxvbJzzgQ=;
 b=ETn1sbcjVr/9dzcfUVTeQ4sADN5WXGwB0HC8ObSbDZqzGN/LksHp5sfjZWpbax4ntNm6bm6GEkc94P0gQY4+AwX+/HddO7H0AtwBStgeK7lk5WX+B34pYMGznc3/PP2qbwaaEu9ZXdCdxtXFPUwMg9UnbVgnjRU75GIYvBaeCfc=
Received: from SJ0PR13CA0211.namprd13.prod.outlook.com (2603:10b6:a03:2c1::6)
 by MN2PR10MB4206.namprd10.prod.outlook.com (2603:10b6:208:1df::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.19; Wed, 29 Apr
 2026 15:23:02 +0000
Received: from SJ5PEPF00000204.namprd05.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::72) by SJ0PR13CA0211.outlook.office365.com
 (2603:10b6:a03:2c1::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.16 via Frontend Transport; Wed,
 29 Apr 2026 15:23:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF00000204.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 15:23:01 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 10:23:00 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 10:23:00 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Apr 2026 10:23:00 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63TFN0VZ3353816;
	Wed, 29 Apr 2026 10:23:00 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wI6ke-000000046s4-2PCU;
	Wed, 29 Apr 2026 10:23:00 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v2 04/12] meta-ti-test: Import the recipes-connectivity recipes
Date: Wed, 29 Apr 2026 10:22:52 -0500
Message-ID: <20260429152300.979685-4-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429152300.979685-1-reatmon@ti.com>
References: <20260429152300.979685-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000204:EE_|MN2PR10MB4206:EE_
X-MS-Office365-Filtering-Correlation-Id: af56036b-ec48-445e-1de8-08dea60333a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|22082099003|12006099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	OyhjoOE/Sit9LhFPie44/pwFj5jmEfZHrotFMxDLwdahS8bdsbF8U0eEaEiZd3W9L1CYF756pXzRkqKcVAFgdg05kKZcLXA+IlTDUnFG/M1MtDSb9Nmc/ekYSjaXvgCv+gsX4oOLY0bhbrLTgj9gI4pWCNeT3BJykB3ZiyJTbNcOFiINBDCuQq62JeTXXh3Ep6mFeWThBNAdMcmFbU9K+Rb56ZleMjaoGptg+ZlLhEuC8tzf68qPnl9XEnkmMsTfO0ouHk8eflOhPW8E1m2jPwH5q+wLjs8mTNStejgPvAerNd/xK+bH7FTYCvj10Q7vpBm3vmO8zPpk2k5y/cBg1YR/y/r0zMHBrTWV6uvF8I5sn0eiE9qFRhMkMMzPWXJ2IAkIE5n9XtBGXCV5ccQ8fz5pj3X2dWVKAtNXGFlUz7jI7XWl3CdgUGCx/WHVC1bTGiiHSa1D3Z4Jo/0XGcx6Zf5y67KavPbAo7EX7NH1Sm4jhFCf71JrUStwFKtj7vKsJnf9+P9kTsPIv1RnZBjgj4NalXxQ/9v3MyhcVTfkieLG3kohI8FzCm6h+2D7uNRcSb506f1gM5IhMQ+bsoz+oHpHh8dkeLM8bTIB+0hWJ5c33Og67JTau6fs2JpteedtXaWJh7Tt3SSxBemmw0pYtc+yw54Uw2ZAuyRYOxmmmlWI+ItgK9ZY8tRWhoQZcR5ACmQlZbe/sGnTPGCw5gXBgA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(22082099003)(12006099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	UOjoP1RH52WHz4kdX6PYa4zxAH1i6O6xk9Jm5tnwGcNRwv69chYXcK1UKlJZafvP10CZ2F5482RDuZ35bGPAM0pdgiQzShORhtfRW2cry3lC+bWWSTzwx0wvR59cRkfpzzuERm63uq9gFygA/hKfCP6MxQ0CpwKRMr8FOTB/ztNnerEsWI54Ug2HLysOuBNMKrFL6/Gh0PK4yImbGbBEXtb2dH/Tu4OlU/+ydwZwNmBTd++41MYPa1TZes/RtnmAiHrtOH1UgAKkbez2sNaKF78C/0uCqmKyidP9VfKqcheg2O3NOElVvYFJxbjnqjYVCgLDlC2NTDt/eG5RleezThTP57C4GtYHnxQrINgY6ru23Aa2uPDMFVu8i9uQRdbRObwhWNu/z3wRvnZtEzMSpOERSmddNTZqCKI11deDXb04/uoCzcR+R+/MS9uFZNuj
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 15:23:01.3171
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af56036b-ec48-445e-1de8-08dea60333a1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF00000204.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4206
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Apr 2026 15:23:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19892

We are moving the meta-arago-test layer to meta-ti-test.  This commit
imports all of the recipes under recipes-connectivity.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: No changes.

 .../openntpd/openntpd_6.8p1.bb                | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-ti-test/recipes-connectivity/openntpd/openntpd_6.8=
p1.bb

diff --git a/meta-ti-test/recipes-connectivity/openntpd/openntpd_6.8p1.bb b=
/meta-ti-test/recipes-connectivity/openntpd/openntpd_6.8p1.bb
new file mode 100644
index 00000000..6a3c64d1
--- /dev/null
+++ b/meta-ti-test/recipes-connectivity/openntpd/openntpd_6.8p1.bb
@@ -0,0 +1,24 @@
+SUMMARY =3D "OpenNTPD is an implementation of the Network Time Protocol."
+DESCRIPTION =3D "OpenNTPD is a FREE, easy to use implementation of the Net=
work Time Protocol."
+HOMEPAGE =3D "http://www.openntpd.org/"
+SECTION =3D "console/network"
+LICENSE =3D "BSD-3-Clause & ISC"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfe922aad2b6ad1c359cf2adfdaaab1b=
6"
+
+PR =3D "r0"
+
+SRC_URI =3D "https://cdn.openbsd.org/pub/OpenBSD/OpenNTPD/${P}.tar.gz"
+SRC_URI[md5sum] =3D "7c68ce2627b2ea13f2b95db1ef4fcfc5"
+SRC_URI[sha256sum] =3D "8582db838a399153d4a17f2a76518b638cc3020f58028575bf=
54127518f55a46"
+
+inherit autotools
+
+LDFLAGS +=3D "-lrt"
+EXTRA_OECONF +=3D "LDFLAGS=3D"${LDFLAGS}" CFLAGS=3D"${CFLAGS}"\
+                 --with-privsep-user=3Droot"
+
+do_install:append() {
+    # don't install empty /var/run and /run to avoid conflict with base-fi=
les
+    rm -rf ${D}${localstatedir}/run
+    rm -rf ${D}/run
+}
--=20
2.43.0


