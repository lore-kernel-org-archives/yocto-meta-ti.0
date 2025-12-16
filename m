Return-Path: <jm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FDAFD637DE
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 22:17:04 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.315.1765923417072929406
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 16 Dec 2025 14:16:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=BGyujEwx;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.208.23, mailfrom: jm@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q4hobAuXH5oN9Eqq34rh5w+uP544G5RRO16sKaBm12xY5LJI1OBq1H2eow8cKXVFUXKbkTiP0yxYZ0NKY3aphZPXTJs1ihUGoHM9/eu0//du78G3h6FtxdewtRNkeG6J7jvcpPq9DRVZw+WlsnIiQYRq4AZyEn7IRT5TlaqABZL31AyUQLewzeLysujQINOqyGW02fzpsHmCkQ+Gnn2P3lkXnWvypCQV+m1VGUv3GVyCTcaRSd4PTDWh6wLPYEEjrcppSFxUzEwXGiwxaylZZ46g0ORwccu1vhtivIzlw7rwLTKls0TMNiF5DsNGQBPex2CjexZpyeGqYRXI3SHkJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d20cQVdwpN9AM4ortVmIdJWPGkw7/LMiiBX30CFCjrk=;
 b=YM/mfAl80cCLDymYBrB7eIeGgExqSPxdrjOE/GQsLiuKocJfxWs/K+waVBV7dn3WYrfFfvLdZluejeXmJf0ACGrAC6y/3GqLpSxVbVQWjJ6RgGpE6RVcpZii6dUHY+DzjZlDU6fCT2fxkl+pW74i3KHX2inj5HE1CJ5paa3rvtpA0aUNuhi+bQExwxYePB9O68beS41aUyi7+H6rxk+yn/0p61pDmqLxUpIBkf379BRaVnIG12faCPieSqDtvJkNAw1HLJStkwdPCggD/hcmQzOtEBfvZO/3SOGf+vs4QO2ZRvMDBOwHtV/6zbaM4vNp5C66oAyYUJiUDEoofTETkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d20cQVdwpN9AM4ortVmIdJWPGkw7/LMiiBX30CFCjrk=;
 b=BGyujEwxX/T/WAxkXdpVUzD/+WgOeGFDWDy0D7sbEyAu9PqmT3MM1h2dSO4coADKeVGjA+hsMLnX6lbq2zLaTvHWf37ytB74ci/1N4JOX5H8eF0q1ZcAMM5jeWnDeG2k/lSDRZ40lHPOO004Lh+pyCYOSn8q16kK2qkzFZhtAQI=
Received: from PH8PR05CA0022.namprd05.prod.outlook.com (2603:10b6:510:2cc::10)
 by IA3PR10MB8017.namprd10.prod.outlook.com (2603:10b6:208:512::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 22:16:55 +0000
Received: from CY4PEPF0000FCBE.namprd03.prod.outlook.com
 (2603:10b6:510:2cc:cafe::e8) by PH8PR05CA0022.outlook.office365.com
 (2603:10b6:510:2cc::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Tue,
 16 Dec 2025 22:16:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000FCBE.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Tue, 16 Dec 2025 22:16:53 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 16 Dec
 2025 16:16:52 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 16 Dec
 2025 16:16:52 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 16 Dec 2025 16:16:52 -0600
Received: from judy-lenovo.dhcp.ti.com (judy-lenovo.dhcp.ti.com [128.247.81.193])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BGMGqJC514024;
	Tue, 16 Dec 2025 16:16:52 -0600
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>, "Andrew
 Davis" <afd@ti.com>
Subject: [PATCH v2 1/2] meta-ti-bsp: Add support for BeagleBadge
Date: Tue, 16 Dec 2025 16:16:51 -0600
Message-ID: <20251216221652.2231748-2-jm@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251216221652.2231748-1-jm@ti.com>
References: <20251216221652.2231748-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBE:EE_|IA3PR10MB8017:EE_
X-MS-Office365-Filtering-Correlation-Id: 98da728d-1cf8-4308-e50a-08de3cf0d124
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Zrq6i9U5rLqYnUgLL3DPdB9gXcTCuLyUc3scY+TYz8Uiavo/wJkVIISD1m/S?=
 =?us-ascii?Q?uEOugDcRkfLJTxGwNleXwlmUoFQdyQOzGmmMPzWo3GvkN0xIoy0ESSUSZqwc?=
 =?us-ascii?Q?85kCqkdFecs1SwkUjHRX8CGZzgidZP0Jb1YMGm2DE3vXDtUcxqU8AAQwzNnv?=
 =?us-ascii?Q?4dPzBxemIML9bPfFsUpHPaKUADYfS6FRoFfLCNygC6lgbnAPwRQ8LgJWxokm?=
 =?us-ascii?Q?LRgUSnmKusGGyKSFRVTRLpNzrs4yt9DYnlK8iJDKVLuVIIFA01rFkmdKghRW?=
 =?us-ascii?Q?8RV1Dwia25SFJmuhXv4AKZvRbFdZE/fLFxSUvgfNHVf2dMiHYErtJOSctRNt?=
 =?us-ascii?Q?Xj2kRh7sDxHdvGJHQ/LIFujaVfebiXfFdV4F1iPoSu4csxdshYHM0wi0n2+k?=
 =?us-ascii?Q?1si0DSAgIO90Q362ARlI/C1p0BHGfCBDfPv+Oyz1ILQFK2G6Eo+1XBqfb8AM?=
 =?us-ascii?Q?kATka2q2gTDo185v9ZAXDiUa+wSCNQwnkxFmpgkVq43zPPnaMyGJGDeU6JmT?=
 =?us-ascii?Q?GvrmvqZEKxpHjwWW68xwA3ndG1tpEF9/1CD4NnJywCC+IYmsOiwRyohzTbva?=
 =?us-ascii?Q?OPJA0y2YVzPB57MOFWIys0PnFk87Auib+WBgyG9PRgCb2TR5ygujU4iJTxBE?=
 =?us-ascii?Q?NQsP1eYmdAKdy/wnjFUVOZAQ43f0ozP8478LKorDATLePb9X4nymQzEOzMvl?=
 =?us-ascii?Q?xwJIdIFZAN5KoqY5JR71/mhoLNTkpwGWKdx8BQCyN/YlTXwuA+boz8tOfXBE?=
 =?us-ascii?Q?aoFMuEGkygm+7Z8+q2ZnSHoh5XJLiyDMN6LkTur4ymniPnT/eOLPHZ5Pp6DP?=
 =?us-ascii?Q?UiRMwPlxQZnasob7VW8FfT6+FImMAkLMuME0ENOFJnzF7RL99T9/ryWVEiTm?=
 =?us-ascii?Q?KlbQ+MC+1OcdS9B/63toYtUKz+yfLwP98dqhuoEdSzVniOm7vt2fjiJBmjBe?=
 =?us-ascii?Q?2+GKT48Vr5fAN4UhIz4kx6QZOYYS2fT72CPH4BWhCQMzK0Ns/jRSs5PzZ+PI?=
 =?us-ascii?Q?53mRy5zxtdepwkzxZ/uAJcTWoU3ajF69P0zMGEVOo66V/5X/vD22fcd/Saz8?=
 =?us-ascii?Q?8YtAcMjJbb92vC31rciDGzBUNV7puZwI0iFT7v+9glkorY5i8eDvS2EU7f7f?=
 =?us-ascii?Q?kKeJ2vT0H0GJ3dz7IUpCLeeD0QkKHGoLj+VJQoKfGzXqISxrjBVkOPdO5DBu?=
 =?us-ascii?Q?CDUAt8NjOAOwWAj4ZRGJoleFP9wU/9pMMDZ/s123zcPcLodv1vZyDCYABf6+?=
 =?us-ascii?Q?N2G4lmhg9ufw9+xBvfFTNOuEKvYmVzpSF8mDRMPkrVFigtnOC9MpNr+f9AyJ?=
 =?us-ascii?Q?Bsu4+kF/1K332CuUaGPbD6wM635C2wLbf7NT5cq0E05FM0JPEtNHGWaaUeRt?=
 =?us-ascii?Q?k551f7akBUqH5u2tazr7eMDveTtFUAEriFkZ/SMBqQUUus+Hie/M420jr5/b?=
 =?us-ascii?Q?qH1cVir/zuc43Q2g52sFrlky8F0OG917UOBIegO1EKrv4aWJMxi//0krW17S?=
 =?us-ascii?Q?sud7ZrRR22kvJbNuia3Xni2DDmCl+XvpMtsk+qJViJthBUfw0CHohQS76mII?=
 =?us-ascii?Q?i8tjoeAgbl5G3s4zp/M=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 22:16:53.1028
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98da728d-1cf8-4308-e50a-08de3cf0d124
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000FCBE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8017
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 16 Dec 2025 22:17:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19363

Add support for the BeagleBadge which is an AM62L
based device that requires new build configuration
for U-Boot and TF-A sources.

Signed-off-by: Judith Mendez <jm@ti.com>
---
 meta-ti-bsp/conf/machine/beaglebadge-ti.conf | 22 ++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-ti-bsp/conf/machine/beaglebadge-ti.conf

diff --git a/meta-ti-bsp/conf/machine/beaglebadge-ti.conf b/meta-ti-bsp/con=
f/machine/beaglebadge-ti.conf
new file mode 100644
index 00000000..ff870c92
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/beaglebadge-ti.conf
@@ -0,0 +1,22 @@
+#@TYPE: Machine
+#@NAME: AM62L Badge
+#@DESCRIPTION: Machine configuration for the TI AM62L Badge
+
+require conf/machine/include/am62lxx.inc
+
+IMAGE_FSTYPES +=3D "ubifs ubi"
+
+MKUBIFS_ARGS ?=3D "-F -m 4096 -e 258048 -c 8500"
+
+UBINIZE_ARGS ?=3D "-m 4096 -p 256KiB -s 1024 -O 1024"
+
+KERNEL_DEVICETREE_PREFIX =3D " \
+    ti/k3-am62l3-badge \
+"
+
+KERNEL_DEVICETREE =3D ""
+
+UBOOT_MACHINE =3D "am62lx_badge_defconfig"
+
+TFA_BOARD =3D "am62l-badge"
+
--=20
2.34.1


