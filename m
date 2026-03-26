Return-Path: <s-tripathi1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED399106F307
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 08:57:30 +0000 (UTC)
Received: from BN8PR05CU002.outbound.protection.outlook.com (BN8PR05CU002.outbound.protection.outlook.com [52.101.57.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43779.1774515443905253173
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 26 Mar 2026 01:57:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=WxUF7Z9z;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.57.33, mailfrom: s-tripathi1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kPP/u90+GAFmiPsYZ/ItxqH9CuEmlnn8eQhU7ri7+iBFsVujwuRcJrUfMmZnqYiAs+uuY4zggFMB7lY/3I2G4jITPMSJ95YgEyM0lRzgLDUoRw67LgkAdg551RLM4vJfZNcaFb512IDyihw5bLc7EsbQjEx2MSf3m/8Rw78A6ak1D/uWwYcdFUzglzK+VCkU0C7oaOjaPGOmGxwQ1odPp6U/5kxOO6p0Etpyo8j9pvAN2zuojbDdu5Pbu3PqFS1Bdtfc4+ZjfpyF2Wqcywt2Kmgry7wY5uKra80XX5hCxrjSnTd7aanv5z1wwBBHNLmNlP5F7zQ2UX98vyKcY8DL4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a7TjhxFi7Q3E91fBJ5eRkf/PcNm0R5/V2k8HT97nhJ0=;
 b=VEMdmUxHSFy8LAFwyb+LR68eEdMwutGAt6IUQeioLK5CqclWUUNWReQsa7haCtFeL30x1GBgfztK9y5Lfq/A5jsTQkEq+vLTgdh6Em4B4uRDbveDtM9PB24sGFe01sySY24mg0OOouSKNl5bN77dL2nvyjZ6itAihbGZPJFLr3XknSMZgPhnEYJ2gwFmQmEfjicGJosITs7OSIee5qwW+QKo3raZ71nyDAWU5ePmdHdhM+F0xCosEAKs7NUjaExGueyJvgVs3Llfs+Wx3t6EY7KgxzAbIlIySIWUyo+E2d5JnY5cxWMsE8w76eEZWRZO5s4CMzoFaYAFEwQFnFIQcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a7TjhxFi7Q3E91fBJ5eRkf/PcNm0R5/V2k8HT97nhJ0=;
 b=WxUF7Z9zowoP28qX4ZBg+pPz2UYhY7YqVQdyDWNPQMPZSd0RsXQPg9arixjg+3QDlYI3yUCy5gsNnHuTb8vnz3ValFOEtfPAzT2FdPnuFBrR6nNadEGHFwPgidklQFF8wioB/DU3PPN7dGH2+62MMC2v4FB5fXneKNaluhMHwq8=
Received: from PH5P222CA0001.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:34b::12)
 by IA1PR10MB7115.namprd10.prod.outlook.com (2603:10b6:208:3f4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 08:57:20 +0000
Received: from CY4PEPF0000E9D7.namprd05.prod.outlook.com
 (2603:10b6:510:34b:cafe::15) by PH5P222CA0001.outlook.office365.com
 (2603:10b6:510:34b::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Thu,
 26 Mar 2026 08:57:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000E9D7.mail.protection.outlook.com (10.167.241.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Thu, 26 Mar 2026 08:57:18 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 03:57:18 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 03:57:17 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Mar 2026 03:57:17 -0500
Received: from HP-Z2-Tower-G9.dhcp.ti.com (hp-z2-tower-g9.dhcp.ti.com [10.24.68.200])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62Q8vDGW1858872;
	Thu, 26 Mar 2026 03:57:14 -0500
From: Shiva Tripathi <s-tripathi1@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <rs@ti.com>, <jcormier@criticallink.com>,
	<praneeth@ti.com>, <kamlesh@ti.com>, <vishalm@ti.com>, <k-malarvizhi@ti.com>,
	<denis@denix.org>, <vigneshr@ti.com>, <afd@ti.com>, <s-tripathi1@ti.com>
Subject: [meta-ti][master][PATCH v9 0/3] Add LUKS encryption with fTPM support
Date: Thu, 26 Mar 2026 14:26:20 +0530
Message-ID: <20260326085623.864201-1-s-tripathi1@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D7:EE_|IA1PR10MB7115:EE_
X-MS-Office365-Filtering-Correlation-Id: d61f8f93-f17d-4c20-2326-08de8b15af58
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	jKu1s80VX8fNL8P/3tRL43bgWeKmsZkLq1ucdSSezZ+N3l7RXVMbvmU8XputGE+So8CF2jR3Fs4G73ezpjrxtqs/o9tGU2I69PzFQVjt1CHGdpRhLP06/SeYKol/bENLwCWais4QnvnF9Ka3n+myvieAdj6cQ+gKLl367ZYIhw5/zbH8kog+2nt1WwavpEy+cPNqi2DtARxWnBSly1zIv7wXhnz2qHlHJxv/qauVcO62pW5sfW/N3zOJ8e10RqxqWVB/HH6r5s1Plagt2wHEZv0qGAh+DJKVD3ZkNE7bBqyPo0a3MtbJhf3iOe1N6doRxr09aG1uSlzFLeHPfcEIdEZZhpgTfH+WY2p4gOs19xCJCHS8xLxOuF4VNqX2elOw5pJbWJZ1FfvlpNqb0gPBczNycjvJBJPlV5wdwnbuGPcI0hYknCU0kEdeUPFGAiqI8NJuyaU6Z3MPKfLjZbCeHkFxJlJjS+6QjKAuD1LP32M/vwRbYX9SfANGBqrmceB76qzLhOTjp612PLXXRFAixc+U7OHd9KK+NV7IRnMnNwYWLfuiHLAv8LwD4F8Rdu6X4CkS9niZROcrhjq/cHXbvP3kqDoOsVlKqKislMZRHhlIeMSfDuSsC+69wrdBSGEEGpsPjX+ukS5nL/q7g+Ti3QHXfEGWsltm8Xt6RxeonCufw3lNqccbWCPexIp48iSeWyY4sAOtYocgypWgoDJTtk4IhQ9urf2VZEVfWCKvJSJbkyd1ffsMUWPz8f0Wey0yVqd2iok8B/D8mUEC3u8vAA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	FkSse7pB+XakfvROiwrQOCXUOjCFPAtoNHR44QhRoDgVnOl94k8VqStTwbC7i4+hO06UBKbT1ayBADkMWLcQYdGJiJkHPpxaKlXaqJA5iDgNkQXi0Mj8UR6+4G4lTf/BS6Ab1ImjnHikaAbUxfBdy2Rlz8URNqyyEbdU/Q/a7uZjgWy6swRukeWmAnkInc18vuiVdH9pStNYp6UoPh1T+jNGvegKMKO+ir21Ysu4PhoWVqI2EYAwb7LyfW3u9/8EYzQtarmLklFSboR7B2wQFyPq2RRqgOL9AjGGjfFR1vWg5QkUFXBFhUTMy7i+QRMONo6+CZ6K9DC73nU3uhFXyIdUvG42QU0br3kIG6lIZRnMXH6gCvoULgM7rbdmJQRFgSLkyTL5FRnOWStody0dQIAywASfbMPoNly9LTFKMB8ZgI4Ptuus23ZFRJ8Tc3jm
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 08:57:18.4645
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d61f8f93-f17d-4c20-2326-08de8b15af58
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7115
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 26 Mar 2026 08:57:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19819

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
Changes in v9:
- Add INITRAMFS_MAXSIZE override - 200000, to accommodate LUKS encryption p=
ackages
- Link to v8: https://lore.kernel.org/all/20260319165833.137342-1-s-tripath=
i1@ti.com/

Changes in v8:
- Update 'meta-security' to 'tpm-layer' collection name in LAYERRECOMMENDS
- Only register 'tpm-layer' in BBFILES_DYNAMIC (removed 'security' collecti=
on)
- Rename dynamic-layers/security/ to dynamic-layers/tpm-layer/ to match col=
lection
- Add S =3D "${UNPACKDIR}" to initramfs-module-luks-ftpm recipe to fix buil=
d warning
- Link to v7: https://lore.kernel.org/all/20260319103533.2431033-1-s-tripat=
hi1@ti.com/

Changes in v7:
- Added 'tpm-layer' collection registration to BBFILES_DYNAMIC for TPM pack=
ages
- Added meta-security to LAYERRECOMMENDS
- Link to v6: https://lore.kernel.org/all/20260318145732.2115521-1-s-tripat=
hi1@ti.com/

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
  conf: Enable dynamic tpm-layer support for LUKS

 meta-ti-bsp/conf/layer.conf                   |   3 +
 .../machine/include/ti-core-initramfs.inc     |   2 +-
 .../initramfs-module-luks-ftpm/luksftpm       | 341 ++++++++++++++++++
 .../initramfs-module-luks-ftpm_1.0.bb         |  43 +++
 .../packagegroup-ti-core-initramfs.bbappend   |   3 +
 .../initramfs/ti-core-initramfs.bbappend      |   1 +
 .../linux/linux-ti-staging-6.18/luks-ftpm.cfg |  22 ++
 .../linux/linux-ti-staging_6.18.bb            |   8 +
 8 files changed, 422 insertions(+), 1 deletion(-)
 create mode 100644 meta-ti-bsp/dynamic-layers/tpm-layer/recipes-ti/initram=
fs/initramfs-module-luks-ftpm/luksftpm
 create mode 100644 meta-ti-bsp/dynamic-layers/tpm-layer/recipes-ti/initram=
fs/initramfs-module-luks-ftpm_1.0.bb
 create mode 100644 meta-ti-bsp/dynamic-layers/tpm-layer/recipes-ti/initram=
fs/packagegroup-ti-core-initramfs.bbappend
 create mode 100644 meta-ti-bsp/dynamic-layers/tpm-layer/recipes-ti/initram=
fs/ti-core-initramfs.bbappend
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/=
luks-ftpm.cfg

--=20
2.34.1


