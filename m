Return-Path: <s-tripathi1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79B9B1090258
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 16:59:13 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.70])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1037.1773939544935296663
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Mar 2026 09:59:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=PKm1H2nX;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.201.70, mailfrom: s-tripathi1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tLaFDQ6+VWtB5GzcnWQLkVh8y6425RGWdTRoICAfyeCpF/CtEHEgcpkGg/95yz9/Mi8zXWZOTmfHo9u+4tqtM1KcXje7zpHJVgcOnrZxV6yflPnVXklUOUPn6BkPaT0kO3iWs0cg1r0YrGBGUBxzLydmQzHKCl27Ju1Oe4f0e3a1M/fJ5VuBhiIqb2ikFmph3xu4ObXQdDlu4bTnLA6+EKbuH+l7t7A6iC417aMpCKvmWPkA5TK8vqA+q8Da5pqqSkhY7IOR+yEFNB734sOoeNxD1LXmJJiMi/r1r6keZbmYFu5Mzy6qXiu9xBtCclchzpy6wenG5k261+T6FhSWQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4zV62z4UNCpWsDdRy/wMz+WyRJyxD29yci4DdJXPXcU=;
 b=PVQ0uGK0FnKA5k6VYDRX4MzxnJcDTpyEg4wcJ78iVYs/lzRM+kc8S5QvgKp9qYSbKoF3/Elu25jL/J1NgyzIJ6zakfPRqFi/d9GeyhCkLrrNAXh1dX0q//geISJ8mR6xPrS+GesSa2wWfQFYOhrZuKaJ+W8+NoDsx1OrsEOjg2ohGs7TdjS/gDEUJma+XAqYbS+a2hokrw5sY+kYZmZppyDKnXc+fdCHzo+JaFxS0dKjY70tEG/wyNmptqm3jiPoNGPGFJHJXB4G0mh2yt8w+qYUv5ydohhm7wkJRZX2HDSC3SyaKzdQg3cyz+zZYPovaWKiNtUJv3hxeIOzWdwXng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4zV62z4UNCpWsDdRy/wMz+WyRJyxD29yci4DdJXPXcU=;
 b=PKm1H2nXcJY4K9iahX1ksMZ2+G41sn6vlNOIUeiFJmZcVfD0T85tIAGiguwvWztVHbTjeAIjCMGn1Orma5LEL4i50LgdXJfNvwgjQd5LwsINpxRNfBuocHHqXqviUNpLt+zGHWmAK6Kb8OqoyMtvlSHusaEbt4JK3kn9Jd66RVg=
Received: from BLAPR03CA0020.namprd03.prod.outlook.com (2603:10b6:208:32b::25)
 by LV3PR10MB7937.namprd10.prod.outlook.com (2603:10b6:408:21c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 16:59:01 +0000
Received: from MN1PEPF0000F0E3.namprd04.prod.outlook.com
 (2603:10b6:208:32b:cafe::e4) by BLAPR03CA0020.outlook.office365.com
 (2603:10b6:208:32b::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Thu,
 19 Mar 2026 16:59:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MN1PEPF0000F0E3.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 16:59:00 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 11:59:00 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 11:58:59 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 19 Mar 2026 11:58:59 -0500
Received: from HP-Z2-Tower-G9.dhcp.ti.com (hp-z2-tower-g9.dhcp.ti.com [10.24.68.200])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62JGwm542883032;
	Thu, 19 Mar 2026 11:58:56 -0500
From: Shiva Tripathi <s-tripathi1@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <rs@ti.com>, <jcormier@criticallink.com>,
	<praneeth@ti.com>, <kamlesh@ti.com>, <vishalm@ti.com>, <k-malarvizhi@ti.com>,
	<denis@denix.org>, <vigneshr@ti.com>, <afd@ti.com>, <s-tripathi1@ti.com>
Subject: [meta-ti][master][PATCH v8 1/3] linux-ti-staging: Add LUKS encryption config
Date: Thu, 19 Mar 2026 22:28:31 +0530
Message-ID: <20260319165833.137342-2-s-tripathi1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260319165833.137342-1-s-tripathi1@ti.com>
References: <20260319165833.137342-1-s-tripathi1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E3:EE_|LV3PR10MB7937:EE_
X-MS-Office365-Filtering-Correlation-Id: e83526f8-ecbf-4b55-b0c3-08de85d8d196
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	cXwLM76lDkYiKhTcc9dCz1VG8GyVGTp95hWYS63t0VZhVHP4kZWlxKsVcl+fwuVLU+SRkTrDSEjmxq62eyZsLFlpETJoyGd9sSSULICKJJpzQm5zAo9eYyCpqRZkrVfC8Reh+5ifS0LHn7pU7m8wq2xPM1JzKQRc0Fb1AhKMnCWGtvRSG7qVRIsmbMM/4I2GjHY/8/l6B/bUw4nMyf1G58e4czJaLrIgAvZrUHgbcC43e91/KsT2VvH8s3ksSfY3xEfYwVshtaGbPfbPHCf3tQh08CQu/JqHZlGqdBv3Z+hALSQLwszz/ibNS+Iuk/FHU178epZeWNX3TZzFelGKo4y0rwan+CGlF2bvlFeCfvQ5osD598gaUHDzkYexJempORqXLTf2mC/E/jSp7F6S8qd+1/Ddbq052IKDnkh81CKm5Sxas8gSl//w06vSPGTH6Sd8GxWbr2LBNfmOCwRUhfl4JkrqfAhcw6UdX1WzmeHkAST9aR3+Pz7rQnzWhDtGkesvv0poTvZdAO2eycyU40zFPPKqjIgK23VwTwQco4NUz10+JuVypjFS/arLVw4krvPkP1oOwtzyRxPrSJuY8DF3tcCobBhccF84F3/lAFB2+9eMuX9QRZqMBKMaKMAoi29B4BH8NGtu6c8eKUuH5ouUEX81ROxtmsuufXnpl7jQ5nDlnkrr9ROf1sLB5zEtLq56iYgvwnDR1hUA6ljPXOmYIxQ7spCNaOqcgtSatw7ABY7S9ZugTqzqwY8+v8ey9K2cw1CulpjiHVuNP+PrwQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ei2b97QSRv7ij9Ud4V1ueg2dNcWd+usJwf8ySFEXw3wKH9ioDS9XYkqn+YW4uBqePujqOYNC69HCGCoa7up7ol7XQNGJ7SqjR7TLpV9gGsfs2+v9IqOblOR4MYvdewHYMqYJd1Pp97RgqOW/mZePDFpRJcx1/3H2C5GwOOM2jWXPTgbENzmiB7FJ/4LZQPpuLkUFVZ/omu09QNk99Aqd+RQCAYe+W9BzANJH3dePIqc0wksmQSU9QXBPm8Icy2UE/XuJS7Sia4esQbdQCi7DyTqextqe6ZA1fRh6BbdZ14LIgjQPC8dqI29PSTnjYNkNdgBagPXoK2a08jsPpykVKyelTlKMLPlyLhSy9jxePNlvi/h7HxLmJK7ZXx4SorGg2xDymSfd78MnB1AKGwFWev5gZo+z64U6sID5vAcXNvn6Z1Kp1hL6j4J1B5erK4Gx
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 16:59:00.7797
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e83526f8-ecbf-4b55-b0c3-08de85d8d196
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000F0E3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7937
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Mar 2026 16:59:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19783

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


