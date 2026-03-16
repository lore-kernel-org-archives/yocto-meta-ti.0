Return-Path: <jm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58E3AF506DA
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 22:18:28 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.3])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.63378.1773699501721172251
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 16 Mar 2026 15:18:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=SMqjGmlD;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.193.3, mailfrom: jm@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EEBwFfDDP8nPz7YLOo3O/HIDMy17Cb69Kc2TunT7SpSHDaqlZLy/SGC2qEEB+TOqWKt+gYyP/lIxrsXYoCI/N49F8VqxplwtAMIwuxu/msW0VcVgv4HsTslTXvopxF4S6dpsbGAjEbUwn8OD5lvH+pvbSyOBeEBUKFCsRN2T0gsWF3pPJm3namCZ3bwCAjaDQeJBFHO79E916bm98K/JD/yeCzZAOnZEnet60ZK55wOGva1kt7LCmoVwio9m9qGNcqMB59FbU5A8AQ0GVweQ5UW02pTg948BdO3gTJ+G6f1kcfCTT/Hzm1HPdTBrbvQ1ISvOzCUWHiaSxNgFsiGzLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M+EE60YUZPZQdhvLzIrXHTlq70yKjY79AMawGdjoiMI=;
 b=mcQKW/snLsbcSnaDcC9yYlRv1W1vH6hsRiK5aoG/xkqvOROXDvNzvhM4R8R2r19sQDvvO4lPRnWI00HjcndIZQuw6ydAA37Iocgr6QoO0rIldFia6qJJ/t9aT8GKG71+/7ksHyAKU9YQcacgFlfFUoCnO8IcQMUqTQrmWxUvuEAwLAOwF07sufkZyDIL2G2jOs9QxRJ8U+GMZleBaEB3vmL06/q71S5I+rO/3ZBl/Jd56SXAgcbx6DtBnxXVJultK5ZIrj/mYUXMNjGC8PXM3QKwlZSmE74+Tr7/oznJBiAhZm3T9agwFOq1Zthtuvm3ba2QyY/smoqafJz2LCOagg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M+EE60YUZPZQdhvLzIrXHTlq70yKjY79AMawGdjoiMI=;
 b=SMqjGmlDHfxGhE7RUCjfc64FK2ygHTuu8O2bmiFTUEV3TDR/BADiK95DpSkNqeV32lslUs+Huf/H//Id0DB0SwFJfKByEakRc03N9SmObp6WfNKQZaGKVLf3gvmq/KdAcDfSOhiDcFJJz39fWsGrnGLxsxiwvL2D/YxsOZNFqQg=
Received: from MW4PR04CA0047.namprd04.prod.outlook.com (2603:10b6:303:6a::22)
 by IA3PR10MB8299.namprd10.prod.outlook.com (2603:10b6:208:576::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.21; Mon, 16 Mar
 2026 22:18:17 +0000
Received: from MWH0EPF000C6185.namprd02.prod.outlook.com
 (2603:10b6:303:6a:cafe::71) by MW4PR04CA0047.outlook.office365.com
 (2603:10b6:303:6a::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.25 via Frontend Transport; Mon,
 16 Mar 2026 22:17:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MWH0EPF000C6185.mail.protection.outlook.com (10.167.249.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Mon, 16 Mar 2026 22:18:17 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 16 Mar
 2026 17:18:15 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 16 Mar
 2026 17:18:15 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 16 Mar 2026 17:18:15 -0500
Received: from judy-lenovo.dhcp.ti.com (judy-lenovo.dhcp.ti.com [128.247.81.193])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62GMIFHF1547765;
	Mon, 16 Mar 2026 17:18:15 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Ryan Eatmon <reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Andrew Davis <afd@ti.com>, "Praneeth
 Bajjuri" <praneeth@ti.com>
Subject: [meta-arago][master][PATCH 1/2] conf: machine: am62a: Fix overlays in KERNEL_DEVICETREE_PREFIX
Date: Mon, 16 Mar 2026 17:18:14 -0500
Message-ID: <20260316221815.2502448-2-jm@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260316221815.2502448-1-jm@ti.com>
References: <20260316221815.2502448-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6185:EE_|IA3PR10MB8299:EE_
X-MS-Office365-Filtering-Correlation-Id: fa82c924-ddaf-4fad-2830-08de83a9ec6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	iWhZwZ2k1U8iKmgVwgE4HnFD1I7N8qds+Yz0R+S3JbpcjDu63zwFbc5rAjh08B12nUvkGPS1nA3Kn4iqK9Kyh6kfiGQuff8RVAK5WC36hxutQy98f5468Q3M+jHuWJ5yAYKTOuWDRG/zt7wSocVinMuwB3b3MVPgUhaG0V8EgeaDpYBI8Wnhr569bDoqdxRzJ9MLVeG9BkQ/z9bw9vXMiAxpt84Yqu/7jG4pQzeU/HByt2LSrN8MfsJyU6ZbJt6CZA5Tc+snnvlgg/FvzF6OndyK/zoGbq7vEpHlSv/ZmJtrAZaNEposODY8tBp8ozQqW+qR7oZuBFWCokagG5iuFK9pIvN63+wyydsnnEPPBp3vpoiiVjVEFQIcXzqAxDmucvAuBFgYWhrd/FBwf7JB08Ue7QusR1Z7aPswRu2Y0WtfpvMOU6YRdq5ZKnG/WnUTtK8f50m8CzrEVIVUTAh6UBhzJfsfWnjAQUSsJA0g2FrBaeVRBC74tEd5180FCmNp22vi4yWUrdENQ/2DVIjMRhwlq4up9Vnt5SnOSK9Jcd0DIvZYkU82a8TgmJOKgcLDzWs9LsmQgr1+Mx7EZbrnkhMjidnyw7EksvZNVDMamsEbnounZu4Yjynx/HfUgEob90x3lOfEboPVmGnfvUkc0ytWwV+2Ip+D46TxKPTGZb5J2C286AmNxfQhWuFTQSkQwwnCTn3Wn1v2ANyPLPPFMEyyYBydLxI/4MsKX0rZ64x583GHYOn1Bk9Tkf24TgU/aljhwWZTMRrB6gFn8SP7bw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	lX+ov8mTeorbG31IU1zk8Tk2aJwe4PiicegthW2LdtYeh+/05P8lPE+ryrlNvVJUekClNgk8nEILliQleLdHPveL2ar7keMrXruZi+8dc2jmvPUbD+7oUxzqjLXqx2ABH4e5iJkAifHJWgCnkIc7OlYIHO1BK1A6+ncTQ1rUTUF/l9ETS0ZZitUekpGZNLjN4/SI3K30/uWK4OZN0hjQYSQVCve9zgwUvCbuIu4pT2AJXRsShWG0OVYGRxaPGAj4TOrz1xrapXcV511vYHWt/sYGzUA+zRiGCzJOa7iktygC9Lrjrk0qmsN0k1ojxyKLbISFgGS1ZuQ9GVAyJ44YMjyWsB2cJCwcE2C0amK8FDFq3RQpBkS0t3GbBMhFS6QuvTGJkQ+gbzQVQ2S0DtXUEv6I4Vv33rKHOhrVQcJZ66gfNecyHJQWADBatpgzNAYX
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 22:18:17.1302
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa82c924-ddaf-4fad-2830-08de83a9ec6e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000C6185.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8299
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 16 Mar 2026 22:18:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19722

There have been changes in k3-am62x* overlays due to conflicts
in DT, so update KERNEL_DEVICETREE_PREFIX for AM62A SK appropriately.

Signed-off-by: Judith Mendez <jm@ti.com>
---
 meta-ti-bsp/conf/machine/am62axx-evm.conf | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/am62axx-evm.conf b/meta-ti-bsp/conf/m=
achine/am62axx-evm.conf
index 32ae2490..01955470 100644
--- a/meta-ti-bsp/conf/machine/am62axx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62axx-evm.conf
@@ -6,7 +6,13 @@ require conf/machine/include/am62axx.inc
=20
 KERNEL_DEVICETREE_PREFIX =3D " \
     ti/k3-am62a7 \
-    ti/k3-am62x-sk \
+    ti/k3-am62x-sk-csi2 \
+    ti/k3-am62x-sk-ecap-capture \
+    ti/k3-am62x-sk-eqep \
+    ti/k3-am62x-sk-hdmi \
+    ti/k3-am62x-sk-lpm \
+    ti/k3-am62x-sk-mcspi-loopback \
+    ti/k3-am62x-sk-pwm \
     ti/k3-fpdlink \
     ti/k3-v3link \
 "
--=20
2.34.1


