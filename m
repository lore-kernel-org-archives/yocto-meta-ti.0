Return-Path: <s-tripathi1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC6C6106F309
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 08:57:50 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43783.1774515463333213692
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 26 Mar 2026 01:57:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=AdtbZj3P;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.61.43, mailfrom: s-tripathi1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tD1rFibwXGO3k69+B8NwuhnqRY2uPnyEniz+TZU1lZ/jeePsNtbXjJxvojmmB8qXdtb2CvKlgt9YyzHeRGoKAgRd5Hq3j/3ooaNMWuiAr4hSuN7TpZw6hx3fcvQLLVyCQ4GMyLgi5lkyxLPl3QWim8wI7/edYwvzyMs3q2UxbOjtac2lP7SNPaexSlFCL9AbCqOA0jQt5j63JL76jl+8eGHZBGpH8F+AWahNgY3TtAiEV9UC7HzYAZDO7CCJDHOiDngywMIwMMb2+rw9GnbWrUY92tgwgm8qjMbjt2OpaQmVsf+6naq9jCtlavfMRmoGxOrjTfgt2VtLWbPa+COj3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XduzRvVUCw0FmAYbcu4uTT3pc32TuQSriNGKr0hhHyg=;
 b=owCQ80Xe43XwwFVowc13ycRWJKhvVcGQhyMF4t2MByRx4X78kg7bdbya82Bmh3x7F+HTAoTvtZQbImZ0OQk3VfHVsrighDfinrB6/H7cxEK0uJfHaDcSD+vLi/r5u9MHQsb45+XIUQ2s4rX9e4tXXGTc7Z1RK1wKnAOIbz7JeHs8ULahRGroiCmkOsm92kY7I5UiAcRzAnc43wWIN+Yyh3dD8DWYj+smkGX1meN13bsxx2sPJ3kLASdo32DbrHtXkb5AwcDiS8qde6NKo5XmdBMDvo8K9P5G1J+Vw3XVjA2NUVfTxHtO+BqtIzjJPKqPp1wygAI9r537DHB7kj5Q/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XduzRvVUCw0FmAYbcu4uTT3pc32TuQSriNGKr0hhHyg=;
 b=AdtbZj3POn6j9QQYAzx0bqeSdZqvnpEKs+/jpi/MBtYHgQ3qzoD/QU03tZ9a7/Ls4GqMmdBr9L5cSrD8dEfrtEkJMEFuGvEDS/kYELyx+6UMwvZ8AOEmQB737N+5KT9hDB+y2magVh2uXAeJVZljAjdrlWBAxFSS/w/c2lV01ME=
Received: from CY5PR15CA0211.namprd15.prod.outlook.com (2603:10b6:930:88::13)
 by MW5PR10MB5689.namprd10.prod.outlook.com (2603:10b6:303:19a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Thu, 26 Mar
 2026 08:57:41 +0000
Received: from CY4PEPF0000E9D5.namprd05.prod.outlook.com
 (2603:10b6:930:88:cafe::25) by CY5PR15CA0211.outlook.office365.com
 (2603:10b6:930:88::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.33 via Frontend Transport; Thu,
 26 Mar 2026 08:57:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000E9D5.mail.protection.outlook.com (10.167.241.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Thu, 26 Mar 2026 08:57:39 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 03:57:38 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 03:57:38 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Mar 2026 03:57:38 -0500
Received: from HP-Z2-Tower-G9.dhcp.ti.com (hp-z2-tower-g9.dhcp.ti.com [10.24.68.200])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62Q8vDGX1858872;
	Thu, 26 Mar 2026 03:57:34 -0500
From: Shiva Tripathi <s-tripathi1@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <rs@ti.com>, <jcormier@criticallink.com>,
	<praneeth@ti.com>, <kamlesh@ti.com>, <vishalm@ti.com>, <k-malarvizhi@ti.com>,
	<denis@denix.org>, <vigneshr@ti.com>, <afd@ti.com>, <s-tripathi1@ti.com>
Subject: [meta-ti][master][PATCH v9 1/3] linux-ti-staging: Add LUKS encryption config
Date: Thu, 26 Mar 2026 14:26:21 +0530
Message-ID: <20260326085623.864201-2-s-tripathi1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260326085623.864201-1-s-tripathi1@ti.com>
References: <20260326085623.864201-1-s-tripathi1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D5:EE_|MW5PR10MB5689:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cb303d8-8626-4cf0-8e87-08de8b15bba7
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	KNaJTpyPrU0bcBJ+f94W1R8bW1tonPhy398+bK+hmK2zQZNMNBDo8AecUzFRVczt7ELZ0FfxEarYlC0QuYSDwbeS539jGlbkw3RtyIy/pYkT1rm42If5V7r9L6XAHQblGnFCExuaOkvcZSTRU9LUBMY+mtpGmdMf3A4KhQ27lcjdnHU/J0/Bk98mC4gPYbdpl5pztlN/eQdjptdcw5EM/mlJTfy56df1RWzxxHUic6HxUJvYdaJDHzs/GpHZZVvZr7m4NSNbhE44A/TpFtdNljn2VHJNRy22kd4b1cpME9ZgROZCDbCdS8Rd5evlMWnKulFzfgVcgiRx2NS45gzjQFyCihhUoPhGmncftjYjzLdeqfY8ZBcA0L/iyYNtqLf6mp2UVAXjmcbqF7vcTM29rHN/Vtj6mTqpZpyauBYgLr6vza9IZ3K28iW7Mm5hJ4rO0uJGF14VV+b/0TvwOue0efdGilDhUxydCF+/dlur+nvl5JHTKe4p34WRGPJ0dj/9qWl+DAvZXMkuP9pHplkxUM5b/geCybj1ptI/uo6AADCVKkRXYQ7FcrsV4s7rFy4mao4Vm5iUGinuqG0NUO48u5IyIT1Oaa5Ogk1VvE+6hqk0Mfga5o/l2JYwdPiZhKLo0wOP8R6Ua7PYyk1UC/uADTO4n5fmPRUSy+KIGYzdKIPx1Y6XILijtU+D/lD+vKbDsWlUtCmrxPbByHgTt09SgUjNERWB0TwDvC2CocoR3zZaRvuJk1EqrGAS9YibGD9bDr2Wzu6PT5QymmL7qGjVwQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	w3XBA0taSRr19BeVQX3MUheoKIpe6h6rfod0hY3w1CMWBphvWALfs+ybUQl8yUYcfFwkXUZHJxXOIwyFCOT4SouIe7+QYVQMIqvj+T6Soz6m/4TcQbgJGxBk6uFVZMDMJB9OXcm+RjB6CBQbQUHqyrfL1HzAW0R9a8QyrUfhUfLunFWxgkRrmdt5yhZRPkE0bzhTAIX0Nxny5XKnSVVy2e6DnkK30c3wZXHrf1AuYWSjuT7v9AarEGmVGaMhSv6WaFHdUO3a2UImOV5E66cADhwkuqLZh5rhk1le5oKmatLGqXkOe4Def/+X2aCBXICR1ydIlyHsDvWL79v2k4OhFDc17/1sohWPUGWi/SAWl717TIooBKu7V1cdpjoxsLHsxE9MgEQMNBmzubNZqylVuusPQ5NZvp9DLX9LPlB1tTvj6mB37Mvn4he/iNqKMzrD
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 08:57:39.1200
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cb303d8-8626-4cf0-8e87-08de8b15bba7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5689
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 26 Mar 2026 08:57:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19820

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
index ea0eb305..0db4c596 100644
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


