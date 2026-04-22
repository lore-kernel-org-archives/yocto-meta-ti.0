Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E8BBF9EDD7
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 13:45:49 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.82860.1776865545501349751
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Apr 2026 06:45:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=Eod6HpS2;
 spf=pass (domain: ti.com, ip: 52.101.201.56, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j3ZBQdl368vCuYeHLIB2IiOSAWp6vq3zGHDwnvwbxCBzVqhpVpmso0RTuPIjfYqEkVPAPjO61YCkn+l8HS0GVXtBwRRSEL6yDAe67fHoM9cBcs1fXm8sfS1tp8JJzZVZu7aM3gKBwIN/RJpz12cYgVZRXCw7q1DLgg/vFZa8oBey8f6RkTYUfRFk2eSKEXVCGULd7nAMADlQFnzA4l169zovba2o+bswHvxhJD4YuMGo2KehHna0XrpU68PFqXKFbPRqDnqz9uIGMQ7hMTyETOBj9imE2hzd2D85wvg5MQYbklqiEeq7g47cgCnyYwOFNeTaKpfMIqWjgwcSbHf4rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oh2F5gwx6i++d56QZOTtVzOvt/dQh8Zq/6/mOpgF38g=;
 b=VtkX8kfdpvUF4u1vP/yjTSvSXybRY2W7P0JRaszRh3wrKrmldF1bL7oUF2cbRZ5NiN7DNv0qoj1KznOjgwWMiz+FZc/Fy+s4/I5+HoK4SObjKceoWd2yv6xTUs20c23FQB090e87caJjDgUmmCcsYYonivsyP0PO8AJ21BHg+4avwWY1/ZZKwOjyDA9+WxZSN/NRIljLSxoj2mnaq8EsovEfcNTXDuMYweKwArUW6ZZIo32T9Op9o8/TCwEgnyeSIpDPGzGwnMB2J2fAkMUeOFR3G0FHjOkQZo9x7AWaKyguS2B0iiZwW8LcTaXVNYRyZ33Z/Y4/RoOSZtBKzUnj+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oh2F5gwx6i++d56QZOTtVzOvt/dQh8Zq/6/mOpgF38g=;
 b=Eod6HpS2u1EBnJC2cG44zEI2THQeHowFew4ogyGU0Y8VWjh+v4PlbXkKYbAzDNDA6D3yu90PeimSdlxDW0lGddaUcY3EA4/s+RLD+sJp/uW9n2BAh01mHUgq27ZT76syqtU6NyxRuEF7ewO0vTXyuGfcvfBjfxogZkgOXC3jDvk=
Received: from CH0PR03CA0113.namprd03.prod.outlook.com (2603:10b6:610:cd::28)
 by SJ5PPFC322FD87E.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7c9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Wed, 22 Apr
 2026 13:45:42 +0000
Received: from CH3PEPF0000000C.namprd04.prod.outlook.com
 (2603:10b6:610:cd:cafe::a9) by CH0PR03CA0113.outlook.office365.com
 (2603:10b6:610:cd::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Wed,
 22 Apr 2026 13:45:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH3PEPF0000000C.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 22 Apr 2026 13:45:39 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 22 Apr
 2026 08:45:33 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 22 Apr
 2026 08:45:33 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 22 Apr 2026 08:45:33 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63MDjXmk2273211;
	Wed, 22 Apr 2026 08:45:33 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wFXtV-0000000E8wj-0tBo;
	Wed, 22 Apr 2026 08:45:33 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] machine: Fix UBOOT_CONFIG setting for tie-test-builds
Date: Wed, 22 Apr 2026 08:45:33 -0500
Message-ID: <20260422134533.3370974-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000C:EE_|SJ5PPFC322FD87E:EE_
X-MS-Office365-Filtering-Correlation-Id: 474a5537-70a0-486b-6454-08dea07570e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	2LM6DdQ/yZbHX84p4pyejTM9oM71XNI/au+Wh/MkdqD43I4TFD+l7Z2KCGgJ5cc52UoRLMb2scKJJNZs4yl6Gq3+FPk5H4w68EuLuoUL11MqDIv4YCsqDjiUZlKTBvmqQT3kjeVfkqWiGgJ6pj+xfRpvJiKOXV87wMGo7FqV5OJECUfiQLAs8jWeawSuuZjtpp6FCExLuLVQ1I9wxD98Sv1W2WFij86BaeY7XbmVp9Hg1IyAoTnJJjjeIeqlaGZDuoQTk8HrR+Jw1EbM4W9cbjzTu/DFMBRFlNSZWsYVAskHrc2oaVuKu56oPvR286Z/0eiQKDupqf7/Azbu9MryTS4k3FJU5X63MNbFWeH5gX2XmVGPCJesTUweVPBI7Ujca8Sa7GRjHPNdHLA3e3ir8YSmGtev/760vnhTecBH3Li9iak2tP4ZQ1EvGe32j2xToB2PVOG9cFkuO3fKArb68vVYUiWcGgHw4jFxspiP+3h7aef7lsB/5fwYWQ8+fkc5ZtPFWxZouZaNN5cYhlo0pQFZYdzFw7aYmdMh4YSThFWfSRB7WpYhnjshfD4of1qRbIEdAycjduJEpDOBBHKbJkQpmAeEiJmxXvVem/1SUUEjWtLhhDXXhUa97TusZhRWHqZjFn/WeXKesMoCRjxrgY1niQb9cUz3ZuZUnI7H7IsQe99XyKn/dgloVNfwTfwXmoJryRsqIWSi8egKiNmZ8oD9CbmeCxybb91Twpship7EAvFOycd4XxsWYqHpcuYSea4A8AYdQcEex9zKyx7shQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	U8OFcj+FxeTHbSD2gk7JtM3O+lWIdswlpMqKoA0zZ3VeciAfQ847z7WczlELl9pOOOuhndf6qFqkht9pT84mvPS0R7vT3gzbTOK0Oc3xZpcpg+kFTQMW0VFqR1wPB71K3+W8bTZvanmVQ0gyA1Lg++Xw46kn07QrY5gJIHIlSFJbxzjh7Sjlpf/GulF3J6ouLDOoMQFwsy0Ef7gIzTZNIeyfDxycs/hVst0cPD8yq3vRiahbdUbUhXfvlxXUZ3r02O8bLq7QG2vk0wjA2uF0iqIIVHty21kreRO117iqwNdFWikuNV5GyroABpzfembzVq2ol2FU97sSStIe1huwhJacH6tCTAGikm8rYhjAOaBvS3ZUFz4ZxF6FOkAlqGuKtge685RQJrVwotRBYbjwDtG2Sj9IMqWGch9DMpIs20IuJ4s3WG0FrTkuFBZwLdc5
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 13:45:39.8082
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 474a5537-70a0-486b-6454-08dea07570e8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF0000000C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFC322FD87E
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 22 Apr 2026 13:45:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19867

It was pointed out that j722s-evm-k3r5 was incorrectly setup and would
not build correctly out of the box.  This is due to the fact that we set
both UBOOT_MACHINE and UBOOT_CONFIG by default.  This was a mistake.

While looking into this newish feature I also found that another
platform was using a prepend, when it really should just be setting the
value for tie-test-builds.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf | 2 +-
 meta-ti-bsp/conf/machine/j722s-evm-k3r5.conf  | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf b/meta-ti-bsp/co=
nf/machine/am65xx-evm-k3r5.conf
index 4ceb81af..c3b028ea 100644
--- a/meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf
@@ -8,6 +8,6 @@ UBOOT_MACHINE =3D "am65x_evm_r5_defconfig"
 UBOOT_MACHINE:tie-test-builds =3D ""
=20
 UBOOT_CONFIG =3D ""
-UBOOT_CONFIG:prepend:tie-test-builds =3D "usbdfu main"
+UBOOT_CONFIG:tie-test-builds =3D "usbdfu main"
 UBOOT_CONFIG[main] =3D "am65x_evm_r5_defconfig"
 UBOOT_CONFIG[usbdfu] =3D "am65x_evm_r5_usbdfu_defconfig"
diff --git a/meta-ti-bsp/conf/machine/j722s-evm-k3r5.conf b/meta-ti-bsp/con=
f/machine/j722s-evm-k3r5.conf
index 5df4edfe..3cb95142 100644
--- a/meta-ti-bsp/conf/machine/j722s-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/j722s-evm-k3r5.conf
@@ -7,8 +7,8 @@ require conf/machine/include/k3r5.inc
 UBOOT_MACHINE =3D "j722s_evm_r5_defconfig"
 UBOOT_MACHINE:tie-test-builds =3D ""
=20
-UBOOT_CONFIG =3D "main"
-UBOOT_CONFIG:prepend:tie-test-builds =3D "usbdfu "
+UBOOT_CONFIG =3D ""
+UBOOT_CONFIG:tie-test-builds =3D "usbdfu main"
 UBOOT_CONFIG[main] =3D "j722s_evm_r5_defconfig"
 UBOOT_CONFIG[usbdfu] =3D "j722s_evm_r5_defconfig"
=20
--=20
2.43.0


