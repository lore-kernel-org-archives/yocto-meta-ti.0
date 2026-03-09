Return-Path: <s-sadik@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1343EF41817
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 17:01:57 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19685.1773075710241448069
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 Mar 2026 10:01:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=kMs/VU0m;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.195.33, mailfrom: s-sadik@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vcDzS7CP+XG5lq9VFb0rNyThXpGamBy63k6I6FOnjMfhxe5HVdIpMVJN+TI7oJ2eVkLPuoeUzn+x0M10hOAEMJnlVK3R/T51mHJQNfcLIf1iitpt9qJI3GkwBwYgLvKT9yz+v4R1jKCpwP+PHwiuoyKzNujfmc4ihuNLsT/wq84LMuPfnMt+Vn3ZiwVoszBw8ve098PQb8yL1PTDwpo3k9lob+TCk3FWs/XHn0S0f4T2MN6ZUVWiCnnpvrl4D1w8FjYuXPtqxpsAwsXxrZzgjxlSMi54LQ7pgwGNSheNRZgQb3TmB7JUh/yR2fZzMetoNLGMAK/1oVHVWSMEI5lI1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HUzY39iIAPexrWtFk8TMPNodIl09yr2JnPftfdZivJo=;
 b=GWWfeSBqJjcfP3bYSrxYiieoFMC6tjoIpblFpsyQamSo+Mw6j94LRCQ4IAUPGteMQvW3BF11dX3ivktkcNxYcgO2T8bLKDqI4dylqPCeABFk4l/5deCHbITewdSt5xco/19Uhx81c1jcQMhZ5m75Md4zWqZZ9Hwge/AQs5kX623qwjvRb6ITotJzwRLBmaw+mthlRS/tCZXzEBUP7HVYgQZuZ9IZMo0ZjtpqDOoN9RaNQEcRU2pnDpJ0bqdZdB56qs2NHS+UyR7rjmeW6laxZ6quV+K0OZhoJ5RtamN5O0Z5dVWFN4tzbyRHkTBSqPTePP+EpahaXb1XqQdddrkWvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HUzY39iIAPexrWtFk8TMPNodIl09yr2JnPftfdZivJo=;
 b=kMs/VU0m2yd8tqukBseCn2WPPx2rVnZQ0H0oa4SMzhkSSqwZQ8HL89deH4HKSk3LjMUMlh5VeuNrwhfJK9WdMdpeA5pk183cp1MassQL4siw98eRvWuPpQRy7l201PfNcl8u7MeQR/99HlTIUU4dV3K9TuJ2X5YJxzf4nSnf0lg=
Received: from CH2PR07CA0040.namprd07.prod.outlook.com (2603:10b6:610:5b::14)
 by PH5PR10MB997756.namprd10.prod.outlook.com (2603:10b6:510:39e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 17:01:47 +0000
Received: from DS2PEPF000061C2.namprd02.prod.outlook.com
 (2603:10b6:610:5b:cafe::47) by CH2PR07CA0040.outlook.office365.com
 (2603:10b6:610:5b::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.24 via Frontend Transport; Mon,
 9 Mar 2026 17:01:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS2PEPF000061C2.mail.protection.outlook.com (10.167.23.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Mon, 9 Mar 2026 17:01:46 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 12:01:45 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 12:01:45 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Mar 2026 12:01:45 -0500
Received: from sadik-PC.dhcp.ti.com (sadik-pc.dhcp.ti.com [172.24.233.244])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 629H1egB977422;
	Mon, 9 Mar 2026 12:01:44 -0500
From: Mahammed Sadik Shaik <s-sadik@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Prudhvi Veeramachaneni <prudhvi@ti.com>,
	Mahammed Sadik Shaik <s-sadik@ti.com>
Subject: [master][PATCH v2 1/3] jailhouse: Fix JH_RAMFS image path
Date: Mon, 9 Mar 2026 22:31:32 +0530
Message-ID: <20260309170134.2779295-2-s-sadik@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260309170134.2779295-1-s-sadik@ti.com>
References: <20260309170134.2779295-1-s-sadik@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C2:EE_|PH5PR10MB997756:EE_
X-MS-Office365-Filtering-Correlation-Id: 365dcafb-2d1b-42c8-8e80-08de7dfd8c30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	D7mvGSg+B429sgcM1T2PucvjnEzXby9oLkTrBnpJ2Kx0RCGoSrIpSbSy0P2DLMTIUh0PvOKtxkCobRlw7c5ffmKHl+0UkXie55UkksWap/y3RmhLNbV2HRgVWzz6JozOHGaD79qFnxz8H5Pjmk7dLq5VBRmop3Eb1tB+GMLfvBbE9Q6WvdWRU7gxwmLAMBO+mxhq1pxcmWp8TJC5mCHkLGuPgTFOJ8xiME9Hf2nHmR+m7FPr17mNw239vqg57eeqP4+8oE/CVoySq8BOFaDDyYXja84jiYeUsa9R/WxViyporazIQtPvFWAbXo8lbs0KH26R5GNZZalK65t30NVERgtZqvALlIFJEHToKsYT/MKQDl+Ge2KldVcrQY08faQlCSWTe5jf4WIOQxBJJz+diOJEeUAOBUCEpIaihOw616eBtgHib9znrBCNOKQaRDQ8eToLP9PAPz1Nb2jiRvnBkfWc/rA63j7D2JiOKL0ZodM43VtGCLMWLUAIMPDenUkCALXXLXkcS3a94jzMhYTJ9CdfXUscTU1ocUZ71FagWyj+L4Vbz2Squf9ee6YDf5r+CchtHtxU1ZGe583Bys4bqbzrrArL01GImokWqYzfwpiYgylankTz7abQT/4S+F+pgtSuuJ/bgBTapjMINnoJNZGTnKkHOSYyuUq7cNG0RDxQo0R4FcMCjMIqwUIkSaxRLF3I8meLfqdsZO2wmeLKE63G4P+V4Yl42VGB+ymg+xr6zLCE7JzmBzwB2/lNcG5D6NVGPww5FxBiIs4c1P//8g==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	V47FkGnRM2mNbbrgO9/I+6MGe2of5OVURA26/DaVZvR6aIzqFGoDwK5VrTxdfEA9fHSjIVssr4xBL0OzF159bOup7PTFjIB46W02kF6FrBar01PESqHi+SHQcToS6Kd0yRRx/mywM3EOfyyEky2TK/9rJUylVR+r4p6iJ3BOgluSGPRkKGH7pc49eiqI/f+j1PlwKCBtmUtzzHRdFdvTq8G59IDnuLU9CHy8cA82JRtxsqCax9ZgcgVAXVSp2sUbMRkuU8nVIN1WUDKZG2dC6RqtEcHUgQX+A6qoup/kvMk20iChz+Mza566lVKV3rYh2FhYnRtloABNxJhGIzIPtSXYKTPJd9vC61NRzmBVoYDdxqfWtZyRxbetuzqqUuoe2r0Qts2JS/JUm7/v1qXp/AZlH4VdlqJBAEKIYO4E9nUtQqwrkyILykkBFD9npcSp
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 17:01:46.4448
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 365dcafb-2d1b-42c8-8e80-08de7dfd8c30
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF000061C2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH5PR10MB997756
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 09 Mar 2026 17:01:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19678

Update JH_RAMFS_IMAGE references to use correct .cpio
extension instead of .rootfs.cpio to match current image
naming convention

Signed-off-by: Mahammed Sadik Shaik <s-sadik@ti.com>
---
 meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb b/meta-ti=
-extras/recipes-ti/jailhouse/jailhouse_git.bb
index 0113a916..7d908215 100644
--- a/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
+++ b/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
@@ -55,11 +55,11 @@ do_install() {
 	install -d ${D}/boot
 	if [ -n "${JH_RAMFS_IMAGE}" ]
 	then
-		if [ -f ${DEPLOY_DIR_IMAGE}/${JH_RAMFS_IMAGE}*-${MACHINE}.rootfs.cpio ]
+		if [ -f ${DEPLOY_DIR_IMAGE}/${JH_RAMFS_IMAGE}*-${MACHINE}.cpio ]
 		then
-			install -m 0644 ${DEPLOY_DIR_IMAGE}/${JH_RAMFS_IMAGE}*-${MACHINE}.rootf=
s.cpio ${D}/boot
+			install -m 0644 ${DEPLOY_DIR_IMAGE}/${JH_RAMFS_IMAGE}*-${MACHINE}.cpio =
${D}/boot
 		else
-			bberror "Could not find JH_RAMFS_IMAGE (${JH_RAMFS_IMAGE}*-${MACHINE}.r=
ootfs.cpio)!"
+			bberror "Could not find JH_RAMFS_IMAGE (${JH_RAMFS_IMAGE}*-${MACHINE}.c=
pio)!"
 			bberror "Please make sure that \"cpio\" is in IMAGE_FSTYPES."
 		fi
 	fi
@@ -72,7 +72,7 @@ do_install() {
 		./jailhouse-cell-linux -w ${D}${JH_DATADIR}/${JH_INMATE_DTB} \
 			-a ${JH_ARCH} -c "${JH_CMDLINE}" \
 			-d ../configs/${JH_ARCH}/dts/${JH_INMATE_DTB} \
-			-i ${D}/boot/${JH_RAMFS_IMAGE}*-${MACHINE}.rootfs.cpio \
+			-i ${D}/boot/${JH_RAMFS_IMAGE}*-${MACHINE}.cpio \
 			${D}${CELL_DIR}/${JH_LINUX_DEMO_CELL} \
 			${DEPLOY_DIR_IMAGE}/Image \
 			| tr -cd '\11\12\15\40-\176' \
--=20
2.34.1


