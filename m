Return-Path: <s-tripathi1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ACC8FCB620
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 16:38:31 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com (BL0PR03CU003.outbound.protection.outlook.com [52.101.53.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.73337.1772815108660110690
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 06 Mar 2026 08:38:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=JjaHa7+e;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.53.12, mailfrom: s-tripathi1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dCuLlUf6xJ7V8xHju9XSlWsz+kblSSXdUlFhGJTHUATgjNEwVhXEvMqaGm1YY2bCk9/RtSmwUawnlcy+n5rOpmXZOFdjnAg61gYDtJ1oMrywkUDNKPwEAz/krNJYGV5cxzblmaRdPROsG1i6x/N6iFrBBdzaEbNdffDMw6LvaWMm35tebbGhDM5k6mYQCQnKe+SuHcE+AIfEatxJnjp7JuTZ1MYXn/jM/1MoyJ+/i2J4c78Grei/I/zc00GS4W6enBeMYiKJ+wQl3tsqSg8G0tssWYxKaPdcRtpb2U9ctBce0JPNfMmF4vVlXWZxmkN1AWrTRw8IwLOy6ti9XVdgvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jSPBpNKMxIX7lhKFbwcV7bNB+SxZ7Hf9+Bl/At+FzVQ=;
 b=Nmi3vbLg9fzIhiAgN7SJ52GFUnNLu6tPDJFyO7SKFy0lvgJOpL2fAro8cvYs1TzNzUEeNfeCbDT3zx4OK7WYnq3RlXHotCQldBXktZdalGSagVrpysGkWNNsZxid63wup0aZtwwY384YQQLNSLCSTvEHTD6PcDUv3kzsrzKDmXE+qvUF813tOnKuMGM494pBHE1BB1m8vX4Hx7dUADuNdfFcucet7QYJT2JpTXKShV6a+ivcUL0XX7zo80xJwVzTeh09mBB/XhjsLF3t3SpdiA1CZwy7Kw27pLKpXZcK91bmSWFPSTsXgUjSHZvZwUXl7AvP42z8YsvV/JABc1spbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jSPBpNKMxIX7lhKFbwcV7bNB+SxZ7Hf9+Bl/At+FzVQ=;
 b=JjaHa7+eNk+p/aFQFVE+IurgGPGFTEt7PevSCGJQM7KxTFPbHBfFYvkyEWtT+h/EncbvR/rSNWWeMFxyYlwgMMSFiapwIyrFzpmEpBb5ACjYY+AZZflQhWUKHAhIFt420clWea6BmNR5U5vgYe0GEbWdpA5zjdDiho7SrV9bewo=
Received: from BLAPR03CA0113.namprd03.prod.outlook.com (2603:10b6:208:32a::28)
 by DM3PPFF6B8E3753.namprd10.prod.outlook.com (2603:10b6:f:fc00::c59) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 16:38:24 +0000
Received: from MN1PEPF0000F0DE.namprd04.prod.outlook.com
 (2603:10b6:208:32a:cafe::8f) by BLAPR03CA0113.outlook.office365.com
 (2603:10b6:208:32a::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18 via Frontend Transport; Fri,
 6 Mar 2026 16:38:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MN1PEPF0000F0DE.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 6 Mar 2026 16:38:23 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 10:38:22 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 10:38:22 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 6 Mar 2026 10:38:22 -0600
Received: from HP-Z2-Tower-G9.dhcp.ti.com (hp-z2-tower-g9.dhcp.ti.com [10.24.68.200])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 626Gc9E54133859;
	Fri, 6 Mar 2026 10:38:19 -0600
From: Shiva Tripathi <s-tripathi1@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <rs@ti.com>, <jcormier@criticallink.com>,
	<praneeth@ti.com>, <kamlesh@ti.com>, <vishalm@ti.com>, <k-malarvizhi@ti.com>,
	<denis@denix.org>, <vigneshr@ti.com>, <afd@ti.com>, <s-tripathi1@ti.com>
Subject: [meta-ti][master][PATCH v5 1/3] linux-ti-staging: Add LUKS encryption config
Date: Fri, 6 Mar 2026 22:07:33 +0530
Message-ID: <20260306163735.1316257-2-s-tripathi1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260306163735.1316257-1-s-tripathi1@ti.com>
References: <20260306163735.1316257-1-s-tripathi1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DE:EE_|DM3PPFF6B8E3753:EE_
X-MS-Office365-Filtering-Correlation-Id: 2990e988-e211-4c93-7325-08de7b9ec893
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|34020700016|36860700016;
X-Microsoft-Antispam-Message-Info: 
	CYOVVCdKqAjzxq6/Q/lZwChaVP04GCWJW1tUJDDSS30qeNGLnNA8sjrnYrXAnOwPJst1VjUDJAT9VSVjXIH9w0Ud77liKxNhcf3PLUx9H0aCNktdL2QDuY0+tuu3sQuAFqrE8elTnh/5M7CrV/+UG6dWcpU8r5wojKfxef79CgQd4qauh209J6zM4B9xaAW0tf7W134DREPdk9vVe4XMdg0UYt9+waJlyWHG+GhSjHjEbXtEJUK9EcetptXoJRLd+xxAOBVJDRTyCPrw7vMaIOU3lkQx0QxYmTK6WMIyePlw+CScqJHBkunfwuxlhzKm6KI5o4E2zspi5jJj3EaFivNRfyx3SVjnoPrgH9awbQ31RPxuu7hpFM2sioS4uvIf8FJ4057SklpRrweac4l8H6kKYViceln9uDjKm1ZRhfRgDP1QNiTNOKCHWEdUYNxYjNU1XZG0XeG1H03CaKlm5FzYbXju7j0lUbZCzD8rNPg4SyhftDwrWcg3Yh/Lw37ZsGnnYlFVVB11jU4XU3v3RFV9LAKyrFw+H0u0ArxbxFKlbYKdo7axX/zsYW1sccr0evVE9vKU/CKt7Kp9Xh5EY6WZptwFIQ9g9HruJP/6LYC9HhIDeU0lYUj8GbHPFIXfDf+KHX8+L6nNSgBEV4Xa1d3KGYUgwEHM0+P5iA4inCUDC07+GSWMqeFGsFmyPwMI4yuW8kGwrvjU/o9al24MLhzzh4E8VU8pni1hv7SNs3NUvENYLsAQnIzq97U0sC2/rJTRcNNCSn/TjDj8/ZpYeQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(34020700016)(36860700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	hLzLcDXhT/BT+FGYI+mHTQxYh+qZL8sg1LdOHy56mihptKtgL/XANmO0tTMVL0GiyWsrjOonjSw7KgTdwrgGBBzkUlLk4080yA3efUjRi0Z8HR+GqFYUKwR9/8T5euQvpPnEwGcw85JCvBZtUUbZCH4zRPr+LFu//T0ufT5MLL3NX2ja4NWizfBvPu4J/iRCT6XDAqwxFKDnY2SdwVTrf+NqoJpYNDPSpb70NsZWpv9nAuQqGUNRoQCXK9fgsbGIYIx8jAaG3w1FEmkXtC7JgiatWSCu4hHMMNaPS9IuklrzC4dPlEyxuFzGBQk7V3PqIHXYAr/N+szXwFufkHro/mNELi2o670n2sX754nQAufNsJz+LGKKAUo4tqxQEfle/+PgGFUshqN4by+adwGx/HQBby47WUcaar1Vp7K5O34xUD9hyiK8BVDlx0lyvJRl
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 16:38:23.2125
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2990e988-e211-4c93-7325-08de7b9ec893
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000F0DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFF6B8E3753
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 06 Mar 2026 16:38:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19670

Add kernel configuration fragment enabling dm-crypt and crypto
algorithms required for LUKS2 full disk encryption. Config is
applied when DISTRO_FEATURES contains 'luks'.

Includes ARM64 crypto optimizations and fTPM support.

Signed-off-by: Shiva Tripathi <s-tripathi1@ti.com>
---
 .../linux/linux-ti-staging-6.18/luks-ftpm.cfg | 22 +++++++++++++++++++
 .../linux/linux-ti-staging_6.18.bb            |  9 ++++++++
 2 files changed, 31 insertions(+)
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
index 0e5ea5a5..b27463d2 100644
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
+    ${@bb.utils.contains('DISTRO_FEATURES', 'luks', 'file://luks-ftpm.cfg'=
, '', d)} \
+"
+KERNEL_CONFIG_FRAGMENTS:append:k3 =3D " \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'luks', '${UNPACKDIR}/luks-ftp=
m.cfg', '', d)} \
+"
+
--=20
2.34.1


