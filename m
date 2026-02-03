Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A2CBE87858
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 18:58:00 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1241.1770145076886273259
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 03 Feb 2026 10:57:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=n8vlgmRH;
 spf=pass (domain: list.ti.com, ip: 52.101.85.53, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ER7EM1v4EjIaZNnZ6ZIFLGhlu40+yNUnIijTqU63Dwzq61oxiHakzj58D5i90cMyQQdrruaAAQEDyqvru6TVj/Dn4Fzr8ybzAy5o3u/wENQzZTmKvD1bDh66x6qwxAVrSCzOy7V544Lt59mltKCu8ENeWWw/eoyuIYk5HYsw32v+LY1POquDL80xgjpijoE9KJ2k1IZuGezNu6r8sT1YaE0ODGGsMlvvc8dc8Szr7AFnvD4gG+tJWI98fBZu4aOu3X3V5muvnzRGmCoy24f4TkgJrrAyFOP9Al/hyB632TOJELsmLDCHQe+f2EVhAmrPnr35R1GhI7RGcLtWMPJl4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0HSS2VMUTY2fLPnrBr/6O+3DH81HGZsYCQP8YxfTc78=;
 b=GfJeB/4Dd+bAPUBNtCGaL/+flFmXlJtilKDkTLFNnyjkDCo1qj0oUGrRaBZ15DlmZ1uldDj5/AD797dBSF7jnosP+uwYWVHkkrByZwayXwB7QCJn6TWEZLhROPncf5OuZ06SkhL8DmIEVKRadUQ14E5yNamDvI6DXJXHSiVwOl3ELOfW8Kc0aH3RrmWGC7oUui4llzhmDkKZPxT6YgsIeo8Icn+Mia7PZBJujhIFKciybqyHj5S9Ew2cOdRDPi3wWx5fd6FuLjhqb8ZkImQsgUud0vPQbn2U0boZWxzlc4zxgLPsesC+8rtrYxo/7KajK2BfiIvueuXqRpxsnByG7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0HSS2VMUTY2fLPnrBr/6O+3DH81HGZsYCQP8YxfTc78=;
 b=n8vlgmRHE62kHfo23INwhQjKJ8SJUX1afYQrWoP3CE4YGN338DwGy8W2ZUnoPqFx8ggBZxUji31bETQr4QCDFpA5p+q6z/W4Q2f99Wm0jmZzREECCYW9UZA7PWK0ELCMLuPRtKs8XaPc081Li0gDJnAWYFUIxUjlXmhBAqrFRb/qH5PAPSTx8L0EXauf5/krlduV1mubH1p1a0Yrxkan8wPULC32mGp/ekJS9gNCFHEl3pzMYR8xj97G5eG7biNHnBU+wxHpFpuBmTI1zzh7HMjG/9EtexITTJmTABkEl+g9vN6k2PaKk5fAJDxgA7Wn+LMQDLbNs35KBvuikRs4HQ==
Received: from SA1PR02CA0004.namprd02.prod.outlook.com (2603:10b6:806:2cf::8)
 by PH0PR10MB5817.namprd10.prod.outlook.com (2603:10b6:510:12a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 18:57:54 +0000
Received: from SN1PEPF00036F43.namprd05.prod.outlook.com
 (2603:10b6:806:2cf:cafe::c5) by SA1PR02CA0004.outlook.office365.com
 (2603:10b6:806:2cf::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Tue,
 3 Feb 2026 18:57:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF00036F43.mail.protection.outlook.com (10.167.248.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 18:57:53 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Feb
 2026 12:57:53 -0600
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Feb
 2026 12:57:53 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Feb 2026 12:57:53 -0600
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 613Ivr5M2736031;
	Tue, 3 Feb 2026 12:57:53 -0600
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 404972A61; Tue,  3 Feb 2026 12:57:53 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202602031100
Date: Tue, 3 Feb 2026 12:57:53 -0600
Message-ID: <20260203185753.3259517-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F43:EE_|PH0PR10MB5817:EE_
X-MS-Office365-Filtering-Correlation-Id: d5bf7371-1f3f-4069-17bf-08de63562316
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?DnFSjSl3LDWHWWKGS/VWPVl/4nPFxTgPSa0DYQ14vMtaF8rK6HMYOHnU5M4S?=
 =?us-ascii?Q?VxZ6ZLjMpXK47ba1D+AKklZ3FV2vkMk1HjUO1L0ZHRAyj5U4eFeDX9y8blkq?=
 =?us-ascii?Q?5sP8uzgpwmy2veOfcwWjp3AK6L+W/EPOnBAaWlC+QULy3G7RfbJo6xESXsCy?=
 =?us-ascii?Q?2tGrz6kqdBTsqQkMidni/WUlaFAXT+CDuzHtRTG0dfJTjhvOiGqAIW4wXcCm?=
 =?us-ascii?Q?2+gzxQDKkhMY8EwjYNfWnbAXjpB19vP/UMug6qYwrvbEgBXUIfWP1QqL9RSY?=
 =?us-ascii?Q?D3XEze7VduQqiPcTE9qNFe2QGLYVSC6NgfMDaKm46pqazcCVhFFUwLy9K/w6?=
 =?us-ascii?Q?85c7X5gM6uF2YshNCKR+Ii91YzwgO3doD8Wb/IxueD33bjDKmdnHBLkYMoUi?=
 =?us-ascii?Q?MEC8DJg4IZ560cCrFbm9KJx7AlSFaBsom1tJHJ2/xvVEXKrQMxajD1MHFCuh?=
 =?us-ascii?Q?4Qsz5MX3l1FRKKaFmyT56i1lUeBjilecEa4AB//XQcf4aXLhAMaSZaq9/Vfw?=
 =?us-ascii?Q?vzfxn3Gg6nhglMgxt+C6lYrNNL9OVMWl2ZM8gJjrSAFeTAUfnaqXS9ebuiy6?=
 =?us-ascii?Q?PlNQlpah3DzDsacpbxfPJ4W6l66BKuk0MyH+fJJ/WrstLuEC8m3yiErRyYK8?=
 =?us-ascii?Q?ZNT59ZCmjloZYxH25jGN2uJEZLoEX9prrgot/0DMS1fo6UCqrKnKrRYmTkxv?=
 =?us-ascii?Q?YvakikBuIdNv4ZZR6JnobrzGNPCO+ao3HVG3wbKZC2DYrgwmFlNc9SUXAnFD?=
 =?us-ascii?Q?PEWhIrVKWpQh3qy2oF/DAmobfB6oxle6eOPo8e8D3eWxOXaDNDsCINoP+jpu?=
 =?us-ascii?Q?TJEgjNDImuHMoDAu5z8aghvrZQkkY0DQMufnz6nDmET3FRDABUzu+PhqrnOz?=
 =?us-ascii?Q?yh5qIaeiiZu/SgFy0MULK5DVR0HLvGs06LrcwwPm+1GhlajyUfJESfMMXTGj?=
 =?us-ascii?Q?TY0J5nl5oT1z1O0r5EzF9a0Z9x/h0HXZBS9Z+2g+ZHcN2sGeXg8S0h8C+FTH?=
 =?us-ascii?Q?Z0Mm+UyQL5FrKShNpXt5srFmxBdMUoujT2BYX+3I0E3R0MEJnWA7u7HwRkkN?=
 =?us-ascii?Q?89fKFNggSebmJBCVgGKYhK8ITPvelKvBMxWitosTksXh8W3gONm0notCj2Yp?=
 =?us-ascii?Q?J2lAR8LDNo8rtUsBHmMLaBUAqSjkFQXiHs8DWx56jfCuoHcbhYfcYuvZh2P2?=
 =?us-ascii?Q?Fem+pVZHKNwHiEeHv1VN+/VdKAOD7SF4JuZ7Lo64TVo2iaAFoT0K9MB1VTK4?=
 =?us-ascii?Q?8nhex3Jua2c4WoskzZf8/KbUHl/n8pVsZLg6eUpaznppc4WB7NVc5isqWl08?=
 =?us-ascii?Q?aLQizPquvwPeLApG+SNgO5+et/5Dn/ACptIKcnai8qqn65bnF2SUzr4FSVif?=
 =?us-ascii?Q?pxaIO1/cqnNTJWa2MMIPDE5LVaEoxLGQvlaqbYdiHH8tRuwsM+99TmTfjy6g?=
 =?us-ascii?Q?EkWmC8cR9uCLxrVvQrawSa21nwg7pbcF54jQyh7+IxMlglu2D6j7akDlD2jz?=
 =?us-ascii?Q?FujvDR2SpvG98gnNDhUEr8+JIQoE89EF6rlOJMzUBkEB7ufQFzPuo6OPmJ0d?=
 =?us-ascii?Q?sIsZOksZUmfqoPs5zuUqEe9GtxcHOqwgrqHjEt09dgOneibhTrR0aTUJ58gk?=
 =?us-ascii?Q?uiUDHm9YRwqGlKvdfefT2l8aPovR/7rRafs3W/P0p43huDfPs+/9j4jq2e6V?=
 =?us-ascii?Q?qkcWTQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	UcUv7u8e9puslF5O49nUQp4Usizrxew0wI4NoLIoy5Yw/XsfYvD6zxjKxeN/xOVMf/IGbalinIFXo0mJ9j+MQu01xsYK8PEzAtSwaGd9yoeUNfQIFk/5GFfV4dxUlZw62NUJMjDx8MuQYWmXBgvg1BO+Ze9gOCOWQ14tg7h3JX/HYqkjSPSmN9ztO9qy3C4BuWiSuXp4PfQC4G7mr68DlhVSeOCrKFymXBmTE5VMJJxR4ho51CwFtIbAUif/6gQOdtQLICus6Qoi0t6BJPIv1AeDL37cnqmXGqgNfdJAaGaYKyObwsBLzyyNmzpdn3RZ+tfUMJkTTS4Wty4bk6e/vQ0zb2Qrdx6e0tVW3mAforwVdELrjVvv2LaYaGGmCT9ZCoY6yVqn8any6/6uAB5Pj8mwN6Qvi+/Sw2y1NjWbbZ8O/eREfeJjhW0b3DK3OOJV
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 18:57:53.9465
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5bf7371-1f3f-4069-17bf-08de63562316
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF00036F43.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5817
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 03 Feb 2026 18:58:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19460

Updated the value(s) for:
  atf: SRCREV_tfa:am62lxx

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-=
ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.i=
nc
index 510940f6..d933dc43 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -10,7 +10,7 @@ SRC_URI_TRUSTED_FIRMWARE_A =3D "git://git.trustedfirmware=
.org/TF-A/trusted-firmwar
 SRCBRANCH =3D "master"
=20
 LIC_FILES_CHKSUM:am62lxx =3D "file://docs/license.rst;md5=3D1118e32884721c=
0be33267bd7ae11130"
-SRCREV_tfa:am62lxx =3D "b1237f2794c47501d2d5e7d533720ec48c8af20f"
+SRCREV_tfa:am62lxx =3D "40660e2a494f3fe38a40525bc9b9bf9d55e84d11"
 SRC_URI_TRUSTED_FIRMWARE_A:am62lxx =3D "git://github.com/TexasInstruments/=
arm-trusted-firmware.git;protocol=3Dhttps"
 SRCBRANCH:am62lxx =3D "ti-master"
=20
--=20
2.43.5


