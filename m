Return-Path: <s-tripathi1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7A0F103E195
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 14:58:40 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16254.1773845917364740448
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 18 Mar 2026 07:58:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=dEGE8Evn;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.198.17, mailfrom: s-tripathi1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xtbc9Vf1qMscAh/tN4zpqehtIWRjOSPb40aHWIHT8PUslMqHnoVfL6OffGUR60bgjke5J8y8aRm9NBvePGTrC2IBcQqxpMMa7AGvk+hcuuIoGUBc1tICzsbLyvpCJtzDq1jKHhMLZKvGjjItBqpJNQjYiP92hdpyOh89liGcwK1tLmWialnVQVoS+PmAuetVWqpuUrwaInqxw51/0wZ6jV+MNR3FLXlJIJzSARcsFIFT+IKL2I0EArQ08WB1ZnBM8Jp8H3iDf2zkEWu11hiDMSvjdPKUACJpTZKrWVYBKJQsdXBEVQDbYj04Ta1k84FrQtcncpAz3nr8R0cHAlFxRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vs1DJbB+1uT0bMMKBnKiBwrGS/yvPYxCuRs4egd0kZw=;
 b=w+VcOKWFql+XkBg7PA4RzyjlF5qiNoEJ8YdKEMF3ylTfTladw34T1zkd8CeiqiXcdt4lJdvcHO5oNV5u9PUmHZiuQqGk3FZQ8HmCB3EW5dxYR/x4pfMWW8TXdyFoYvvsiUrxMVNt1WuPDEc+fsT3a0lbgMGmm20g2rZaEsoX+Zw7CinOBsqkD/j3Jci5qXcG2uck9FmvQn8qluARr19QHMumkbWl2/ZiEWcV058nQRjZ5g9QlTV1uAT7v8Tv+KtJnVIGIJaVGcjVV0l/jbzW4KskIJZh5ScT5WERQyiZ1yGbmsOHJWIZQUz/NS8Ywl14Mh7HwspSkD0UrsS4NSDy7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vs1DJbB+1uT0bMMKBnKiBwrGS/yvPYxCuRs4egd0kZw=;
 b=dEGE8EvnZMPTAHDcmuj9v180r5iWHDnsTJ+LOOlwmHkR68jhrAtK0SRvd4V++gUSDHxZJOvI8hwVEwrXhr4cBmFpJ23D/bEuL7yIHFlALM5SNo9eoftfgxZTHEmgxVsSCXZn43h7/YtPQaTe7HwjFqlDCKLHl/9bbA+rNjvTYuI=
Received: from PH7P220CA0120.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32d::22)
 by EAYPR10MB997806.namprd10.prod.outlook.com (2603:10b6:303:2c2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 14:58:34 +0000
Received: from CY4PEPF0000EE38.namprd03.prod.outlook.com
 (2603:10b6:510:32d:cafe::42) by PH7P220CA0120.outlook.office365.com
 (2603:10b6:510:32d::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Wed,
 18 Mar 2026 14:58:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000EE38.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Wed, 18 Mar 2026 14:58:32 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 09:58:05 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 09:58:05 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Mar 2026 09:58:05 -0500
Received: from HP-Z2-Tower-G9.dhcp.ti.com (hp-z2-tower-g9.dhcp.ti.com [10.24.68.200])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62IEvrjV1014945;
	Wed, 18 Mar 2026 09:58:01 -0500
From: Shiva Tripathi <s-tripathi1@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <rs@ti.com>, <jcormier@criticallink.com>,
	<praneeth@ti.com>, <kamlesh@ti.com>, <vishalm@ti.com>, <k-malarvizhi@ti.com>,
	<denis@denix.org>, <vigneshr@ti.com>, <afd@ti.com>, <s-tripathi1@ti.com>
Subject: [meta-ti][master][PATCH v6 1/3] linux-ti-staging: Add LUKS encryption config
Date: Wed, 18 Mar 2026 20:27:30 +0530
Message-ID: <20260318145732.2115521-2-s-tripathi1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260318145732.2115521-1-s-tripathi1@ti.com>
References: <20260318145732.2115521-1-s-tripathi1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE38:EE_|EAYPR10MB997806:EE_
X-MS-Office365-Filtering-Correlation-Id: 33d679d9-bcb9-4e7a-ebda-08de84fed2be
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	XFw1yFFxcku+qQFqcuPvtc3m77NusP3p3v6WzCX72LRjCoLuuT6k/nPQln205TS7/kvj2eCaurPHddZOdHaoIM7z0dp/Ksq9aiJonM3ilmVQaTW6lSiBlM6ZPpwQJPXOCPcjOUVfiBVKQW9Rajd6hUnbAxWbOAx9y/wtcWssfq016FcgCoZgy96sLCxMrcIYm6VQa+RH8nwM4nztOuVzqkXrUmCh/o2psV7cAAm1gCNw3RBRhW+whyMz0lOGEKkDVANkHko9pIXiwVQ2TRjZqDjdTK1w3Rn1uMr7nixXRHL1STVGh8dmF1Mh31sEMWd2zMk/Dgt2dA0MOTvCjtAAADRWEDsZCl7NK4Xxw3CiYXwvDdZCVNl+ssv5pEkdVTxtfLrjqLBVSm84pl+iwMsLaNfmSO8+Ft4Fhc2O5Qs3X/PSEOqHj9V7q7cPBaTPPAKfi4XtJV950Oubbia86+WFEZXrbjk5WYoI+g9h+3T2z0Mz7EJXiPGHQdBDphPEdUyXoxpilUtIuEDmzQslLIvnzO9bWDPRuifqw5cDOaNUk7NJddAtPyHNUL+i5D0SwjBZV4K4TzQLbVjLkdqtXLrXykrZ1GwqLGYCT5iZzVBZE9o1WqhcPfSY1sfIa5WiOHlo2mD1/KvYgvxCQoXeZvap6Vy7izjXJnP+SR9ru+ZRIT1HnM9ZC471OLipGnIU5Q+26KecY4uWw+SQOwYkq99+MPvo29oyElPL15XSJ1GTxGp0KcsIY215crpQvz02+gyuZKXPwBBMJGZRMdBGMywwkQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	N0RNosFC8h+d7I0Tg+Z14eOWdMFPUEfw8jU7X9YjFj7dN3qfI6hqee4eHVooiVGOkVINY18NSw9Gbhq/AlVK7SNkS1YfhKVAQWSr3OHhxYCZjyietvtumSBk1R7TB19pwMK2CsCfb54/9U/jfgTmHOM0dn7/ry+bg2hVA6YEPQPuzE0ozrVGVu5lqR6J4vsfcWrd69vrFlEaQmEfqo2u9DuahFK5mj+Dww+IT2ZNk7EfGn7IGifb0USccNqrTYlb0xOBRuLNmOYyMguzTRjm65XBUclj7K5ST8yQQ73XZ/bdBOpJHKuEKvCjWlRllD4EiCMNnewe558Hbbj0Mxth5Szx0QWgGTYArnCutj2qL4Nnb46QY413i3NskIcpLWcexAeLBp1sDp8eLGmJ0yL+mWPlb4YVqH/1UNgY9J0RAdgvjCeIUM++Q2vFzsWV9Jen
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 14:58:32.4574
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33d679d9-bcb9-4e7a-ebda-08de84fed2be
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE38.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR10MB997806
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 18 Mar 2026 14:58:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19760

Add kernel configuration fragment enabling dm-crypt and crypto
algorithms required for LUKS2 full disk encryption. Config is
applied when DISTRO_FEATURES contains 'luks'.

Includes ARM64 crypto optimizations and fTPM support.

Signed-off-by: Shiva Tripathi <s-tripathi1@ti.com>
---
 .../linux/linux-ti-staging-6.18/luks-ftpm.cfg | 22 +++++++++++++++++++
 .../linux/linux-ti-staging_6.18.bb            |  8 +++++++
 2 files changed, 30 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/=
luks-ftpm.cfg

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/luks-ft=
pm.cfg b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/luks-ftpm.c=
fg
new file mode 100644
index 00000000..291e5ee6
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/luks-ftpm.cfg
@@ -0,0 +1,22 @@
+# Device Mapper support
+CONFIG_MD=3Dy
+CONFIG_BLK_DEV_DM=3Dy
+CONFIG_DM_CRYPT=3Dy
+
+# Core crypto algorithms for LUKS encryption
+CONFIG_CRYPTO_AES=3Dy
+CONFIG_CRYPTO_XTS=3Dy
+CONFIG_CRYPTO_SHA256=3Dy
+CONFIG_CRYPTO_SHA512=3Dy
+
+# ARM64 optimized crypto for better performance
+CONFIG_CRYPTO_AES_ARM64=3Dy
+CONFIG_CRYPTO_AES_ARM64_CE=3Dy
+CONFIG_CRYPTO_AES_ARM64_CE_BLK=3Dy
+
+# Userspace crypto API for cryptsetup
+CONFIG_CRYPTO_USER_API_HASH=3Dy
+CONFIG_CRYPTO_USER_API_SKCIPHER=3Dy
+
+# Firmware TPM support via OP-TEE
+CONFIG_TCG_FTPM_TEE=3Dm
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/me=
ta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
index 0e5ea5a5..6bef4c9b 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
@@ -35,3 +35,11 @@ module_conf_rpmsg_client_sample =3D "blacklist rpmsg_cli=
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
+    ${@bb.utils.contains('DISTRO_FEATURES', 'luks', 'file://luks-ftpm.cfg'=
, '', d)} \
+"
+KERNEL_CONFIG_FRAGMENTS:append:k3 =3D " \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'luks', '${UNPACKDIR}/luks-ftp=
m.cfg', '', d)} \
+"
\ No newline at end of file
--=20
2.34.1


