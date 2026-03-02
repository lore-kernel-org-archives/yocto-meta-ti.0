Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B18F1FD006E
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 17:07:16 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.69])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.162565.1772463728408078982
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 02 Mar 2026 07:02:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=JHgA5AAk;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.62.69, mailfrom: s-tripathi1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VEisMfBfcEmIebgwoxohL6BNtCl3xI5hd5Bvlm3MmS1k0STpc6N/yWIs/Jw9wig+6mvQvFRpGYXJ6k45uuZQHSC/rfhsuMvz+6gYs0DzFTp9onDBLe+s46wT8uvt/rHboCUef4Qt+T5fh2Av7/nLtZR4LzuKPxBjU/0KeUDKbEPs2V9XHfxoifQsA1TUFQFYQWUWfcAaDK4jW9+jMqIcScyS70JAEbaOi7beDhgwKgk28lT6o+S57iEuy17e1hZ1hYRaspSeyck2sWAGfPTtDILs7SRov/pjUMeWPNqCJwsVh2be//AO+MAdIbMvmwbLoUxG65kKEXB/m9Kfv5NTmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QjT1Ce99XT+pEevxyNe/i5ywnNMDJcJmGKaes1dyXOg=;
 b=RlW3bu8UfvocrBKrjP/2cg+aWmxvnEuVnxu49YsP2ypx69xr330UVFmoL5Oa43JBcbH2CfOxFliwjsWk5ORK8Bx5jMvdCr/yRzdUHMvq77kz0oX5OGHb+aeM5TfyIOXu5BD526YbzLXg3q3M5nHde/69ce8jsEizSX+tMevDrbtT/LF6mHbPNx2Dmh4eByYjxoGfzvdK7qn7BE5vUpi1KDCN5eCP+mcZzUYYxODEqZyu08y1/9ui+As1y9L/syvl5eA7nR3/vBTl5nxkxA4R44qdF2ABIsh7Mwfg246S7bXczdzwGGR1/7bEO2WvGZHjvVWozz3bS2AuVKW9GKKvkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QjT1Ce99XT+pEevxyNe/i5ywnNMDJcJmGKaes1dyXOg=;
 b=JHgA5AAkThQsCPkSOz0hElcTuGp6uEGK6sgd1LU8VnuRLR9u1LHlqaDAMo/SsKMZD2f/Yn4jh77wGgIxxA/auMA4fsse5LDw1ful+6/dNrVGzoDmaie0xSWZ/r7GvOBKRyxTZWZjhhU7+aE733FGAq2AngSkSex17KBwxgM1mkk=
Received: from DM5PR07CA0084.namprd07.prod.outlook.com (2603:10b6:4:ad::49) by
 BN0PR10MB5096.namprd10.prod.outlook.com (2603:10b6:408:117::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 14:47:28 +0000
Received: from DS1PEPF00017094.namprd03.prod.outlook.com
 (2603:10b6:4:ad:cafe::29) by DM5PR07CA0084.outlook.office365.com
 (2603:10b6:4:ad::49) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Mon,
 2 Mar 2026 14:47:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS1PEPF00017094.mail.protection.outlook.com (10.167.17.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 14:47:26 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 08:47:17 -0600
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 08:47:16 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Mar 2026 08:47:16 -0600
Received: from HP-Z2-Tower-G9.dhcp.ti.com (hp-z2-tower-g9.dhcp.ti.com [10.24.68.200])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 622ElE70454549;
	Mon, 2 Mar 2026 08:47:14 -0600
From: Shiva Tripathi <s-tripathi1@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <praneeth@ti.com>, <kamlesh@ti.com>, <vishalm@ti.com>,
	<k-malarvizhi@ti.com>, <s-tripathi1@ti.com>
Subject: [meta-ti][master][PATCH 0/3] Add LUKS encryption with fTPM support
Date: Mon, 2 Mar 2026 20:16:44 +0530
Message-ID: <20260302144647.1705408-1-s-tripathi1@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017094:EE_|BN0PR10MB5096:EE_
X-MS-Office365-Filtering-Correlation-Id: dcf61877-00bf-4ba6-ceb1-08de786a9f37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|34020700016|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: SFRQy11p19G/TVpA1Ld67dkngFbVyzdgzeumGBUfxOekDN+GROokkbqgxwmK3wrv9UKEZ1vaIyvsQzj2lhv7GxLCBU786gQsGiKaKJK23YdnW3xW0atkcnrgHlB/uDBVA2i4E5akSUsq4X+wvvl45wWt0xhOAZQm1hC8mSvVLBKo91HDbd30lqrwEHMAXtVhXZk+jv/beFl8hvom68bkUwHHp/TRZdAwap/M9CSqEeivxKdA5EtbaBYIzch6D4XY/cN8EcJjYIDbnd0GZepxFYmTAJTy8X8mjgVUGkyC2zVPVskWrXtazsWTTrODIaGfpqtjk2tRWIiU8p1eICcvSS3erjQefcP/VjNvFfEu3pcReZ++sM6WlaTducnG0CZ+F5UlON73o5KuaJzpzskn4pJ7UB/QNuK3Upi2bAjcoqofN7SEBXSOVibTC3R9K5aap8FPGBr/Q6K+qLl5GdMjZoXNlm3+acGVcV14ZVmmBLtHLgXLWL/D5Kr107XdS2Ofw1ZtOopdzuUpz98pe25himJOwqgH7xv60swgolZ4B3u7iR5ARoSYZJTwBF/aVRtsQJqLjDfROQNw9/Qvnp8zZbYiMlD9w2fgglY46VEDcmj4gxtD/gAican5ogbwMHsILqY4ftoZGxFRRH+7GrQSwOwjCuC/WxM332tDxtaJh7vqnvmEgcPsSyIDVGBTdkr4vOv3nMYcjW+3NnkiDRYlu5lC1zpjQj9IMUDOhFtVPBnXaN65RZsh4HzlKcoYfTRSnX8u12uRFYBQVYTuS2pLyMPObYqqnpAX9jzO3E+bYUkygUbgP6f/emxvB3C6SaFG
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(34020700016)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: rXykh6BxBgJnoD1++oJ0W/rBebZLB7Xnrhu9kJWtUWgQ+gRMgPY2EkaNjY+ssQ7WOqd/dndtew9F41brtKpalyiAuHUaxe9iNARcgffq15kd+2wbSUz0D+E7/R/5QHSWUuJBEl5YCaRWlvSfYvCGwPNXBNwxcAoHJtKEUzb8hzpD8Fjmkf8h+TMDiET4ztejCmZ/B7DArhHSi3Nn+uhNmPc9691jc+9+KE+JW6/Inz9ZHQy+NPRzI3lwv0Nql6iqhCQfyD0R3vA292SUGwdcGcmE4+qLCerh8ITU/7m4242HNL8OnbLbSuccqciZYrcFST4nfXwozdkJXG1g1FEy94jRyd/7FHQeD0jchKlM+gKx+N8nXGD/aV9Mz0eVV273hhhHwFFxmsRQB1wCzTob9eVoNZAGcO3agHv8Y8VjC46lmh1OEmKXAvcwys3L3aoe
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 14:47:26.5231
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dcf61877-00bf-4ba6-ceb1-08de786a9f37
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017094.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5096
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 02 Mar 2026 17:07:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19625

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
- Conditional builds: Only enabled via MACHINE_FEATURES +=3D "luks-encrypti=
on"
- No impact on default SDK builds (COMPATIBLE_MACHINE =3D "null")
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
2. Encrypted boot initramfs infrastructure
3. Machine configuration and WIC support

Shiva Tripathi (3):
  linux-ti-staging: Add LUKS encryption config
  initramfs: Add encrypted boot support with fTPM
  conf: Add encrypted boot machine config and WIC file

 .../machine/include/encrypted-boot-common.inc |  38 ++
 .../linux/linux-ti-staging-6.18/luks-ftpm.cfg |  28 ++
 .../linux/linux-ti-staging_6.18.bb            |   9 +
 .../initramfs-ti-encrypted-init/files/init    | 324 ++++++++++++++++++
 .../initramfs-ti-encrypted-init_1.0.bb        |  30 ++
 .../initramfs/ti-encrypted-boot-initramfs.bb  |  50 +++
 meta-ti-bsp/wic/sdimage-2part-encryption.wks  |   6 +
 7 files changed, 485 insertions(+)
 create mode 100644 meta-ti-bsp/conf/machine/include/encrypted-boot-common.=
inc
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/=
luks-ftpm.cfg
 create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-ti-encrypted=
-init/files/init
 create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-ti-encrypted=
-init_1.0.bb
 create mode 100644 meta-ti-bsp/recipes-ti/initramfs/ti-encrypted-boot-init=
ramfs.bb
 create mode 100644 meta-ti-bsp/wic/sdimage-2part-encryption.wks

--=20
2.34.1


