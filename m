Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DBEACD6E57
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 10:48:26 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21948.1780397300447393260
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 02 Jun 2026 03:48:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=sx4zk7vJ;
 spf=pass (domain: ti.com, ip: 40.107.209.46, mailfrom: m-shah@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nFimzOxdz6RpPqa7Ha8yVTed8I2G3mbTRkgF+PFT9WbpAHfJSqQZm6ntMwMP9wTGSbeDpGKmDumRFwF3p8iHwMFqDecvEf/v3WUPBd4IATu1LbgYA2n6OaSuUEOoUY8ci0ttUcLLvkxraa12dmhgqSCwypHupRhi/WSNVuYH14mrnsr8au6L1xH1mGj5gLfZq9vVcTUsHyRGnWOvhUcxYhbeVB6x7KBArlzyCUJUYCiksvC5huiXVPUCwakWHWOcrwnM5LO99OzBTb7AMMxO4hKYMSU4Q046grLNDLDQF4M7GcWCDyDUa34zEgk/r9D4+gpWAqQ97whtUjgf5V5AWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/qNgFYgfUz1f7GBPo77zbt/8/qMdfil/fbXieippdMQ=;
 b=Bs9TwJkc4WYIdBmgfKKYDO6szYabJY52F701OQd7UMUFpYZU5YXv5iBPHrUYYIT1g5MsyLWmWXLhf6R92XJ244H/yFEnag86B8R0F/xdp4Vms2ar9fqChlu97ybq7+cCvSJVt6CsyXSyOH8Tx89UOx+9iIOx0dcHv9OBE+DUPjD7EIScOOoCBoZgGL8/Mou8VibS82+MDwPPv9Kpd0JOUUe5vvadIBN9FpE0IaF37AxfyclPsFgVOXKwrROr6NZMT5QSyfH44cpB/DKDNp7pfCe/qBa27et01gy3ZOX62AcRWSYsXA78tRa9EnbXvxjXZpXw86u0Mi1sT1le3EmRtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/qNgFYgfUz1f7GBPo77zbt/8/qMdfil/fbXieippdMQ=;
 b=sx4zk7vJdsUBLgRSy0x0KV+Z2rVcCe4UtAeGEOeQhqn91Yaey4scaEmMZY4CW9K3Rt2bQfLjb5RpOE9jozHjshbAC43aEVunDRxak/IOMoxwwPKNP4JwJG6DP8fr0YONtSQYrf3ShmGz7uk9t2c4XNuJTlmWYu/6FWEOAmkx4YU=
Received: from CH2PR02CA0007.namprd02.prod.outlook.com (2603:10b6:610:4e::17)
 by MW5PR10MB5806.namprd10.prod.outlook.com (2603:10b6:303:193::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Tue, 2 Jun 2026
 10:48:18 +0000
Received: from CH3PEPF0000000F.namprd04.prod.outlook.com
 (2603:10b6:610:4e:cafe::67) by CH2PR02CA0007.outlook.office365.com
 (2603:10b6:610:4e::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.16 via Frontend Transport; Tue, 2
 Jun 2026 10:48:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH3PEPF0000000F.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 10:48:16 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 2 Jun
 2026 05:48:14 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 2 Jun
 2026 05:48:14 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 2 Jun 2026 05:48:14 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 652AmAhW3602223;
	Tue, 2 Jun 2026 05:48:11 -0500
From: Moteen Shah <m-shah@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <nm@ti.com>, <u-kumar1@ti.com>, <s-vadapalli@ti.com>,
	<a-limaye@ti.com>, <m-shah@ti.com>, <gehariprasath@ti.com>,
	<denys@konsulko.com>
Subject: [meta-ti][master/wrynose][PATCH 0/2] Fix NFS boot on K3 platforms with bsp-next kernel
Date: Tue, 2 Jun 2026 16:18:08 +0530
Message-ID: <20260602104810.1068959-1-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000F:EE_|MW5PR10MB5806:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e15421d-c698-4d42-b183-08dec09473ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|6133799003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	PPCdHE6g19LTP1eN1fd86RBu2yrm2ehNI7wiLZeaRXlj2lod1i7/qA0hpGxLQJl+xbmrkOQXY7YbQ5Nd3RvB1CFCdCc7Er9LWWhA/qBcOVICZogBu7mSEXMtUezMCGkoOvT7DAjDCmMwGyrTsYY62TOBDoAZ+WsgVnCMPNQKplD2xuZmeNoUhnYPj2v0dRsmbMGghybSrGQ5sMnNo9/797pzwmfPFRD0rf1/pI+fEk6Y55Hm5jqQdKvwXFbsxiGVEkbMJAS3ukZ+9Vz7R9k0p9pAiNMC47Ok23Xmks7n7c4wxzxOFGLe67r9WyCGV3SdQjrzdoXOucikXDN5dbDweUHbQ/JNJBMu4eOMt7YXZw4cqmIHgGMhUZ0c9ysvdFdjqROif0RJ/rgXGuHCAG308868w6T8k2ajhcurGRQzma6jnoijUswu8nQuFamxqsX44bp+eTQ8Y7RsvgomtVhipm1ypsG8lEe9eskyNUeH08rKOUz9Gth4+7ZLBzSi/uBirTpMWJ72oNdQbbgrVOqK4yJiLRoeAQ0ltoLD0nxBEpMnByiRs6Z1lQdhgV/9arP2JGunlvGb/HW0bJJukqwjN1KO2pwlgDzPiNCquo2juAoErEgXdof5zSgdJ+CnvqfBX/G7P+fvzhh+Jvx1g9fXt+MJ4jWs5FmUmbKChuU1Fz+fQIQ2rAxE0k/mb2nXxvpl2kllE4BsFPzPK68vJr9GyDqt6yLHHXPMxLZ3WMFi11w=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(6133799003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	EXkNx1Nm2E4d9TXigicV7drwTcsopITFjpuxYY+aYK3sNAyiqDIOqKecpRuSWGCV2PKTanSxzer9DPPby0xO4iUXTzPOwl0u5a9F/a3bLvgoPcUCO9E+xzYZiO6jDRpRgtCmusFrFNSmYac7Z4J6O4SsJb//swO9spf6AYmj3SjE8w4Gt3uvcfa+5xIBDltmPUDdTCBwLHQOd5F9FRcqmpok96aUz9iUeMmhlPdG7nBs5hWsIIOUV10DAxnGMAwgJZ0g0HnyU/czFt5w6N/aZKf9i0w7AXBWBW/A94IJs56agUSaNY4w8ElQHDGWNwi1hF097f8/kXYzk1H8RqZm+7pB70c3Ho5Sn4pfxz4vBf83lKsQv3T4e1miRBU/EyZRCbEMc9ugqAvsOSWx7KZHaDrOoRVFBI0ypmsCfsK/bfHK+2xewqbYj8+G5vOX9qI3
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 10:48:16.5906
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e15421d-c698-4d42-b183-08dec09473ff
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF0000000F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5806
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 02 Jun 2026 10:48:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19945

AM65_CPSW_NUSS and its dependencies changed from built-in (=3Dy) to
loadable modules (=3Dm) in linux-next. This breaks NFS boot because the
Ethernet driver is no longer available before the NFS root mount.

Patch 1 adds the CPSW module set to TI_CORE_INITRAMFS_KERNEL_MODULES
for bsp-next so udev can load them during early boot.

Patch 2 adds an initramfs-framework module (83-netsetup) that waits
for the Ethernet interface to appear after udev loads the modules and
then configures it via DHCP before the nfsrootfs module runs.

Bootlogs: https://gist.github.com/Jamm02/4b631f90f282030d367561c08503c9e1
Moteen Shah (2):
  k3.inc: Add CPSW modules to initramfs for bsp-next NFS boot
  initramfs: Add netsetup module for DHCP network configuration

 meta-ti-bsp/conf/machine/include/k3.inc       |  6 +++
 .../initramfs-framework/83-netsetup           | 54 +++++++++++++++++++
 .../initramfs-framework_%.bbappend            | 15 ++++++
 .../packagegroup-ti-core-initramfs.bb         |  2 +
 4 files changed, 77 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-core/initramfs-scripts/initramfs-fr=
amework/83-netsetup
 create mode 100644 meta-ti-bsp/recipes-core/initramfs-scripts/initramfs-fr=
amework_%.bbappend

--=20
2.34.1


