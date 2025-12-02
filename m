Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE643CFD376
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 05:59:27 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1524.1764655159538065168
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 01 Dec 2025 21:59:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=hJHgs6OF;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.195.50, mailfrom: m-shah@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l3gqnAZBugELqSJVwTjDgQTohtPaexpI49wcltdRGyB6LK/VHPTR3Uf4qIIqSAhMAnTvp5aufG7EJ9Db8ImQ3N0DNKcySu+RoZJqmHimoCgnGPS7Bgc5+8p6LtIBQLIflJ0AvQiHtQYakXXv3RR0nuM/Ctnic3D6GiEWZotTNv0ouvpowWJwBhtnlV466kpM89kMzQfKXBVNAACVSY1kcOtkHDLwaHj0v1o7kEcxrP4Dk9BCRLen+jb3GBWkMZtgLmObRRIvpeM1L6OjJNVdHm4XKFwYBW5Usv42Ny77vnmJF4uuSmTNWsMpbKpitqfbgHa9uSsgWAg+1ffg2QR/TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=soNsKZXyt6wScuOu1t7RndeFP9wjx77YGpbR5DkRZRI=;
 b=Y7CkBXlBfutl5iVvKOFdua0CA1hAKoCLxUn/i+tXgzuWx9pghRbcou0zcflt79SA8LdCATqrAR+otWzGWGYN34h89RU4/uj5sj08AAmNvz17abZej9Ly7Avqxez6Nc0wnkt1Tw9k2xrDHPx+svpRoVvI1TeZsz1unDU12I6IUx6i/ohkiZ7lM8+8pks8DXWvGZyBftH6n2smlsncZ4Rxm8BsaXyr+F8kgd/oIj06m4NQrsJXs+qDV9uXSOmT+aH7QShWRRSOCm6AluwtMSs9AMQBiPSL3aMin76ueJqc61NGjr6QWOq/mccC5RB2PSW1iluXNFhARuqJAvDHwYkXsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=soNsKZXyt6wScuOu1t7RndeFP9wjx77YGpbR5DkRZRI=;
 b=hJHgs6OF5D/P7EUmKzf4ldF+2/ole6AL51ysuDSJFZhn0pdI85qtQk8CwbK7rBLFUzZzGtKHBW8DY73OuqZxY9QHJsJNsPC51PizZ65z5/nfwbxuMUHPUb/L+ajFwxFdnvQLdfMt2XwbpKvBVBJabgB7TD3uatYU2BhOkQCp/RA=
Received: from SA0PR11CA0129.namprd11.prod.outlook.com (2603:10b6:806:131::14)
 by MW4PR10MB5727.namprd10.prod.outlook.com (2603:10b6:303:18d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 05:59:15 +0000
Received: from SN1PEPF0002636D.namprd02.prod.outlook.com
 (2603:10b6:806:131:cafe::a) by SA0PR11CA0129.outlook.office365.com
 (2603:10b6:806:131::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Tue,
 2 Dec 2025 05:59:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SN1PEPF0002636D.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 2 Dec 2025 05:59:15 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 23:59:11 -0600
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 23:59:10 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 1 Dec 2025 23:59:10 -0600
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [172.24.235.46])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B25x7Xf1716853;
	Mon, 1 Dec 2025 23:59:08 -0600
From: Moteen Shah <m-shah@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <vigneshr@ti.com>, <reatmon@ti.com>, <a-limaye@ti.com>, <m-shah@ti.com>,
	<gehariprasath@ti.com>, <praneeth@ti.com>, <jm@ti.com>, <denys@konsulko.com>
Subject: [master][PATCH v2] am62axx.inc: Add TPS6594 regulator and core modules to initramfs image
Date: Tue, 2 Dec 2025 11:29:07 +0530
Message-ID: <20251202055907.303737-1-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636D:EE_|MW4PR10MB5727:EE_
X-MS-Office365-Filtering-Correlation-Id: 88766faf-a56d-4ed9-16bc-08de3167ec74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?E1lwwCrnE9SE6s2Vr8WNg0J8pexKFv2Kz87rlDdYovhGOKKDJ3fkUpjYWoNU?=
 =?us-ascii?Q?5CYDZ8EJylZ8v55Fkay5YhH6DeFiF+HM5La/uFkMTPrtKspixdxQb1iVXTIs?=
 =?us-ascii?Q?/LwfZUpLIp250KbIDExPeVmlZnUyLaMOOoe4ubPJsHExc+GfjpFcjLsS0D19?=
 =?us-ascii?Q?AB8KtR8EcwktJxzrc+O5Xl6734cULkWhObz1UX+sZMhOs/Tkge0jD/ZxLDht?=
 =?us-ascii?Q?RjJfhWCz5JqqXJnLIrHyKV7Z2iodJXoEFuuhndWlohHOOHWq8vENNbS2FGxV?=
 =?us-ascii?Q?R3zbHhlIqHIiaK6k1nHGVLOwrh1kLqTV3H1zM01dJSupTuGL0dfzaIbDe/g1?=
 =?us-ascii?Q?rS3vRxqp0qEzXDfJhUPLtbMfbmzXRBkxGClGoeHqxUG3dx+oW3t5Kjz7dCUj?=
 =?us-ascii?Q?5TqKfDzgpulCqYYFzESj1P2tRdo5fNAeiO7/JrWRpehpvUxZOD/oFpio47bI?=
 =?us-ascii?Q?ZksRz4X/2eaHHy0EvpsFtxiFJf9JLGVoznddStuIfh5YunWZtlneNFoZy/MX?=
 =?us-ascii?Q?P0DwcyhYLnOwkRvND0D5r4O27MPDsAS+wbAqIIf5JIa42SD3A85akASOVJ9+?=
 =?us-ascii?Q?EoAjwLlKScu+x6UHgjPk+vK8zQsleKVUq1bhjEre4Puopkl/F3t9L16YFAaW?=
 =?us-ascii?Q?HSCUz1Jj+d1gWD5p75cQevt2WmhZwWsSTqSQjXAERGI8tMddhK5525at0JC8?=
 =?us-ascii?Q?aGVeAQKtfyK7UE4/q+r7wTO21kPnmZxJw+jnut+BEGkCcZVE+oMA9uUKQtQe?=
 =?us-ascii?Q?go05Nhsnr2lvfUVCkneBoZWGyBfiazuBifQcHqQWHJ1fvfXu0xhOp4rhtyAp?=
 =?us-ascii?Q?f/sl8MaLUORjTLGB3M2sEZj0h7mHk/NTFbateDVvQaiW2vlUNByCAXC6hi2h?=
 =?us-ascii?Q?R3bYGlVdy3eOpZTOXsGvhvAHZLt/ApYjEHGG+/hno0S5n9ETL5gM/w224LZs?=
 =?us-ascii?Q?K6aPhdGfuY686EZW9Xatjmt8dRRcxAIQfcYjKeFdzRkXMbvb9+dESezwI4zq?=
 =?us-ascii?Q?y3w/QC9DtsTMK7VDVZR/KGrP4F+w5GKrqpfJG7ob5m0rK2dxdzLNP9OylkT7?=
 =?us-ascii?Q?6LLrcibsPBL97Xc2Gi1jeEGwLG81X6HCZY4QKUuRJLNftAgaUmUZdkmZc7rw?=
 =?us-ascii?Q?hAzksz+DkfCbIEv/qk1+9U7PJlLG5ZFjKmw61J5C7PezWW0jjCn1Yv1p3I/a?=
 =?us-ascii?Q?iACZ8qlvEKnAYNb/PnUqq5XQadTmBVC5NrKQY24BJ8KPN2/Uua3L2GiOnJwM?=
 =?us-ascii?Q?EYbEQDsz5aDOVZCVnYlU3G1v3BuUAIAibjiYYCgZQP2FU47Hyip14lmt0jDk?=
 =?us-ascii?Q?uTpiU6kRnJewAy6I2yfQS143suaEdg1cMjcia40umXp0qfzCAd/D848MFMIi?=
 =?us-ascii?Q?po+/2YaxPHvp3QsYhL4A8+7IFqqE5+32iZvLMusCqscqI9AS9+aocEwL4/pk?=
 =?us-ascii?Q?EUkrZXdcQ2fFjWlbZw0XxwJj5G1aWWLwBTENqBZyHcUekXvA30jvVXuw1zcP?=
 =?us-ascii?Q?bn1/HpHKs+B4J4AqZ0zZQDgQkGziMMOYBjkj?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 05:59:15.1188
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88766faf-a56d-4ed9-16bc-08de3167ec74
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002636D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5727
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 02 Dec 2025 05:59:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19315

Add TPS6594 core and regulator driver modules in the initramfs image so
that the SD card can be probed for am62axx as it is dependent on regulator
to get the SD card probing and eventually boot from it.

Signed-off-by: Moteen Shah <m-shah@ti.com>
---
Bootlogs: https://gist.github.com/Jamm02/0313971306492f183be6ae5ef6c0dbce

 meta-ti-bsp/conf/machine/include/am62axx.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/am62axx.inc b/meta-ti-bsp/con=
f/machine/include/am62axx.inc
index b66a2227..08111f82 100644
--- a/meta-ti-bsp/conf/machine/include/am62axx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62axx.inc
@@ -12,5 +12,5 @@ OPTEEMACHINE =3D "k3-am62x"
=20
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "cnm-wave-fw"
=20
-TI_INITRAMFS_KERNEL_MODULES:append:bsp-mainline  =3D " kernel-module-tps65=
94-i2c"
-TI_INITRAMFS_KERNEL_MODULES:append:bsp-next  =3D " kernel-module-tps6594-i=
2c"
+TI_INITRAMFS_KERNEL_MODULES:append:bsp-mainline  =3D " kernel-module-tps65=
94-i2c kernel-module-tps6594-regulator kernel-module-tps6594-core"
+TI_INITRAMFS_KERNEL_MODULES:append:bsp-next  =3D " kernel-module-tps6594-i=
2c kernel-module-tps6594-regulator kernel-module-tps6594-core"
--=20
2.34.1


