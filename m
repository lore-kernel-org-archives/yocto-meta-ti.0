Return-Path: <s-sadik@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B786112583D
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 15:01:26 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23238.1773241281385456658
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Mar 2026 08:01:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=PptupDqY;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.48.23, mailfrom: s-sadik@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kVusEYUmLLOmgJLkKXYuaN9OhJvekQ+DpAFFlDs5vI3q38QQIVblVtd/1zXRklQTPreoH9Q65h8vc8AHyDrnKaNRwha/96Y1r0Piq+uazaFYqm8PHCQrZQbYlI9s9ajP0S2LzHYCGvLtz0mlOQDRfaD3u6egUEXIRCiv8Nq9v56bgKA7yXqJczNQKUL6St8dIYBuhbXUNjnTTFvPGyEVbYqGSmOV1IALXKCTjUQ30y3OXJNyKFLXjT2OFSpQYdhCzhXOw1WqQEnVhFZtR2M2gSr3TWBKBZOosCX8Q1qMdOPqPLveVwxkU1ZaT1a0krQcHL/1HABSWZ8sW5kSRmWYDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HUzY39iIAPexrWtFk8TMPNodIl09yr2JnPftfdZivJo=;
 b=mMBE3JPASVRNZHcEI0IRENymg/Fo1SWRX6mhEF/rmi/RMqTthI2LtU2rVGiQySkfLnv1XZof0AAT9URzQbQ4Il2/vPAeyVTz+KjUj4Ozsv90/WGURHeljSGseR7oHe6CrCzHLSowwyrEon56iDrHA2KqCImLcpzzFTXHHKQdcazq++rnxv5W3PG3LWdrQuvEj9dPNH+YoMR+GtbAmTIwHY34aIwLDJCoK88T5+cahHcUQNowyVvXhCavYIVq5SmIrVOhvF1jNG4cQK+bcXAikyhxfAl6ar2UKLV4GTqlGhlc3k1lWQ4rJAf7/4TRUOCYT1vvXrHQiSmZ0RVt/IRIwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HUzY39iIAPexrWtFk8TMPNodIl09yr2JnPftfdZivJo=;
 b=PptupDqYGNhChscExbkfGFpbSXfw4vx0VO80k8DHY45Kf/dn+YC22KxkxsyHTnmhn9Ek8/kMCMQJeiSK0zCsMYaAOMZCmAzfFOFrEDrw+awF5qkcTT4JOFAatVZDtN443/s2ohS5fQU9mTYhmQWLfcnbQNi232u4zthZXwzjrS4=
Received: from IA1P220CA0020.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:464::13)
 by IA1PR10MB6242.namprd10.prod.outlook.com (2603:10b6:208:3a2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 15:01:15 +0000
Received: from BN2PEPF000044A9.namprd04.prod.outlook.com
 (2603:10b6:208:464:cafe::bb) by IA1P220CA0020.outlook.office365.com
 (2603:10b6:208:464::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.27 via Frontend Transport; Wed,
 11 Mar 2026 15:01:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF000044A9.mail.protection.outlook.com (10.167.243.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 11 Mar 2026 15:01:11 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Mar
 2026 10:01:09 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Mar
 2026 10:01:09 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 11 Mar 2026 10:01:09 -0500
Received: from sadik-PC.dhcp.ti.com (sadik-pc.dhcp.ti.com [172.24.233.244])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62BF137i534375;
	Wed, 11 Mar 2026 10:01:07 -0500
From: Mahammed Sadik Shaik <s-sadik@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Prudhvi Veeramachaneni <prudhvi@ti.com>,
	Mahammed Sadik Shaik <s-sadik@ti.com>
Subject: [master][PATCH v3 1/3] jailhouse: Fix JH_RAMFS image path
Date: Wed, 11 Mar 2026 20:30:58 +0530
Message-ID: <20260311150100.3275513-2-s-sadik@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260311150100.3275513-1-s-sadik@ti.com>
References: <20260311150100.3275513-1-s-sadik@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A9:EE_|IA1PR10MB6242:EE_
X-MS-Office365-Filtering-Correlation-Id: ad38a536-7196-412f-de7a-08de7f7f08e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	TcWIb/Va9FmzNN5IKvyDaQWFIqlzJnp1tJQEbrO6DozIWx/fhycWRjMTLJwA9tZSVBwgwWq1TlOX/8N88tgWN+pRN8wIZhGT5z+CGx0Yvs/ioq51LFKGS+M6d/+6TboNZICFB5BiZqBGMjiblt3ZuPMQ8sAPQiPK/ZsV05Gmyg6pl2mD2wePdZztglG34f8W5ipkeOq1AnBLNdplIZNB0UwGoekd42lvdXwMk8v+8tTwCoj/5qcRtBw71/fmgDjZ8TVUGAqqLsqhGtC8rXEN264fUSgBbXDUsGETClR6ruGg4ACz4L6ZOaBX5xYZEj7EDfQcsCjs6kwBqe8kYvgKaWDWvKYbbBkZsmx5iIitHMFTWmQuLvD/QofgALzmwmchv6JQ+vrqfxLxQ77hMPiAboECZDm8RXpeiEGnydWx6svu6jR6Pn78EAceYXsdssYX7C6tg7LVfGGlO1adWA9ylhZX9+wmWafZnDBjLW8JOOiQUbnHpXboXF5hFhdikbQmRjkmtLi2GPaHRQe80MUG1q4xk9qJBNmASk6N31pMYIMnrUMtL53gqU/W6NbduvUPTZ0ThUtzUj80fgPGIC79b8+jMyY93x6LUEZTTfuVP7A49wbsX4r2D9OCJ9ZL5RNyUN2x+q2sDhsKSZOT2zAhAvpzpPyl7eB9pgMg2zFoMcZNuUu3seKoHODW/q7VA1OPe3r3fVZ/pU9WR8YarNcePngHvF8J/ZunKeXTQEtEDwV19xi4S9kcmk9J5wh1zxpceBIFP/49PZdiGia4LmlqaQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	zeKK9PQ1uq6F1ydfWsVkVml4awtNk4vLWMtaW4uPkeBNMGakx/2TlvntiNMXnCH+O6u6Mwd1A7lqDKrF1Fn/iAXiWqYxU8Hidip4sF3MUfFlcC3Hqb6CTebkGqObX6Jdiey9u5bwfp6oaUuY7TtLFAB8YAu9ggh2NBd5a+4OC/NPlNZ17priWYpnuFxJVyuinlUt/XbaeDURcGk+CqTN0d08Y5tYWkMXrvcrx5fHFbRlfMWjw/yRDZmwtckWFc66zbajAKzRhc9iBSXJiVbHJav4hf7Q7Y39r7TP/spPQTbt98Zs3BMh46T7yVoQaJZfsvfBJ/0wkM4t5EaV7ExnGUQ2uOpLhmAvH23Wwf8v9NJ5yUtsziR8eCcsJwP8Q497IYE7bCRBZvDn9FM3A4Wn+B9ghQw2Eqx5mKQ3IFoFwGdV0Wv7VsEqiaTBJ7Tx/Suo
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 15:01:11.8683
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad38a536-7196-412f-de7a-08de7f7f08e3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000044A9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6242
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 11 Mar 2026 15:01:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19699

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


