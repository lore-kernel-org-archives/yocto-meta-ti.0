Return-Path: <v-singh1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED84CCCD1BF
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 05:03:04 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.37])
 by mx.groups.io with SMTP id smtpd.web10.1124.1761714183867309065
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 28 Oct 2025 22:03:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=iulYLTv/;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.194.37, mailfrom: v-singh1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QBv5APWx6DMrhMPyYXk+3ySTqxnMYb8PV3a5qeFDP3yMqWD19CxFxA0qkZAvBrapGhhpOU8SN58BLZLx0RR3BmQhGHIdltaMXtypb+nELOvl8OMJMwBmsdA2Mrkg+JRkSzlekQdKhoEjh35P1XgAOZ4tZb9MLO5OCYh4INsx0OsVvsHLTqDllv42OmaEQRMvGMerE2Xpj/ZykBYR7JR04csn6+swxdjoDKP3GfLT977whbA8tiBRciAdRJVBe9P1e2Gaxybmk8+FUGMaG9SziT9QRofTWC5C0DtXh0KvkctqSWnvP38OsN82aWKvIxp2RkC5RnJZDjwezEQGY/G72Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5uqroPpRp7JDL+ykRhr0ZdqvUJquqhykCiDPlBwH9Hs=;
 b=qoL04srhUH2XRrDbrYAGoDNklg+Y2ISEBv/HE/Dx0PFBjSKW7oCS/x1Dd4j65+yGRJqm3UKIZgaANKGA1JLSauK/m17cXP7SNdKRegHJlrwSNiI4JsEfUCe1ucqCAiQ69oTMM4NzvYN1KC2u8zCiaU3CD3LmKE8OJ5YYPK6pSYyUSdQG5A4ldAKjS41S9TK8Qq7ksAmLN9r1TovL7AuEeOCkpbrtibfiSigS1vcSPyy5+aWCjWPpdRDIYa7SlDgS87YaxTFvWFSwGa9GYd5zzvv0x1a1cztWqE8ww1X0lgUKNcDV3d/z4pY4nZNW0KvvlC/GqxaVfsRz/Fq4DhTowg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5uqroPpRp7JDL+ykRhr0ZdqvUJquqhykCiDPlBwH9Hs=;
 b=iulYLTv/CfmYOCYvV+VbUpYMogJjbpW6FEWM2rI0U9Z+bAGUAiSXVomJMYxbFhPJXhxt5N1OJZ2w344HMiGpVcclP/vCMCxcV59/gWulygG+1wfk9t0WLry7l2WrrFhl3H8BZPSIVvB+5hFigxTCqNNkMFqsn52JSztTSWK3tc0=
Received: from BL0PR02CA0009.namprd02.prod.outlook.com (2603:10b6:207:3c::22)
 by IA1PR10MB6242.namprd10.prod.outlook.com (2603:10b6:208:3a2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Wed, 29 Oct
 2025 05:03:00 +0000
Received: from BL02EPF00021F69.namprd02.prod.outlook.com
 (2603:10b6:207:3c:cafe::71) by BL0PR02CA0009.outlook.office365.com
 (2603:10b6:207:3c::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.12 via Frontend Transport; Wed,
 29 Oct 2025 05:02:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL02EPF00021F69.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Wed, 29 Oct 2025 05:03:00 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 00:02:33 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 00:02:32 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Oct 2025 00:02:32 -0500
Received: from uda0513920.dhcp.ti.com (uda0513920.dhcp.ti.com [10.24.69.90])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59T52UYj3458999;
	Wed, 29 Oct 2025 00:02:31 -0500
From: vishnu singh <v-singh1@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <denis@denix.org>
Subject: [PATCH] ti-librpmsg-dma: update ti-librpmsg-dma SRCREV & LICENSE
Date: Wed, 29 Oct 2025 10:32:30 +0530
Message-ID: <20251029050230.1697118-1-v-singh1@ti.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F69:EE_|IA1PR10MB6242:EE_
X-MS-Office365-Filtering-Correlation-Id: 293f3f10-bedd-4199-98d1-08de16a86ebb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|34020700016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?yidr2IyZfdQkE40ab6gOt2hW6nTnZp2m3zmnRCMPsnbT+3NeFkfe8yvM78U1?=
 =?us-ascii?Q?JfhrdRp+mYIfTFqYcjWu/e+trwXg3pm/e7FYgYF6J9WrD9uqioMFebWOWkat?=
 =?us-ascii?Q?CX3y+whijcKLRfXscKNSUh8sdMPiOH/iMR3DN7RvFTkek68wrBkSIMJ9afVq?=
 =?us-ascii?Q?ecbMlmoN7tLDm738VvLYjhey1gyoMt64fE7/VAiuIfx/tdWZS2MZVuNr63Cs?=
 =?us-ascii?Q?1I47YkrIu/BbUPsQm6heOpSHCjFlv8v3LwrQVmYcGtJ6+SmvnYfRNpUBwSG8?=
 =?us-ascii?Q?vPfj8eOgcGzxWyZFfOQlGzVhW6LIx08pZfeVx0WbAaG3w0s3FM/9yT8z9qU4?=
 =?us-ascii?Q?8Mr1ElDPsrzwLsC48MI/ebmxhrHN4XoxUDfQEK1qt4h16f5gNJredSDcEZQW?=
 =?us-ascii?Q?wQhnHo2o4gVhcFcmydWi2x0RuDYTgCJsD+WWiU0E9UfHJYkZBgOxaQtIMLYE?=
 =?us-ascii?Q?BrZ8L3uoFjqr5uoq1+4HAENI+vJ5iCaggYSjiVj4UyNgp3+BG9MlX6Qpq9vq?=
 =?us-ascii?Q?IkatoIZ4bOV6+OKaX5xA+/2uhthxV8f9JDRO4SyiJcQPaqZcV76oehqnoeNV?=
 =?us-ascii?Q?rBxg+B1ID39oGATY7H0ksKrsle+FAFveoFhrrYTd5XXTLDQfl12lcqtK6SGY?=
 =?us-ascii?Q?VRajME637VoUpUxORJmnYNTZZgSKfm0q0WE6xNaP7+RCdI/eNwy+rEz+UVWo?=
 =?us-ascii?Q?aZgBi+AEP8Ke3NhplgGJxgbrGHoaKFcVGy+FRneYO7oLmemGBXAyHUqB+XsL?=
 =?us-ascii?Q?kJw5+f74wQkcrf79tljpxSwy061uYpUuzSsF4wMFvnEBbEwN3qZO7yRdGYkJ?=
 =?us-ascii?Q?7cWHzUQM1fACfcTLGpuMOSWUMW63/f2xPh6JF1fKe+4q4HA5XD8fqfZp56NN?=
 =?us-ascii?Q?9N2pgrAzQJ4LZtVPM7HwS+yVWadj76+tKDMAICcFfSm9tpzTqnueMx+j3wxf?=
 =?us-ascii?Q?APsrPmkol82hQGXqhYHoI2VmOVTsZBd3yGdx4vQwvM+AN1jv2o5Icj92sk5H?=
 =?us-ascii?Q?RtdNxe6qSe4owRzA/3myU8XC4I8w0uMGBT3/SVmbblrpCw3RY2ah+wPqGNEs?=
 =?us-ascii?Q?68qOhdEIaMKRsNCfw35iR1N2DXVXxEdgJm5NAU2Y9iNjTYOTViZbx0fxKWu8?=
 =?us-ascii?Q?/67ucSPyIVHiKKlffkkSce8S8c2MzEw4ftijY6GE3EZCydJdbGIb36n0K2+7?=
 =?us-ascii?Q?Z9nmYDD6UlvmF7AmP8SQy8tsjBR/6kO2zdNBfgsr2es+i1ymHzfUrYJKI5iX?=
 =?us-ascii?Q?628SD317FkP1onDpH4oJCbMCqiuWAU2HY4Lk1cMHR5NXNp6HOSyrOSEUOR6c?=
 =?us-ascii?Q?KPC1VAut1mZEu/wiDmxPH/h1mWw4jBWC0mIc1Y9MBnj5NG0t73WGOkaQg7Ar?=
 =?us-ascii?Q?rW0GoNfeAbbDSekgaeA6oF14ScamAmT1v2qlb/xljAUqoJroDfYTEsThCcxr?=
 =?us-ascii?Q?MISVYH+FM2DIo2waY2069NuzLIPFQ0fprnOfkZs4csRk4+h6gwDbOD8RAC70?=
 =?us-ascii?Q?UU05PBEvY2tsY3TqlCMM4qdpl1WKyAQ4zX6rjzZBRFCnUEzjH0qDA2awsnI+?=
 =?us-ascii?Q?oJ4/FVgweXyxYBmXpu8=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(34020700016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 05:03:00.0127
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 293f3f10-bedd-4199-98d1-08de16a86ebb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF00021F69.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6242
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Oct 2025 05:03:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19195

From: Vishnu Singh <v-singh1@ti.com>

Replace MIT license with TI-TFL to align with TI release policy
and product requirements. Legal approval: SRAS00013045
Update scarthgap srcrev and disable 2dfft example from lib build.

Signed-off-by: Vishnu Singh <v-singh1@ti.com>
---
 meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb b/meta-ti-bs=
p/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
index b624871d..7600f867 100644
--- a/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
@@ -1,9 +1,9 @@
 SUMMARY =3D "RPMsg DMA shared library"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D744e63d2bb8c6151dcdd97f49aa02c5=
3"
+LICENSE =3D "TI-TFL"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D91dc4ee6d125d0aaba4e5bd2fcc50ed=
3"
=20
-SRC_URI =3D "git://github.com/TexasInstruments/rpmsg-dma.git;protocol=3Dht=
tps;branch=3Dmain"
-SRCREV =3D "609fd72f458ba56f80d06810509ef88d010d2c03"
+SRC_URI =3D "git://github.com/TexasInstruments/rpmsg-dma.git;protocol=3Dht=
tps;branch=3Dscarthgap"
+SRCREV =3D "33d20a5a488844ace45ffb9dbbad9f043c5c897f"
=20
 S =3D "${WORKDIR}/git"
=20
@@ -11,6 +11,6 @@ inherit cmake
=20
 DEPENDS =3D "ti-rpmsg-char"
=20
-EXTRA_OECMAKE +=3D "-DBUILD_LIB=3DON -DBUILD_EXAMPLE=3DOFF"
+EXTRA_OECMAKE +=3D "-DBUILD_LIB=3DON -DBUILD_AUDIO_OFFLOAD_EXAMPLE=3DOFF -=
DBUILD_2DFFT_OFFLOAD_EXAMPLE=3DOFF"
=20
 COMPATIBLE_MACHINE =3D "^(k3)$"
--=20
2.50.1


