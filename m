Return-Path: <s-sadik@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D57DE67A72
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 14:56:19 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.24])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20242.1772549772348101880
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 03 Mar 2026 06:56:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=PIDXf9JY;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.56.24, mailfrom: s-sadik@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=odqaO/Cvn3tIz0VBgawsNPZUUCcdS8ylkQ7OQcBHDGHkXrf1EOXt1Z0jWkcXHxH7V+/FjH5aiS07QkKquJkTdYvCFZYw4KqFW1B9KZoUUfX6wsdRFkXeS5RHI/X2dmhZNGzc4GWTTr3edaDG81guaBabKM7XLp8SUYS4N9/RpXg+kp+WYEfGYGePhCvRIAusFV/s6jedPakRObyJ6GbDo+Zlr6PJshrcBMIL9fGo2FjhTuA2WFnDSoqtUCGcoLRhv8FHyuChnVaE83MPTn476nACBB1ldNCJ2bktbkQ4R6etCyRo66z2ihqioipMm5u+QNZBUAFQV7+Bf30PKePcZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RlCmpY1vDs2CGDD0YgrYUPGUMV0ps2hGfN0pllpPBCw=;
 b=xUfJXLnYVW9fZ0PEEIf/J7fSgOUCiU5GW/L3l0YzXiu3MVfvT0+EWvYtsiCIDQIrbEGHDHNrenOd6Ow1c0DtovsvZ+QtaYzRxX1OZvUXb2AQJq0kR9kOwgea8+xz0hdIfnerEC3sUTw1Tx3JD0jWHX1YPgm9BNNKHJ7D0vENHkUeo1500SaHcdN7iGsj7tpWVsexDA7lyvWt5SDJFgueKmGyo1v0Vs9IHWAGz83AULjQL1Rzwhkbrk3vVKi7EyH9IFByN8cZZ3whO4hF5EaFP0Y42B3be6i57rDQRHzcF+dJBuS6jnpvTeuIfvDNuEh/cUcU5K2mQqudpDG6NKXeWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RlCmpY1vDs2CGDD0YgrYUPGUMV0ps2hGfN0pllpPBCw=;
 b=PIDXf9JYoOO0Jr5sG3C26VpeELNDpQDRvSjx2n5w9WjhcC7W1gaVP5gI1a62pxd1LsaZtHKtmdxSrNrajS6r3cD570OdGwr2Jyqs/Iw9eWiyPyN4Vw7X66IuX0+agaMghvGf8c1ieqNySb9Ic4B5wS6UGwuc7cpLgE4i/YNdVgc=
Received: from PH7PR17CA0050.namprd17.prod.outlook.com (2603:10b6:510:325::22)
 by CH4PR10MB8193.namprd10.prod.outlook.com (2603:10b6:610:23c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 14:56:10 +0000
Received: from SN1PEPF0002BA4F.namprd03.prod.outlook.com
 (2603:10b6:510:325:cafe::11) by PH7PR17CA0050.outlook.office365.com
 (2603:10b6:510:325::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Tue,
 3 Mar 2026 14:56:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF0002BA4F.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 14:56:08 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 08:56:08 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 08:56:08 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Mar 2026 08:56:08 -0600
Received: from sadik-PC.dhcp.ti.com (sadik-pc.dhcp.ti.com [172.24.233.244])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 623Eu6Cp2296506;
	Tue, 3 Mar 2026 08:56:07 -0600
From: Mahammed Sadik Shaik <s-sadik@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>
Subject: [PATCH] ti-extras: Add Jailhouse support for bsp-ti-6_18
Date: Tue, 3 Mar 2026 20:26:03 +0530
Message-ID: <20260303145603.1204480-1-s-sadik@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4F:EE_|CH4PR10MB8193:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f5346e5-42dd-4bcd-5889-08de793500d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|34020700016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	uekO74UMZioW2gSpk8Y7nJq28q8+EPOIxJlJzZvevLoy7uX9cccLhFKq3uX3/gafZCGhXEZ19F8es80E+iXxDJNJWolNot3FOAzh04yc9M7H3XBWOIjL3da21i1PKHDKqQGgOlcezXaFNg1ZI3KTcOdXiismlSAfkYFf2K23bTdye2bPHJSmSwLQvy9mVljgR+WjHLb4NaNGVKEMwO5wqEtnVf5JY7YFwsIMYgfr0DZWlOPc7+44IGiYMmaRmyA9K5IyopGhEdlZiuHgB4eIdNG6+53E4v7Eqyqrs2+0avUq4aTPQ/nDUlENk1dXw29DWGFWU+VCi+ghhCzTmZGoaGRzFRtH1s2GcRJwF4QqiyvtFIxFqwLTIITzW7A+vu+4zPtQV9YdYGNY5uxtvuGFkuYvlueN8jqJZeQ+j39nR0DGYwC2ugMna1XKN8Tggmk8oM+VLlH1P6znKlqggn/XuVc4azHnFzgBgiP/u/KbU5liWjHyMEZGYMAFOGONSFUNB2+qmzKcjHUkgTHhCGiRqAH+EWOgpV/Ul2ozgIfkFIj5w3222aZYGKXmHx1gTd3VOBWCu1rtVEzN4VRAV0I+xWJpK859+tMwYY1pxOuBHSTEGpb3ucO+0SbtOeLSXVJWUcYLjUa75Fogt6I9VzR6sR689Lr3NT3n3AYxm2AYXsTgpwaiZUPgtfzEDi6/d52+YV0Fo3PL0hIouSIbfUrO0BSf9kPB8vd3lCSRZ02yxHyLzEIoyzJpknQQb/W06A+gyi12d8MGkS0SmpBXauJDLdIl80Fyh2ZeAuv8fyXYYbM1bFGdvtIK97/4vTW4sC6zK0+q9M7FUMNfqC34JUt7Fw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(34020700016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	mtyXHUnMmYWBW+k2ONtcYwlrb7gtWnDCR4daDiVpaaB/XcKi+JVxSdK7FcoDiqR87dLFTNgfnQikzY4CoZQdv9I8a60zh+eif9TmvXV1b9+5ZVzWN8TjkZz0bIvLMk9nLfCL6bbsSRfm43wsTMOTUMXQlDb60ecO5Lj0bnajlIYACVqK7VNWSR+PAcVtl32QnyQwSR5bivBGj4okplywGyWph4XqayyQowCE5IXwq8RQFH6U0bNNZ7wbkt4YRv5P3Rer2Tq0P0cNKATpbiqnHFIRXWYi3/uxKstahghzl0Pxz2ap9SY9+pLsTiASyY1roLVmaAsiIcC7sl+LeDjWTtGQ9Q7snIGUyLqlijsqqAvC/C8oUeB1WR0WG/r7+Lq0zv9afyFjVc/n+h64YHvBAHxfRB2b1YZA4FSVghZBO/iEUWvQeykRDWbgn/HVFFRW
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 14:56:08.6354
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f5346e5-42dd-4bcd-5889-08de793500d2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002BA4F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8193
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 03 Mar 2026 14:56:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19637

Add Jailhouse-enabled U-Boot and Linux kernel configurations
for the bsp-ti-6_18 release to support AM62xx, AM62Pxx, and
AM62Lxx platforms.

Changes include:
- u-boot/ti-extras.inc: Add ti-u-boot-2026.01-jailhouse branch
- linux/ti-extras.inc: Add ti-linux-6.18.y-jailhouse branch
- linux/ti-extras-rt.inc: Add ti-linux-6.18.y-jailhouse branch

Signed-off-by: Mahammed Sadik Shaik <s-sadik@ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc      | 2 ++
 meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc | 2 ++
 meta-ti-bsp/recipes-kernel/linux/ti-extras.inc    | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc b/meta-ti-bsp/rec=
ipes-bsp/u-boot/ti-extras.inc
index ed95f483..a793a3e7 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc
@@ -4,7 +4,9 @@
 COMPATIBLE_MACHINE:tie-jailhouse =3D "am62xx|am62pxx|am62lxx"
=20
 BRANCH:tie-jailhouse:bsp-ti-6_12 =3D "ti-u-boot-2025.01-jailhouse"
+BRANCH:tie-jailhouse:bsp-ti-6_18 =3D "ti-u-boot-2026.01-jailhouse"
=20
 SRCREV_uboot:tie-jailhouse:bsp-ti-6_12 =3D "e718bbcec3ebf663c021839753034a=
224be4cc53"
+SRCREV_uboot:tie-jailhouse:bsp-ti-6_18 =3D "257704a4a690f221064e0210028e89=
86a4b4ccae"
=20
 UBOOT_GIT_URI:tie-jailhouse =3D "git://git.ti.com/git/processor-sdk/u-boot=
.git"
diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc b/meta-ti-bs=
p/recipes-kernel/linux/ti-extras-rt.inc
index 859b4801..907fbbbc 100644
--- a/meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc
+++ b/meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc
@@ -2,5 +2,7 @@
 # Jailhouse settings
 #
 BRANCH:tie-jailhouse:bsp-ti-6_12 =3D "ti-linux-6.12.y-jailhouse"
+BRANCH:tie-jailhouse:bsp-ti-6_18 =3D "ti-linux-6.18.y-jailhouse"
=20
 SRCREV:tie-jailhouse:bsp-ti-6_12 =3D "229a48602ad1557612a4ffabec6a3cbcdd74=
5f87"
+SRCREV:tie-jailhouse:bsp-ti-6_18 =3D "e9ebc825175636714e0ffa113133ef038797=
48df"
diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-extras.inc b/meta-ti-bsp/r=
ecipes-kernel/linux/ti-extras.inc
index 1b7239f9..f38336e9 100644
--- a/meta-ti-bsp/recipes-kernel/linux/ti-extras.inc
+++ b/meta-ti-bsp/recipes-kernel/linux/ti-extras.inc
@@ -6,7 +6,9 @@
 COMPATIBLE_MACHINE:tie-jailhouse =3D "am62xx|am62pxx|am62lxx"
=20
 BRANCH:tie-jailhouse:bsp-ti-6_12 =3D "ti-linux-6.12.y-jailhouse"
+BRANCH:tie-jailhouse:bsp-ti-6_18 =3D "ti-linux-6.18.y-jailhouse"
=20
 SRCREV:tie-jailhouse:bsp-ti-6_12 =3D "229a48602ad1557612a4ffabec6a3cbcdd74=
5f87"
+SRCREV:tie-jailhouse:bsp-ti-6_18 =3D "e9ebc825175636714e0ffa113133ef038797=
48df"
=20
 KERNEL_GIT_URI:tie-jailhouse =3D "git://git.ti.com/git/processor-sdk/linux=
.git"
--=20
2.34.1


