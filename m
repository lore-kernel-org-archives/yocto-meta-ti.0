Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F19BD44C70
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 16:04:24 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.69])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39461.1768493059996461232
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 15 Jan 2026 08:04:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=QF7SNtvc;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.200.69, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cp+zjHibDC6ANQV79bX+xH5iEMaT3MMdf3khygRLDM1AbShi0Od+9dCQVnQ1N8VTjF1QWBuqL/OqBit6QTzaAfFpnKp4Hgqaa9S8oIE4FY2wv+yF/ZVq8zfu660vg3ucJKVxBoCN0Gs/DHj+7TJqzFDdP09x7iTizf3NzMluC6PKCSeVSzQocYj0zvvS3pxdNkYX9r/AthBGWcFLHdUqUUlTOAuJMRslTHxXKiokLPzum5p/LvthO/qTE8auso3FNeEK1HIQ2SQ2ZnkoQD15k0TwtmpnK1S1NJAM2bv7MiAsYiqEjzNtihfYBXEIWX6OU2TbtB+H27Q2Zr+2mB45Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rAyPYvMlDWha4Ejb5F+XXW25xCo7NDZ+sQW90tC2zTw=;
 b=J//3KFiRZqSFItLMiLbyRuAUhMGqFc1XgbawM3b4rKww5CanCQu5eXm7WtlzvX2zqIflAcLVFohLLqa+Nj6mYT1U48U9AeTNoyNtChjikX0omcLWj+tw0skhysbeUfFhUPmhFBiiPWrcTHf3DX97RpnCCs7fHgQt2zOgCHWO1ZiUXHI4Ho2h2oOpS7yh7tDiBM6i7odb9mSZosOwCPplKXa+fKmAPfRTxynXbD9QEBEGhPoBU7PvSS/88vhphqLSFOZ3WtFW+ek7WpVULCYCEQmrm7qVL7EKvfn9/WZJzhgGH4ywdzYmhXh8CeakyuzEXZJDoJbXB4tdtT0wQX+XJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rAyPYvMlDWha4Ejb5F+XXW25xCo7NDZ+sQW90tC2zTw=;
 b=QF7SNtvc/JGaSwTTh9mkkiOM8Z+3RzjMW182OupazX1kYBJaKyMyJAaOdI6zSMKZIgwCbvy6CDY0SETecUxAuwDCX3mHx6aWo2GeM+LUqr+0amy/Xvh4umA0/0c6WDu3DwioA6F+hVmYpZ52vmC4OYjI2KIN/714TEGncxu2fEQ=
Received: from BLAPR03CA0162.namprd03.prod.outlook.com (2603:10b6:208:32f::22)
 by SJ5PPFBC9E970C5.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7c6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Thu, 15 Jan
 2026 16:04:16 +0000
Received: from MN1PEPF0000ECD4.namprd02.prod.outlook.com
 (2603:10b6:208:32f:cafe::e8) by BLAPR03CA0162.outlook.office365.com
 (2603:10b6:208:32f::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.6 via Frontend Transport; Thu,
 15 Jan 2026 16:04:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MN1PEPF0000ECD4.mail.protection.outlook.com (10.167.242.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Thu, 15 Jan 2026 16:04:14 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 15 Jan
 2026 10:04:14 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 15 Jan
 2026 10:04:13 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 15 Jan 2026 10:04:13 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60FG4D3L1684272;
	Thu, 15 Jan 2026 10:04:13 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vgPpV-0000000CaCm-2x5I;
	Thu, 15 Jan 2026 10:04:13 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] linux-ti-staging-6.18: Add config fragment for j721e
Date: Thu, 15 Jan 2026 10:04:13 -0600
Message-ID: <20260115160413.2999023-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD4:EE_|SJ5PPFBC9E970C5:EE_
X-MS-Office365-Filtering-Correlation-Id: e04c4c5e-17ff-4148-e079-08de544fbada
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|34020700016|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?7poKc4uiURQ2EXmtoOQK+B2JKIwQkbwK72ueUI1PUzuU7nLoSvek9tAXHAlG?=
 =?us-ascii?Q?XrrGKgG3XO6OKIP1OLBLsbVisp24PEcCfA+PrVX0+jxvaGcbfwa87i0JXMBc?=
 =?us-ascii?Q?0Y3W0a82FR3AtRTUc76UzhbGxDeDqIRAP33QDVM4XOJ8ex5saaiM5OZBmbf2?=
 =?us-ascii?Q?kMeAKRXqEKpB2BdqC+G2fjxUMu7ooJuqt5fgYRr/epam1p0ceqNvfYUgk5cp?=
 =?us-ascii?Q?2S8NpCNcx40aljmKZWV3+jXOY0ZRgiGxs4ARAqjzYRtqBCrRijneht4bK8kq?=
 =?us-ascii?Q?uxn2oSsi67s0RXLWR8zEyxwZ0LlYVryrJHCmihPV4n10lbdHkbcXoEPKGiDo?=
 =?us-ascii?Q?Ag+9C/jLBYOV7yIm+AQZtlNtXtLSzfhSVzZJ9vuwBq5ZzB5WeBGU8k9VQrTA?=
 =?us-ascii?Q?ANkBCZ9Kb8Gv2Pw7qbJiJdnwXyA5Q+vaW+uyHoEc2IZU6RAtAp2FqDRPkc50?=
 =?us-ascii?Q?Ik8HCkAROZ0yXZ3ochrgVI3JtqMPaSht60TchUMhTYCX/jdY2lHZolWj77hD?=
 =?us-ascii?Q?t457JonDGxTw7azZZD9lilScSp1x1vainw7NuEWrewLcyv84k16Chq0y6tr8?=
 =?us-ascii?Q?kSK0KjlVLZsPck/9xHLGWXVOW5jJepNFnuVR7zOFFM4AHbuHhXyCfU72pMYt?=
 =?us-ascii?Q?ChRbjKjrp1RRhknOUbVpb4RnQmRkDkpnsNTNPAcFfJVHr5Utgv/jRKmjoFnN?=
 =?us-ascii?Q?0zrHopIrlULGmw4Iqfvb/0N4YB41z5CYqW/5v8+4q16c074/pEA20f7Jgfsl?=
 =?us-ascii?Q?dAYflY02wweNhKarRZ+WL1It346PwFTuraPxMp/x1HrDQg12famDeur46vdm?=
 =?us-ascii?Q?MkBfUREg6i7ybgSvotGU8nW2n9Um+7RbWqbxMsAlVl5lxUa+HegE/nNrVyUF?=
 =?us-ascii?Q?jeOXTXnEuWL6fF6kRhFLCeP3ZvLyiATGVpqt13KIfk60+rS/aK473n14bj24?=
 =?us-ascii?Q?pDV3SgmLt7D46LPDXOcdCQryjLBMcvOWjSQtCQlFIznJ8DdV3tmMSetKG46P?=
 =?us-ascii?Q?DnAOWCVcFlAtWHvwfTxtTLvsliNVtWldfsIR64oAzKV63SWYPjc/huGRsnJ/?=
 =?us-ascii?Q?ufKaQ7pjHkfBLOGf8Ch6jYGoNEM/0ojMm8K5YFuCUx2J0qNQklrcSzunRqFc?=
 =?us-ascii?Q?3QkpLhTsONJK/Qj+kgjSjPMGuU3CcQ3WYkGliX70OWF+pQ/V3dd/wIxrgYfB?=
 =?us-ascii?Q?TmOOur7a9zQ43lRxv10KZU3eqV4nFjtJpQAeMDV+jMXuC8NXZTISDNqjWeQA?=
 =?us-ascii?Q?lhJoldExJTVpaJ7uxatevviVv/z/iM169qi4KJWgU7cUFaRB6nUK9pyO4fEw?=
 =?us-ascii?Q?Ej8DDImiyQahckvDZwH98z3Z7iOQw72LIjxnAgPwlEUqIRpQhCBqlJQ5HIZO?=
 =?us-ascii?Q?fiOqq8wAnrIXvCxcAXV17zD6AaIb04074LmhV3AkG5V9cQNBPA1UWWeBr/W+?=
 =?us-ascii?Q?skZIebDy/Ss3Tvq5EG+Wvn4ZgJgF7qSdVeS8BmDONTKodw6cgYUeQZZi1QbO?=
 =?us-ascii?Q?EeRcdd1wipokJd2XucPw1d65WVVV3CZauYdDxnBpFmxJ/OZVy6msFv/gpDBu?=
 =?us-ascii?Q?8E8M9Z1jQA4LcCQGd6k8mu1QIRHFdU3O8BT7oIfx4PzkqihIO/hV79npx2OJ?=
 =?us-ascii?Q?Rv/EP4EJYOHW/zOsmuAfUZLfRbPpK0t6mmVEd5BLbK8P76nzvFjTgpV28kz6?=
 =?us-ascii?Q?4J1N6g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(34020700016)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 16:04:14.6014
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e04c4c5e-17ff-4148-e079-08de544fbada
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000ECD4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFBC9E970C5
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 15 Jan 2026 16:04:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19417

The ti-vxe-vxd-driver (out of tree module) requires the VIDEOBUF2_DMA_SG
module to be built.  But the in layer defconfig is pruning several
options from the default defconfig that prevents us from easily turning
it back on.  This KERNEL_CONFIG_FRAGMENTS entry will turn on all of the
needed options to re-enable the VIDEOBUF2_DMA_SG setting.

This might be a temporary fix as there is effort to move the
ti-vxe-vxd-driver back into the kernel tree which will clean up the
Kconfig mess that requires this fragment.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../linux/linux-ti-staging-6.18/j721e_vb2_dma_sg.cfg           | 2 ++
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb      | 3 +++
 2 files changed, 5 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/=
j721e_vb2_dma_sg.cfg

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/j721e_v=
b2_dma_sg.cfg b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/j721=
e_vb2_dma_sg.cfg
new file mode 100644
index 00000000..d7249909
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/j721e_vb2_dma_=
sg.cfg
@@ -0,0 +1,2 @@
+CONFIG_VIDEOBUF2_DMA_SG=3Dm
+CONFIG_ARCH_ROCKCHIP=3Dy
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/me=
ta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
index 169d8395..51a4f63f 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
@@ -36,4 +36,7 @@ module_conf_ti_k3_r5_remoteproc =3D "softdep ti_k3_r5_rem=
oteproc pre: virtio_rpmsg
 module_conf_ti_k3_dsp_remoteproc =3D "softdep ti_k3_dsp_remoteproc pre: vi=
rtio_rpmsg_bus"
 KERNEL_MODULE_PROBECONF +=3D "rpmsg_client_sample ti_k3_r5_remoteproc ti_k=
3_dsp_remoteproc"
=20
+SRC_URI:append:j721e =3D " file://j721e_vb2_dma_sg.cfg"
+KERNEL_CONFIG_FRAGMENTS:j721e +=3D "${UNPACKDIR}/j721e_vb2_dma_sg.cfg"
+
 DEFAULT_PREFERENCE =3D "-1"
--=20
2.43.0


