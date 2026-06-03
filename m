Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E8F3CD6E55
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 07:30:29 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14500.1780471823763720759
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 03 Jun 2026 00:30:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=ThpwjyY6;
 spf=pass (domain: ti.com, ip: 52.101.56.31, mailfrom: m-shah@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g/Mor304QvKCdvFRQUXaygpOEPJgbOc9qsVPVM8MlTlaIQXZGYd27XbiGf37qxz2ZOvNsoVTjiztJJO8hAZ1BC4UJTSr69FvjTuZ4guV+hfrpnVR/zPnUEvPMnLflzVTlGGc4CC7cbSDXSzzGmF13hMm+n8XE362HP30dbGMyaFLDQk9nqnY4Ug1Uu1d+jWPuPBw1x0kISpPsNC8XWQWaUhG5xBYaUPzvB2JRwZQ8ff8gZsnycJdwO77+wLdiEmkxWTQthXaqMyv/0Q4pVZqgQrEzuQvc0JMb29J/DsM3D/lDnJYhy/HCdnO6tYf1LXTaUgqO813ht/fjiAtAeHA2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6YaDRtIgMZi4PfGwZ4awLhH/yHdtRIWXvO4YIICkUuY=;
 b=CBe+lelYPfx0/o3iziSR4IsjokXCbarYLmQZZtSlcdWIJpOTutdMb5WhtlmyG1Gk3zBERAG3mjbe5vZkZhOG52vwcsXMkaCNYt8K2U05n6m0l+ENkI7okyD3T6PvwyoeAMF1slmVYsmPyatOzUsEJjUomVFFS29eUdftpSOtSLKUNAT7WCkPdVtMOl1Xjqa3c7/TNUIhgY10Sg8voLQIN41WqzkrxCOs4bs6EzX2+RlbyYWlOtGJxES4JMgQbS1ngYmC4IinNZXbSbpzMU8U+iyVK/dTlO0oHz5W3EuRM8R6cY2I+ggI1lEUNTL1GvtdvhIeOxvuMEe+JQf8OmGzdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6YaDRtIgMZi4PfGwZ4awLhH/yHdtRIWXvO4YIICkUuY=;
 b=ThpwjyY65CHx6BV4mluH6qEXIP5/Fz/P1Wloj96ncCUbFKiLvGfqMYKLUPQE8w/2YpuvJ6yn0D0c331/+7kzBXUIUivKNRsKSQ7ON1z4HKQo5/o9I8OLRrWSpHzlxRSBnrcDnBiWTGnzwd8ajxBA/3aHkHIQ7ssp3heEMv7lcvo=
Received: from CH5P221CA0001.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1f2::6)
 by SA1PR10MB7636.namprd10.prod.outlook.com (2603:10b6:806:376::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 07:30:20 +0000
Received: from DS2PEPF000061C4.namprd02.prod.outlook.com
 (2603:10b6:610:1f2:cafe::6c) by CH5P221CA0001.outlook.office365.com
 (2603:10b6:610:1f2::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 07:30:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS2PEPF000061C4.mail.protection.outlook.com (10.167.23.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Wed, 3 Jun 2026 07:30:18 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 02:29:36 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 02:29:36 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 3 Jun 2026 02:29:36 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6537TWbV737025;
	Wed, 3 Jun 2026 02:29:33 -0500
From: Moteen Shah <m-shah@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <nm@ti.com>, <u-kumar1@ti.com>, <s-vadapalli@ti.com>,
	<a-limaye@ti.com>, <m-shah@ti.com>, <gehariprasath@ti.com>,
	<denys@konsulko.com>
Subject: [meta-ti][master/wrynose][PATCH v2 0/2] Fix NFS boot on K3 platforms with bsp-next kernel
Date: Wed, 3 Jun 2026 12:59:30 +0530
Message-ID: <20260603072932.1273938-1-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C4:EE_|SA1PR10MB7636:EE_
X-MS-Office365-Filtering-Correlation-Id: 106707d6-454a-42ee-67e5-08dec141f683
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|56012099006|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: 
	HhINTNXWud3nkW4vbf7psJRb0wt6SvW1lmoEp2fh8XW3bdbfyxEwgr0FegELVjt+WlZbRakB1yXyG2FRr7OS5cRcH1bTYdmZGyHcofFtfmvEnkqoPRDp02k5TJkmQCWPJnKkLfJjwZmMxPeHjkERgYy/S8+2GLQIZx9ikBLVVPIR3OnWbfWLS8in979yMt72aIxwG90LHYNmTmcXA1HMLApDpJW3VTxOoGeh8L3jtAqH2Gw8eGOKGqP/kuVOq6W8WXOaitCnNln91W3P9ATmU7pClf+6vO4fzdQ7iZt3Grxg++h/XCvb6fIGqI/vAcLlmj8/O/axQwdCDT6EDjy8LNIF/hl9lJ4hrZICXFiN5NS2F9jfcfGW+VqUrmhMdaVTZyHtLRI9PNUugTQ+zIy88rAouWpH7Em9482ea9vj/7PBb2fLdfLBm84v6JIr9Gyy/LWRmWTNPwfGmjdCuuAvNsl+g1m4bte3iIk2eswuhkvNc0r9qiT5xfeMwJn2Z8uNij+y07rCQ2Z+KC49P/nxTqVvw+o8DYUhFYrybXpcypIOlsalQCm4HvxYov0bFE8fDAFEdA+xkMPi0wus0Ivlb0/i6O6xyjmQ8BWsY3Xt/H2hHXmo2Sl7npEAtDslmW1aYrdolv9Lo7XkIzufJvbpHBMsjhd94i86Lu/HYTg2d83AopwsHjY7pG49dgmlN0jQyL0F3UmDfpiaa6DxE4cYcsc3MQHF2frnhN0609L3aZA=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(56012099006)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	5b7IhFFPGxF6IaFYe1dEj6odRMu+n5nJLfVLX8yPWZep+AP8rX2Ho15zxnEYjy7KALbRzGXFJHPXw27cvDegZRtWLs/lObAe05uqGjgWgrs5Fg/N/VzzzkM96L+z+BVOyzHyMAOjJKW0OsqsrL6oEy0JZfloDVdKZgdQpvl/8o2EKWCt7GRBBM4L/3iacSwQjAIiKhZmyPOwtmc2wbdVDAsGlPZmhxh7ux8hQ3LTvwQHJZwd85Wf0JyNM/NRemPhoOdWIOk9hTu90tykKsrTPYAgHAijoMnJZa5QAuU2wuD70aQIYS9H9WzrnaTAVtCDq1/lf3of1m8wkUes9C13Uag8VL2g+BNYBIhikRlYof3Vw9CiogiN6HrBFABmWGjRWgAHtme8tcrROkcaxlTYZxwXgN5wdPnMKA3PGSOF7ZEBVzMRxyTBfKvUk6nk/8Ng
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 07:30:18.5043
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 106707d6-454a-42ee-67e5-08dec141f683
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF000061C4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7636
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 03 Jun 2026 07:30:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19960

AM65_CPSW_NUSS and its dependencies changed from built-in (=3Dy) to
loadable modules (=3Dm) in linux-next. This breaks NFS boot because the
Ethernet driver is no longer available before the NFS root mount.

Patch 1 adds the CPSW module set to TI_CORE_INITRAMFS_KERNEL_MODULES
for bsp-next so udev can load them during early boot.

Patch 2 adds a standalone initramfs-module-netsetup recipe that waits
for the Ethernet interface to appear after udev loads the modules and
then configures it via DHCP before the nfsrootfs module runs.

Changes in v2:
- Move netsetup from an initramfs-framework bbappend subpackage to a
  standalone initramfs-module-netsetup_1.0.bb recipe (Denys, Ryan)

Bootlogs: https://gist.github.com/Jamm02/351d46885e20b6043d464166ee313614

Moteen Shah (2):
  k3.inc: Add CPSW modules to initramfs for bsp-next NFS boot
  initramfs: Add initramfs-module-netsetup recipe for DHCP network
    configuration

 meta-ti-bsp/conf/machine/include/k3.inc       |  6 +++
 .../initramfs-module-netsetup/83-netsetup     | 54 +++++++++++++++++++
 .../initramfs-module-netsetup_1.0.bb          | 24 +++++++++
 .../packagegroup-ti-core-initramfs.bb         |  1 +
 4 files changed, 85 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netse=
tup/83-netsetup
 create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netse=
tup_1.0.bb

--=20
2.34.1


