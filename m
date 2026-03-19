Return-Path: <s-tripathi1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91FFE108E1E0
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 10:36:46 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.5])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8072.1773916596576781926
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Mar 2026 03:36:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=lcumNgC1;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.52.5, mailfrom: s-tripathi1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KkxLPCMbN2bNmIxZPF1U0l3vyhsXaDog2/DAEy5W/7XSsNrQOUetWd5sM+9H5sJQ5JmrKmBGozJT93zK7ahMtvTwNRJqWitAQPraW6VZSjbOTp7HkLPpkObxXMuS1P27ULxGJwXvzHnE87jPumcn95lTdQg2VTxOVZIyJAtQXtKQwggmmQaLTzKzZ/SsFULyO7+IWn7P8DW2LwXfijpwfFj911zahhh3GzrBnQ0+dGJf0bTI3epPSLkx5D2Kk7k8ACVQfsKTuAalg9Ny4z6pP78jskF9OF9lpGxA2Hgy2BzuLDktg+4IjA0Hnx88ZW/lzP2aoQxmP+6+1Ox7dOrDnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4zV62z4UNCpWsDdRy/wMz+WyRJyxD29yci4DdJXPXcU=;
 b=ksk3u7HIeI0F7JyfoeIc2aFU+BszjrhGryWflaaKVAhkhrCKaT2QKYhp1ev5hYszsfsfjlj8qu1+6rV8+5O7gIS8ze2B7csI2JqBj70JkXyiB3pMJtJ3J5Ky6iSLEaFotCzm5nCG0eTb3kL4kJUr134FZaQcAWPyFjkyJoakzwaU4RyssjsoI6787CMCz1t39BI4Dys3YjQFvxppp70bYNOg+FRviWOJyDCNzc6dyqt78GlKN5EIB1S9ady4sRuwXXweHra+ceV6Hp9douzqVZGkbYu9rV7cgi8fTfIgQbupISTX0Y3QfBIObC52iB3ICimqr1TxNfx1n/iLCgVNKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4zV62z4UNCpWsDdRy/wMz+WyRJyxD29yci4DdJXPXcU=;
 b=lcumNgC1MsAUSUOzTGJi95yRIrmSgMobYitIgm5qM03Eb6Bc1MMIALyyhXxmlfv8WYIP6nCaOMFDw7EgG1VrmnirnkMd1O5ev9nKCfQRl4ntLbT+5n/G0UO15rSOTtpMIoJYnBHqkuD8xOU5XsKujT/iqc+N1/xzmib9QE0S0lQ=
Received: from PH7P220CA0084.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32c::7)
 by DM6PR10MB4300.namprd10.prod.outlook.com (2603:10b6:5:221::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.20; Thu, 19 Mar
 2026 10:36:34 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2603:10b6:510:32c:cafe::4c) by PH7P220CA0084.outlook.office365.com
 (2603:10b6:510:32c::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Thu,
 19 Mar 2026 10:36:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 10:36:33 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 05:36:32 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 05:36:32 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 19 Mar 2026 05:36:32 -0500
Received: from HP-Z2-Tower-G9.dhcp.ti.com (hp-z2-tower-g9.dhcp.ti.com [10.24.68.200])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62JAaKor1950755;
	Thu, 19 Mar 2026 05:36:29 -0500
From: Shiva Tripathi <s-tripathi1@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <rs@ti.com>, <jcormier@criticallink.com>,
	<praneeth@ti.com>, <kamlesh@ti.com>, <vishalm@ti.com>, <k-malarvizhi@ti.com>,
	<denis@denix.org>, <vigneshr@ti.com>, <afd@ti.com>, <s-tripathi1@ti.com>
Subject: [meta-ti][master][PATCH v7 1/3] linux-ti-staging: Add LUKS encryption config
Date: Thu, 19 Mar 2026 16:05:31 +0530
Message-ID: <20260319103533.2431033-2-s-tripathi1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260319103533.2431033-1-s-tripathi1@ti.com>
References: <20260319103533.2431033-1-s-tripathi1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|DM6PR10MB4300:EE_
X-MS-Office365-Filtering-Correlation-Id: 5273a9fb-a1da-4679-217d-08de85a363b5
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	IR0jCfBjEED57Skk5NEEKgkEegmfh9txLay+IMi780I9o/T4IHYMdgvy0sWjn8CMqy472DnXhZw24BV1v0+VbkAjlCX0fuq13OQw81eoirHTnqQxD1HyzVc4L6ozjx+25Xn0wd1Vh8YW1rt3MgD/FmdmutGqYshwMfbfDJ7VKNyD30g4YzgwesMtJ9EZpb+e+OigW760D/DKkUQZcZBR45VBSfJ9JobEnLYdK+7vw7EjhQlaro9OUYZbYY40EQZx9y50dR8Ib8RWmUgbEa0mKkWJ+IoPrhD8vKaSjAu+2ESrKYIqJe+wRZ+023jY9mEgCyO99m3FIMrBgGttLERXHyanb0errdor2XK6/iLctuw9PAU4cKYlr6tNrFNoY73AbyO3I2GvC0Hv55KMW3VslJx5btmawus/Z7XmiXulhj67qafieYS4zZW/Y7A2Ea29mOoxvnaz324Z9psGK75mxztEp4Sn2F5iyXVMywRs3X+REvowKLz27xxSRsQZC38jGRL9gMUwn9Iv1BnpNZINfJ1lgf6GZN025rA9jTqoh3xpSuRwNyjC4FafKrHlCvLRxfWhH4JGccwerV5O880V+FXY15yaZPmf0xFXHmQxbpvAH5mjaTPToWIMRQAUsIQvs8/bAdcV7WtgkXNB8JhgzV63kOG+lWMdnQx0YyFSdCPic3J45gJ1RBUqwpxgnaS1zJ7NYVwkLdbaKsnUWC5MQYLjUkQ+aAt8mBtbHgDbaFM+7MvOim2DQsUSomf6nGnCbdo/GZitN8gcxQIrQEJMqw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Qc4FD6xrHTu5rOe4rtlLJQjz7/4GhkDWoHlYArrRaeA8KVJ34utMJ2ma5ZhYi/Rm+Bu5Ad9X4MnNhbEdtOzU5ab4HVA+Fa8gKFIuIV7Kipydh140y/fX9mpDs7q4nitaGmu2vShlJB2/K1QUTlOS+J/dl+p4Y4BgmR6zzKuIhYJzLONDwgDDkgcW6Kz1T7y4DZZNjTMIk+fUPVpi6A2e/Mq8mV1mwlxcZMBPozKc98ErgKZn8Ku3gnCKOIC0UJPzk/7CMRj5BLTdkQ9Ixj9w1HMO4gapNwEr58jD9c74Imvm1Ocd2ONwM+kILECH64mvpeUBQ5fiqjWoV5B3UjqWxly0qqZzdx8GdvMmpCVRpIvzez8sDUJt1pzPOLBCzJci4eS/CaVjtyZYxSfyzNx1sK79+XB2PdNcsgTCE4Nywgq1YdUqQmqhub+hibbUhhQ0
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 10:36:33.1397
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5273a9fb-a1da-4679-217d-08de85a363b5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4300
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Mar 2026 10:36:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19774

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
index 0e5ea5a5..2b064d12 100644
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
--=20
2.34.1


