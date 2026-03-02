Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A675CEB3621
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 17:07:36 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.162391.1772463736752398385
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 02 Mar 2026 07:02:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=vCIKg8oy;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.201.28, mailfrom: s-tripathi1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r9BQ5BQ7/n6zs6QaBcgyNxc51xmYmAFlR14cRMnhL+mUISICNYZRWCkHoSPRCJYHr0h/5HCh1OAIjesN2Zk4OUEQ9kmqswb7990Z80R/xKIOwAvVIb6bCZUF4Bs9SlyrV7mvVRL/Uew29aFjrNCfwtCkX00FDwPwVJpSRSFm4KhuIMTNYXAQ47mvc0uACXLfw8Piyx2SgtiTdh1XgiOTWDXhG/25WrFKgT1z4x1msl7/qLtYGAcPrxP7eD/CRnhq24r9xED/8tMvokDqshVR9lj9opC+e5TtmnwiSiaSvuurFfwcWymPpRMKuhfLeK7YLi4TeQkvQJjVS/Cwixc+7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eXUcRwSImi04MxuBOsUTjV/E+JVPxRqhSarudEdFDyM=;
 b=O7oRTPd5iB9f1/rcB0/rDzp+byznRTiwt5h50UokpF/VN5oarH3c6DTaU2cnE1R5tcnXDlVXpNTn97KCjz+UVeFovsx0kRaq8ktfsTGvHig6XaQp0MzMSRWplEeQK9mxIY/lylTZHadiD6PV+XXPeW66cgpDHu55oBVIC4KypX6V/02TDuaACJ9C24k4mtiYhFivefOQvRWshxF8oLsNFyN7AH6tvPtLpghnQdosy9LBGUNVx9DlW7h0T1onZTPthXEcpJ4bvTIc90Upmua6O3YY3+1TrUXa0H/jOmmu2X2gC3geZ1LR2oIlJUaAp5O41lu9U0Np5ti6sGfElrFqGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eXUcRwSImi04MxuBOsUTjV/E+JVPxRqhSarudEdFDyM=;
 b=vCIKg8oygsysUmIFEz+1niHTNv9MDol+Lj/21oX9LJSNQLEimUQEM2N6M5hu9eEuFJ/+Duv/VFLDjfGnPLR/ANIAxT7C9UMNZnSkLF5A8EoQFxFNw07K5ZECm8x24LCXi37F+U60/IwVz6JHK+IeZkyO0YonNh3ZoR1PzBVfrqU=
Received: from DM5PR07CA0059.namprd07.prod.outlook.com (2603:10b6:4:ad::24) by
 DS4PPF26D9E501B.namprd10.prod.outlook.com (2603:10b6:f:fc00::d11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 14:47:34 +0000
Received: from DS1PEPF00017094.namprd03.prod.outlook.com
 (2603:10b6:4:ad:cafe::4b) by DM5PR07CA0059.outlook.office365.com
 (2603:10b6:4:ad::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Mon,
 2 Mar 2026 14:47:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS1PEPF00017094.mail.protection.outlook.com (10.167.17.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 14:47:31 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 08:47:22 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 08:47:22 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Mar 2026 08:47:22 -0600
Received: from HP-Z2-Tower-G9.dhcp.ti.com (hp-z2-tower-g9.dhcp.ti.com [10.24.68.200])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 622ElE71454549;
	Mon, 2 Mar 2026 08:47:19 -0600
From: Shiva Tripathi <s-tripathi1@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <praneeth@ti.com>, <kamlesh@ti.com>, <vishalm@ti.com>,
	<k-malarvizhi@ti.com>, <s-tripathi1@ti.com>
Subject: [meta-ti][master][PATCH 1/3] linux-ti-staging: Add LUKS encryption config
Date: Mon, 2 Mar 2026 20:16:45 +0530
Message-ID: <20260302144647.1705408-2-s-tripathi1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260302144647.1705408-1-s-tripathi1@ti.com>
References: <20260302144647.1705408-1-s-tripathi1@ti.com>
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017094:EE_|DS4PPF26D9E501B:EE_
X-MS-Office365-Filtering-Correlation-Id: ef024f61-a6d2-4974-0fab-08de786aa21b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|34020700016|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	yZNK6jqfLiX/JOVZcp5Ya/qj1/wDXysFINFa0q98lGs3rGhs/w0wWQBjUYrCc3u69TwbiZ+OQIeln4Eq2keop5qT/pqi1DyeeBbWc9UIMbNmurOFhyjB5rc5mZQy7DcAQGW5plyQif2Yj6JiWOK6SXo1aXduvj+hv2ModyWCPo7Y7PZ+xK5OM3Hhw7P0hr6bkLn7Eazze5VQbfgzs3mz+4kpWYbaL80VKsqf77c1wWriVeSR5Y464HEmuLdTz3Te+IZHC0MwmIQb9WfGRILJJFfuXNIb7ZNIcBPS3K6FgYc4Jjsk7yydDDuLPbchgIPgl95OqhSlPGg8a28tTmwLTHn5ELV8I6yyMQRB9PLil/VbQFplDbYf9GUqjpZvijKDs8QWRoxipAiNXQNlcV2F9jEWbWXe/9dLDmfSdEmJxH8Lp+sniHUaRLeUHA2peF3xOI/EqDMgvuvqssKK+bm6pH8CzhM4O31jwtijaGAfmzjchOBko8inhMQ9sJ6Cqziqf3EtOR+oHvDwrCYLlbpb12ISYerQbUMOhLJdy/9qdfO20ewlfmPGhdUKD5cxrjLqpPwe0yarIAPz7Y/Ta/JJ6nRlU7lSFzlpgIgA6ofHSicC30cg3bEGSL3S9nhEroT8PpQA0FvrmtiUOtWdKyhyfvPQrWXO3gsLtByi1GGwIzhV0wYJ0wJdyDiHUcdRSqg1cw8wZSoVb8cEjd/LR2T2+DQRg3nF7dwceFYhIzWqvgFeHxeNRtkhpk+KqBSbmQK77qMlgDmGY77hEpglyTNxSuaydXyFHuPs4sSUtlr7UwM4HuGja2wB2lt5Rn1E2IUKYKCa3ukDygCopKaX3+jWRQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(34020700016)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	tjB74J+/JjKOnHeb0NEc2xPeTyVbmyWVBHXsjLSXm1LGMNnJj+s+pFBI5QFl5v1CLCPhEwUcuYX/oLnP0KR13iDUCVmtkXUtXwtdMiRLLqf3HTVIM2mo4jDWCsNMHE8LY8UTxM3PmDE3eHqq0LyDxF9hMhDYVtdhGm+nmcX+QkwNv5L47mZq0Bn1g50YZjgMZ9tWQCyIkvoawwiiuTnLbMyorNixMPEB1rGZ9jeJHbI8XUriPPoTM9Tmk10PRVrXBNb7tDM9FXRwrRo3o3TN110O7gA7HDUlQbKkLjyDQxJbggQN0RXr2+BqPlBC0Xwv9zwj4zcUzc7JWbZ4zPuMI5/mqA+ozlL32enpj7UGUcA9Vx/HlOCEbR6X13n6iRey8H9UAVYKzbGhkL2Ra8Xr94HLk57z81pCK0Asl1cYBv/wqL8e/C1AXBOkG9JZaP8V
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 14:47:31.3780
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef024f61-a6d2-4974-0fab-08de786aa21b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF00017094.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF26D9E501B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 02 Mar 2026 17:07:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19626

Add conditional kernel configuration fragment for LUKS encryption with
fTPM support. This enables dm-crypt and necessary crypto algorithms
when MACHINE_FEATURES contains 'luks-encryption'.

Signed-off-by: Shiva Tripathi <s-tripathi1@ti.com>
---
 .../linux/linux-ti-staging-6.18/luks-ftpm.cfg | 28 +++++++++++++++++++
 .../linux/linux-ti-staging_6.18.bb            |  9 ++++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/=
luks-ftpm.cfg

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/luks-ft=
pm.cfg b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/luks-ftpm.c=
fg
new file mode 100644
index 00000000..234cc087
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/luks-ftpm.cfg
@@ -0,0 +1,28 @@
+# Device Mapper support
+CONFIG_MD=3Dy
+CONFIG_BLK_DEV_DM=3Dy
+CONFIG_DM_CRYPT=3Dy
+
+# Crypto algorithms for LUKS
+CONFIG_CRYPTO_XTS=3Dy
+CONFIG_CRYPTO_AES=3Dy
+CONFIG_CRYPTO_AES_ARM64=3Dy
+CONFIG_CRYPTO_AES_ARM64_CE=3Dy
+CONFIG_CRYPTO_AES_ARM64_CE_BLK=3Dy
+CONFIG_CRYPTO_SHA256=3Dy
+CONFIG_CRYPTO_SHA256_ARM64=3Dy
+CONFIG_CRYPTO_SHA512=3Dy
+CONFIG_CRYPTO_USER_API_HASH=3Dy
+CONFIG_CRYPTO_USER_API_SKCIPHER=3Dy
+
+# Additional crypto support for LUKS2
+CONFIG_CRYPTO_CBC=3Dy
+CONFIG_CRYPTO_ECB=3Dy
+CONFIG_CRYPTO_ESSIV=3Dy
+CONFIG_CRYPTO_LRW=3Dy
+CONFIG_CRYPTO_PCBC=3Dy
+
+# TPM kernel modules needed for initramfs
+CONFIG_TCG_TIS_CORE=3Dm
+CONFIG_TCG_CRB=3Dm
+
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/me=
ta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
index 8e4ccd7d..572149bc 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
@@ -35,3 +35,12 @@ module_conf_rpmsg_client_sample =3D "blacklist rpmsg_cli=
ent_sample"
 module_conf_ti_k3_r5_remoteproc =3D "softdep ti_k3_r5_remoteproc pre: virt=
io_rpmsg_bus"
 module_conf_ti_k3_dsp_remoteproc =3D "softdep ti_k3_dsp_remoteproc pre: vi=
rtio_rpmsg_bus"
 KERNEL_MODULE_PROBECONF +=3D "rpmsg_client_sample ti_k3_r5_remoteproc ti_k=
3_dsp_remoteproc"
+
+# LUKS encryption with fTPM kernel configuration
+SRC_URI:append:k3 =3D " \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'luks-encryption', 'file://lu=
ks-ftpm.cfg', '', d)} \
+"
+KERNEL_CONFIG_FRAGMENTS:append:k3 =3D " \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'luks-encryption', '${WORKDIR=
}/luks-ftpm.cfg', '', d)} \
+"
+
--=20
2.34.1


