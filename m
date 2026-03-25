Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D52C7FEA80E
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 06:29:10 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.39])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16382.1774420144408550042
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 24 Mar 2026 23:29:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=vJybYEy3;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.196.39, mailfrom: m-shah@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=udno+TLJ91udvcC+mzML9VSELhEseypQqNCmy67q9DFhscGJCIzkngyrcqRyCxW6kNzqQ4ugQxKF9buTBj8tcwHcHLAg3bup43jUsu3tnnMrK4WWnKJDT/3+T0tOQendjGN54m7hymVOoxVdQHJYzuj4MaHDiIRsCllsKm0OPVRdX+qlORlw/+sFLut4Ctr+yH0Rtzuf6LhxCYz1uGNV4eOhu32V/PGkbXNsPjIazmbNibIw1PapgpIuj9zWc3LYhgVLd45gHjGHUP3eOOh5gRi7Ygem/t6TDERU1soiAgA0vSYELBcomsvKF+40GP+tiiKnPKgUGcNBb3/JqA26eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9aTkOsaTyoYkSOXGJddMM5iDpP2XSN4RqprLjIXrwJU=;
 b=URKEBvz6ensqrTcP/YRwe9gznwPqw6tY8xQhn3PBYbBaPmnLIuoOBPsqzgnkymnUdQ0ZMcBbdvUcnwTl+u3kV9c8GKrIdr+itCo8OTUc+Y11z6bs00cZSpSTTjSOCs55c0561Y/lhsQtZ84P6ih6t6Cy2wQkGOO4SUvKPN/LmRxsRbjszDHBiLNX6sWhsW/mrx78IfP5xkuBQg10Ny7c+Fi4emhOkzdNDUA2uNTQtDzBZzsA2Qv3EIQNvsbC3TMfci0JGk/khsZjq2jJvV/fIvrjDfOM4DKXHAPBIquge7XoTQuNX8ObiDLs0m5uoxle6OzzYfdppSFAoln+Yk4MLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9aTkOsaTyoYkSOXGJddMM5iDpP2XSN4RqprLjIXrwJU=;
 b=vJybYEy3W7KNQ8V9KLdi1qkE8GNmxV1jPTVA+HSf5l2w8/sEwQCp+BMtYOoSqrdZDOw+PSrZ6S1NqJ4w0b6TnP3plpAtNYosH/6V1D8emP3tO/LJfTwyZ3UQPP/kdO+OaP7SKSYJWM6z2opN2xMzlfbF9qflAk9xhujpGWHjmZk=
Received: from CH2PR20CA0003.namprd20.prod.outlook.com (2603:10b6:610:58::13)
 by SA2PR10MB4601.namprd10.prod.outlook.com (2603:10b6:806:f9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 06:29:01 +0000
Received: from DS2PEPF00003444.namprd04.prod.outlook.com
 (2603:10b6:610:58:cafe::83) by CH2PR20CA0003.outlook.office365.com
 (2603:10b6:610:58::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.32 via Frontend Transport; Wed,
 25 Mar 2026 06:28:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS2PEPF00003444.mail.protection.outlook.com (10.167.17.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Wed, 25 Mar 2026 06:29:00 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 01:28:59 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 01:28:59 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 25 Mar 2026 01:28:59 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62P6Suqk3977145;
	Wed, 25 Mar 2026 01:28:57 -0500
From: Moteen Shah <m-shah@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <praneeth@ti.com>, <vigneshr@ti.com>, <anshuld@ti.com>,
	<m-shah@ti.com>, <gehariprasath@ti.com>, <denys@konsulko.com>
Subject: [PATCH] packagegroup-ti-core-initramfs: Remove runtime managers from initramfs image
Date: Wed, 25 Mar 2026 11:58:56 +0530
Message-ID: <20260325062856.2664785-1-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003444:EE_|SA2PR10MB4601:EE_
X-MS-Office365-Filtering-Correlation-Id: 93547ca5-60ca-4de1-37af-08de8a37cd7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	RAnMmqCb16mNCCxzqgrgX874hWQQQGuXd4B0SNnAQZelIzgioXDcNIpv/jZqncMy5qU13zlXTs8N8fjZGE+eGjlXT5AVFato5CUtKvjHbYNuD/tD1DhWyaQcTtU6j1cKLIi4m1X2KV3MXjlDFljVACF4A5oQ7YSRhM/IXHEe0H3Ao6CJyt37RDPVrfzSbejAWvmdrl4WjLGXIxIAb8JMKBeZpAWPOfb06HrEb9dkEaIfHXEsdbYoG0eSiurUjmXTkkwghNPtadf41bGUDvMboO2TfkwtX85FI4v0qpiV/lVitNuVb95WyBx5qapTMPsYRukAD9qHzkTEhjq4oOCz+pRC32SA60zMQLLla7MY38PPmiDSsd96P0+dlEuxWINTzwt7kmv415e4gZxqnKTjlfW4DOHC7a7cFZrXSo814MPf8W6DpmRC1lDCDKTtyjxSs4BJiTC0O9csyJvlK9NdX7BBPjOPjppsQdFoXTOzIOfVkzd3lQ1yiW99Gp8tsH8uDGA8y+j0hWASF2/gXK8xJ/0z5gXUuNigifJoL3NKt4hGBRpl+FMPhMM+rg1cx1PD0sAjL/wqTmH4m4ylyCjD83zSDzglbU2PPInGNZ7OHyiPVUU4JxE1uJbHpQY/a2/1WblEo0lq/B/U1UQEdxfHIMhG8eXBLFvoKlwAP6g+fAa/95iScpPxiMFHEc8PXfCUGVQ9eN2untFxadBup5gz/yzOxhiww0oIG78yBkTZJQpdy+8IU2i+sFRX8X8rlRcPumcJb7fPlmH/f4merGDPPQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	IrZNpfBfJMdqvEhVFjod+qgkdz2YBwbN5ssKjio14S62iuZi1X2DqXuDt2ocS58Is4FouK2S54h43UM8oMAE5IkOAmvU0pnAtNJl3RtqhkfVISwXS0ulUevVDALQ0LdDc0tlXCdgjYuzvDJaNWL9GlIC5StzIYBdhjVYXFTNeT+3PHvAY5H6hlLtr7Qw90hojo4xMnmwsueGgCJR65HMMyfFZ+6/orqN9VQYWYveBIo36WH0TAvgcIX118PsmWsybQC5vi64HiV6zhwXdyi27KsqBOpD+UahLR0oVOoUNJHGlati6qV4kIiL1Z/14+BYLbuUZcD1svU2rln65EkEcK/Fk7DM2qZpWIfZqqz3R3UkDK4IaBscidvXvR2gUxW9LWeCbESlPP92SCigTjKOim2jTU12MGtzpBJ187BqaSTlaOjZGzTigWVnv0QG9I4o
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 06:29:00.7610
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93547ca5-60ca-4de1-37af-08de8a37cd7e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF00003444.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4601
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 25 Mar 2026 06:29:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19813

Remove runtime managers since ti-core-initramfs does not requires
login and other services as it is being used as a read only
image during the boot. Modules can be probed using the udev from
initrams-module-udev, hence remove the init manager along with
others.

Signed-off-by: Moteen Shah <m-shah@ti.com>
---
This patch will help in reducing the size of the initramfs to about 7 MB's =
compressed and 25 MB's uncompressed
Boot logs: https://gist.github.com/Jamm02/ebdb124064e253208ee479f46edf127f
 .../recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb    | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramf=
s.bb b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
index a9eff847..f496f21a 100644
--- a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
+++ b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
@@ -11,10 +11,6 @@ TI_CORE_INITRAMFS_KERNEL_MODULES ?=3D ""
 RDEPENDS:${PN} +=3D "\
     ${TI_CORE_INITRAMFS_KERNEL_MODULES} \
     ${VIRTUAL-RUNTIME_base-utils} \
-    ${VIRTUAL-RUNTIME_login_manager} \
-    ${VIRTUAL-RUNTIME_init_manager} \
-    ${VIRTUAL-RUNTIME_dev_manager} \
-    ${VIRTUAL-RUNTIME_update-alternatives} \
     netbase \
     base-files \
     base-passwd \
--=20
2.34.1


