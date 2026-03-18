Return-Path: <s-tripathi1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 080B3103E194
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 14:58:21 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (SJ2PR03CU001.outbound.protection.outlook.com [52.101.43.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16247.1773845900033840237
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 18 Mar 2026 07:58:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=Jfxp04wG;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.43.64, mailfrom: s-tripathi1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=deEsWD85c4zcq3RfPZVGbgWjnsHngow0e3zQrlAbZbCd5yYviSjWKkIqN3+KRUrnu7/7SLjhkdByrU1XsU2d2hZCccLgtTZh68YeIgrdZqclV58POPlpEbmcs7VqFFxsPbo/0p4Bpdg1tFd+psb2d+n9VRXil3Klma4E9iATZJ+hAMBwGTWXgqvKLd0eaOVHcXh9Tkd2OzZE3GX2/xtxwDQ7afImyaCmg8W9pR1VMB0y6moiwxQeGuENR1jDYbIMv/RDjBthCZVeBhoP5ReULxfGL5m2oMZlO1Wu20RbixAiBKW4t9KbJGMeO1kSqIOIKNZrE5BqGvXWLm/eqLZB9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OZVaavQRC6m0EecVKuLl+kMw9WuM8oy9jBihZ3T2ZZY=;
 b=jbsGxLYHGmopfWkBAnRZ/SscJlBbEo2VL+U2BJ0iErMa74pl2ZkbqZ8Ob765eLBuv6SNAmQ5IAvuK8l1DCvvOVmmhq1YTGFjAI6qiFfB/liCuLNobv8dW08gvCmx777/ivkHKFMiIFMZ/x2cS9TMYG1h4pSWeum40LWHxNJ/X1MOsa/YFlrYGmDZVY10Qm5kL+8eIjxKMxj+pTjFf8SFZE5fXwLw2Wr3+N8siyughC6XedLau+cLeczKGTBovs2YUP8FDKbagVue3aFS/pvXD2mIp0KeiI4IAiCCtk9swG+jyptMHKxieHJ116MW3k6njkj2op5TgOV09Rq6fJPh7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OZVaavQRC6m0EecVKuLl+kMw9WuM8oy9jBihZ3T2ZZY=;
 b=Jfxp04wG530/Uzz8CfdV4o64M3ArCZiHMaghCUoU+JVnBqPHPS9RS5A8s2am+nuAoIXYeCoi/0w2wlAjn6Tlzi3EA5fDvjsJmtiryYpKxGOOeJp6B+o+LwbO7b+2qeOLQTKm2pnY7I0tO78wF5qUSZytemRJgrGpO+vojASu8Ig=
Received: from PH7P220CA0110.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32d::21)
 by SJ0PR10MB7690.namprd10.prod.outlook.com (2603:10b6:a03:51a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 14:58:17 +0000
Received: from CY4PEPF0000EE38.namprd03.prod.outlook.com
 (2603:10b6:510:32d:cafe::ed) by PH7P220CA0110.outlook.office365.com
 (2603:10b6:510:32d::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.25 via Frontend Transport; Wed,
 18 Mar 2026 14:58:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000EE38.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Wed, 18 Mar 2026 14:58:15 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 09:57:58 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 09:57:57 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Mar 2026 09:57:57 -0500
Received: from HP-Z2-Tower-G9.dhcp.ti.com (hp-z2-tower-g9.dhcp.ti.com [10.24.68.200])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62IEvrjU1014945;
	Wed, 18 Mar 2026 09:57:54 -0500
From: Shiva Tripathi <s-tripathi1@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <rs@ti.com>, <jcormier@criticallink.com>,
	<praneeth@ti.com>, <kamlesh@ti.com>, <vishalm@ti.com>, <k-malarvizhi@ti.com>,
	<denis@denix.org>, <vigneshr@ti.com>, <afd@ti.com>, <s-tripathi1@ti.com>
Subject: [meta-ti][master][PATCH v6 0/3] Add LUKS encryption with fTPM support
Date: Wed, 18 Mar 2026 20:27:29 +0530
Message-ID: <20260318145732.2115521-1-s-tripathi1@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE38:EE_|SJ0PR10MB7690:EE_
X-MS-Office365-Filtering-Correlation-Id: 1264f210-d5e8-444c-0a6c-08de84fec8eb
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	i2q929tWMcYF5c64CQ6ugl9okpZOBhcN63OJbJ91eovJkk9fF2kROwp+MrZhRes52BjfeKaVY1vujFq8aZQ/irYl1mXkhWm5KRVHl4zUP7GHLg5xWLQf00l15aXmMcr2yPWOwFRU9H7gKkvAFkgUwMppI7Jmv4LlKE7g6VPAA3Qooay9s8ct7pS6dvowBJfcvXJ3VkZ1MP4e7aJzCP4ighYp+FSWHnSGktLEOQ9zeVofOZd5PM7ltLtuoRGeF9U2TW8iQUgxphl6hYt7Xu+SSA5RHLJ1fskizfxfWjFHxKwtq8J4GWifeDIcMJHm4eyvE9QB/KrMl79ezkIciMtgnhvJeV3bjBm5EKajQinZgWMbyU5me6e01gwyKWRUOYxmrggyjU5jBTYiewsO9qRIbKUQSrptNRlFP4+Zl1cO3Nliz/vC2ykqaEIaoWHKXHrvyb+BJeFN6iWOW6IHdNyo2TI7NQNMhehFSAuKOEE9sDWykra5MpfHkMvH/F+jZuny/neyQ3M9ho3D4nok3K5RibXy5czo2ab16gisA04IjS3yquL4UeFgvSyiMjATfspsxIv37DGFn+G98DMYJdnWjv/Pb8TGxcBJejg9xvnwrHLo9ieVHgQyW7TiiNv5VM9isl3Z8ooioNKUg5NX009tpijpEKtVHES5WxwYBNpXoLM4vOY6C6P1v9Zm6LnmnTHwJtvdGXqejKVOvfnpE2InwoWXHxZv8lkNrmUS3GwblWdQKWlt3aH+bCBDL9DDn9LRxenE7ughbg3jZxVOac4y/md8iiGLM5Wh64MCkipmOus=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	IDtwTAGTL0jmkeF+2wa5XUSmg22aGWPmopIlZUoMmg9D8auBcWEwEEwgDokE+xHdPJqfErvsfpw6MTRDK8REZePX9BtwExk/W1r8GR6jP/k7j0QaTNVcG9d1vfiJRqSmj8Bt8+ceLvzNVpg47lXBhtvNhptEmYtj+kUwc7+Uf+5RJwrOL3GCsUDd37qQbMuxJTtc8EVOscqmrhngPxD+feAqLDlBdfMF22O5FwkZjLKgv2ArzSmTI9g+wH4T/FxKy802HyMg/ND+APob5Hy7GqGohz2eoiomwBlsUOtrBef9RA8ZFbxRk2BQmz34ePB5Dk9I820+gpBq8aPZGtAxyYIsBcLIHldZdRFm36XgERjz6cmVu1D8ni0VWpaAq0ZGXrOazlaeNiMjIW/5eK12dVWXUF7z9SnScP1x2blTRkD/UBZo+dfhil3GriylKGaq
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 14:58:15.9722
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1264f210-d5e8-444c-0a6c-08de84fec8eb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE38.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB7690
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 18 Mar 2026 14:58:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19759

This patch series adds LUKS full disk encryption support using firmware TPM
(fTPM) for TI K3 platforms. The implementation provides hardware-backed
encryption with keys sealed by TPM running in OP-TEE and stored in eMMC RPM=
B.

Background:
TI K3 platforms do not have integrated discrete TPM hardware. To provide
TPM 2.0 functionality, this implementation uses firmware TPM (fTPM) - a
Trusted Application running in OP-TEE secure world. The fTPM provides
standard TPM 2.0 interfaces while leveraging ARM TrustZone for isolation
and eMMC RPMB (Replay Protected Memory Block) for secure persistent storage=
.

Key features:
- Conditional builds: Enabled via DISTRO_FEATURES +=3D "luks" with MACHINE_=
FEATURES as 'optee-ftpm'
- No impact on default SDK builds
- In-place encryption on first boot
- TPM persistent handle for key storage (0x81080001)
- Secure key storage in eMMC RPMB via OP-TEE
- Security model similar to CIP Core

Use case:
This is designed for K3 platforms requiring secure boot and encrypted
storage, such as industrial automation, automotive, and IoT gateways where
discrete TPM chips are cost-prohibitive but security requirements demand
hardware-backed encryption.

Testing:
- Tested on AM62x platform with kernel 6.18
- First boot: Successful in-place LUKS encryption
- Subsequent boots: Successful TPM unsealing and boot

The series is structured as follows:
1. Kernel configuration for LUKS and crypto support
2. LUKS encryption initramfs module with fTPM key management
3. Dynamic layer registration and initramfs configuration

---
Changes in v6:
- Moved initramfs-module-luks-ftpm to dynamic-layers/security/
- Added BBFILES_DYNAMIC registration for 'security' layer in layer.conf
- Eliminates hard dependency on meta-security layer
- Packagegroup LUKS logic moved from base .bb to dynamic-layers bbappend
- Link to v5: https://lore.kernel.org/all/20260306163735.1316257-1-s-tripat=
hi1@ti.com/

Changes in v5:
- change from MACHINE_FEATURES 'luks-encryption' to DISTRO_FEATURES 'luks'
- implement dual gating using existing MACHINE_FEATURES 'optee-ftpm'
- optimize kernel config - remove unnecessary CBC, ECB, ESSIV, LRW, PCBC, S=
HA256_ARM64
- packagegroup-ti-core-initramfs.bb changes moved to patch 3 from patch2
- Link to v4: https://lore.kernel.org/all/20260305172115.3684326-1-s-tripat=
hi1@ti.com/

Changes in v4:
- remove encrypted-boot-common.inc and use existing ti-core-initramfs.inc
- Link to v3: https://lore.kernel.org/all/20260304193824.2495898-1-s-tripat=
hi1@ti.com/

Changes in v3:
 - remove separate sdimage.wks for encrypted boot, default works
 - update encrypted-boot-common.inc to use existing hook for adding TI_CORE=
_INITRAMFS_ENABLED dependency on luks-encryption flag
 - add logic to verify if partition has enough space for LUKS header before=
 starting encryption

Changes in v2:
- changes to use existing ti-core-initramfs instead of adding separate
- cleanup in previous init script as per comments in v1
- /usr/bin/busybox logs updated to echo, mesg, info
- WORKDIR changed to UNPACKDIR
- Link to v1: https://lore.kernel.org/all/20260302144647.1705408-1-s-tripat=
hi1@ti.com/

Shiva Tripathi (3):
  linux-ti-staging: Add LUKS encryption config
  initramfs-module-luks-ftpm: Add fTPM support
  conf: Enable dynamic security layer for LUKS

 meta-ti-bsp/conf/layer.conf                   |   2 +
 .../machine/include/ti-core-initramfs.inc     |   2 +-
 .../initramfs-module-luks-ftpm/luksftpm       | 341 ++++++++++++++++++
 .../initramfs-module-luks-ftpm_1.0.bb         |  41 +++
 .../packagegroup-ti-core-initramfs.bbappend   |   3 +
 .../linux/linux-ti-staging-6.18/luks-ftpm.cfg |  22 ++
 .../linux/linux-ti-staging_6.18.bb            |   8 +
 7 files changed, 418 insertions(+), 1 deletion(-)
 create mode 100644 meta-ti-bsp/dynamic-layers/security/recipes-ti/initramf=
s/initramfs-module-luks-ftpm/luksftpm
 create mode 100644 meta-ti-bsp/dynamic-layers/security/recipes-ti/initramf=
s/initramfs-module-luks-ftpm_1.0.bb
 create mode 100644 meta-ti-bsp/dynamic-layers/security/recipes-ti/initramf=
s/packagegroup-ti-core-initramfs.bbappend
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/=
luks-ftpm.cfg

--=20
2.34.1


