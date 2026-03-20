Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B09971099B39
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 19:25:07 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21029.1774034699375746055
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 20 Mar 2026 12:24:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=e3Kq+aB7;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.201.48, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dJRlm1yTqBlUwAOWN1kbRiC/kBi2MPQMUCijI3XL894APr0dcbWjwJLRn+e73PX1pEo7FAf66nkp1blE8y1z87oZeZo6JUtd3D0fwUtPhFWBXhouHDLloUFWQRKf9ERXfdeWAuM1lyokt9PScxj5X3+u2WW0iCxVErgdWO4yVsjTwGDjDwzuBtvob0LW1UlSzBQb5boTG2lofrOwg6/fsDve8mDvQ8uCkCxEdip4XEc2R51gC511bU7YeXFaNrQFfNlVOSl6jK6MkPI/1ecb1mk6L9ZbjQ15yaFaIfBPvWYZJhzN79p07fkVC57ivtJBAWXF15mx7aJgpOmfq4KaDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aiG39yJ+aQoATtE0HTh8v5yDcJ7jG6iq9WBICcUyEbM=;
 b=GZYhEo8V37W8HNIJOBBVoeLYoV2ANfWhBqS/Q8ANfyybJOd5Nu59cAE0mGZDzB40f/K05c2qaWayJLZBmfoCfdUa/X0Rt02NgfJHiVEScxID/DX5HUjH50mkNtmPk5E0ySx3zn6mxStZB+jirBtKnt9BIO9AcRGKyNQCaXUilVBMjenPwebRCRuCo1T+V7ElXOQSoXhQIu0Ohc5p7JCx3TYNvrAzdVk/c1xHgtMwxtFSnDklwDSskO4W9QLqA6mN3wvTiiXpWeQV7bcaNMPUffzhYHxF0PLITwdylOXqrUduTsRuc4UGpM9+CXxxHve5o56PxowrwKMuj2Y63GyEkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aiG39yJ+aQoATtE0HTh8v5yDcJ7jG6iq9WBICcUyEbM=;
 b=e3Kq+aB7rUsccQ9Ww0tEdSZlsspnyGRAFzzIMKZL7E8/zx22aomkn2lE640oT/hvMMJQ+G4gp5B2aljhuNEiahjJIumYpDvBnMwcyAmWTAw/19AvXj6JmNzMLDRIp83fpSRLxUfgWeFIRcQaWVLrzlOn7hbsWMcVrG/8t4X4ko4=
Received: from DM6PR08CA0061.namprd08.prod.outlook.com (2603:10b6:5:1e0::35)
 by DM3PPFA3FC49FBA.namprd10.prod.outlook.com (2603:10b6:f:fc00::c3d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.23; Fri, 20 Mar
 2026 19:24:57 +0000
Received: from DS1PEPF00017094.namprd03.prod.outlook.com
 (2603:10b6:5:1e0:cafe::8e) by DM6PR08CA0061.outlook.office365.com
 (2603:10b6:5:1e0::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.22 via Frontend Transport; Fri,
 20 Mar 2026 19:24:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS1PEPF00017094.mail.protection.outlook.com (10.167.17.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Fri, 20 Mar 2026 19:24:56 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 20 Mar
 2026 14:24:56 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 20 Mar
 2026 14:24:56 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 20 Mar 2026 14:24:56 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62KJOuDd611349;
	Fri, 20 Mar 2026 14:24:56 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1w3fSq-0000000AX4F-1Bzr;
	Fri, 20 Mar 2026 14:24:56 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] check_yocto_rules: Add new exception
Date: Fri, 20 Mar 2026 14:24:56 -0500
Message-ID: <20260320192456.2510384-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017094:EE_|DM3PPFA3FC49FBA:EE_
X-MS-Office365-Filtering-Correlation-Id: dd3f661d-2dcc-4e7f-b525-08de86b65f15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	ovQQVA+8UFF1NoWHmoW935vCnL4GLfKoonGLNASqGOpwxRBQqwO9Jzd+dPCxd4KwgLwz03lz50JQXM+/kIwZgowOaQFxC4kdE7eYnQOlApQQxmlyTKKYwzENoo3DXq0Gsdl/T4lCqGRUVsnJE3QQ5I5pqf34cdCgv4isBoMG0EdOSi5qvFl++pQwXwtSnb/i0jhrXRNAXrJerCgieJHNnNRjplSCmYKH5tMpLMpV/zIX7wLJxlUAzin41qB49X8LgL0M/KqbBuiTRTJqPRBt8TLx/cpMfaqnge8ijTyfIaxrDXFe/m0M5KqwS0vTxpYP/Wg6feplljLJ0Jo0+nm1GFqKDVxbGGq36EpWklBIu30leOImC+cKwj73+xNXHTdUCLQJsRX99gvq8gdzuBLSDaEUbtWg0ZNxz4q6C9cKBXpD5fVGGjflyr2TJOGRZ0O8TUmF0ACYXJCxN3ubWnckN6JvUX5Jdn8MedBnuM4Wjn9cpJDORiNi0rAD7Y7F4MCCHq9Wp1oPOllxd8RAjkMdIyc9iquz4oRHT5w/KRl3Z6DWy3e68t++Isndtj56dlafCXnooAmK2chvaVzsbWl8HlXhghq2i/3K5VORhvKZ1QSh8Wj0CwinVz+W+fTJy0+Yw7sGApjlzDFM/uN5CgTaRNfgZtjiEYBwD7WxV4uW8scGnj2PopPz425CgNGo6T5v58o7zXDGLvLzTycRqeQPN04ZpidR+5jED2S2NBE72REYhFA1tuB972mMgPjpywKIonWIn/jex5Cni9hxPTyE9A==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Fp44GLHJLoNI1aaHxz6EXSCxUBH0AEpWTtcKtFzYd1f1hPmxkegin9EfnU1QjuCUoIHg3LABk7xpjT1fHzpMTe97RpBTczujwvlpiHmQp2oLsRwqXWCgrfSIiKgrdI/TiHHsOnllmFB2wqXrAF9yiSrYfAy3dceK/QdHqL/byyKaBjzjAO/op8PcQwgFy+T3wRcQN0+TeNDvSJl6MUQ/BB3rEeBh3Q6j6GF+v65XE9Us9FflM+hFk1yGw4fwbcqbxIItWznC3cevNQ72Mc3yEIg9BK1frK10rdSZZdaUilOp5kt75lujW8hjInpJUYdJomjhCgkSf/7d9UENfMYlsvaYBqYfCp+DyuUgFc6kS4c7HOgldyZr4qokt+NJbNOp04QtYOYVjD8esoRdzLjTY4ECNOu0AZDWOgoGF0Km9MC/2BV+4LAtECrtccdUYnBl
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 19:24:56.9684
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd3f661d-2dcc-4e7f-b525-08de86b65f15
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF00017094.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFA3FC49FBA
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 20 Mar 2026 19:25:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19800

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 check_yocto_rules.json | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/check_yocto_rules.json b/check_yocto_rules.json
index 038d665a..66b9ae74 100644
--- a/check_yocto_rules.json
+++ b/check_yocto_rules.json
@@ -19,7 +19,8 @@
             "meta-ti-bsp/recipes-devtools/binutils/binutils-cross-canadian=
_%.bbappend",
             "meta-ti-bsp/recipes-security/optee/optee-%.bbappend",
             "meta-ti-bsp/dynamic-layers/openembedded-layer/recipes-bsp/u-b=
oot/u-boot-ti-%.bbappend",
-            "meta-ti-bsp/dynamic-layers/openembedded-layer/recipes-ti/init=
ramfs/packagegroup-ti-core-initramfs.bbappend"
+            "meta-ti-bsp/dynamic-layers/openembedded-layer/recipes-ti/init=
ramfs/packagegroup-ti-core-initramfs.bbappend",
+            "meta-ti-bsp/dynamic-layers/tpm-layer/recipes-ti/initramfs/pac=
kagegroup-ti-core-initramfs.bbappend"
         ]
     },
     "GUARD-2" : {
--=20
2.43.0


