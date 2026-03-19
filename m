Return-Path: <s-tripathi1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABDF2108E1E3
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 10:36:56 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.15])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8180.1773916608045644656
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Mar 2026 03:36:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=LknaHIJT;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.62.15, mailfrom: s-tripathi1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h6cKCkEElbOSSiKBe8sFddlaoHf9CtDKB6pmpWrdyVX4Bdv0WJl8CuPo7ECH4RZe/Ope1c97ZEK7EZOUzZ62fkJ7JGcLFHZkqy0V0xWu51ZrOfmDGiOjlKq5m9lOngRJxvmW9bPvb5vllplnE0+4dhdHhqIERFETsQ4XwZQHe7L8NcrY8oZmRlw/MtYEA3BeaP5qJssLe2ESS9E67EKfh9KFLBDskPiez6xKFmvQX6YxPNyakbgXzul0tr5w7ODR82PmJ1dkiMe8p6FA6o4oVv5YXW0/y1Sq/OjmR62BbwdfBktcMEt2FLTWpeYwMy6n+nvM2mTQKWI3JhxkRDQtDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ezGLhOcMetp+9P6izg/xgPA+3NoD3Wv7+ILS6Iqs/6E=;
 b=EiJYpdLlAw7MBwB6dp0HMmWyC7lLb9D8oF/P2Kt5ultv5RlXrAjpE9zMQ2k9z/BGJ3KFGBSvJzYYa218OisCy+naixR6f1FIQrRC/1mKZeQpP3Cmi+5MuJmRRc4e4GYJuobFpBarB4wuc/SSvNi6KCNBlgNthwoOY9TgegnvYCoOeldoUSUZKbfqAQiavAQHCHXS2x7PQp82veAcvBhkP5tDCL7stpp81UIye+r/Dfzr0XMKSxozrS0VxM72JmPV7+bKV+U9yGv3FY4u/w8MI/b0cIkdh0NOv5B2byk1mNO6V1lbUvVsaxLQzmxe5GNrORjo6tMKAAbCRjpx4wXd7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ezGLhOcMetp+9P6izg/xgPA+3NoD3Wv7+ILS6Iqs/6E=;
 b=LknaHIJTDfqW6iCauCzXM7D4rS0mYmEjw4of4wi6B8irtsyJAsyl4TDNAewOMif2v8kWTN7vkBPicfzD+PckUjtBKx1YdtI1kTQKV5mKb1G9gP022ndQVuzfIlcezDXIjXd9G+5jFG7RT+GwnwB2PxFH3M1O9tQzw7myMY0djNA=
Received: from PH7P220CA0043.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32b::12)
 by SJ0PR10MB4493.namprd10.prod.outlook.com (2603:10b6:a03:2dd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.25; Thu, 19 Mar
 2026 10:36:45 +0000
Received: from CY4PEPF0000EE35.namprd05.prod.outlook.com
 (2603:10b6:510:32b:cafe::1e) by PH7P220CA0043.outlook.office365.com
 (2603:10b6:510:32b::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Thu,
 19 Mar 2026 10:36:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000EE35.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 10:36:44 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 05:36:43 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 05:36:42 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 19 Mar 2026 05:36:42 -0500
Received: from HP-Z2-Tower-G9.dhcp.ti.com (hp-z2-tower-g9.dhcp.ti.com [10.24.68.200])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62JAaKot1950755;
	Thu, 19 Mar 2026 05:36:39 -0500
From: Shiva Tripathi <s-tripathi1@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <rs@ti.com>, <jcormier@criticallink.com>,
	<praneeth@ti.com>, <kamlesh@ti.com>, <vishalm@ti.com>, <k-malarvizhi@ti.com>,
	<denis@denix.org>, <vigneshr@ti.com>, <afd@ti.com>, <s-tripathi1@ti.com>
Subject: [meta-ti][master][PATCH v7 3/3] conf: Enable dynamic security layer for LUKS
Date: Thu, 19 Mar 2026 16:05:33 +0530
Message-ID: <20260319103533.2431033-4-s-tripathi1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260319103533.2431033-1-s-tripathi1@ti.com>
References: <20260319103533.2431033-1-s-tripathi1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE35:EE_|SJ0PR10MB4493:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bc8c97e-6bba-4a15-3aa9-08de85a36a94
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	2lW0xxgCXhmRq5LUTSpDryv/F2g4fIxTh5kl8k1tHQz5d64mCS5LtSGFPNh6u5nTWbxaau+CKwGxXMxz4l3EVvnHoHEM+rrwVzu1qjtiaq374KzArENCVq2fDBKy200WdREHcrWs6c45GNL177TbvXcwO9l8UNIAiH7IBG+KQh4Tk728V7ECCltAKMKRJSJ79fMo3oo71fSiaDjxTZAPehwHUsQbs67Rlbz3sUyedxZ6Tz/RfDSW2+KHg9g8zw71INttKeyC2bB8VGKW/c6j2LbtihUan7S00YufVLXwnNxSs9TkEnAdWBK2ul/tWrBmQ6E/BBGGkbGCCyBahVQEwCJ+l8gMShqhQIW22Pp2jPGf4qd4NeDXYrK/goEYmPqDBb/+kYjRqc5BxUpNQVxy9hCXq64rS49+aXW3Uy8CUDro32opr2Bn227NRjMDxRvt/he2i3CHMQ79bfFDE9fLR1Cn5/98O3qvOWwDjhVWoZbVKutZKLVKUQhoRjK/fZPTHp7OntYj0hf7PUz0hzDI4AX4fQPo3V3O1SVrmZFZzASrqvS9QlvSKfBptOlLSuj4D50mQhAgR6Q0FYtI27c+ZCj+OMa4m8U/1wLbX81Q1ixb9bkPQIqRCvf08gC0B+DO+hXrO3KFMueKmoSzidqKKcPbytHuYIjvXHQMVpqBDH/FnoK6uioZMvunk/iIiC22FMgZATA2QackbxgHgrAZGPoAsWo9GGBntwPEJrF7yc2FtlQnKq1jh/8h7X2RV4Wh/vUeJPW6WihojlMe/4cWYg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	gQh1r8g4D1xzGQOH0jGaBew3gf5YygKzkX1eb+K7YWhEA9zrBixxdgotPWnp83hCIu0Vp2IB/XkyJnlwtLxCoUksSMiTr3k1idxoUM+LsN2oLLptQojKUkm5i4pKWp++VYEv2qvLiwdpfN6wh6qWvlA1BawOQwd0zJHb01wMchoHRE1jOuSynOP5reGvybQTHPMrXoiT6ROH5PdjSnweVuSExWnjqCOL/679TNTgkXifLcQuyNd3qMECUbiMpSPHb0Zi+VrjsV08obWZ9ArdULRGUO/JFg7PUPCKcDnl6oX+gz9UDtViM5vkAw/diHbmMnLbZYtURo/iS71T7SkWjh4dpUpdLRSFLLfnjNtUBHK5F46ILfyEWrl074AVDy5wwHLzlDuK/HV2pDUAlgoI9+gyp/Bo0lXxMcjjTCC0a3ltd74PrWQcULILu+loh2yK
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 10:36:44.6604
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bc8c97e-6bba-4a15-3aa9-08de85a36a94
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE35.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4493
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Mar 2026 10:36:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19776

Register dynamic-layers/security in layer.conf with BBFILES_DYNAMIC
for both 'security' and 'tpm-layer' collections to conditionally
build LUKS encryption support when meta-security/meta-tpm layers
are present.

Add meta-security to LAYERRECOMMENDS to document the optional
dependency for LUKS functionality.

Update ti-core-initramfs.inc to auto-enable initramfs generation
when DISTRO_FEATURES contains 'luks'.

Signed-off-by: Shiva Tripathi <s-tripathi1@ti.com>
---
 meta-ti-bsp/conf/layer.conf                            | 5 +++++
 meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
index f78da573..36d05b5a 100644
--- a/meta-ti-bsp/conf/layer.conf
+++ b/meta-ti-bsp/conf/layer.conf
@@ -20,10 +20,15 @@ LAYERDEPENDS_meta-ti-bsp =3D " \
=20
 LAYERRECOMMENDS_meta-ti-bsp =3D " \
     openembedded-layer \
+    meta-security \
 "
=20
 BBFILES_DYNAMIC +=3D " \
     openembedded-layer:${LAYERDIR}/dynamic-layers/openembedded-layer/recip=
es*/*/*.bbappend \
+    security:${LAYERDIR}/dynamic-layers/security/recipes*/*/*.bb \
+    security:${LAYERDIR}/dynamic-layers/security/recipes*/*/*.bbappend \
+    tpm-layer:${LAYERDIR}/dynamic-layers/security/recipes*/*/*.bb \
+    tpm-layer:${LAYERDIR}/dynamic-layers/security/recipes*/*/*.bbappend \
 "
=20
 SIGGEN_EXCLUDERECIPES_ABISAFE +=3D " \
diff --git a/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc b/meta-=
ti-bsp/conf/machine/include/ti-core-initramfs.inc
index 9d3cc612..15c05e04 100644
--- a/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
@@ -5,7 +5,7 @@
 #   TI_CORE_INITRAMFS_ENABLED =3D "0"
 #
 #-------------------------------------------------------------------------=
-----
-TI_CORE_INITRAMFS_ENABLED ?=3D "${@ '1' if d.getVar('TI_CORE_INITRAMFS_KER=
NEL_MODULES') or d.getVar('TI_CORE_INITRAMFS_EXTRA_INSTALL') else '0'}"
+TI_CORE_INITRAMFS_ENABLED ?=3D "${@ '1' if d.getVar('TI_CORE_INITRAMFS_KER=
NEL_MODULES') or d.getVar('TI_CORE_INITRAMFS_EXTRA_INSTALL') or bb.utils.co=
ntains('DISTRO_FEATURES', 'luks', True, False, d) else '0'}"
=20
 TI_CORE_INITRAMFS_KERNEL_MODULES ?=3D ""
 TI_CORE_INITRAMFS_EXTRA_INSTALL ?=3D ""
--=20
2.34.1


