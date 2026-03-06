Return-Path: <s-tripathi1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 178E3FCB61F
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 16:38:21 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (SJ2PR03CU001.outbound.protection.outlook.com [52.101.43.19])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.73331.1772815098606656666
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 06 Mar 2026 08:38:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=dvMF3FBp;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.43.19, mailfrom: s-tripathi1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o21PpU6cRZWOa+KJn3jmgg2jrFJ//DRGgT/hppNpKA1lJnIlUz5e3Ub0HpFrNw9VArymcCszvoiw/0lEcylSOEkYhQYDCnzVG5ggTHUV5/U1II/J9H9dieeDJAitKgnoNA8wGPn/xx4/ZaHRrtt2E6FE2+4c5rOcajNF8dSbsWXq2THMAVhEzl4/4sW2dx72gqlOdFubmxIj39+3ZrNBADnBcvrGlu7AGmGU7R232DsNNTB0OuhID7dCh3x+GyJ0Ez1OVFF4m3dEXhMturUdcAH1jpTo8N/7OOO77pSexjLdOGx+cOW8kjaM6h+RxJx9BQprKKytgpiVZSDVrqbBjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ares6KIaUfyh/uiJtJYwSc1rbtLFmti8Hh9MAslrY+0=;
 b=LeY5EYWgwsi0KSaWtxtEOkvowrBnGjGJZmm/YMBMaCTJjXibUVm/RSGgwGxtxcEsVn4F2WdDL9PWxMQ5MP/LgD4jc+ZGeJje7xkOZSqvKs8FCLCgkhVWsadVguCHGUb8hWvXADJ24H7MNsYiLVi8r6nTzJwZw69e/lm3kXkCPAhMp+91b+7i9riD/sMniTB8WtdAoIukwTm/2Ra856dMZLdfnl6oTj+AC1wowhKHHj0VBl6E0lzpuOeXJ4f/qainxoWUmR/fkezCibMYAVLJXMkwF1Up1Ba3KWoWKCXQQRYRPhN5z1ziC0X7ybGQbSy3EoyAwq5TzUEAWp5Rjyt4pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ares6KIaUfyh/uiJtJYwSc1rbtLFmti8Hh9MAslrY+0=;
 b=dvMF3FBpJhDpnqCV5WgX2txekjSDXuV8BrXnJ5AcH/a9QYMlMkCPaPdjLGFHSjnd+WubitUnFzUg+gDuv6NVDT2kDHwrQl6BLepxl5WTq/rSqzDAA4M1GMQJdqkFD49N6kbLkuqpCia0zEk0uHIa6VCiVZM5m5xY6mnR/GzRDIw=
Received: from BYAPR02CA0067.namprd02.prod.outlook.com (2603:10b6:a03:54::44)
 by SJ0PR10MB4637.namprd10.prod.outlook.com (2603:10b6:a03:2d6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Fri, 6 Mar
 2026 16:38:15 +0000
Received: from CO1PEPF00012E7F.namprd03.prod.outlook.com
 (2603:10b6:a03:54:cafe::6c) by BYAPR02CA0067.outlook.office365.com
 (2603:10b6:a03:54::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.19 via Frontend Transport; Fri,
 6 Mar 2026 16:38:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF00012E7F.mail.protection.outlook.com (10.167.249.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 6 Mar 2026 16:38:13 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 10:38:13 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 10:38:13 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 6 Mar 2026 10:38:13 -0600
Received: from HP-Z2-Tower-G9.dhcp.ti.com (hp-z2-tower-g9.dhcp.ti.com [10.24.68.200])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 626Gc9E44133859;
	Fri, 6 Mar 2026 10:38:09 -0600
From: Shiva Tripathi <s-tripathi1@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <rs@ti.com>, <jcormier@criticallink.com>,
	<praneeth@ti.com>, <kamlesh@ti.com>, <vishalm@ti.com>, <k-malarvizhi@ti.com>,
	<denis@denix.org>, <vigneshr@ti.com>, <afd@ti.com>, <s-tripathi1@ti.com>
Subject: [meta-ti][master][PATCH v5 0/3] Add LUKS encryption with fTPM support
Date: Fri, 6 Mar 2026 22:07:32 +0530
Message-ID: <20260306163735.1316257-1-s-tripathi1@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E7F:EE_|SJ0PR10MB4637:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c3d65fd-75b0-406e-810b-08de7b9ec309
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|34020700016;
X-Microsoft-Antispam-Message-Info: 
	Cknz2LeDUU2FbINo+yefX+dOlDYEpeOHsyDpXBHdyKv3VVqxvXCs06wmKNJsAunLiN1G1WztUOMc1RcozmwDlFbsgzXHeuZ2RXVunVfYYBW9jVuO5pL3rmieOJ0rEMmZ1/jp+qf1t6kXKwuuasLrNmlB+VDXGvWQSlyN/ybUiDB74qTnXLdpA1Q0cRlAsrXn1Yv7/7LXOCeqlatOeNCawpLBvGpXsQ+etOx3tmQyEPqg+cOhhhye/GKHyE6wh4BnPv5AaMWe7DPfrEQeB0srI+/mvuDFeEr9yoVh6mEmRw8u3kOlHWZn/1QG9/HkaGJ3T6RLmKrYi/v34znHvnThlE7BufNcw5f/QeARCrHLzAcL1LoX2lMFes3eAJJalYXR8fDtEOVB9uJfIUsTfsAyKG5T5lu5sSJkD0ONgERI0RXZ6C8ioGQkzYSMUZf1/QxES3Hld3WcJGT7jlpdBJCTrHhgnZiXy01SHKdPa8KkzYrAiLRkoj8KDaysdvzJZXwrBhBxwAknBgAdSaANdWe8EoaCH/4w28T0SJ4XmF2IKieXj38iHC8FZBb5nKojlherN6D6rd+BT2uYOxL3c22umXJrn468gvYHVknanntL7cxGpmHVaB3INtQHThA2lxwnIMTZfI6FM7WVpkUAGJrWc7eEydyIbA8I6290jDddY1wBdexdWje7qHN+MYpYTTB9g2m2uYxwpjfwqc4lyoyG7C7Vh4j4Bt+e94+GtwYDIrr8bIbgaKpPw56GoS7edl+sNs+Vjo8bKwmc+6LRwN123v62oV6H5LlvMuadFHDVwuo=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(34020700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	RxgUY3b1G4eIeaqw8H6pn1MYMYTe5S5XeP51ado9ynb5eriqKJTDu2SC21nK7zIb0cFKZuqRuS/KlbZWev3hVAZXyGO2AyMBVXhwRrhXIn5/r95GblgyyiGTTBnUsyEsEr40MiZ5Fm0l2K3jSVWgSTulKXCFi4Gx5Rof2IEPDxttQ0qvQ+wAuF2smfT9rCHV+PaXmckSMFPns9gxs6q7isOAIll1QBZuy7OK+y0c9vEtk+ERiZYv7ykEZ7rS+kIeOwuCtAu9ymYTQGr9RlY4ansBgRRbW3rNqTDXgiuoViX3sLlo9BNGMISs576DfNpRre2y5wD4qJDiOnvT4nRWVeVjdEokb8mHL76pWkPZ87kvtCapTfeDaEjZq5D9IQuUN/jbFRfYeGWVAmM/SQV3D/b+Uem67IMaDdvqm6GNtoSZ0VIumRKW5ny44Mgs5DtG
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 16:38:13.9134
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c3d65fd-75b0-406e-810b-08de7b9ec309
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF00012E7F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4637
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 06 Mar 2026 16:38:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19669

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
3. Initramfs generation trigger and packagegroup with dual gating

---
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
  initramfs: Add LUKS encryption module with fTPM
  ti-core-initramfs: Enable initramfs for LUKS encryption

 .../machine/include/ti-core-initramfs.inc     |   2 +-
 .../linux/linux-ti-staging-6.18/luks-ftpm.cfg |  22 ++
 .../linux/linux-ti-staging_6.18.bb            |   9 +
 .../initramfs-module-luks-ftpm/luksftpm       | 341 ++++++++++++++++++
 .../initramfs-module-luks-ftpm_1.0.bb         |  41 +++
 .../packagegroup-ti-core-initramfs.bb         |   3 +
 6 files changed, 417 insertions(+), 1 deletion(-)
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/=
luks-ftpm.cfg
 create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-module-luks-=
ftpm/luksftpm
 create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-module-luks-=
ftpm_1.0.bb

--=20
2.34.1


