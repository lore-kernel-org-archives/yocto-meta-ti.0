Return-Path: <w.egorov@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E279E68157
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 09:46:55 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.111])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8799.1771321605882581712
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Feb 2026 01:46:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@phytec.de header.s=selector2 header.b=X2rIKVvr;
 spf=pass (domain: phytec.de, ip: 52.101.70.111, mailfrom: w.egorov@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=syQpYh643h2nWT8eQtTyhPeIjr/bH2dy2jqcIIh2zCgO7LxOEEJItglJBpnj2nTIbMymaPdd8NuTjhCFektH7YHCxqEuGjfsxux8DBrWz4q/qJ+Jwz0m9VscGYyabMohRmstGCu2INB49OjwtJfdxC8A9FCzcydBrS8dVyxLm9pjjBjpweTjKxd4LMMZM0cEcRfgl4N//l4r+EDWkhQhJsSn8bf4TanVvejnwHrf+rkO9MmunAQrytRVbCh6RqdizWL35EeOoWt1fw4116ul3WtnOJXpxtUvoOKx7Qs+nPN0mDpfDG1prKNFQXTDKkBgzg403RhK/Wf6yHI/sHayiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ard28/WMHb7DwWBHQS8/z6PXq24zv66/P6IgZsQmajI=;
 b=ynMVmpuW1mlGq4ayJuRu0aEXbKXpJp8taIVtLlFNOcMzNmaM/Tw5gRmHrJPp99igqsRoj9soiN3nuJ/RWVCAuo0B7tWZnybABvz6OPwMmyFuSLUaPAoT8jQi47hF923pZsVto5LywFCAoLhtjEs5DK+lxsrO9TqBcaeR6ok+bo1WCkXNI6nMXbu7CC4WWJuDc4gO1LOK/NGcMozwSBb0e0P2MkBIgSl5YE7+PCpmMVBoGMEqM5tpdDmL1u9teHVJcjyL8cEFDSStOIrLd00y1XDvokbWpoXeEXs9AhE+pPxAXatea+sJTtgIh5rMikCvPAHay8K7tBI7dzTqsthQWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=phytec.de; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.de; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ard28/WMHb7DwWBHQS8/z6PXq24zv66/P6IgZsQmajI=;
 b=X2rIKVvr4V9OlPI44ISbz5FQKGsc8WLovGbpvmRA71MnR5zOOCK8ON6A13ddSP9LQWlKmgB8Mlqhj4FBI80m6kEnVbN8vwYI852AKzElJXPrLhVHtvUZR6Z81l+6/qYUKnvDv14y6wJyaoIpbuJYVN5xlQSoviVFvaSzBceuc/8SkI/0i8yMykw5orVcagHlguYhD53FZZ4OHHtp92UNY3m+RKhK9LWi0gn81Ys2PZ7VTfKy6EqMdm4gHeFG16A4Iu7xA23ye59yg59JG1plwHvZNUYfc/h1CHob5IX5yqmVYe4z+EtO2fnr4230vjof5akDu/p4U49lKoCPsOMWbQ==
Received: from DU6P191CA0060.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53e::10)
 by AM8P195MB2748.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:32c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 09:46:40 +0000
Received: from DB5PEPF00014B99.eurprd02.prod.outlook.com
 (2603:10a6:10:53e:cafe::ae) by DU6P191CA0060.outlook.office365.com
 (2603:10a6:10:53e::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.16 via Frontend Transport; Tue,
 17 Feb 2026 09:46:34 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB5PEPF00014B99.mail.protection.outlook.com (10.167.8.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 09:46:39 +0000
Received: from phytec.de (172.25.0.51) by Postix.phytec.de (172.25.0.11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 17 Feb
 2026 10:46:39 +0100
From: Wadim Egorov <w.egorov@phytec.de>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <denys@konsulko.com>
Subject: [scarthgap] meta-ti-bsp: ti-img-rogue-driver: Avoid TMPDIR in debug paths
Date: Tue, 17 Feb 2026 10:46:14 +0100
Message-ID: <20260217094614.1925493-1-w.egorov@phytec.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [172.25.0.51]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B99:EE_|AM8P195MB2748:EE_
X-MS-Office365-Filtering-Correlation-Id: 8045d67d-3811-4e13-c275-08de6e09732d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Nvh+0pXJnFaUIMaLTCjnaOR8fAVowxOjx8OCufobedmQMxkILZ2j8SfuS0kH?=
 =?us-ascii?Q?6yLHA1WkPPC2oo95DOI6+2HeSL1SUMu3joApbTAyfuluOXlS0SpcMvI5Fqu1?=
 =?us-ascii?Q?xIHocazjdu3T/ESrM5hv0w0gbXS3y1q7GEP73DDn7FEhWa/fSX8xXe8rlJR9?=
 =?us-ascii?Q?OlArDCZkG0ZVST/f7Gpwic+ht+rQS6PtmiMUSK44JFsDf7GbQMJygWdBLKVz?=
 =?us-ascii?Q?B7eNy+9d74Q6fyLTnIfMJfnqrM78UMV3dS2fQdcjbLZsAzhbjgfmhr7vuyVd?=
 =?us-ascii?Q?jDtBW7y5Sp+gUaG7+JyODhQ1Xcmtb9CAmoYWw3JhIqJOssdjA6AKTP/0LDp4?=
 =?us-ascii?Q?S14H6SY7SLBNdb03uXrEJ2Xdre4iGbdbB6ziEBupANAoaqlGKAo380bG+usp?=
 =?us-ascii?Q?8/PMBcDQlSy+9mC1SVQrDf1SsxTp5y7+dkq3103B4u5Fr7jns9ozXJgC8d/x?=
 =?us-ascii?Q?2bJR1UIjvl9dCekEZzEH+8JbQYRtMETZwgQk9dDkw65KnI4O21ShoRnhn3JH?=
 =?us-ascii?Q?uKW7rmmfSvCWzFqXQ4gDjJemDBOVkIrJaXWHbHdUZMjOoxYKhq+EwX0iFor+?=
 =?us-ascii?Q?YFuyQOC+cbXbyrHFbGr1C+WruqG4MohMtcd5m8P/9l5+7r0xZIIo5SkQ0niO?=
 =?us-ascii?Q?8ubZBx7iGDDqwfGQPasTBIizHqlu20zlu6TqRXOiIZo0NLivanpjCrHXPor1?=
 =?us-ascii?Q?711cxb6REzfh1fwO+etnKT6dbY2ZnDHcuDD8HtvEUYXZaIWCHKgTPifLUoGf?=
 =?us-ascii?Q?p3Kd2dKXxYZM0fNZ7j94BvK4ZM7yhmoq1apPmm3znWyrqvxpucMDUi/oXs4Z?=
 =?us-ascii?Q?Th29RXkvQmkSdxozKpMEw1dKK6G4cYxWh0QA99LNLzP0emU9efB7PJ5n7ZeY?=
 =?us-ascii?Q?oKq/OTA6uW3iCcXcEDEURHHV5QvGznU73JXOaUPif4aaGN2snQuHQgE7n4bX?=
 =?us-ascii?Q?J70IPGosT96Op/ChnSJ0SsmftgNWwgT4iu8cZA+eA6B9X1a9suwyRGcddj0S?=
 =?us-ascii?Q?IXXGj3eik9VWVrhWNA0FxvjWr7/+sE8yil8DmaGgyyY09cc5PhIdUiauhfFl?=
 =?us-ascii?Q?tAcBO15BfWd+FXfysHOTMLo/YhgNJNsUqAtcdx47ZEP+GBkI5fH8Vq7/YB/0?=
 =?us-ascii?Q?WPBzY4ojXLsQXWd44Ns32V1LLNUnVZ2UJx/u1zN60js/Par7fIvU0VbU1O4L?=
 =?us-ascii?Q?Hr32jy15dk93q92VcBjgL2MIeG0GjGclw+6GBcdLeq9oMy4TaDjV0m6Z8Q35?=
 =?us-ascii?Q?RwshBobS5wU8X14gGDGlo4RR9k1YzEnEva9xOm741Y0eOZ4uy6fMTtcpYnTQ?=
 =?us-ascii?Q?GFawgsSzQRwjOe16iTUXQYBq4nqR6CIb9UvQdW/AHMhGGZ7cQaMNiJGvFcc+?=
 =?us-ascii?Q?HAd+VJTCO+a6YpxBEdiAOT9N/uXba9T4WszFldRItsFYO7CXw6vcZgbLyrnD?=
 =?us-ascii?Q?PLvPfarne5HNR1IvuYENxuPb0vS0pFIQKuQ1UWweIblHBaK1Nqa2w9t8lufj?=
 =?us-ascii?Q?YUYSHLM3tHKf/12Oz8IOZ9vDhd/dGYrpfZqvecch+kIU7ppUZ9iSCtEZ8U2W?=
 =?us-ascii?Q?fKVgBrr6j4k7ox8W8JobtMKRMFdYzvRl8abrIWoIpHTKk1/jymEHFHph0k6H?=
 =?us-ascii?Q?MmxxhdwHyxgKgFQrbs85hKr5paO228aydcjh4QcRx+IuDfRGsh1MrI5hDcLj?=
 =?us-ascii?Q?MJ2QbQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	UWdYCYvGAigiVCNf9u2q3mlkW7qCKVi2+ePhVhcgRDT1DKJROGMa+fMXTOhoI5R6LTXEpbSCA4bBHNiNaK2qyGEMCi5xjwDnKbnqUQQZaai/A7ptu0LNzdeztqN+9QyGNALwQpGn6DVVgf5ryoZInn3HC6b2AhYC1mNqsg/DIY3K1G+IZAs7nbCUMHy+8fADS7g86b/CvVZpC9lbiZ7nQ4HtslPrJZIo/4xv2oX6cEvojzUXP5+XMgwJ3CnqEQPSyqZHb+wOkuUHoor6ScV9w9aLs4NmtscNGmOrFSKKHhA/+aCV49rOS8qGxWuI0M4g5nQF8o5W/C2fa+fca+Gj5GFn9693+J6s6jQGHp7fBiGZHjvoxSNtJVaC4zy961l15pSYCYnwl2VLbNt4fE0Sf7vRUvjJZqiUQAMfL7Duzfz64gIw0UOSB9IW5S5TOmx2
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 09:46:39.8594
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8045d67d-3811-4e13-c275-08de6e09732d
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B99.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P195MB2748
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Feb 2026 09:46:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19521

Build module with KBUILD_OUTPUT to avoid TMPDIR in debug info
(buildpaths QA). Also bump SRCREV to include upstream path/prefix-map fixes=
.

Fixes the following warning:

WARNING: ti-img-rogue-driver-25.2.6850647-r0 do_package_qa: QA Issue: File =
/usr/lib/modules/6.12.57-g7af20799-g7af207992070/updates/.debug/pvrsrvkm.ko=
 in package ti-img-rogue-driver-dbg contains reference to TMPDIR [buildpath=
s]

Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
---
 .../powervr-drivers/ti-img-rogue-driver_25.2.6850647.bb  | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_25=
.2.6850647.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver=
_25.2.6850647.bb
index 0f50026a..54c80480 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_25.2.6850=
647.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_25.2.6850=
647.bb
@@ -19,7 +19,7 @@ SRC_URI =3D "git://git.ti.com/git/graphics/ti-img-rogue-d=
river.git;protocol=3Dhttps;
=20
 S =3D "${WORKDIR}/git"
=20
-SRCREV =3D "a838ac0074db640ebd1b64be6364417b1bbca3cd"
+SRCREV =3D "72723eea0cab47c20e5734c1c7b9a441ed2d74c2"
=20
 TARGET_PRODUCT:j721e =3D "j721e_linux"
 TARGET_PRODUCT:j721s2 =3D "j721s2_linux"
@@ -31,7 +31,12 @@ TARGET_PRODUCT:j722s =3D "j722s_linux"
 PVR_BUILD =3D "release"
 PVR_WS =3D "lws-generic"
=20
-EXTRA_OEMAKE +=3D 'KERNELDIR=3D"${STAGING_KERNEL_DIR}" BUILD=3D${PVR_BUILD=
} PVR_BUILD_DIR=3D${TARGET_PRODUCT} WINDOW_SYSTEM=3D${PVR_WS}'
+EXTRA_OEMAKE +=3D 'KERNELDIR=3D"${KBUILD_OUTPUT}" BUILD=3D${PVR_BUILD} PVR=
_BUILD_DIR=3D${TARGET_PRODUCT} WINDOW_SYSTEM=3D${PVR_WS}'
+
+do_compile() {
+    unset CC
+    oe_runmake
+}
=20
 do_install() {
     make -C ${STAGING_KERNEL_DIR} M=3D${B}/binary_${TARGET_PRODUCT}_${PVR_=
WS}_${PVR_BUILD}/target_aarch64/kbuild INSTALL_MOD_PATH=3D${D}${root_prefix=
} PREFIX=3D${STAGING_DIR_HOST} modules_install
--=20
2.43.0


