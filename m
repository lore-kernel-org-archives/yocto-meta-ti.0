Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B2E5C79FB6
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 01:55:29 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4296.1789005322896254791
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 09 Sep 2026 18:55:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=ck4xCw/h;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=j5K4kV8E;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A1jHen1830679;
	Wed, 9 Sep 2026 20:55:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=s/1y+aDnV287c
	ejiiscl5JQW/vfADx0tdTpClQBoobU=; b=ck4xCw/h1pboyxV5KBYH3M9m9qFEH
	We8ksQSWnBHaEa0lZgmcxk4n0TGwfU0HdY/0H5bhp7oO14z9iJjJQXnRbrFHcI++
	WY5Oqd8bgYIpdXUh5nkMHUcgw5m88pQCTgewFlBuCWF5NC+/2ziMQLUllzW2FpQ8
	DURlNlTMNEfFzOiwe/qzj6vdpwEWKWerwEWtVwsnBva4pNf7jsaM1gnst3RjThTT
	K6KYcUuluHdL20URN24/S5XpjSk2lKfO9EoSRKjOthtinT0fkC0dmnLoLApLkAga
	LS5oJIDE+ko7TsQ/LLB4zN9jbdOLxDZ+r2DvWT2222KnU3W06kuRsWvrA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011022.outbound.protection.outlook.com [52.101.52.22])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gkcxftgxp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 20:55:15 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zNe1RnrTD3e2g/Dw8JI9EjHaW3KwvOFFpUcyuYSwkMqbuij65v0KTHynTirQDnoOxidKIqfhNumEhIjl7YTknkfuwQQuR6htOP5ooY7N7sy36d0DtCvMv+K2fqaHhRPyrLh7ZV+QqLGNt3KnW3KXpcLT6HZRt1QsG/J+huN/IQefAi4pqXd7CSo2U9/g31VlQEZ1YOtzhpok3ua0HB42J0tmODhUCIdn5CMKwYQdP7Yg+nSNG0EGjqYS/rnlOcqOI83IDf1FPVHWBD6WjmWjs6VqsYdz/Xr/8oEjuOy+BdW6NvJtKxvpbKJkW9O9fMLj76/2iEBxNRWMB6c7r09viQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s/1y+aDnV287cejiiscl5JQW/vfADx0tdTpClQBoobU=;
 b=JNr+augSbx/AMYtUH+tlMJKoDeVd8c5JQQKr+QBfhHWrn3i9ogvkKStcf/qK4vqTl8LIW6TaB+qehPc83SlA/Zb8AvzE/CH9ScoySYcRyyMv3sl1op4fcX63nSNhS9pYXRq8g5zEQNqVUpaaG8xXtt/grT3TcDbbwBgaZFPKmVBldGbD6PCmru7eNyztxWxoS3Za30w0IP/xQmlWRt4XYbl2puyRAX2ODXhttxu5e6aflfsXP5h7DvyCAwYW1IH4fk1jbijuT6tU5DPbyPvcOxpV8qLZmiJCKX9z76rM1q3X/S4hqzBKnnaXtEnCdO4xa+ZJCdnpHl4xu22Otfe0ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s/1y+aDnV287cejiiscl5JQW/vfADx0tdTpClQBoobU=;
 b=j5K4kV8EE9vzQ1o8QhBXDWdLPgo+cHGlxx+w7FXGzSXOP1Swe094T+O4TV/eQ9MDEpOAn0xK7Xa+t0dZ9pWeE+TQAULFaIEbeH47JLmt88q845FEZwiVlTZKbxA8l2/G2mBbezum20+Fo1Vgxig9wE3uYKjazwjLOtjxMHAJtxk=
Received: from SJ0PR03CA0118.namprd03.prod.outlook.com (2603:10b6:a03:333::33)
 by SJ1PR10MB5906.namprd10.prod.outlook.com (2603:10b6:a03:48b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.4; Thu, 10 Sep
 2026 01:55:03 +0000
Received: from SJ1PEPF000023DA.namprd21.prod.outlook.com
 (2603:10b6:a03:333:cafe::25) by SJ0PR03CA0118.outlook.office365.com
 (2603:10b6:a03:333::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.6 via Frontend Transport; Thu, 10
 Sep 2026 01:55:03 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF000023DA.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.0 via Frontend Transport; Thu, 10 Sep 2026 01:55:03 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 20:54:54 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 20:54:54 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 9 Sep 2026 20:54:54 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68A1ssUL1396651;
	Wed, 9 Sep 2026 20:54:54 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1x4U06-0000000CJao-1drF;
	Wed, 09 Sep 2026 20:54:54 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v2 1/5] u-boot-ti-staging: Fixes for OpenSSL 4.0
Date: Wed, 9 Sep 2026 20:54:48 -0500
Message-ID: <20260910015454.2933250-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023DA:EE_|SJ1PR10MB5906:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e307248-f4de-4d5d-ee3e-08df0ede87c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|82310400026|376014|1800799024|36860700016|10067099003|3023799007|6133799003|56012099006|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	QXVEkqhQVuInG7W+5yisLeFozIhGL09YEUCO60epocRr4SB6yoT28reIl6bxtgBCMwVnUKCR9KtXPNSinvTJGAij4+esmdAiBQyJcM17N+iDGc0At5Ren2ACK+zjWCgiN80p55//ncTeC/O44ogY8U3PDFLA2idcjcL8CheK27H1pSdew9ySh30H5r9RAgX1FYOqTtgKVX+OHvPvvhwJZzQjHKWKiy75algme0g+DId9+Z/O8i9oH7Xxs4Wg8dvysc0gZvq8A9pNPGCRzZIs2gu9Kj8QOug/LOaTiymK2stHgRDfkXAhd2wUvoYJ5LeoIBHxKMT2nyuVo64FAy5kztrQ3ZS2w32yJc5+Acz4F6dyMXXHKh24AeuUvkGFE8+ig3CSX2X/T9fNEKSC1TnNrk2oPN1r+AX1P+lBeiOz/osFtihNlWUc/JxufSirsa9xq5MF4AwHvygwrcgC5dq9SDOS0aR9u1FtQRYcMbp/Wrgwa6cMuZ5vFyaO6uMjSO2MMpNgwB6D3L3Dit9Yt7R7v3Yx75Cfu7sRuoCtJ3rJVg3jtCV1Es1go9kaHUQwEjs+UiHDFl60jgscMwmsKdF22FLiPGGi1VvyR3onw/u5xpL0WSy88bpt2BDFQs/OXhHpx4SdfQY9vsxyWkxR/6JfZytGMFz3ewsmrKIXq23Tgrp5o8699NXWKJbjsAOeIyh6Me2v0KPk+/phM5eW2g474w==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(376014)(1800799024)(36860700016)(10067099003)(3023799007)(6133799003)(56012099006)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	dBi40t/nti1d8TTqmc5U4oKAzTLrAH2QRNGyC4Zy7yjVjp7CHL/Tvm2OuRYFeyb10Vdh5tXGsMwxA9KtnBl7aV7/Uj8BaMr6Mccf7qRG6TCLl6evxTKocdyk0VmxAhQ+msgarWNuXZm0KOO6VTOiD8YL7AFrc+wlnqNSLcxC8gtOyTom/0579rcjCqkZ/mRYxSQj/84OvHDqiMq1zuktRiXlPoaTZXk52bsitCDEQmfffYvj/5h5/Ajh/uoFallJMG0SkwPRlecdFUbO6fKDGpf0x5C4XansXHYDNbCJUQnfwr6K5pn3NplcyPn0QkiJ3P7gSsL0tIm42WoZF9WBGiKUNXf+VJu+C/SC5ACQ0/vL8cweYwpWQlRaI05CA803uqOhjvHLU6skg3u0s5hU5KvbIJlcKKQkdCQRYXhAHr/LJYiBOosTcJikLMBDmOyZ
X-Exchange-RoutingPolicyChecked: 
	qLG7Q6ag3/4NZh7tc2cH9ss6+84Gmk6Bf1AimYqgJXLQKhhsPUiDWHazWML7EkT1zlLG4Ul2eQhmxTnTSKTVjoQT6uGirDfq5eZlMjQx+gF3IuHlXefXkOb+M50QlmGP+ytwH8mqUsf8Wto8GjS20YcVvlk8Kbyr17PaVDJZHNdW7Oxe0q3PDBrvVqpihwPTTrYhcH8JygOjutwI694ABf8tYKiH7kgSdCuP4EH7IQXL44l4DUB9iXIrhVLc1LHnjUh2lEC34qc71pnpl4wpDt1aQg49MFfZL+bD4m0lF5sVRxcNowv5TuaN2A1MunBYToP1RluAA+mpk7Nbw2nWew==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 01:55:03.1840
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e307248-f4de-4d5d-ee3e-08df0ede87c3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR10MB5906
X-Proofpoint-ORIG-GUID: 1gnhY2ov16glEIiOWHKzWLdDr-eBA-t1
X-Authority-Analysis: v=2.4 cv=SoAFe/O0 c=1 sm=1 tr=0 ts=6aa20e03 cx=c_pps
 a=3RjCkzAZQHL7PUncwJf+GQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=Q4-j1AaZAAAA:8 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8
 a=sozttTNsAAAA:8 a=ptNznvi-AAAA:8 a=kWlOZTdTBx2Y8M_f7woA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=__MQohX_fo54y4GeBRKl:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDAxOCBTYWx0ZWRfX2XOZQRSuoR9D
 TOqM0AAr89LlmOnjvUCLIjVbBS2fDcpRZLrmUJuVBmJePCi78KTVUkrtOl7pAcncg9uFu1NReLZ
 cmn/+TDQqomZXaJMuWfeU7y7xJr0M6aZqPHKOSsbHVrlsBcZhO7YOCbVjm2g+bZZrzrvFdZmKFQ
 r45piscaSxRBL8r+woTYHUq7nKCklQQtMi8RLW1lUKKuLnV8HDRsvlH/9LbQkkOYklJn83zHTtO
 /cvRKpF1c1/t0MbVZmW4ZW2K2GLSapWfJ5SSJo9q6UcWFqMz4kDPJcWRevfQFxja53plplWFDqH
 qDvInI3lJEwd7M2L5p9PdxTZCVCLi/5Wofca5P7GKZg5Puo2smiCSGs9axkdewgr17X17qTL4/a
 W56ZPYKrEw1GgBuIGFfFB1Jqfgexf4Hmt2YZZAPtf0BNl/LVE8G0wG/jnLrFCaEV/trebJ4enWx
 IbwExgBDO+ls/sBKKcQ==
X-Proofpoint-GUID: 1gnhY2ov16glEIiOWHKzWLdDr-eBA-t1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDAxOCBTYWx0ZWRfX0p69Iqw+Od9y
 eenR0BNRRcGXS3u61sG2RLYKwjyi2hkbsxrvnttvPKUUbTIOwej/Ik7dLAiweB9TORFMZzQVwPb
 td5ns4OQgWdJ+OYgm1o0nqnsHVQNhZM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100018
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 10 Sep 2026 01:55:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20358

With the recent move to OpenSSL 4.0 [1] we need to update the same code
in the various u-boot versions that we support.

[1] https://git.openembedded.org/openembedded-core/commit/?id=20bf704e5809e95036b998f0f45145cf7205b05b

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2; No change.

 ...ort-for-OpenSSL-Provider-API-2024-04.patch | 300 ++++++++++++++++
 ...ort-for-OpenSSL-Provider-API-2025-01.patch | 300 ++++++++++++++++
 ...ort-for-OpenSSL-Provider-API-2026-01.patch | 340 ++++++++++++++++++
 .../u-boot/u-boot-ti-staging_2024.04.bb       |   6 +-
 .../u-boot/u-boot-ti-staging_2025.01.bb       |   1 +
 .../u-boot/u-boot-ti-staging_2026.01.bb       |   2 +
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc  |   1 +
 7 files changed, 948 insertions(+), 2 deletions(-)
 create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API-2024-04.patch
 create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API-2025-01.patch
 create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API-2026-01.patch

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API-2024-04.patch b/meta-ti-bsp/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API-2024-04.patch
new file mode 100644
index 00000000..9f67644b
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API-2024-04.patch
@@ -0,0 +1,300 @@
+From 401c19f6b0a7c63afad92e9d3f2cbb75d6ed8566 Mon Sep 17 00:00:00 2001
+From: Ryan Eatmon <reatmon@ti.com>
+Date: Wed, 9 Sep 2026 10:04:50 -0500
+Subject: [PATCH] Add support for OpenSSL Provider API
+
+Backport from 2026.01 patch [1] by Ryan Eatmon <reatmon@ti.com>
+
+Upsatream-Status: Inappropriate [OE-specific]
+
+The Engine API has been deprecated since the release of OpenSSL 3.0. End
+users have been advised to migrate to the new Provider interface.
+Several distributions have already removed support for engines, which is
+preventing U-Boot from being compiled in those environments.
+
+Add support for the Provider API while continuing to support the existing
+Engine API on distros shipping older releases of OpenSSL.
+
+This is based on similar work contributed by Jan Stancek updating Linux
+to use the Provider interface.
+
+    commit 558bdc45dfb2669e1741384a0c80be9c82fa052c
+    Author: Jan Stancek <jstancek@redhat.com>
+    Date:   Fri Sep 20 19:52:48 2024 +0300
+
+        sign-file,extract-cert: use pkcs11 provider for OPENSSL MAJOR >= 3
+
+The changes have been tested with the FIT signature verification vboot
+tests on Fedora 42 and Debian 13. All 30 tests pass with both the legacy
+Engine library installed and with the Provider API.
+
+Signed-off-by: Eddie Kovsky <ewk@edkovsky.org>
+
+Upstream-Status: Submitted [https://lore.kernel.org/u-boot/20260429180247.83091-1-ekovsky@redhat.com/]
+
+Note: Modified to make pkcs11 provider loading optional. The upstream
+patch unconditionally requires the pkcs11 provider, which is not
+available in the OE build environment. File-based key signing only needs
+the default provider; pkcs11 is only required for pkcs11: URI keys.
+Changes from upstream:
+ - Load default provider first (was pkcs11 first)
+ - Make pkcs11 provider load failure non-fatal (ERR_clear_error instead
+   of ERR(1, ...) which calls errx/abort)
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+
+Signed-off-by: Ryan Eatmon <reatmon@ti.com>
+---
+ lib/aes/aes-encrypt.c |  4 +-
+ lib/rsa/rsa-sign.c    | 95 ++++++++++++++++++++++++++++++++++++++++++-
+ 2 files changed, 97 insertions(+), 2 deletions(-)
+
+diff --git a/lib/aes/aes-encrypt.c b/lib/aes/aes-encrypt.c
+index e74e35eaa28..8a6f7715df9 100644
+--- a/lib/aes/aes-encrypt.c
++++ b/lib/aes/aes-encrypt.c
+@@ -16,7 +16,9 @@
+ #include <openssl/err.h>
+ #include <openssl/ssl.h>
+ #include <openssl/evp.h>
+-#include <openssl/engine.h>
++#if !defined(OPENSSL_NO_ENGINE) && !defined(OPENSSL_NO_DEPRECATED_3_0)
++# include <openssl/engine.h>
++#endif
+ #include <uboot_aes.h>
+ 
+ #if OPENSSL_VERSION_NUMBER >= 0x10000000L
+diff --git a/lib/rsa/rsa-sign.c b/lib/rsa/rsa-sign.c
+index 2304030e32f..29b3bd3dbb1 100644
+--- a/lib/rsa/rsa-sign.c
++++ b/lib/rsa/rsa-sign.c
+@@ -19,7 +19,47 @@
+ #include <openssl/err.h>
+ #include <openssl/ssl.h>
+ #include <openssl/evp.h>
+-#include <openssl/engine.h>
++#if OPENSSL_VERSION_MAJOR >= 3
++# define USE_PKCS11_PROVIDER
++# include <err.h>
++# include <openssl/provider.h>
++# include <openssl/store.h>
++#else
++# if !defined(OPENSSL_NO_ENGINE) && !defined(OPENSSL_NO_DEPRECATED_3_0)
++#  define USE_PKCS11_ENGINE
++#  include <openssl/engine.h>
++# endif
++#endif
++
++#ifdef USE_PKCS11_PROVIDER
++#define ERR(cond, fmt, ...)				\
++	do {						\
++		bool __cond = (cond);			\
++		drain_openssl_errors(__LINE__, 0);	\
++		if (__cond) {				\
++			errx(1, fmt, ## __VA_ARGS__);	\
++		}					\
++	} while (0)
++
++static void drain_openssl_errors(int l, int silent)
++{
++	const char *file;
++	char buf[120];
++	int e, line;
++
++	if (ERR_peek_error() == 0)
++		return;
++	if (!silent)
++		fprintf(stderr, "At main.c:%d:\n", l);
++
++	while ((e = ERR_peek_error_line(&file, &line))) {
++		ERR_error_string(e, buf);
++		if (!silent)
++			fprintf(stderr, "- SSL %s: %s:%d\n", buf, file, line);
++		ERR_get_error();
++	}
++}
++#endif
+ 
+ static int rsa_err(const char *msg)
+ {
+@@ -98,6 +138,7 @@ err_cert:
+  * @evpp	Returns EVP_PKEY object, or NULL on failure
+  * Return: 0 if ok, -ve on error (in which case *evpp will be set to NULL)
+  */
++#ifdef USE_PKCS11_ENGINE
+ static int rsa_engine_get_pub_key(const char *keydir, const char *name,
+ 				  ENGINE *engine, EVP_PKEY **evpp)
+ {
+@@ -157,6 +198,7 @@ static int rsa_engine_get_pub_key(const char *keydir, const char *name,
+ 
+ 	return 0;
+ }
++#endif
+ 
+ /**
+  * rsa_get_pub_key() - read a public key
+@@ -170,8 +212,10 @@ static int rsa_engine_get_pub_key(const char *keydir, const char *name,
+ static int rsa_get_pub_key(const char *keydir, const char *name,
+ 			   ENGINE *engine, EVP_PKEY **evpp)
+ {
++#ifdef USE_PKCS11_ENGINE
+ 	if (engine)
+ 		return rsa_engine_get_pub_key(keydir, name, engine, evpp);
++#endif
+ 	return rsa_pem_get_pub_key(keydir, name, evpp);
+ }
+ 
+@@ -207,6 +251,38 @@ static int rsa_pem_get_priv_key(const char *keydir, const char *name,
+ 		return -ENOENT;
+ 	}
+ 
++#ifdef USE_PKCS11_PROVIDER
++	EVP_PKEY *private_key = NULL;
++	OSSL_STORE_CTX *store;
++
++	if (!OSSL_PROVIDER_try_load(NULL, "default", true))
++		ERR(1, "OSSL_PROVIDER_try_load(default)");
++	/* pkcs11 provider is optional; only needed for pkcs11: URIs */
++	if (!OSSL_PROVIDER_try_load(NULL, "pkcs11", true))
++		ERR_clear_error();
++
++	store = OSSL_STORE_open(path, NULL, NULL, NULL, NULL);
++	ERR(!store, "OSSL_STORE_open");
++
++	while (!OSSL_STORE_eof(store)) {
++		OSSL_STORE_INFO *info = OSSL_STORE_load(store);
++
++		if (!info) {
++			drain_openssl_errors(__LINE__, 0);
++			continue;
++		}
++		if (OSSL_STORE_INFO_get_type(info) == OSSL_STORE_INFO_PKEY) {
++			private_key = OSSL_STORE_INFO_get1_PKEY(info);
++			ERR(!private_key, "OSSL_STORE_INFO_get1_PKEY");
++		}
++		OSSL_STORE_INFO_free(info);
++		if (private_key)
++			break;
++	}
++	OSSL_STORE_close(store);
++
++	*evpp = private_key;
++#else
+ 	if (!PEM_read_PrivateKey(f, evpp, NULL, path)) {
+ 		rsa_err("Failure reading private key");
+ 		fclose(f);
+@@ -214,6 +290,7 @@ static int rsa_pem_get_priv_key(const char *keydir, const char *name,
+ 	}
+ 	fclose(f);
+ 
++#endif
+ 	return 0;
+ }
+ 
+@@ -226,6 +303,7 @@ static int rsa_pem_get_priv_key(const char *keydir, const char *name,
+  * @evpp	Returns EVP_PKEY object, or NULL on failure
+  * Return: 0 if ok, -ve on error (in which case *evpp will be set to NULL)
+  */
++#ifdef USE_PKCS11_ENGINE
+ static int rsa_engine_get_priv_key(const char *keydir, const char *name,
+ 				   const char *keyfile,
+ 				   ENGINE *engine, EVP_PKEY **evpp)
+@@ -293,6 +371,7 @@ static int rsa_engine_get_priv_key(const char *keydir, const char *name,
+ 
+ 	return 0;
+ }
++#endif
+ 
+ /**
+  * rsa_get_priv_key() - read a private key
+@@ -306,9 +385,11 @@ static int rsa_engine_get_priv_key(const char *keydir, const char *name,
+ static int rsa_get_priv_key(const char *keydir, const char *name,
+ 			    const char *keyfile, ENGINE *engine, EVP_PKEY **evpp)
+ {
++#ifdef USE_PKCS11_ENGINE
+ 	if (engine)
+ 		return rsa_engine_get_priv_key(keydir, name, keyfile, engine,
+ 					       evpp);
++#endif
+ 	return rsa_pem_get_priv_key(keydir, name, keyfile, evpp);
+ }
+ 
+@@ -325,6 +406,7 @@ static int rsa_init(void)
+ 	return 0;
+ }
+ 
++#ifdef USE_PKCS11_ENGINE
+ static int rsa_engine_init(const char *engine_id, ENGINE **pe)
+ {
+ 	const char *key_pass;
+@@ -372,6 +454,7 @@ err_engine_init:
+ 	ENGINE_free(e);
+ 	return ret;
+ }
++#endif
+ 
+ static void rsa_engine_remove(ENGINE *e)
+ {
+@@ -471,11 +554,13 @@ int rsa_sign(struct image_sign_info *info,
+ 	if (ret)
+ 		return ret;
+ 
++#ifdef USE_PKCS11_ENGINE
+ 	if (info->engine_id) {
+ 		ret = rsa_engine_init(info->engine_id, &e);
+ 		if (ret)
+ 			return ret;
+ 	}
++#endif
+ 
+ 	ret = rsa_get_priv_key(info->keydir, info->keyname, info->keyfile,
+ 			       e, &pkey);
+@@ -487,16 +572,20 @@ int rsa_sign(struct image_sign_info *info,
+ 		goto err_sign;
+ 
+ 	EVP_PKEY_free(pkey);
++#ifdef USE_PKCS11_ENGINE
+ 	if (info->engine_id)
+ 		rsa_engine_remove(e);
++#endif
+ 
+ 	return ret;
+ 
+ err_sign:
+ 	EVP_PKEY_free(pkey);
+ err_priv:
++#ifdef USE_PKCS11_ENGINE
+ 	if (info->engine_id)
+ 		rsa_engine_remove(e);
++#endif
+ 	return ret;
+ }
+ 
+@@ -636,11 +725,13 @@ int rsa_add_verify_data(struct image_sign_info *info, void *keydest)
+ 	ENGINE *e = NULL;
+ 
+ 	debug("%s: Getting verification data\n", __func__);
++#ifdef USE_PKCS11_ENGINE
+ 	if (info->engine_id) {
+ 		ret = rsa_engine_init(info->engine_id, &e);
+ 		if (ret)
+ 			return ret;
+ 	}
++#endif
+ 	ret = rsa_get_pub_key(info->keydir, info->keyname, e, &pkey);
+ 	if (ret)
+ 		goto err_get_pub_key;
+@@ -717,8 +808,10 @@ done:
+ err_get_params:
+ 	EVP_PKEY_free(pkey);
+ err_get_pub_key:
++#ifdef USE_PKCS11_ENGINE
+ 	if (info->engine_id)
+ 		rsa_engine_remove(e);
++#endif
+ 
+ 	if (ret)
+ 		return ret;
+-- 
+2.43.0
+
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API-2025-01.patch b/meta-ti-bsp/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API-2025-01.patch
new file mode 100644
index 00000000..c5f3655e
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API-2025-01.patch
@@ -0,0 +1,300 @@
+From 0525693750b1b7a8fb7228dbb97bf592a21322fc Mon Sep 17 00:00:00 2001
+From: Ryan Eatmon <reatmon@ti.com>
+Date: Wed, 9 Sep 2026 10:04:50 -0500
+Subject: [PATCH] Add support for OpenSSL Provider API
+
+Backport from 2026.01 patch [1] by Ryan Eatmon <reatmon@ti.com>
+
+Upsatream-Status: Inappropriate [OE-specific]
+
+The Engine API has been deprecated since the release of OpenSSL 3.0. End
+users have been advised to migrate to the new Provider interface.
+Several distributions have already removed support for engines, which is
+preventing U-Boot from being compiled in those environments.
+
+Add support for the Provider API while continuing to support the existing
+Engine API on distros shipping older releases of OpenSSL.
+
+This is based on similar work contributed by Jan Stancek updating Linux
+to use the Provider interface.
+
+    commit 558bdc45dfb2669e1741384a0c80be9c82fa052c
+    Author: Jan Stancek <jstancek@redhat.com>
+    Date:   Fri Sep 20 19:52:48 2024 +0300
+
+        sign-file,extract-cert: use pkcs11 provider for OPENSSL MAJOR >= 3
+
+The changes have been tested with the FIT signature verification vboot
+tests on Fedora 42 and Debian 13. All 30 tests pass with both the legacy
+Engine library installed and with the Provider API.
+
+Signed-off-by: Eddie Kovsky <ewk@edkovsky.org>
+
+Upstream-Status: Submitted [https://lore.kernel.org/u-boot/20260429180247.83091-1-ekovsky@redhat.com/]
+
+Note: Modified to make pkcs11 provider loading optional. The upstream
+patch unconditionally requires the pkcs11 provider, which is not
+available in the OE build environment. File-based key signing only needs
+the default provider; pkcs11 is only required for pkcs11: URI keys.
+Changes from upstream:
+ - Load default provider first (was pkcs11 first)
+ - Make pkcs11 provider load failure non-fatal (ERR_clear_error instead
+   of ERR(1, ...) which calls errx/abort)
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+
+Signed-off-by: Ryan Eatmon <reatmon@ti.com>
+---
+ lib/aes/aes-encrypt.c |  4 +-
+ lib/rsa/rsa-sign.c    | 95 ++++++++++++++++++++++++++++++++++++++++++-
+ 2 files changed, 97 insertions(+), 2 deletions(-)
+
+diff --git a/lib/aes/aes-encrypt.c b/lib/aes/aes-encrypt.c
+index e74e35eaa28..8a6f7715df9 100644
+--- a/lib/aes/aes-encrypt.c
++++ b/lib/aes/aes-encrypt.c
+@@ -16,7 +16,9 @@
+ #include <openssl/err.h>
+ #include <openssl/ssl.h>
+ #include <openssl/evp.h>
+-#include <openssl/engine.h>
++#if !defined(OPENSSL_NO_ENGINE) && !defined(OPENSSL_NO_DEPRECATED_3_0)
++# include <openssl/engine.h>
++#endif
+ #include <uboot_aes.h>
+ 
+ #if OPENSSL_VERSION_NUMBER >= 0x10000000L
+diff --git a/lib/rsa/rsa-sign.c b/lib/rsa/rsa-sign.c
+index fa9e143b4ca..af5b18e0c95 100644
+--- a/lib/rsa/rsa-sign.c
++++ b/lib/rsa/rsa-sign.c
+@@ -19,7 +19,47 @@
+ #include <openssl/err.h>
+ #include <openssl/ssl.h>
+ #include <openssl/evp.h>
+-#include <openssl/engine.h>
++#if OPENSSL_VERSION_MAJOR >= 3
++# define USE_PKCS11_PROVIDER
++# include <err.h>
++# include <openssl/provider.h>
++# include <openssl/store.h>
++#else
++# if !defined(OPENSSL_NO_ENGINE) && !defined(OPENSSL_NO_DEPRECATED_3_0)
++#  define USE_PKCS11_ENGINE
++#  include <openssl/engine.h>
++# endif
++#endif
++
++#ifdef USE_PKCS11_PROVIDER
++#define ERR(cond, fmt, ...)				\
++	do {						\
++		bool __cond = (cond);			\
++		drain_openssl_errors(__LINE__, 0);	\
++		if (__cond) {				\
++			errx(1, fmt, ## __VA_ARGS__);	\
++		}					\
++	} while (0)
++
++static void drain_openssl_errors(int l, int silent)
++{
++	const char *file;
++	char buf[120];
++	int e, line;
++
++	if (ERR_peek_error() == 0)
++		return;
++	if (!silent)
++		fprintf(stderr, "At main.c:%d:\n", l);
++
++	while ((e = ERR_peek_error_line(&file, &line))) {
++		ERR_error_string(e, buf);
++		if (!silent)
++			fprintf(stderr, "- SSL %s: %s:%d\n", buf, file, line);
++		ERR_get_error();
++	}
++}
++#endif
+ 
+ static int rsa_err(const char *msg)
+ {
+@@ -98,6 +138,7 @@ err_cert:
+  * @evpp	Returns EVP_PKEY object, or NULL on failure
+  * Return: 0 if ok, -ve on error (in which case *evpp will be set to NULL)
+  */
++#ifdef USE_PKCS11_ENGINE
+ static int rsa_engine_get_pub_key(const char *keydir, const char *name,
+ 				  ENGINE *engine, EVP_PKEY **evpp)
+ {
+@@ -157,6 +198,7 @@ static int rsa_engine_get_pub_key(const char *keydir, const char *name,
+ 
+ 	return 0;
+ }
++#endif
+ 
+ /**
+  * rsa_get_pub_key() - read a public key
+@@ -170,8 +212,10 @@ static int rsa_engine_get_pub_key(const char *keydir, const char *name,
+ static int rsa_get_pub_key(const char *keydir, const char *name,
+ 			   ENGINE *engine, EVP_PKEY **evpp)
+ {
++#ifdef USE_PKCS11_ENGINE
+ 	if (engine)
+ 		return rsa_engine_get_pub_key(keydir, name, engine, evpp);
++#endif
+ 	return rsa_pem_get_pub_key(keydir, name, evpp);
+ }
+ 
+@@ -207,6 +251,38 @@ static int rsa_pem_get_priv_key(const char *keydir, const char *name,
+ 		return -ENOENT;
+ 	}
+ 
++#ifdef USE_PKCS11_PROVIDER
++	EVP_PKEY *private_key = NULL;
++	OSSL_STORE_CTX *store;
++
++	if (!OSSL_PROVIDER_try_load(NULL, "default", true))
++		ERR(1, "OSSL_PROVIDER_try_load(default)");
++	/* pkcs11 provider is optional; only needed for pkcs11: URIs */
++	if (!OSSL_PROVIDER_try_load(NULL, "pkcs11", true))
++		ERR_clear_error();
++
++	store = OSSL_STORE_open(path, NULL, NULL, NULL, NULL);
++	ERR(!store, "OSSL_STORE_open");
++
++	while (!OSSL_STORE_eof(store)) {
++		OSSL_STORE_INFO *info = OSSL_STORE_load(store);
++
++		if (!info) {
++			drain_openssl_errors(__LINE__, 0);
++			continue;
++		}
++		if (OSSL_STORE_INFO_get_type(info) == OSSL_STORE_INFO_PKEY) {
++			private_key = OSSL_STORE_INFO_get1_PKEY(info);
++			ERR(!private_key, "OSSL_STORE_INFO_get1_PKEY");
++		}
++		OSSL_STORE_INFO_free(info);
++		if (private_key)
++			break;
++	}
++	OSSL_STORE_close(store);
++
++	*evpp = private_key;
++#else
+ 	if (!PEM_read_PrivateKey(f, evpp, NULL, path)) {
+ 		rsa_err("Failure reading private key");
+ 		fclose(f);
+@@ -214,6 +290,7 @@ static int rsa_pem_get_priv_key(const char *keydir, const char *name,
+ 	}
+ 	fclose(f);
+ 
++#endif
+ 	return 0;
+ }
+ 
+@@ -226,6 +303,7 @@ static int rsa_pem_get_priv_key(const char *keydir, const char *name,
+  * @evpp	Returns EVP_PKEY object, or NULL on failure
+  * Return: 0 if ok, -ve on error (in which case *evpp will be set to NULL)
+  */
++#ifdef USE_PKCS11_ENGINE
+ static int rsa_engine_get_priv_key(const char *keydir, const char *name,
+ 				   const char *keyfile,
+ 				   ENGINE *engine, EVP_PKEY **evpp)
+@@ -293,6 +371,7 @@ static int rsa_engine_get_priv_key(const char *keydir, const char *name,
+ 
+ 	return 0;
+ }
++#endif
+ 
+ /**
+  * rsa_get_priv_key() - read a private key
+@@ -306,9 +385,11 @@ static int rsa_engine_get_priv_key(const char *keydir, const char *name,
+ static int rsa_get_priv_key(const char *keydir, const char *name,
+ 			    const char *keyfile, ENGINE *engine, EVP_PKEY **evpp)
+ {
++#ifdef USE_PKCS11_ENGINE
+ 	if (engine)
+ 		return rsa_engine_get_priv_key(keydir, name, keyfile, engine,
+ 					       evpp);
++#endif
+ 	return rsa_pem_get_priv_key(keydir, name, keyfile, evpp);
+ }
+ 
+@@ -325,6 +406,7 @@ static int rsa_init(void)
+ 	return 0;
+ }
+ 
++#ifdef USE_PKCS11_ENGINE
+ static int rsa_engine_init(const char *engine_id, ENGINE **pe)
+ {
+ 	const char *key_pass;
+@@ -372,6 +454,7 @@ err_engine_init:
+ 	ENGINE_free(e);
+ 	return ret;
+ }
++#endif
+ 
+ static void rsa_engine_remove(ENGINE *e)
+ {
+@@ -480,11 +563,13 @@ int rsa_sign(struct image_sign_info *info,
+ 	if (ret)
+ 		return ret;
+ 
++#ifdef USE_PKCS11_ENGINE
+ 	if (info->engine_id) {
+ 		ret = rsa_engine_init(info->engine_id, &e);
+ 		if (ret)
+ 			return ret;
+ 	}
++#endif
+ 
+ 	ret = rsa_get_priv_key(info->keydir, info->keyname, info->keyfile,
+ 			       e, &pkey);
+@@ -496,16 +581,20 @@ int rsa_sign(struct image_sign_info *info,
+ 		goto err_sign;
+ 
+ 	EVP_PKEY_free(pkey);
++#ifdef USE_PKCS11_ENGINE
+ 	if (info->engine_id)
+ 		rsa_engine_remove(e);
++#endif
+ 
+ 	return ret;
+ 
+ err_sign:
+ 	EVP_PKEY_free(pkey);
+ err_priv:
++#ifdef USE_PKCS11_ENGINE
+ 	if (info->engine_id)
+ 		rsa_engine_remove(e);
++#endif
+ 	return ret;
+ }
+ 
+@@ -645,11 +734,13 @@ int rsa_add_verify_data(struct image_sign_info *info, void *keydest)
+ 	ENGINE *e = NULL;
+ 
+ 	debug("%s: Getting verification data\n", __func__);
++#ifdef USE_PKCS11_ENGINE
+ 	if (info->engine_id) {
+ 		ret = rsa_engine_init(info->engine_id, &e);
+ 		if (ret)
+ 			return ret;
+ 	}
++#endif
+ 	ret = rsa_get_pub_key(info->keydir, info->keyname, e, &pkey);
+ 	if (ret)
+ 		goto err_get_pub_key;
+@@ -726,8 +817,10 @@ done:
+ err_get_params:
+ 	EVP_PKEY_free(pkey);
+ err_get_pub_key:
++#ifdef USE_PKCS11_ENGINE
+ 	if (info->engine_id)
+ 		rsa_engine_remove(e);
++#endif
+ 
+ 	if (ret)
+ 		return ret;
+-- 
+2.43.0
+
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API-2026-01.patch b/meta-ti-bsp/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API-2026-01.patch
new file mode 100644
index 00000000..346d0584
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API-2026-01.patch
@@ -0,0 +1,340 @@
+From a81cb0932dce109af44d7245d47489fe54ae390f Mon Sep 17 00:00:00 2001
+From: Eddie Kovsky <ewk@edkovsky.org>
+Date: Mon, 23 Feb 2026 09:43:22 -0700
+Subject: [PATCH] Add support for OpenSSL Provider API
+
+The Engine API has been deprecated since the release of OpenSSL 3.0. End
+users have been advised to migrate to the new Provider interface.
+Several distributions have already removed support for engines, which is
+preventing U-Boot from being compiled in those environments.
+
+Add support for the Provider API while continuing to support the existing
+Engine API on distros shipping older releases of OpenSSL.
+
+This is based on similar work contributed by Jan Stancek updating Linux
+to use the Provider interface.
+
+    commit 558bdc45dfb2669e1741384a0c80be9c82fa052c
+    Author: Jan Stancek <jstancek@redhat.com>
+    Date:   Fri Sep 20 19:52:48 2024 +0300
+
+        sign-file,extract-cert: use pkcs11 provider for OPENSSL MAJOR >= 3
+
+The changes have been tested with the FIT signature verification vboot
+tests on Fedora 42 and Debian 13. All 30 tests pass with both the legacy
+Engine library installed and with the Provider API.
+
+Signed-off-by: Eddie Kovsky <ewk@edkovsky.org>
+
+Upstream-Status: Submitted [https://lore.kernel.org/u-boot/20260429180247.83091-1-ekovsky@redhat.com/]
+
+Note: Modified to make pkcs11 provider loading optional. The upstream
+patch unconditionally requires the pkcs11 provider, which is not
+available in the OE build environment. File-based key signing only needs
+the default provider; pkcs11 is only required for pkcs11: URI keys.
+Changes from upstream:
+ - Load default provider first (was pkcs11 first)
+ - Make pkcs11 provider load failure non-fatal (ERR_clear_error instead
+   of ERR(1, ...) which calls errx/abort)
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ doc/build/gcc.rst      |   4 +-
+ lib/aes/aes-encrypt.c |   4 +-
+ lib/rsa/rsa-sign.c    | 102 +++++++++++++++++++++++++++++++++++++++---
+ tools/docker/Dockerfile |  1 +
+ 4 files changed, 103 insertions(+), 8 deletions(-)
+
+diff --git a/doc/build/gcc.rst b/doc/build/gcc.rst
+index 1fef718ceecb..29a6a632e7e3 100644
+--- a/doc/build/gcc.rst
++++ b/doc/build/gcc.rst
+@@ -25,8 +25,8 @@ Depending on the build targets further packages maybe needed
+ 
+     sudo apt-get install bc bison build-essential coccinelle \
+       device-tree-compiler dfu-util efitools flex gdisk graphviz imagemagick \
+-      libgnutls28-dev libguestfs-tools libncurses-dev \
+-      libpython3-dev libsdl2-dev libssl-dev lz4 lzma lzma-alone openssl \
++      libgnutls28-dev libguestfs-tools libncurses-dev libpython3-dev \
++      libsdl2-dev libssl-dev lz4 lzma lzma-alone openssl pkcs11-provider \
+       pkg-config python3 python3-asteval python3-coverage python3-filelock \
+       python3-pkg-resources python3-pycryptodome python3-pyelftools \
+       python3-pytest python3-pytest-xdist python3-sphinxcontrib.apidoc \
+diff --git a/lib/aes/aes-encrypt.c b/lib/aes/aes-encrypt.c
+index 90e1407b4f09..4fc4ce232478 100644
+--- a/lib/aes/aes-encrypt.c
++++ b/lib/aes/aes-encrypt.c
+@@ -16,7 +16,9 @@
+ #include <openssl/err.h>
+ #include <openssl/ssl.h>
+ #include <openssl/evp.h>
+-#include <openssl/engine.h>
++#if !defined(OPENSSL_NO_ENGINE) && !defined(OPENSSL_NO_DEPRECATED_3_0)
++# include <openssl/engine.h>
++#endif
+ #include <uboot_aes.h>
+ 
+ #if OPENSSL_VERSION_NUMBER >= 0x10000000L
+diff --git a/lib/rsa/rsa-sign.c b/lib/rsa/rsa-sign.c
+index 0e38c9e802fd..f456f3c58e65 100644
+--- a/lib/rsa/rsa-sign.c
++++ b/lib/rsa/rsa-sign.c
+@@ -19,7 +19,47 @@
+ #include <openssl/err.h>
+ #include <openssl/ssl.h>
+ #include <openssl/evp.h>
+-#include <openssl/engine.h>
++#if OPENSSL_VERSION_MAJOR >= 3
++# define USE_PKCS11_PROVIDER
++# include <err.h>
++# include <openssl/provider.h>
++# include <openssl/store.h>
++#else
++# if !defined(OPENSSL_NO_ENGINE) && !defined(OPENSSL_NO_DEPRECATED_3_0)
++#  define USE_PKCS11_ENGINE
++#  include <openssl/engine.h>
++# endif
++#endif
++
++#ifdef USE_PKCS11_PROVIDER
++#define ERR(cond, fmt, ...)				\
++	do {						\
++		bool __cond = (cond);			\
++		drain_openssl_errors(__LINE__, 0);	\
++		if (__cond) {				\
++			errx(1, fmt, ## __VA_ARGS__);	\
++		}					\
++	} while (0)
++
++static void drain_openssl_errors(int l, int silent)
++{
++	const char *file;
++	char buf[120];
++	int e, line;
++
++	if (ERR_peek_error() == 0)
++		return;
++	if (!silent)
++		fprintf(stderr, "At main.c:%d:\n", l);
++
++	while ((e = ERR_peek_error_line(&file, &line))) {
++		ERR_error_string(e, buf);
++		if (!silent)
++			fprintf(stderr, "- SSL %s: %s:%d\n", buf, file, line);
++		ERR_get_error();
++	}
++}
++#endif
+ 
+ static int rsa_err(const char *msg)
+ {
+@@ -94,10 +134,11 @@ static int rsa_pem_get_pub_key(const char *keydir, const char *name, EVP_PKEY **
+  *
+  * @keydir:	Key prefix
+  * @name	Name of key
+- * @engine	Engine to use
++ * @engine	Engine to use or NULL when using pkcs11 provider
+  * @evpp	Returns EVP_PKEY object, or NULL on failure
+  * Return: 0 if ok, -ve on error (in which case *evpp will be set to NULL)
+  */
++#ifdef USE_PKCS11_ENGINE
+ static int rsa_engine_get_pub_key(const char *keydir, const char *name,
+ 				  ENGINE *engine, EVP_PKEY **evpp)
+ {
+@@ -157,21 +198,24 @@ static int rsa_engine_get_pub_key(const char *keydir, const char *name,
+ 
+ 	return 0;
+ }
++#endif
+ 
+ /**
+  * rsa_get_pub_key() - read a public key
+  *
+  * @keydir:	Directory containing the key (PEM file) or key prefix (engine)
+  * @name	Name of key file (will have a .crt extension)
+- * @engine	Engine to use
++ * @engine	Engine to use or NULL when using pkcs11 provider
+  * @evpp	Returns EVP_PKEY object, or NULL on failure
+  * Return: 0 if ok, -ve on error (in which case *evpp will be set to NULL)
+  */
+ static int rsa_get_pub_key(const char *keydir, const char *name,
+ 			   ENGINE *engine, EVP_PKEY **evpp)
+ {
++#ifdef USE_PKCS11_ENGINE
+ 	if (engine)
+ 		return rsa_engine_get_pub_key(keydir, name, engine, evpp);
++#endif
+ 	return rsa_pem_get_pub_key(keydir, name, evpp);
+ }
+ 
+@@ -207,13 +251,45 @@ static int rsa_pem_get_priv_key(const char *keydir, const char *name,
+ 		return -ENOENT;
+ 	}
+ 
++#ifdef USE_PKCS11_PROVIDER
++	EVP_PKEY *private_key = NULL;
++	OSSL_STORE_CTX *store;
++
++	if (!OSSL_PROVIDER_try_load(NULL, "default", true))
++		ERR(1, "OSSL_PROVIDER_try_load(default)");
++	/* pkcs11 provider is optional; only needed for pkcs11: URIs */
++	if (!OSSL_PROVIDER_try_load(NULL, "pkcs11", true))
++		ERR_clear_error();
++
++	store = OSSL_STORE_open(path, NULL, NULL, NULL, NULL);
++	ERR(!store, "OSSL_STORE_open");
++
++	while (!OSSL_STORE_eof(store)) {
++		OSSL_STORE_INFO *info = OSSL_STORE_load(store);
++
++		if (!info) {
++			drain_openssl_errors(__LINE__, 0);
++			continue;
++		}
++		if (OSSL_STORE_INFO_get_type(info) == OSSL_STORE_INFO_PKEY) {
++			private_key = OSSL_STORE_INFO_get1_PKEY(info);
++			ERR(!private_key, "OSSL_STORE_INFO_get1_PKEY");
++		}
++		OSSL_STORE_INFO_free(info);
++		if (private_key)
++			break;
++	}
++	OSSL_STORE_close(store);
++
++	*evpp = private_key;
++#else
+ 	if (!PEM_read_PrivateKey(f, evpp, NULL, path)) {
+ 		rsa_err("Failure reading private key");
+ 		fclose(f);
+ 		return -EPROTO;
+ 	}
+ 	fclose(f);
+-
++#endif
+ 	return 0;
+ }
+ 
+@@ -226,6 +301,7 @@ static int rsa_pem_get_priv_key(const char *keydir, const char *name,
+  * @evpp	Returns EVP_PKEY object, or NULL on failure
+  * Return: 0 if ok, -ve on error (in which case *evpp will be set to NULL)
+  */
++#ifdef USE_PKCS11_ENGINE
+ static int rsa_engine_get_priv_key(const char *keydir, const char *name,
+ 				   const char *keyfile,
+ 				   ENGINE *engine, EVP_PKEY **evpp)
+@@ -293,22 +369,25 @@ static int rsa_engine_get_priv_key(const char *keydir, const char *name,
+ 
+ 	return 0;
+ }
++#endif
+ 
+ /**
+  * rsa_get_priv_key() - read a private key
+  *
+  * @keydir:	Directory containing the key (PEM file) or key prefix (engine)
+  * @name	Name of key
+- * @engine	Engine to use for signing
++ * @engine	Engine to use or NULL when using pkcs11 provider
+  * @evpp	Returns EVP_PKEY object, or NULL on failure
+  * Return: 0 if ok, -ve on error (in which case *evpp will be set to NULL)
+  */
+ static int rsa_get_priv_key(const char *keydir, const char *name,
+ 			    const char *keyfile, ENGINE *engine, EVP_PKEY **evpp)
+ {
++#ifdef USE_PKCS11_ENGINE
+ 	if (engine)
+ 		return rsa_engine_get_priv_key(keydir, name, keyfile, engine,
+ 					       evpp);
++#endif
+ 	return rsa_pem_get_priv_key(keydir, name, keyfile, evpp);
+ }
+ 
+@@ -325,6 +404,7 @@ static int rsa_init(void)
+ 	return 0;
+ }
+ 
++#ifdef USE_PKCS11_ENGINE
+ static int rsa_engine_init(const char *engine_id, ENGINE **pe)
+ {
+ 	const char *key_pass;
+@@ -380,6 +460,7 @@ static void rsa_engine_remove(ENGINE *e)
+ 		ENGINE_free(e);
+ 	}
+ }
++#endif
+ 
+ static int rsa_sign_with_key(EVP_PKEY *pkey, struct padding_algo *padding_algo,
+ 			     struct checksum_algo *checksum_algo,
+@@ -480,11 +561,13 @@ int rsa_sign(struct image_sign_info *info,
+ 	if (ret)
+ 		return ret;
+ 
++#ifdef USE_PKCS11_ENGINE
+ 	if (info->engine_id) {
+ 		ret = rsa_engine_init(info->engine_id, &e);
+ 		if (ret)
+ 			return ret;
+ 	}
++#endif
+ 
+ 	ret = rsa_get_priv_key(info->keydir, info->keyname, info->keyfile,
+ 			       e, &pkey);
+@@ -496,16 +579,21 @@ int rsa_sign(struct image_sign_info *info,
+ 		goto err_sign;
+ 
+ 	EVP_PKEY_free(pkey);
++
++#ifdef USE_PKCS11_ENGINE
+ 	if (info->engine_id)
+ 		rsa_engine_remove(e);
++#endif
+ 
+ 	return ret;
+ 
+ err_sign:
+ 	EVP_PKEY_free(pkey);
+ err_priv:
++#ifdef USE_PKCS11_ENGINE
+ 	if (info->engine_id)
+ 		rsa_engine_remove(e);
++#endif
+ 	return ret;
+ }
+ 
+@@ -645,11 +733,13 @@ int rsa_add_verify_data(struct image_sign_info *info, void *keydest)
+ 	ENGINE *e = NULL;
+ 
+ 	debug("%s: Getting verification data\n", __func__);
++#ifdef USE_PKCS11_ENGINE
+ 	if (info->engine_id) {
+ 		ret = rsa_engine_init(info->engine_id, &e);
+ 		if (ret)
+ 			return ret;
+ 	}
++#endif
+ 	ret = rsa_get_pub_key(info->keydir, info->keyname, e, &pkey);
+ 	if (ret)
+ 		goto err_get_pub_key;
+@@ -726,8 +816,10 @@ int rsa_add_verify_data(struct image_sign_info *info, void *keydest)
+ err_get_params:
+ 	EVP_PKEY_free(pkey);
+ err_get_pub_key:
++#ifdef USE_PKCS11_ENGINE
+ 	if (info->engine_id)
+ 		rsa_engine_remove(e);
++#endif
+ 
+ 	if (ret)
+ 		return ret;
+diff --git a/tools/docker/Dockerfile b/tools/docker/Dockerfile
+index 73bf6cdd2c52..50e98e83dc20 100644
+--- a/tools/docker/Dockerfile
++++ b/tools/docker/Dockerfile
+@@ -122,6 +122,7 @@ RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
+ 	openssl \
+ 	picocom \
+ 	parted \
++	pkcs11-provider \
+ 	pkg-config \
+ 	python-is-python3 \
+ 	python3 \
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb
index d3a78d8b..5812b914 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb
@@ -4,6 +4,8 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2024.04"
 
-SRC_URI += "file://0001-scripts-dtc-pylibfdt-libfdt.i_shipped-Use-SWIG_Appen.patch"
-
 SRCREV_uboot = "29d0c23d67ee7b88e46fe1753cd020e2b04c2ef6"
+
+SRC_URI += "file://0001-scripts-dtc-pylibfdt-libfdt.i_shipped-Use-SWIG_Appen.patch"
+SRC_URI += "file://0001-binman-migrate-form-pkg_resources-to-importlib.patch"
+SRC_URI += "file://0001-Add-support-for-OpenSSL-Provider-API-2024-04.patch"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index f7475c2b..af4b1b77 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -7,3 +7,4 @@ BRANCH = "ti-u-boot-2025.01"
 SRCREV_uboot = "4ca322ca563a21cccad8c9ba65e386b9fd34dd16"
 
 SRC_URI += "file://0001-binman-migrate-form-pkg_resources-to-importlib.patch"
+SRC_URI += "file://0001-Add-support-for-OpenSSL-Provider-API-2025-01.patch"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
index 7637cfaf..d1ef241d 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
@@ -5,3 +5,5 @@ PR = "r0"
 BRANCH = "ti-u-boot-2026.01"
 
 SRCREV_uboot = "2a85f4bcffc50ddc8b443d8e4162e9e46ed0f200"
+
+SRC_URI += "file://0001-Add-support-for-OpenSSL-Provider-API-2026-01.patch"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
index 3d6769bf..8213ac60 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -25,6 +25,7 @@ UBOOT_GIT_PROTOCOL ?= "https"
 UBOOT_GIT_BRANCH ?= "branch=${BRANCH}"
 SRC_URI = "${UBOOT_GIT_URI};protocol=${UBOOT_GIT_PROTOCOL};${UBOOT_GIT_BRANCH};name=uboot"
 
+SRC_URI:append:bsp-ti-6_6 = " file://0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch"
 SRC_URI:append:bsp-ti-6_12 = " file://0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch"
 SRC_URI:append:bsp-ti-6_18 = " file://0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch"
 
-- 
2.43.0


