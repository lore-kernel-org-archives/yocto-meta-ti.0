Return-Path: <s-sadik@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B25C61125874
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 19:06:02 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4276.1773255958408538430
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Mar 2026 12:05:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=OuZM8YAV;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.52.31, mailfrom: s-sadik@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RzeGurkF6YNjlyYz0glJHN8OaWXl5NxpUy0VJ4jKu0ZeNDGe4LT6eCe4XVTjieMrNS5tMqd/gYe+gQ6dtXNvbY9/tmx2zglJSWWwXc9ORth3fypdiBkaw1/cnhakTlDQGPv2ERC1Z2taFfU8qDvi7q4SJ6m26+rCet3WwrHen8G+9XjTZCp/cMmZ6RTcF4PSieNDS+ACLpFn0lU7oSFoMpOIw2nC9uvDFAVSb/CFSZ6pwy/4pb/U8iVo6MdByndBV4agK9MxgsZh8/EbOnEkDFCwCTHGQ6vwjOZO33zyXKT8TcVklZ7gUwNzqFfQuY2INOOBMUjrprzKBGIyxlLxIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HUzY39iIAPexrWtFk8TMPNodIl09yr2JnPftfdZivJo=;
 b=wEF5Em3ZEH2aHztT3tOqispfPiQrfRwkZFLhwtANAijE0IUlqST1EFJtWwc47tn/Bo+yypjSVVJfl+YDayALE9DiEHdyXmpX5r2Y1Fjo1JRsPvesbXJZyt7GpbNcsAStOe8mO4K+5I2ryYnUsGq2ruiyOXUheSi04+vQl4YD92niKo9z5ePLsdPpfRsh2sCO07Ovk7Zg4QrQXw7wRxkTvx3a557yJ2fUn2393HJqRq/BSYkfgxz9J011oSo/1YEUfY4zSSv6tTCk3xuwUdey8h5WpNHqnLZoX35TfS61BAELHZNhwtLdUFVTAynftmo4XXlJeilG01Lb1ucJYxdqPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HUzY39iIAPexrWtFk8TMPNodIl09yr2JnPftfdZivJo=;
 b=OuZM8YAVj8erK2DyfHNtUA33/rbBU46NBImMQFSPawcQK2kMwMJ4xpbHuVx/Nrd2/X1zt7TCT43TEpQxFkAoH0Zn1meyYZ8wANb/Pl1J2vVR3NQyqBx5212cDihZlgdBW06he1ip9IN67OSO2t/QkOon4oHay4fER6GX15N+1N8=
Received: from BL1P223CA0032.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:5b6::15)
 by BLAPR10MB5204.namprd10.prod.outlook.com (2603:10b6:208:328::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.14; Wed, 11 Mar
 2026 19:05:55 +0000
Received: from BL6PEPF0001AB55.namprd02.prod.outlook.com
 (2603:10b6:208:5b6:cafe::cc) by BL1P223CA0032.outlook.office365.com
 (2603:10b6:208:5b6::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.27 via Frontend Transport; Wed,
 11 Mar 2026 19:06:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL6PEPF0001AB55.mail.protection.outlook.com (10.167.241.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 11 Mar 2026 19:05:55 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Mar
 2026 14:05:54 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Mar
 2026 14:05:53 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 11 Mar 2026 14:05:53 -0500
Received: from sadik-PC.dhcp.ti.com (sadik-pc.dhcp.ti.com [172.24.233.244])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62BJ5kpv896192;
	Wed, 11 Mar 2026 14:05:52 -0500
From: Mahammed Sadik Shaik <s-sadik@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Prudhvi Veeramachaneni <prudhvi@ti.com>,
	Mahammed Sadik Shaik <s-sadik@ti.com>
Subject: [master][PATCH v4 1/3] jailhouse: Fix JH_RAMFS image path
Date: Thu, 12 Mar 2026 00:35:35 +0530
Message-ID: <20260311190537.3340422-2-s-sadik@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260311190537.3340422-1-s-sadik@ti.com>
References: <20260311190537.3340422-1-s-sadik@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB55:EE_|BLAPR10MB5204:EE_
X-MS-Office365-Filtering-Correlation-Id: 20041913-835d-4538-70da-08de7fa138ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	wALfIODongiw9PAI1hFYcuwyF5l37gmupNJnscyuU6e1LdC/S4PkQDo9jymBLRFd0v7Pcizy5z8giXFl1zicOSRFUWwYFv5AMwvAA/IMzyXubtSwpp6mFXgj9H7F60JsnfHTpQzcBoNHHTinsrskiug2F1jLkVS51BcG5ivGoYTRS3mIechyQqL6fGKme1M9UKxwhdIG3YwgPaRlmITSewIIOVI4/bm4I8s4vGxBrNiBcoqhOXgxCgtwWzCV7N/kRWN2zy/9WVQBiRpSItr/5w7QI1fq4HNIuZQ5ceLrEYjrKCmrKtk/9zb0cNZQLSbGDLKgZMk7Kq72BOpaG/JlE37rwcrGx2Uhw/EL5Bz5660uGVVRquyA+oY8/FRy956Vm56WCM1sSMxieZ48g+XE0eMkBezOaUOgTjLHjLrFaRHX01p4SdUkiQexdBVYjBTN2gz035+1pfsHpWLKP1Wykr+iSlarvw57OUbycxEBDa0Hw/6PRHVeK/Lxm63wuqNE7FUxx8sQ1xApeJEqQRP7msJDIHZbPLdGFL1KKacFmN8Fq4UumsmKN9YHuixJ9SB4a7Ss7MpA0SZiYT973j49WFpg9cPVkHA321C0kTyIJwxubHzPAjKoY/u/aY+KHjvitcU8p5esHMEoJp2pCECru2oBVxn6Sr24SukhJU4u0W3/Nu4M+rZVTBrRvjbanwRpynjM9xOh5tWFEln/+uQHu2oVhNLKoVjvTtTbDCwQgG6C2rmK6Dk6ktOVcD4DuO1d1HGhbvWWW2c9uFwRaj3asg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	qlMEb5okzzpdXGCh1tIB/7WeYod9iIutpH9sqXrx6k84PDBrbtIVaqJW3EYhjux3hEYvR2+/TEIJ3fEHGoUQa60alAyWtAuvwTgCH2zXjLLNND92mByTzva3l7JqzMcAQcib0v8QIM91R1Jeac3H42Ij7Ztzb60q0SnOw7Eow1ir+la5Ad6zL0+uxeCZxNIAkE/ISGf1jnhEB280FX26sAztVbKtOoskQkFojn5SXP+P2W7HIU2yA+C1SWH7fkx8lVS2JT7wSLjqBBYRXyn2C4jRgnytDAixxlANJ8bKTByZU8ETPF9YwBZb8B4cKl4IS/TnkHth/QYKg5UG5g8v71Fb1iJG1FaaCrwbhCrfk7DNVL2l1cA0aI4+IapzGdpFBnhTpNpJik1Q+ByoH8ewF/51obSiol3pGbG5hWXDVB0r9RiGQLlsr0QUc3FVgrV0
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 19:05:55.4811
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20041913-835d-4538-70da-08de7fa138ff
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB55.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5204
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 11 Mar 2026 19:06:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19705

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


