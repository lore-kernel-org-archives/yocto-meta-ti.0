Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B051D15D86
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 15:15:07 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.61])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17628.1764774898074971224
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 03 Dec 2025 07:14:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=KEVnav/c;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.193.61, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=burZ4Vo6Pc2ez9xkKJhJXcoZcCmmZqjzZNQemhUTDZMjkWFflPV4eUZ/Ttwsh3hljbLQmLsBy2kibQ6FxCFeq9EWtuQcxyV1eDM62sIdYprD9MMhG1XUidzodtByUie743+ooj790iqt4onYOOreANwRL1pv8Zk9M3Xr0MPIEH1/yHuxVqlsPlI0Cuqy12gV9MTgJ2HD+7hsDlSEmYiPnAZWRSrhGJHnEtK604ZBxyBQsHceAtKerCb0wfVeaHLarThm07VLUhHt8HJ0FR1PgvqTOxnfTHdI4daCSKczZRbYsApfZThLAcka8f/a0yKlMi24U7KI/MYSYyBmTK7/Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cEqQelOm3gqMIQzK8u4hEhzaJT2O5HoWgUw+TAnCDng=;
 b=bhOp3c9l62K/nJwfUlXFkGca9/2WIhAfQ8oR+TTZDyvDYfQ4nDrY76h4Jld1HjTPGQzS9I/SKzo70/C6OuKySB+0+vV9hSVS1TxiEmskaHxtSLq4asS1VgVRwODd2ediNI7LM+LQIcWoCA2YhbI8ZI/sqSb8W8a40Jl8bGKuOF9EXC5LYb2Al2+I4utu2hE1DTreuRn3q7LMDpAh4a7AShgt0eXNdIvBF9fo6E6QTQcfq2muuUyywOy4oCxaJSq1ZCo2sNzZW875B29SN2IsNkwF2QgdLpeVX32/s2PJdhfZvXtfhalO8zg4Ffq4doUCHC5mDJoD7uYgV8kGw01z2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cEqQelOm3gqMIQzK8u4hEhzaJT2O5HoWgUw+TAnCDng=;
 b=KEVnav/coJZJMlC9vzf2eOI/Un8xMXIaSin/RwgVlZLzxyeLK1KQ4ywcdd1KGakNJGFez9e58eOKQx6D+lJMwSNXPRmPNpN/uELfMsgXz/d9omGnFxENn0jar2XrGVsQ7Xhl3zhU6sZFaNJvUa0OYjgbLQHVsJJQKbmt7tWdFuE=
Received: from CH0PR03CA0342.namprd03.prod.outlook.com (2603:10b6:610:11a::16)
 by DS4PR10MB997621.namprd10.prod.outlook.com (2603:10b6:8:31c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 15:14:53 +0000
Received: from CH1PEPF0000AD82.namprd04.prod.outlook.com
 (2603:10b6:610:11a:cafe::1f) by CH0PR03CA0342.outlook.office365.com
 (2603:10b6:610:11a::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Wed,
 3 Dec 2025 15:14:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH1PEPF0000AD82.mail.protection.outlook.com (10.167.244.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Wed, 3 Dec 2025 15:14:52 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 3 Dec
 2025 09:14:49 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 3 Dec
 2025 09:14:49 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 3 Dec 2025 09:14:49 -0600
Received: from fllvem-mr08.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B3FEmU4011667;
	Wed, 3 Dec 2025 09:14:49 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master][PATCH 2/2] linux-bb.org: Remove unused EXTRA_DTC_ARGS from kernel args
Date: Wed, 3 Dec 2025 09:14:46 -0600
Message-ID: <20251203151446.3889979-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20251203151446.3889979-1-afd@ti.com>
References: <20251203151446.3889979-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD82:EE_|DS4PR10MB997621:EE_
X-MS-Office365-Filtering-Correlation-Id: d53ac7f5-3266-4449-34f9-08de327eb579
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Rc/Ebb4coZg2q8bss3sFmf//sn+1h66WqSlCaLdEVKLtY13dDWHcJEE7W4Ji?=
 =?us-ascii?Q?N5SH/JR3EVNx+Ow2VCfiV6EJlhip3EQHYKGNTiZydYpjk8/kWA/d6gvbbP9Z?=
 =?us-ascii?Q?GzSR1g1HT25+TWYZZR4oIFzd/HGSy4q7Gtw4PbKfi/K6oxbt6fWF386F8/I1?=
 =?us-ascii?Q?druw4gRnIlk1iUcZBNHI52ZQvW2dFftoLU32fMne2OrY1Wf0fUa0oWxvKbCE?=
 =?us-ascii?Q?WNLgRzBQz0Mue9FFJDtGRCBxEK7wOIOv3qsbbTrA/BN5/c5lLKA9VtWedU3z?=
 =?us-ascii?Q?4OatdZwV2IMov6hnu0F5g5qJl/s440Kh3n8qdD7Wansvip6nTqV5k79SNhaB?=
 =?us-ascii?Q?Z9y3K30QJlcLUDjBajI1y63diDBDa4lZO3+oaHRAC0SMIZjA0HFYSLByHjUd?=
 =?us-ascii?Q?N71d2HmmoPRt4F5gEe3Z1J1nkkLdafEXB/CVMNJ8275I4woYI3EmG55BG6Lz?=
 =?us-ascii?Q?W7uXYU9lQLC7CZijbWuslI1YkYEan4O+2vUG7yoibD2BVLBAaTfyKftdrA7D?=
 =?us-ascii?Q?ld/A2dyGs5018j1rvTEKSdsJwaJKiTeC/qrjfK7LTUK+as/wRIIl38ZKSHcC?=
 =?us-ascii?Q?XrjySYr4kTx8+4zKVGHYXb8Q0W/2LfH7mD9yfyQ5lYhLzXJX4V/rVi8C2XSe?=
 =?us-ascii?Q?+2ywPiWZcHWOpT8slKeBoNzAZjb7Jb8IzMHAfYyWpcFpUEPd/9sLVVWmhNiz?=
 =?us-ascii?Q?l4DvS/5cv+m/VQyUMETvU5aoaMZdHiz8C3lqMPELVJwi5XAciPKUJYd/R7rr?=
 =?us-ascii?Q?lPTjCsXvOm/X0FOuPu5cTcd5lUB2eIx9gL/kICRxNdrieOvRQWQvFrRLQvfC?=
 =?us-ascii?Q?mLTyXciLcxWcy5AaQXfOF7esX/gePpDw3c33O94FpeJnsgl4MIoNukg41m6g?=
 =?us-ascii?Q?yjHK38ABd04HYKus8ymRbfGE8le6TGtiZ35Cz8RLGrvsc3ON7GZaa6E9mNU0?=
 =?us-ascii?Q?IFLuszJU7N0ngXjiYHJLXA031GsqS0MbeffmeQutaG52SsienIRDT7em9i6r?=
 =?us-ascii?Q?8aNvZFqIqKrF3vTHJ8T/JVDq+C6hxK/iiPHdModFm5Mc+kP/aOKiJ5wesVQ8?=
 =?us-ascii?Q?xRveyFF92zQT4OCWFvaNVoclf9wcyAac3rGD192m5getHn/0uGYxxiY+eg/i?=
 =?us-ascii?Q?cyLqyaOZgEENDDzROOK5HdwOfpAUhP2B6RFtjWaE1fHf6QmTt1OlZ7jEvFzF?=
 =?us-ascii?Q?wkPiB1HLVPdIFb7ag7oxifoeYLxhcMqO+Peznx9wwzpaOQf0KzOkKKC97tzV?=
 =?us-ascii?Q?hQ+p5VtTi1gMQEnKPGFFdZwyD+/Qme/pHZsxDIhzyHlEimmHOSg37HBlW9uR?=
 =?us-ascii?Q?l8fm4O2+cSEwtMAJQn0k190rjBFThnQH82fPPcJF0XTTq0MDWNCTigM0vrnf?=
 =?us-ascii?Q?82STXeiWqpRR+oyeyhz5XqCZczN+GP8dGy1tyWcYjzb1BNaCdksqI9xY+ptK?=
 =?us-ascii?Q?xErd6tqongKCwnbXCOnMSZMGuC3frKTF0VuxksrNy6Lk6oVkw7FwBuh+ev/b?=
 =?us-ascii?Q?oN7OtJWnhAiDFpgzJh6GSxtdkS4zNVlnZlscgbsPa8MBMToyOj5n65bICJly?=
 =?us-ascii?Q?ncb6oh0g33ggJzTneCs=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 15:14:52.4400
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d53ac7f5-3266-4449-34f9-08de327eb579
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD82.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR10MB997621
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 03 Dec 2025 15:15:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19324

This is no longer used anywhere, drop it out.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb | 2 +-
 meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb b/meta-b=
eagle/recipes-kernel/linux/linux-bb.org_6.12.bb
index 8ab9fc67..64b11045 100644
--- a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb
+++ b/meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb
@@ -15,7 +15,7 @@ require recipes-kernel/linux/ti-kernel.inc
=20
 DEPENDS +=3D "gmp-native libmpc-native"
=20
-KERNEL_EXTRA_ARGS +=3D "LOADADDR=3D${UBOOT_ENTRYPOINT} ${EXTRA_DTC_ARGS}"
+KERNEL_EXTRA_ARGS +=3D "LOADADDR=3D${UBOOT_ENTRYPOINT}"
=20
 # Extra DT overlays/capes
 KERNEL_DEVICETREE:append:armv7a =3D " \
diff --git a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb b/meta-be=
agle/recipes-kernel/linux/linux-bb.org_6.6.bb
index 4873500d..37626a1d 100644
--- a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb
+++ b/meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb
@@ -15,7 +15,7 @@ require recipes-kernel/linux/ti-kernel.inc
=20
 DEPENDS +=3D "gmp-native libmpc-native"
=20
-KERNEL_EXTRA_ARGS +=3D "LOADADDR=3D${UBOOT_ENTRYPOINT} ${EXTRA_DTC_ARGS}"
+KERNEL_EXTRA_ARGS +=3D "LOADADDR=3D${UBOOT_ENTRYPOINT}"
=20
 # Extra DT overlays/capes
 KERNEL_DEVICETREE:append:armv7a =3D " \
--=20
2.39.2


