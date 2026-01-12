Return-Path: <b-brnich@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87B3CCF45D6
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 22:16:17 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45360.1768256173746659487
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Jan 2026 14:16:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=IaKq0uf7;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.194.13, mailfrom: b-brnich@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pMZKr/H8D3aX5EcEwzUIH1eWTqW7WRC20gcZF7VsNSjwGE8OrmJTYoiUQGYefudboxwwpjJRQ8rMgfX/s3fD5gjP4TzxavZtANotdVsKs5xDaSwLBPfJNi7aLJko1fbJu5NZp+isXnRAQ2AGebiUBE9YVgD0i26EczyDTIL3pqUjpchuIboO/ziGa9CJ8K4IlnJMzFhi0+Shk8+48i4+QKKTA0wc9fvmniGQmT13jNcOZ7XOLwvnDpljc/JKyxezzb906zHOVTkB2tjfY4DpwOQVYR9NaSkKLtM6xaP9l/PKnHwJZQquQkerWfgwC0cDj4tVFmAGb1ZSm5bcthe1yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gtGhPXy97a57bjpdbyG6PPhs03MAVjHmKevUiGIBUOg=;
 b=UXzbSRDB9x8eh8g2jsJ1ytTOt/DDK6U0scT1X4baDweoy63Azx4Yr6Ojl9qbFd1cHQ7s99ZnUwbQmnDvzFWXbHijxclCcy32QuhoRpN6wVynenSva9BJNq2UuOSg58oJ3NEmOFFsUsGj4fK3i0VJfJ4kQIGUmMkhEXe5fDAcYeAMP7RZi1hsB9nd3YNHh0Mzzh3nneauBg4aLKKVddoKz/4hox36NiQUnzliA5M5DzzDhrDej0YzqUpSvf3rUExX6PQJOQGUDymlN8WhDGNFWMFk4UQ7IL6Jt7rPEEFKXJZXFqWNhWFivPsG4uPxaQwQmHHMMkVPSs4HeshWnfdujA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gtGhPXy97a57bjpdbyG6PPhs03MAVjHmKevUiGIBUOg=;
 b=IaKq0uf7/l/BqVy93kHvru6YZTLiBsaVQ1p6b8hW1xM6ZzNhDSLTBsJnu73ZtpVuITIjlmV+CfBGwia064K0p1OWgSRzXybRWCx7g8fPCa+krml5T1LugYea90Ho2KtoB9VatcTtego45xDWlB3VlI5RfAISyIeJzf0E8CKLQj8=
Received: from BN9PR03CA0374.namprd03.prod.outlook.com (2603:10b6:408:f7::19)
 by DM6PR10MB4121.namprd10.prod.outlook.com (2603:10b6:5:21d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 22:16:10 +0000
Received: from BN2PEPF00004FBC.namprd04.prod.outlook.com
 (2603:10b6:408:f7:cafe::bc) by BN9PR03CA0374.outlook.office365.com
 (2603:10b6:408:f7::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Mon,
 12 Jan 2026 22:16:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF00004FBC.mail.protection.outlook.com (10.167.243.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Mon, 12 Jan 2026 22:16:08 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 12 Jan
 2026 16:16:08 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 12 Jan
 2026 16:16:08 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 12 Jan 2026 16:16:08 -0600
Received: from thinkpad.dhcp.ti.com (thinkpad.dhcp.ti.com [128.247.81.69])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60CMG7Km1099224;
	Mon, 12 Jan 2026 16:16:07 -0600
From: Brandon Brnich <b-brnich@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Brandon Brnich <b-brnich@ti.com>
Subject: [meta-ti][MASTER][PATCH] ti-bsp: ti-img-encode-decode: Update SRCREV
Date: Mon, 12 Jan 2026 16:16:07 -0600
Message-ID: <20260112221607.455389-1-b-brnich@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBC:EE_|DM6PR10MB4121:EE_
X-MS-Office365-Filtering-Correlation-Id: eb811068-e523-4047-db62-08de52282fe3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|34020700016|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?uFmHBcmn4y9fLw/Sg2/3dmIEN0k3U6qhQZCwVn5cra03PvS4mE1WgQbRrVXg?=
 =?us-ascii?Q?WgyT5LXr1Ovc6gMI0UBZuhV6bIkEYKpCcwUc69GzMS3A6ff9GToWTCqACX75?=
 =?us-ascii?Q?7WIlBxTvZXAgAURB7mVsfnTWo1hP2Ppmo3a3RehzuzwtrL1BRRkPzaE/Yd2x?=
 =?us-ascii?Q?rwO9N3NdrdD8otbaM1BERt2hGYXVg7/lrUunRBXto5WjAotkFpcZBHJJt3NI?=
 =?us-ascii?Q?D95b0EQA/NEuXnyvtqSG/8Sb5KXmLDbCWIsyRPSX5UDG/NZ0Sg3xzRQOTqRq?=
 =?us-ascii?Q?I8O6I8DxFuWr6dTdFKYJClerUFLQtNlpyB1/NYuv0XLBkehfJFdG2y96rn7a?=
 =?us-ascii?Q?Wgn34gpxvdfT3ym3U4FKdstsdyWQl3FcBqYYO/aSd1RxqtSvJVsxie2+8cv8?=
 =?us-ascii?Q?qJLhBf9QcoA+vWtb06G8NEBsgOkfANPKfRv91VFoekUtgm6v3ES6IatX9HVI?=
 =?us-ascii?Q?fGKXauotPzoqMwAzFBT2UHhkSOXGhqaEgnQnPZtTnSD8vQegU5nNmkKmpddK?=
 =?us-ascii?Q?puwsr7T8ZH18BoGRIIwMphrUUdfuV/B8+yGMFwtOy3KidhskEbv6L2pbcezx?=
 =?us-ascii?Q?LyJ+FBclNJc27sZbKDe0TgWlit9mH7YqfAqxhm6/gC94jFxUB0Iy7tCzsrMp?=
 =?us-ascii?Q?LY0k7NfS9kOTcds5eDlZZWCD5PBxP5+VQSNRywWYV9XksbiZB8uI1gUVLWbf?=
 =?us-ascii?Q?bJV0iq9tQg8HhxzaYcy3iPH5WY6ZHfMFuGWBE+fESbWkugIPTFyvkiF/J2L7?=
 =?us-ascii?Q?ToSLSBG87S5usQUwmXQ4wAlddpkY2ATsHkvnvuxBqBNyvStT4DZcpTCVmGIY?=
 =?us-ascii?Q?nUiHQ0y0WlNoNGs4IDul0TnRvbpCPw93GI+ZPjq+iioqatyljcjuLAQtXRBJ?=
 =?us-ascii?Q?umcrvTqEf8Xcg38vD4pTM1IU/WI+FcahfRBmo630ZrmfzzqbI648+WFppqdB?=
 =?us-ascii?Q?jRDBdGe8aNsGJEA/8UonsqbQSF/lSe1NTuDQSbRjw7JGXcjWdd1S3DWk/OZh?=
 =?us-ascii?Q?aQW9YiXu6/KEHDMIDjc7ImDJeI4GoL0mtlcV1gsqgP2GUN0OsdeZpVJ8bw9i?=
 =?us-ascii?Q?o07WZoG6HqUOHB2vauzMYAIYDnEunig6SNqtBZzzbcnqluzWB1rc4dd2e/r+?=
 =?us-ascii?Q?kGwtDJ6SeyRJnmD2px+sTM/DyPc4tCuyo0cZOrGVS95U3yGrhpVaCT/xL0wV?=
 =?us-ascii?Q?DKpkBmlV3qeep33prWzAD73e1CJxADceX/kbcCLjMMOTvoyydiGkJPoCl3Y6?=
 =?us-ascii?Q?a+EB7HmvNlshJjxydda59gEJZjMAfiv9lLlBISZPPMKddFv72fu7kCKE76NH?=
 =?us-ascii?Q?VAdOOz+GP18JPCv7uLx17Wikgo8RfGztxkgFxAD9zNyKSvrZh4oygq7whqeu?=
 =?us-ascii?Q?i0JM1ghsbpAZCjCoXDpaH+Xsu+tO0PYkR4grYQsxTHbg98ygk3rW8Vxh6r+L?=
 =?us-ascii?Q?/CAcVy1XJaX1aHfeuvVjIxrdfItiwgT39LY14dd39e4lj7O3RXZLIPxhAZR0?=
 =?us-ascii?Q?+xr7MxA66zLRqHfcX4VSgvoIsLf/f6bKotII7GCCPGD0VIWXRQF/k/3CR14g?=
 =?us-ascii?Q?z112maOPGvEaMC/e5PU=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(34020700016)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 22:16:08.7575
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb811068-e523-4047-db62-08de52282fe3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF00004FBC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4121
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 12 Jan 2026 22:16:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19407

V4L2 API has been updated to remove the flags parameter from
v4l2_m2m_buf_copy_metadata in the 6.19 stable kernel release. Driver has
been updated to reflect these changes. Update SRCREV to pull these
changes.

Signed-off-by: Brandon Brnich <b-brnich@ti.com>
---
 .../recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver=
_6.12.bb b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver_6=
.12.bb
index cdcf4af0..10a1b1d7 100644
--- a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver_6.12.b=
b
+++ b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver_6.12.b=
b
@@ -14,7 +14,7 @@ BRANCH =3D "scarthgap/k${PV}"
=20
 SRC_URI =3D "git://git.ti.com/git/multimedia/img-vxe-vxd.git;protocol=3Dht=
tps;branch=3D${BRANCH}"
=20
-SRCREV =3D "0bcbb20af32ea13275b452f0e84f5a49966d0bf6"
+SRCREV =3D "9453ad8ebdd42a5e5a384c21cd5f6bc2c86aa6d8"
=20
 TARGET_PRODUCT:j721e =3D "j721e_linux"
=20
--=20
2.34.1


