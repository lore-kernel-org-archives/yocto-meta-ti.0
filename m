Return-Path: <jm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E33CCD8CB2
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 22:11:43 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7497.1781043100383023274
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 15:11:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=PKz8fWMF;
 spf=pass (domain: ti.com, ip: 40.93.201.4, mailfrom: jm@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SMJjVqyl4rREn7q2OCFfcuM50cA+CMQ+ht1GQjbTo/7HoFh6uobyLsQFmlse4GRip8mYsbaR3MZw5UZ8F3LX0tXocOgnDeirOfghY7D/XV3udhWmJcIlMrwolGeLO5V2zONFopdAOUEFVN4cbc+9dLOBgoQMJujvi1/d7I/QLOdXUqjG7NjexYs9eJyIFg2AGdQmp4WwrV85osuP6vQNyY/LTBiQxYPSj0OyNFT8iSQOKdA6fruZdYb4UXp1Y7YqQe3X0eCgwFvn3LRuor+EUUx27IuHqAOXDG4CpeBPaOI86QJBsz/c7V9UHex5xWWdlNd5IJ6dsQglMV6pxTfFyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B44mfLROqPcZ6/T3Q7wd/vcoZPXdMHC22e8OkM605eI=;
 b=nt6ORYNBcr82s9vsVf0GkJh2FzkONcrhAUbF5yAbuaJs1bkhPGrrXfwjTeXRCwAfVdkovWp7ljiCGM/waDfoXCCy1jq0/rJBXCn1rKxyP1XOh/Lg7iaQXuigL1IO4ju46nlfbhgYz3jm5KfqRzVb1JFX/RobNx5u4hDd1ZLb80wjtssObWywSV4VWQYz3C67aWEYr8mn7mGuElfQ1AA3Jg1oPqgUZsErlY+zGOIiIxL/6uyCgXOX3lxOorLMF8dUzyPMhurDVDghms0qqSh32M2mmICpBvT5zTjbCQHHw+oCBca1Q3Oz7yaFWig/6BFnU1CzOeucqxmIVRgvw6wUOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B44mfLROqPcZ6/T3Q7wd/vcoZPXdMHC22e8OkM605eI=;
 b=PKz8fWMFZWYdqtlxHrhCHKIQV4KpbYLJ68XafYVFAGGPd2p+Y16R5FUN9teWPZ41jm4KEuqElMhEkl4rnHjCU4uIl4e+r37EKRieSg3cECeZUME5L8WZLWqUxFo2kw2ZGIOgcnkgtM9ix/kiqUlESClU8jE1hVz4MknpxrKSxIU=
Received: from CH0PR13CA0036.namprd13.prod.outlook.com (2603:10b6:610:b2::11)
 by BLAPR10MB5187.namprd10.prod.outlook.com (2603:10b6:208:334::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 22:11:37 +0000
Received: from CH1PEPF0000AD7A.namprd04.prod.outlook.com
 (2603:10b6:610:b2:cafe::23) by CH0PR13CA0036.outlook.office365.com
 (2603:10b6:610:b2::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.10 via Frontend Transport; Tue, 9
 Jun 2026 22:11:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH1PEPF0000AD7A.mail.protection.outlook.com (10.167.244.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Tue, 9 Jun 2026 22:11:37 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 9 Jun
 2026 17:11:36 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 9 Jun
 2026 17:11:36 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 9 Jun 2026 17:11:36 -0500
Received: from judy-lenovo.dhcp.ti.com (judy-lenovo.dhcp.ti.com [128.247.81.193])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 659MBaki2518244;
	Tue, 9 Jun 2026 17:11:36 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, Ryan Eatmon
	<reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <denys@konsulko.com>, Andrew Davis
	<afd@ti.com>
Subject: [meta-ti][master/wrynose][PATCH v2] conf: am62dxx-evm: Fixup packaged overlay list
Date: Tue, 9 Jun 2026 17:11:36 -0500
Message-ID: <20260609221136.18510-1-jm@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7A:EE_|BLAPR10MB5187:EE_
X-MS-Office365-Filtering-Correlation-Id: d65124f9-7c15-4390-bfef-08dec6741310
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	doa1eAlwMaorqflJA88rXEymKkTCejbP4LPRof19pS5btoz8GJgUVhncvgcIlWsyRJBHXfhFAmgAviRBGq83uXHSaKtahG2bl5j8i/yGVn4I+MB2hx+bMTinYU482GvzHt//Tcp9ZmMgtpNphamXG9zXIWvxSkerDgQbTemoo0ZUhfacw+4y34nG0P+CwGJSFBy5PQ8MAtljNPbaclLJveHpksvsScMwOIuIBshs2KtHEztr1eRfF+ctfW5wW5QA5An1Y/X7OAAN3J4crJsPnbn02X9dSJHSWzGCZlTTBQkpxrM3RQy/rq/sRzKMpF2crApHmZLUAPez/Zbjq4ZOKOm4cS6xFtGXQH7Bz8Fa2c1Rf+B4WEvXRPlkA/SFBtR/H78O6Tsl5GLdrTeFR/QtwdMx5giRamWihA7Cc/Z6GSga+G72cGu56lP7gzzJNyuoJQAjeU5jyiBu5QoZVuTAfJOZVOBXWqnfnFN7pxWOfmnPPEds8zIMHesUj3gLbS9baquytFzvx3nFJy1NaQ6iF1lyxJasIAzbaRPpX2kY/oUJxYfBL/ecpI1W8RWVX0p8CIHhYp2wRoO4F4YTy4L9tW9jKWKpn4si4cSZQDiCePjFs2sVfiRS+l+UvjTkkdvivV9v/mRf5fNXBZ3yOrFgEyG1PaH2Qj5SYnL0Nc9hKFLyHs61cxYA/zLQ/As/S/kivYDwdGj7wF6LoIFmAOSZxC7jNB2ByNuPJSXin4NIjEo=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	8rhocQbaGC4Opdz4eRadFqlbh1ryA9M0g4lJeb+S5ZNsLx01k8npMBkj73s0TWzkv7GzHnMOukhxR2ipRyBsEejpZT5lUFmwD956ux4czITRFEPt5MvUnjEZ8fvUwsjs875Tl0Cstmct3KNhg+yzM1CAPJEYafCYT3vn3oDvsnSrD4elBlqaMJ71urKCnW344C7buquTD6Ip/jsng53j1n5yk0I0J8qv0+kAtV7cV5n66ziGuPhFxcOVWNDZQbyiwwnBlLn7iZlPvmLsJyAVSpdJCgq4N4ElgrG2CLhX+aT4mvGsCLVuIId1BYLRlbwexKmHXh+55bRF4FcGZdK+Njmskdc5IPgwOR1IUNKw9Knn7sHFhfj8Qk2Aj20IEk3D+u5hXCQ3Hpi7Ngu/BoPJ0jEzoiBkQhRsNBSWzq714ymkt39QTGmxZ8+VQFsu+PAQ
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 22:11:37.0532
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d65124f9-7c15-4390-bfef-08dec6741310
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD7A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5187
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 09 Jun 2026 22:11:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20001

Some k3-am62x-sk* overlays no longer apply to AM62A/AM62D boards,
update overlay list packaged for AM62D mostly to include the new
k3-am62a7-sk-mcan.dtbo without dropping applicable overlays.

Signed-off-by: Judith Mendez <jm@ti.com>
---
 meta-ti-bsp/conf/machine/am62dxx-evm.conf | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am62dxx-evm.conf b/meta-ti-bsp/conf/m=
achine/am62dxx-evm.conf
index ef9df2f7..b723d457 100644
--- a/meta-ti-bsp/conf/machine/am62dxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62dxx-evm.conf
@@ -6,10 +6,14 @@ require conf/machine/include/am62dxx.inc
=20
 KERNEL_DEVICETREE_PREFIX =3D " \
     ti/k3-am62d2 \
-    ti/k3-am62a7-sk-edgeai \
-    ti/k3-am62x-sk \
-    ti/k3-am62a7-sk-rpi-hdr-ehrpwm \
-    ti/k3-am62a7-sk-e3-max-opp \
+    ti/k3-am62a7-sk \
+    ti/k3-am62x-sk-csi2 \
+    ti/k3-am62x-sk-ecap-capture \
+    ti/k3-am62x-sk-eqep \
+    ti/k3-am62x-sk-hdmi \
+    ti/k3-am62x-sk-lpm \
+    ti/k3-am62x-sk-mcspi-loopback \
+    ti/k3-am62x-sk-pwm \
 "
=20
 KERNEL_DEVICETREE =3D ""
--=20
2.34.1


