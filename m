Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B40D4FF887E
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 15:09:28 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.36])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13765.1777475366242454813
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Apr 2026 08:09:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=Ctp3GrpQ;
 spf=pass (domain: ti.com, ip: 52.101.48.36, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i/cwnA9aQMhFDuZNea2BXZgBiKoA/moHBQZtty7wzoEERnvOg4QO5nxAPOL3MgPErogojORyAbbwBW+FvjuokPt2vMiObUvHU1gZ2a+CIRsAu+58ac6cgGDNW182d7ur10vvE58zdt4Q64Etw/vZDqM9EaDodZDVchZu8JXmei7oxibOR5rxMIjL3yQGaj5cXpN89uxWEotwYp7IzfnvEegJ9BE88OOvCK3ntV8+Dx/8lkKF9tGoYZdnuLfZP6bXkbG+htqlVUNAuA8jpYQA4h835pdR+eE5vl6WqiRzMdooKoEblBB6RH6xXb13R/2AE5mfn7pRV6tqJU2feH8JWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fu+/CEY30pSbMCjuOXlINCr3BcqV3m/Kon2+1eDLBhE=;
 b=G2xZl2wukkgb7aDIqiuKHYbVBhADuHi+iTsXRCrF4dr8tFDpiHsvLMZhXlhdzhWB7ST9uqLzqJxSpz6CCWNeCb/JXVnfbONXUpXWwlpjSi/nwM+Zxygcxp9XHf/ZlVQ2Hj3+B1ZTLDDIbTcyPXIF5U4nA84y7hlup6Yr9lWQhQhjFBRTOPVL3Jga6jdRvgcgtBaxMDH/KLdtJQxYKPa8VA3t2bm5w7yECiDT/tvS0hin1x+/XwFCw4+hLFO+Io4h4FE9JEDoR1xVXGoH011TTHey02SXSEcurq1wiwipmhZ9bg5d4R5rFIyb9BGnWqRpxX7oMUlTZ9yA+N47eC3d0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fu+/CEY30pSbMCjuOXlINCr3BcqV3m/Kon2+1eDLBhE=;
 b=Ctp3GrpQBVuTqwVRp9ga/GWOzTGgDqMokwcwaj159KkD/2s7pLNXCVgvZA+3Fm8Hc3EZmi9vlCO966TH4+hN6iR7mmtqDPA4n+BcHwAhoXorAs6ww+SUFAS4aIVoha7jtTNhoN1Mo2kJ4TOY1Z8pnaefFGVTG7ea4tMnU6Zk45M=
Received: from BY5PR04CA0022.namprd04.prod.outlook.com (2603:10b6:a03:1d0::32)
 by DS4PPFA1C1B9420.namprd10.prod.outlook.com (2603:10b6:f:fc00::d3c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Wed, 29 Apr
 2026 15:09:22 +0000
Received: from CO1PEPF00012E7E.namprd03.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::70) by BY5PR04CA0022.outlook.office365.com
 (2603:10b6:a03:1d0::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.29 via Frontend Transport; Wed,
 29 Apr 2026 15:09:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF00012E7E.mail.protection.outlook.com (10.167.249.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 15:09:21 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 10:09:20 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 10:09:20 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Apr 2026 10:09:20 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63TF9K5p3333899;
	Wed, 29 Apr 2026 10:09:20 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wI6XQ-000000046VA-1Sf9;
	Wed, 29 Apr 2026 10:09:20 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 04/12] meta-ti-test: Import the recipes-connectivity recipes
Date: Wed, 29 Apr 2026 10:09:12 -0500
Message-ID: <20260429150920.978263-4-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429150920.978263-1-reatmon@ti.com>
References: <20260429150920.978263-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E7E:EE_|DS4PPFA1C1B9420:EE_
X-MS-Office365-Filtering-Correlation-Id: c75e2bc9-5a91-4bbd-9236-08dea6014b44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|18002099003|22082099003|56012099003|12006099003;
X-Microsoft-Antispam-Message-Info: 
	stSLT1AWH4VDip1oFbXjgqD6frRF5Zpdiu7Fl8o2oPXpAEOyPRxnK5217nZafnQJgJj7nzNtG6ZctveErPKZWB+gORFV+CUTbWJZz/WFgXpT6YveiHHNId6VC+cTwqzN+3Yq9q1929yxYXTKNWe0jUUoOIyRKZ3ubOqumzK+7ZhJU5mEyrdTU2DquryytkuI+QCZdfHTtIAepZ5lzeQWhMzweRCNVt/mIFGf2eiHXj6kRteesW9E3nfQXVa9bz3txBnY1RXzR++pKN8cpaw4NVHeHPRjGHHzcjhlapYGM4QGCLaEfPJYP+74hg+IABwYVZqIKjb4r08IadH8rAgFU5nVDZchv7EAh3LDNbRSq/fS0DtWagGZwgXP+o9kobZfI/LcGbJKscHFaPPmS1wdBCaEo8+gqGaoCfX1zPxkobEFjx9KOgorwp0YtDDFA3D4BLb0rFcndaRCB9g4263XiunkygI1wPBzP2QrLDi7GgqzzIDWQrvbpcJ6BXYcU92/gNITWMRYHP1cSMuDkEwHfTWTxBBaOzZ/tGAwqgIZlCK8oKAsSN+EolZ9vFQpi/H61oY7myzs+VVGkrE+YsNWwUTLzZ8PGoaPjaPCx/rhYWIjqee9RmaJZlfgH6Z0NLTnUahnEHCbxUkxqYIOFz9kWkEt/pS/ryueCeHeX6KZxajmQZpe8G0TgG4pAKh2Cmzi4wDWSnWHhp0Dw9pEyr7Mrw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(18002099003)(22082099003)(56012099003)(12006099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	zgHNLiFoiqyDNcihc48eXMlVo/ZRuEwOiMu+z+3aJHABK5q4chYB1Rqq0V9XWMKTjXgOw10HSsUASuOMAp96BuzJMJfccOOfCTsdMYPRTt05L/nkFbe+tSN9Aj6WaA+MVbrEOPVnbbnvIbzrInc5svyj9cN6E/A0UpXBZSdLgAZH7c6xRY2uoMZMQ67T0NDk1HLN06e/essG8f0QrtLFk2jMt91RFKc1IlcIe5Ni3uNLJ8MMiS1mGMEBWI/vGUbK8SSe9yKgfpNFOHf0V4a55mZx//xYWNLqlqjx1YblUCuEnxVTx0Rz1hIS8roFR28ju791TSeWy1PDqlF4UvJ5YDAMBKaidQ5Ystd949f/O0txLCiha6XjJcT5PS1MYBDaiwJNfw7uBEvpR1FLr4mvF6H4w/6mr8MBS57vPzwcqggvovAuFb/iNMuBKspy9RS6
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 15:09:21.9755
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c75e2bc9-5a91-4bbd-9236-08dea6014b44
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF00012E7E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFA1C1B9420
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Apr 2026 15:09:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19881

We are moving the meta-arago-test layer to meta-ti-test.  This commit
imports all of the recipes under recipes-connectivity.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
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


