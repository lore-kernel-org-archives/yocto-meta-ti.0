Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70ED2F8D766
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 18:33:26 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.11])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22435.1776364398980038091
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 16 Apr 2026 11:33:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=Sa9cKLMl;
 spf=pass (domain: list.ti.com, ip: 52.101.52.11, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w6s9Mt/zxc8VMe/bLMzvA9WazgSt5oQrkHlYyHqtoAKkKHMqln5WVuSNKEDy5m9OVMwRRFQkRbafiG49saY2qlbVo8cNZmUKW/SMjkDQkeLHPs2lypM5+O3DT3AtJJb0hUu5hwBjJGV/1Vj3Fi1EFPcgXTB0dMI4jOQfPGh4y1drYG98Yz2k1p+1VYF2oMQLD8x49UcExNYKNy4h07hpCUQHi47ZJ554KmEU2RhFAqw300ZHh2tIlvHCcuKhr60k39ayDGZ81ua/en25U9WXuBkYtL9fZi+wxYXftViuUChvC8N7oSfO8MoCQ7be05d5aeWULyscRnwHGH13kdZ9bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7lCZPFs8oajHpjyWQ7H/Pm1VZ9iwCmjrSwPhxfaHu9c=;
 b=xVkn76xEmNelpa8X+tbARF9hFIHUctNWYSWeK0YqS5YtyTp8hyUfOJtZZNJcOWFfBxYih8vphNMojDeTSJHm7xvdQ+y2dPiaKVS3AE7JOgHPim+Y8gdPouBVMdoLQ8+EByEyl6/VZQMH0ohQ+eGkzCqLPDtIDA3IAfdUGV+JnHuV3e8wYvuSlDs7zRWEJUEeYLYVkqplcYPlCokX0BlwhXN5x6Z7RKOEUt95ilkCN5ZjMPpaxmPzghkk82n9rul37m/eTMpBhZJ6cnzdtAeIGGosFcX7EOPzrni6RF5lvLAfPqkWAs4Jp3FdtnTdZB/7iCI+hx/dLRLQJA/pBrlWsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7lCZPFs8oajHpjyWQ7H/Pm1VZ9iwCmjrSwPhxfaHu9c=;
 b=Sa9cKLMlHr68GqtDr7gG/W0wB+OrpRulr09y7nRvElIqZKKxWfXlWVIOz/FpY8WxNODVGxRDYC/EAmYxhUDGUMBfiBK8MIy8as4KjnFLD1eiXUPvJSzYM1MkG2HVZ0OSAQz4u5VRVEDOKooiED3O4Wg1omHEO4vc+S993yrWOEK59co+XJUk68dodNYoVT1wnc8bDA/jvDvkuE732HfHAHu/DNPm3oybdAw0BYAWClYHY45SEW1FVX8dDvE1nH6rLduCdloBe2OvIbjlW/UfFShKLmnNNQeEsXhTBZ1vAKm2kEadcP9jJeUadrFKPM0SsDPm1z76Qf5paUcbx1rjlg==
Received: from DM6PR06CA0085.namprd06.prod.outlook.com (2603:10b6:5:336::18)
 by CH3PR10MB6858.namprd10.prod.outlook.com (2603:10b6:610:152::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Thu, 16 Apr
 2026 18:33:16 +0000
Received: from DS2PEPF00003444.namprd04.prod.outlook.com
 (2603:10b6:5:336:cafe::9b) by DM6PR06CA0085.outlook.office365.com
 (2603:10b6:5:336::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.52 via Frontend Transport; Thu,
 16 Apr 2026 18:33:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS2PEPF00003444.mail.protection.outlook.com (10.167.17.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 16 Apr 2026 18:33:15 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 16 Apr
 2026 13:33:13 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 16 Apr
 2026 13:33:13 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 16 Apr 2026 13:33:13 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63GIXD9Y1556550;
	Thu, 16 Apr 2026 13:33:13 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 3F18F2A61; Thu, 16 Apr 2026 13:33:13 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202604160814
Date: Thu, 16 Apr 2026 13:33:13 -0500
Message-ID: <20260416183313.682787-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003444:EE_|CH3PR10MB6858:EE_
X-MS-Office365-Filtering-Correlation-Id: 1be808f2-82dc-4f6a-78c3-08de9be69fcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	URSKaxxHsYyW7TCx1/i8QJnBvP3YWLkQrKL+AMnbIpezjyFMxf+JYVkUu/r26W7m43uowXpOIbjwYoMPrXqO5NOoCeUmpnS8c/8TkRJ5Cz/ZODPI6r++Z0+3UoxQUmcRGJtBbwAI7HHh6qVbvVTl9CuTbJ4h34MVSq+1/IpeY8QkvsnQxn/GSBdMZUX2UYWpUMWcpQ3VM0BQT9wgUBHgilmcRq3CcJdk22KzQKH8Mk4AVhXBy5r6+AYQMI59psP7R4BMcIQZdhnzeqPI2zXPsCEPtdEUcjc8HIiqvVnPqd9hQn3xSbqTadALdYvwpbIlXwBEDDrehuyFZ0+YA1kVThHtgvOw4gaorpziPQ82mcmfyOzAxCvZOYdxNqSoqw5QtmLxAdHCqGcNmyIzR+QvI2MjM6kz2BWcjkQKnBwPI91USF9ZhkqwtoTVGznmWY3PrC6SEmniANlLWwVUBVe1bZJYGyTvLpSRwai/ZB43suPVKN16hn9WTGsy5GMtMyJYBrqA2iO+rsuiQNuU7uHlDLY+ow4XRF7vsSjvAtnYkRTv7KM9pF4z5C0ctefCsO5TGJT2XiPYzyVOzzckXfy+Dr/YWVBf96OCe9o/1rS5A7zy8LZEJWVCNdiJmCUdRGqZr9AU7aL2Z2N+rRqvvS2N3XfHQXBX/dRPV7h5p2363PIfEz3DElsKqs0uAkh5g8orxUZ7a7nIiWIAYWi713arC/riSckXeMh+Zfqjug+/Ks36zZqVReiIz9T2n03vwQmqql2CboCUNqWlistX4kK1ng==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	9XcXGlDifGwMJJqrBQl/0ieC1yGeDT9uG1z5n0dMpg3oiSMbLfcMFJm8M7go+LlsKRllafoe20HP/zAwYVluZ8A/cXtreavaU3HAt1k2yln+054f+FFklFVzc8WUOGjydYHsr5ePNhvDw1my6ViIzC2K7AwqJix2OzGrBtcPtY1fIaAWoRlIN0oqaMueEwuMVYxjaB30+yQLsKbUC9cHZWdTDS9q197EBWwZUPzq0txk7AP7z8XFtAv7j2l4uK/DpS6d4RNCagYexJtWxj2Ar9S5suoMMLBzMrhBHNiQ2hxLZYAZU7UVycYIhygDkH04y2jBnaTuzSxClfBrpHUaMUD6tfFhhlHH2qRRSKGCtw7pQ5PhM+R9kJYkOSYcIphuZHfXQrrbWY7lXXSbJ8ZRaFXZTzbNYmCCvuCZzDGLqSwtSNseozfpZLniJxx+6z6z
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 18:33:15.7910
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1be808f2-82dc-4f6a-78c3-08de9be69fcc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF00003444.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6858
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 16 Apr 2026 18:33:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19857

Updated the value(s) for:
  u-boot-ti-staging_2025.01: SRCREV_uboot
  linux-ti-staging-rt_6.12: SRCREV_ARM32
  linux-ti-staging_6.12: SRCREV

Changelogs:
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/lo=
g/?qt=3Drange&q=3D7b9dedb046eb6a720997f61582c7b13da1b5b9f0..19795f63be7ee27=
e38b6e800ff6c88a2feaae13f
  linux-ti-staging-rt_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linu=
x-kernel/log/?qt=3Drange&q=3Da3bc6dc973a99822f0707b1c9ba06b56bf142076..62fd=
c7890cde3197051743120ff44162b7356cc5
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-k=
ernel/log/?qt=3Drange&q=3Dda3c0f0a33ac00f7138c695a16d90301cf7ec02b..c52c558=
9aab8c376f975b1feb7b8746b7b6624bd

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb  | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/=
meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index f5d40a3e..0b49e559 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -6,4 +6,4 @@ PR =3D "r0"
=20
 BRANCH =3D "ti-u-boot-2025.01"
=20
-SRCREV_uboot =3D "7b9dedb046eb6a720997f61582c7b13da1b5b9f0"
+SRCREV_uboot =3D "19795f63be7ee27e38b6e800ff6c88a2feaae13f"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb b=
/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
index 5957194c..0d974c0b 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
@@ -10,7 +10,7 @@ BRANCH_ARM64 =3D "ti-linux-6.12.y"
 BRANCH =3D "${BRANCH_ARM64}"
=20
 BRANCH_ARM32 =3D "ti-rt-linux-6.12.y-arm32"
-SRCREV_ARM32 =3D "a3bc6dc973a99822f0707b1c9ba06b56bf142076"
+SRCREV_ARM32 =3D "62fdc7890cde3197051743120ff44162b7356cc5"
 PV_ARM32 =3D "6.12.57+git"
=20
 BRANCH:ti33x =3D "${BRANCH_ARM32}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/me=
ta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index 45db13fc..d0d76d74 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -22,7 +22,7 @@ S =3D "${WORKDIR}/git"
=20
 BRANCH ?=3D "ti-linux-6.12.y"
=20
-SRCREV ?=3D "da3c0f0a33ac00f7138c695a16d90301cf7ec02b"
+SRCREV ?=3D "c52c5589aab8c376f975b1feb7b8746b7b6624bd"
 PV =3D "6.12.57+git"
=20
 # Special configuration for remoteproc/rpmsg IPC modules
--=20
2.43.5


