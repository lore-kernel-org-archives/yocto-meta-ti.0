Return-Path: <anshuld@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE82710A62FF
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 14:41:43 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.62])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49991.1774536096487760199
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 26 Mar 2026 07:41:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=VOyaFynu;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.200.62, mailfrom: anshuld@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LmLXrHuEo801aK6sVei57gAbkwDCzhaS5XqvOY5AqibQ7n+t+gXon6oBS8yWd32JDMKZrG0Q8h9LOKxojof7H6pEmxVmDVXdoczbAyRj/mkCJ93WD9kK+ePn9Wk9mEJZn4I4p9OJ+yGM79en+U0ZF655jgYPnJcdNcjbaXp2ZzMMfyKIKPhKG52rvv4mLQPcwNMJaK8x3LfLY8jU/qeBMIYybFZ2VC606+sZR502JnlMYNZRN3fBBdzRpjsxrtO6vPGKfLkUN3gbb7L8xcSkWrEjR9C4VFCAEylInM7rSW2qy+VQatUcSWDvbAHiA3LYy6sob5Nj6aZlsXhuRr9lmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fnv8we+yqOHSS+p1RYBMxSOoWi1CvOiHqK7hDHGycNE=;
 b=uqc32TbUnwsYC6Q69eRXQPOW1S04ph0JLwfPpOcY44xuWKBS+XaHfySt7Nl3sn37DXiGhnkghfkK8+7kHCjcjwoZGJ3CvF06kdXBaNeKIHf/N/dz325BU5ndvo/pF2WzN9JwbT21wLMN1HajZlbq0nv43cmGezp7H9IKKlnq6azh/HNztNanGQoBYRUKB3mU0h6Acm9oaZ+iemQtqCqWXHnz/wFap6ukXGFUE2lrGtdp+G2mowI1dn1QJhNcLXLX1429UR1KB4+m99atGBGjrqZvxt4yHO7ZGSMrPPtZsc63Datp2TkZ5cPVcm8CvSRKOcazmdn9n+ikgqzreVnmVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fnv8we+yqOHSS+p1RYBMxSOoWi1CvOiHqK7hDHGycNE=;
 b=VOyaFynuL21Lt8jYb2KfObX6iu3L7K7/JCIad01+4mHOyFI5fMvr0weOhPcrhFuU1r5fYB2uSN2R6eAZiMhqrn5mL4cqH4/7brSXG0w7PcUnchyUWKkkdthupJu9HZwFCHv+gKUxaEYP1f+1T6P8S4Hg56uYfICmYwuFY3ZMy9I=
Received: from BN9PR03CA0142.namprd03.prod.outlook.com (2603:10b6:408:fe::27)
 by BY5PR10MB4337.namprd10.prod.outlook.com (2603:10b6:a03:201::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.21; Thu, 26 Mar
 2026 14:41:31 +0000
Received: from BN3PEPF0000B06F.namprd21.prod.outlook.com
 (2603:10b6:408:fe:cafe::22) by BN9PR03CA0142.outlook.office365.com
 (2603:10b6:408:fe::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.22 via Frontend Transport; Thu,
 26 Mar 2026 14:41:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN3PEPF0000B06F.mail.protection.outlook.com (10.167.243.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.0 via Frontend Transport; Thu, 26 Mar 2026 14:41:30 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 09:41:29 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 09:41:29 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Mar 2026 09:41:29 -0500
Received: from localhost (ada0543016.dhcp.ti.com [172.24.233.9] (may be forged))
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62QEfSg32296245;
	Thu, 26 Mar 2026 09:41:29 -0500
From: Anshul Dalal <anshuld@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Anshul Dalal <anshuld@ti.com>, <praneeth@ti.com>, <vigneshr@ti.com>,
	<denys@konsulko.com>, <reatmon@ti.com>
Subject: [meta-ti][master][PATCH] conf: machine: am62l: adjust fitImage addresses for 128MiB
Date: Thu, 26 Mar 2026 20:11:24 +0530
Message-ID: <20260326144126.3675044-1-anshuld@ti.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06F:EE_|BY5PR10MB4337:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f4e1c41-38b5-4199-2487-08de8b45c52d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	L11f99vtdLAiwE2YFz1UFiRZSLeO8CLs1xKwY/OCsxWNGcX8hg9qAF/mAHhTKgKa98FMIDZqSyEG7Sl7FC4f407rC6FXVZ8A2WBSzdGxpIePMGjui9WqgzhaRc9v/XJYbi8cRd6KSCLVa5aYOxtEPzG6YE9cr/GhBjzc2CRRHobFmEfj0vNhvV1PFQVt66Gd9FJtD6xXQpVoLC2AvMmY66UhrB64fwilJNaHh8WhOzkqHKlij8BcTjnFBXO/lWIADJZkuIWukKIieaIKpMA/mG+20dcU+tz7vP8O+k9+He5/CUemFQQbmjcC5nvTVyoLXni60K4c0WCCDSDuYq6iREyJHk0s7z9/NN7MKy6LJaGHZjGb/9Qq0vbY+dI7oncK3uzBR521bwQ4kHp+u443krqpdmtKxiuSmAi+4juqXiJ9hGkbEXar7Jyyxc0NnWNdgNIjPT8PfP0K0V/zjwtImxUPTXBI0/PMmBm+Qcd/3S2DeplPFjGTWQCiEtQxVxtD6CTPJemD0AGiQifi9j4b2hOfRKso1Ng6YIv0KEUf6qwBSChIbNnxScUeWRTi8Sp7ugK1dxPFpUYZfPr7MGA+UnOfp4aABmj3d7LWvw0juihHT2k7yrNQ1H6YYnfSSDtAkzp5le3a42mYadKdaH/xt5RdrQOL+fKpcl7t2/Sb1nK2kb4U/oyCAHjibeKIrWwM0Ov1b5JG1xRBUn9zIUWOgmiKr3FW++7Lm3s3ANH0qWIMQVRGz44n5cC/CU0RKcvDfzWZEXAp4m6Cz0pzhVGQlg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	tlaUSRPFekgcDEaoFXtd/xGUOzU0TqIqdzG0vP7GJna8x84ReYQH2+bZG9UcLogUvaj7hhwiH38Y2TeSNjkXw/OhV6wN6wPRpnwP/WagcD8to+xIJqqFh9JN0d4oMguxY2UaBUq8hgAu5all6suAGziUY3JD6oGZ++N/0ke04PTkPSonzoeAzCermZp27ZMZAZIT+osERYe7GGewQeYh+wq3v69NgTm4ZdcYf1FyIJRzaHqzKbKgCxqOMMsEN/RU//GCrqmE3gCocQvZDSDwWePrM6FBUy0z/5F5vEy9XZ2Ep030NqLRtXdOZ+TfhVlpr6+ij2aSauHgsiax74c71UhS1e0e+Sp+zQrEbP86pgAYeM4dxj3Tf6ykBNsJCl8akG6pmKFiahRlyA0HO6HlX1+3P/gOVwiuHXojAcNzbh7M9N/8A6RRh/++xbM7kCbO
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 14:41:30.9146
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f4e1c41-38b5-4199-2487-08de8b45c52d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B06F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4337
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 26 Mar 2026 14:41:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19825

This patch modifies the load addresses for the kernel fitImage to
provide out-of-box support for 128MiB DDR sizes on AM62l.

The current fitImage uses 0x88000000 as the DTB load address which is
beyond the 128MiB boundary while the kernel load address of 0x82000000
conflicts with U-Boot's SPL load address which causes problems when
enabling falcon mode on the device.

Signed-off-by: Anshul Dalal <anshuld@ti.com>
---
 meta-ti-bsp/conf/machine/am62lxx-evm.conf | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/am62lxx-evm.conf b/meta-ti-bsp/conf/m=
achine/am62lxx-evm.conf
index a0bccf57..d8e1614e 100644
--- a/meta-ti-bsp/conf/machine/am62lxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62lxx-evm.conf
@@ -17,3 +17,10 @@ KERNEL_DEVICETREE_PREFIX =3D " \
 KERNEL_DEVICETREE =3D ""
=20
 UBOOT_MACHINE =3D "am62lx_evm_defconfig"
+FIT_CONF_DEFAULT_DTB =3D "k3-am62l3-evm.dtb"
+UBOOT_LOADADDRESS =3D "0x82400000"
+UBOOT_ENTRYPOINT =3D "0x82400000"
+UBOOT_RD_LOADADDRESS =3D "0x84000000"
+UBOOT_RD_ENTRYPOINT =3D "0x84000000"
+UBOOT_DTB_LOADADDRESS =3D "0x84f00000"
+UBOOT_DTBO_LOADADDRESS =3D "0x84f80000"
--=20
2.52.0


