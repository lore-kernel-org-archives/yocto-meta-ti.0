Return-Path: <y-hegde@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38755CD8CAA
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 10:31:33 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.11])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.76265.1781001082996243784
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 03:31:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=lRG0+6WC;
 spf=pass (domain: ti.com, ip: 52.101.201.11, mailfrom: y-hegde@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kriqFzGz/Q7udfGD+1jfvDDQULTOdcVVIWxywl8twJLS/Y9xb6sa1I2huOOTCVYrYkmLH0NrET5oeUpiwhyznvHBQ/913LpqhL2agmcotnldP/4HW++Shyi99T7srLj4k5gZ+0uuXDjLz//HCfp76q9PSUuNixVHO1VwSAtCYVV9gxDW0lxvQL5rX3d8n/o2ZkbfYqOwq9EglhIP0xKe8HUKH+bkpR+sRhczANcbVQdrUEt/r2TEfZIfZITvNSEsCbNrX3vMRMp0YcTItnJolngIaDsHB8ROTLAJa5KiaPSsEh3ViJk57oNIyY9890yDTO1bL50qr4o6Mr+dXz8Ccw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l2KQ7taVrCdo5b+9PeYGF3syszk0Nvo4cY64rjRAvYQ=;
 b=VNWuu1VeS6AGLLUV46vl+GRtW0KUh3BDkx5fCeOnYy1wVGybHBWH6hzmPKq9vRXYuovgwFLY6Tq1fu4mxRlphe43mFgp1dL9ROoL2tbFrez8HtaV797DvQdcfnI/YS405kfXg9K4ZbbH1le6ALwxmiemWsCbJnJN22Ni+56HooY/r33Smn7PhOb1OHIj8SWvFts2v6ai3by5jpXXVvdHuPXQMDuUwE19CnmgrLG8FJzZhzEXUIM4UCwYL1c9EKse8c5bzwkLVk2NhJZZ4YreL5pwnt1hzuMsAK5Dk1vve9Khy2/Qjm9kkSHgRiwpq/qqQcfXzVUXbwuiptVL5B3t9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l2KQ7taVrCdo5b+9PeYGF3syszk0Nvo4cY64rjRAvYQ=;
 b=lRG0+6WCb6V9NSVsoYvpmPAwTicS3O1qBxxL8mlzrwXh+cnciW0FW5vNJz8QtLveW/FR6u3ihwuzsz1Vtsf2oURWB9XbwyxRMxmm5S+QttqkNhkRBoeMSzw7CL3VqKHokwS/jNCPFCF2e5DVdC5dGmEocT3h9IubemmI9gDwj6Y=
Received: from PH7P220CA0032.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32b::31)
 by IA4PR10MB8754.namprd10.prod.outlook.com (2603:10b6:208:568::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Tue, 9 Jun 2026
 10:31:20 +0000
Received: from SN1PEPF0002BA51.namprd03.prod.outlook.com
 (2603:10b6:510:32b:cafe::a) by PH7P220CA0032.outlook.office365.com
 (2603:10b6:510:32b::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.10 via Frontend Transport; Tue, 9
 Jun 2026 10:31:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SN1PEPF0002BA51.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Tue, 9 Jun 2026 10:31:19 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 9 Jun
 2026 05:31:19 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 9 Jun
 2026 05:31:19 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 9 Jun 2026 05:31:19 -0500
Received: from localhost (yogi-work-pc.dhcp.ti.com [172.24.233.89])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 659AVHW61460804;
	Tue, 9 Jun 2026 05:31:18 -0500
From: Yogesh Hegde <y-hegde@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <praneeth@ti.com>, <prudhvi@ti.com>, Yogesh Hegde <y-hegde@ti.com>
Subject: [master/wrynose][PATCH] beaglebadge-ti: avoid building ubifs and ubi for beaglebadge by default
Date: Tue, 9 Jun 2026 16:00:52 +0530
Message-ID: <20260609103052.2451227-1-y-hegde@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA51:EE_|IA4PR10MB8754:EE_
X-MS-Office365-Filtering-Correlation-Id: 377e5076-f077-48f7-0cbc-08dec6123eb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	oDGKfBV7PFBdpiNTBjbgnX4F4n4Yq8LFkLchYccGqdCBzPkP0ELi4nvOPnVk82wxGwX8On6KD5qj9XwiAX4jZoMcp0gOynhB5EJDMv600+1TpZExDIcrgr0CMaWELeyP1a3015XcxhM2HXEvs4TYg1bAMJy1p7R73QOYWtQqKakZo6q2lD5KwVUeIMGd6MG+64RiSAAZHqGPjUAQLA8sa+5fe6tVLGYOILFypE7Tx6rZSkueTurnrT8aQU+mbRcrNagVUfx/PC/sDDNloPQBT9GB62imbN4OiTFPy7EEdQrOexAYq/TMXHca0ho4nX/OiLBtE5ozZrxzNA+xdkPI+cikPAI18fswbm77Lb7aKhgVmlSCDm/q+4eF0ExIPgMa6rg6WaHOa1RLEzUIOp8yA8rCIY+qdN7WCXtFeY6XgIQXSdcEhjX3E2ut02nvrR4SzaHm8B4F4Raut7aA9JVEMUnPDLEo2if832QzIT7s4xV/rw95AgzjvdDs/CpQQN6Gp+xS9gh5QQGlR/hEMtSmdAFENYEplsM/sRnM3gfMoE/OLgq2Lbkm33sI+TzmIQpoxGQQuwV3EUkq/F3jdcQR/CSLeMrTPF1LMGiMI3kh409eOZVGU/A45GDxpwPd6azUuMkixOto0B0kQhW5iKk3wgsNytPiMlCSZ4AkDoSmcv2AIlzaa+wI+9QNQhcf5hinOGCwL1iyP00jmjv2WUuTmZsAM89QVoU6pFSVYKI9F04=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	srL7hzVgQsuaix9qJ1VZI+KWtZqo04HojpLbKiSAk1r3IsmY7qlikPqxBwg2tBek5533wG7eu8oU0nK7M6wZAs/a9qPcpw2ci4GS6y5gbEp+qEnlQTy2+tGFZw2+mGhCx2sNwRbZ4WewyIHhbfnmp4hUjgGbi3KF7s+KBEWY8A/bSy/eCWaTcmpyT+jnVJGj1DmkYoL3CtsXHuKSNGUH0vSRXkoycFrguSDYC+jtnyIFq4rM+z2KNwAVAB8TsbETNoNPaQ+PIfwTLrmb8s1H98E470bfdPwMzpl3zQDXFdL/tBu2aPkmFqftBLsErXi8lH0846WahmF0AjW5hOLFMm6Ql/bNslVolSLZWx6UjxkIFUD3Hs5Fzag36rITFh4y7EiQwZufF11emkGDQtdUgn1etwgctGMpgt+jjMGjSJbRNgFDI+uNffFvopmHN0r3
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 10:31:19.6396
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 377e5076-f077-48f7-0cbc-08dec6123eb9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002BA51.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8754
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 09 Jun 2026 10:31:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19986

Beaglebadge has only 256Mb OSPI flash and except for
arago-bootstrap-base-image and arago-tiny-image other arago images
doesn't fit into OSPI flash. Hence remove ubifs and ubi from
IMAGE_FSTYPES to prevent unnecessary image generation and build
failures when adding packages to the arago-default-image.

Those who want to run arago-bootstrap-base-image and arago-tiny-image
on OSPI can enable UBIFS in local.conf .

Signed-off-by: Yogesh Hegde <y-hegde@ti.com>
---
 meta-beagle/conf/machine/beaglebadge-ti.conf | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-beagle/conf/machine/beaglebadge-ti.conf b/meta-beagle/con=
f/machine/beaglebadge-ti.conf
index 78525030..5295296d 100644
--- a/meta-beagle/conf/machine/beaglebadge-ti.conf
+++ b/meta-beagle/conf/machine/beaglebadge-ti.conf
@@ -4,8 +4,6 @@
=20
 require conf/machine/include/am62lxx.inc
=20
-IMAGE_FSTYPES +=3D "ubifs ubi"
-
 MKUBIFS_ARGS ?=3D "-F -m 4096 -e 258048 -c 8500"
=20
 UBINIZE_ARGS ?=3D "-m 4096 -p 256KiB -s 1024 -O 1024"
--=20
2.34.1


