Return-Path: <s-tripathi1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B19BF3D33D
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 17:22:24 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49775.1772731334561327509
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 09:22:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=SroCFtsy;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.194.64, mailfrom: s-tripathi1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JLvv3Cjr6iy4m9mzNw3RrrAOWjRtjUIEtz+jLwyuDsPi+XT9r3iBkHvsrpplPVF/qfRcKYizPBO7OZiqiPDg90QEmGpwlEEiVaxC4o+1bvicw/csggKdE+vDOniGXf/f2Xh0vap+wq9WKdjcBDuPcrY0YPlLphpAtCNMbk2BS7AMX5h+ypsax3uqO2nhcLkc0xNphdrATsYWrW4Kubx/AmgPqJa7kzRd/7g+54aK8BXwMSfLDuTBENy+B8yB7w6v4QbZl6pBoiT4lZBS4GZCCSYZ0qeq06DL3IyMqsy6aLz5iaewyYP2J2Em84H23zX+fr/bA0VlDu1DtXCIqLTYdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t39pcB8WDmO5DlmeKtrltS2p03HAE6qPmnBNcOtA8xA=;
 b=c8gLWD73oERzrN063isRfTjBSAkpd7N6DcMDb3gZ7tHI1vWbhSzsQce7UqA5a11PKqpwVY7hNEIf/SFzEjikGWmaJ9Fs+XUwx1IGuHheNEXoCcYareBPbTF45UoZVxfc5lgAA48sK19CrbJ+ynFw8clmCDc1amZp6S6IYi4aHOdW5a+o7c5InZTjoGOYV/QrMAY+lzs69irliruKEUymAL/CEJ2rUfeGhuw7hMx+vj6EM8iTL04o5SV33ymXAGdEE8ORk49GypaKfoQzytHZlEj010lU5uyvjN7KEbRs5z9qCgO0h1+sX4SmLDFVpCRqvSCAC1LzlHcgP1qWGRAtkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t39pcB8WDmO5DlmeKtrltS2p03HAE6qPmnBNcOtA8xA=;
 b=SroCFtsy2iLYqhNx45rq6Zh9jSO5pi1YJpzmnToCTgeNFdrOqcY82Jm5VA2VFk9ji2sT0qBTdWb4X1ah1h9AylFy189C/YU6luwNtPC1DWh0Bkp5hRw+gsmJpibRCT0Pc9pNrayQ7QOv3hnvCQk9TBWHVa65S0PUfJJ/Fne4o1Y=
Received: from MN0P220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:52e::35)
 by SA3PR10MB6998.namprd10.prod.outlook.com (2603:10b6:806:31c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 17:22:11 +0000
Received: from BL6PEPF0001AB75.namprd02.prod.outlook.com
 (2603:10b6:208:52e:cafe::88) by MN0P220CA0012.outlook.office365.com
 (2603:10b6:208:52e::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18 via Frontend Transport; Thu,
 5 Mar 2026 17:22:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL6PEPF0001AB75.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 17:22:10 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 11:21:41 -0600
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 11:21:40 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 11:21:40 -0600
Received: from HP-Z2-Tower-G9.dhcp.ti.com (hp-z2-tower-g9.dhcp.ti.com [10.24.68.200])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625HLbUW2250647;
	Thu, 5 Mar 2026 11:21:37 -0600
From: Shiva Tripathi <s-tripathi1@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <rs@ti.com>, <jcormier@criticallink.com>,
	<praneeth@ti.com>, <kamlesh@ti.com>, <vishalm@ti.com>, <k-malarvizhi@ti.com>,
	<denis@denix.org>, <vigneshr@ti.com>, <s-tripathi1@ti.com>
Subject: [meta-ti][master][PATCH v4 0/3] Add LUKS encryption with fTPM support
Date: Thu, 5 Mar 2026 22:51:15 +0530
Message-ID: <20260305172115.3684326-1-s-tripathi1@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB75:EE_|SA3PR10MB6998:EE_
X-MS-Office365-Filtering-Correlation-Id: 3011aa60-f65f-4d49-b393-08de7adbbc02
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|34020700016;
X-Microsoft-Antispam-Message-Info: 
	l4XcTC2ThUhmV7iJZOXdeTHp2TYkTewpkjTlJnABcnKcxc+6PZcjdRf1CEvqap4+EnzB87PwmUaX/38kRwvBKxUAhVj+BYr0Qk8e+9GHtGxhFjpc5lEA3lg7dNDqLwWAYoYuSMO3VQ4GUwpfKaA6D4lbnNc2dODcFWF+N1bcinqzsdi3Dy1P6h/ykXqbdWqRqb64IjOqxDnEibOQ6zn19FNhtCj2WyrXOmMK0hxLhtFr3yKVis9RWIrCwcl9untMX/WgwhK4//kZHLK2Waeyr834zwJ7Eox2jmQ/oa+ygeMpPGePGn4pPzJiGHsAcG6dL7FbGfQyzMz41QeHBrz0Z2MaR98VZPX5USabHbJKXNp7WLPQIpFrOehSjIBDgD5EpYP0R2i2bvpGLjuPcH9/ZeYxDwnziHVjnKZQRZDwTfwci+vm6dgzJVmuQ9YpW80NtPQb0YZzdmApY/A6oZpaYqU10JUov0E8B1lMCOT/gtOpH5ODpUF01IZb4nTtUXqaE80idEFlvpGGpFgmC0L0IuSB5IHM/vr9dlPVa/qR/Zo+lvw7mqO9cbBAGZhQb4d9t9FYjPi3PgPZpklv9KrxZh/4g9EP2IsDl+49WcxhKVh7BnIyPLvC+bMKZx86TU+dlp5Mu0EBK4b1np4EY/uVAt0eagm/IV7lro+fn+ShzKJCdU8jCGjasUmFCO5n0c6dIrbN0mFyambqj/XbkH11n76GKwdZwsns7s6de40jhrKHIQlHFCEKtwS2xcy00obHTzTvpi/UaVU9efs1YANdmw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(34020700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	VgxCsrHkt4GntQx+Mf6Q1PnjQgw3Szs6KlcglyvEZeaYl81GNTeDU3kQ3cnHGCGFIHDFbkNq+QrJtLDUSS8wfYsYEHG2WfdNwymRL9DoBOH2uPgGn7h1khXYFZiRou4ZRvQCWoa7xYemuXy/koQZ8cTblfy1DD1SkJ3stLAN3y4fG2kYpDgUBvslZxearTntAyChf4mxJC/FTMLaki9KbH2E65SkzZ90gbzyHmlfSDd+k9JTdnUI3T1ND64af7fSaGbVEojBbaw+CV/7udp1UkSxZZyGY9Z1eHlvA8xVXM5+ZF7HP8WDJIOrZeK2iOzyXCevd1Y2CfzilFRYe5C2d29hB+XkF3G/ppz5Le4ozr6T/Et4blMOIYg62wW3qE3FnIrxJbVK/UUA5ZCRn5BOUYjiMDsSFKbTAXTVyblyJeC3QXk9TBxUbzqQX/GFxn6c
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 17:22:10.2814
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3011aa60-f65f-4d49-b393-08de7adbbc02
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB75.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB6998
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 05 Mar 2026 17:22:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19654

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
2. Encrypted boot initramfs infrastructure
3. LUKS encryption trigger integration in ti-core-initramfs

---
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
  ti-core-initramfs: Add luks-encryption trigger

 .../machine/include/ti-core-initramfs.inc     |   2 +-
 .../linux/linux-ti-staging-6.18/luks-ftpm.cfg |  28 ++
 .../linux/linux-ti-staging_6.18.bb            |   9 +
 .../initramfs-module-luks-ftpm/luksftpm       | 341 ++++++++++++++++++
 .../initramfs-module-luks-ftpm_1.0.bb         |  41 +++
 .../packagegroup-ti-core-initramfs.bb         |   1 +
 6 files changed, 421 insertions(+), 1 deletion(-)
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/=
luks-ftpm.cfg
 create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-module-luks-=
ftpm/luksftpm
 create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-module-luks-=
ftpm_1.0.bb

--=20
2.34.1


