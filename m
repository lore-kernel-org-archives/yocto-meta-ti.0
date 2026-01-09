Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A50A5D26D8E
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 18:27:51 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.26])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16829.1767983262429147403
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 09 Jan 2026 10:27:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=HVIpsjRN;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.201.26, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DehIzk0aPvAe334Hmj0aP1ewsVJq5nw7aMkWvNlxMGlWQ8yJYrhDekoMWfo0zGJYxamgsIavLhgeEaHq4H4v/GErvOPPElEb9V3EULRt7LZBVF4YaMuJKHnkhdSSEvNWqWghF/iz6Qu14yWRs4SdLR+fhs7NIrH39af3+on9xFXkPoQ9OmF7fF8UbJDMAafa+zPTuKAQHykIN+/U3wSewpv0jbj4obyOPKQbK/P7S+nzfnbSWCXi7bIRDM9mFqoQCkVcZQbvOQd2HaZwt8MOfvowUKtbEGvhn9SAte/o7LYRV48kbGtVJh5ZutOhasPIDe6T8H6mz+GrYFeDXeB8mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MSWeHCiDqNIQCAyvnIDMQzvLBtoviSqRFXoTzionsqk=;
 b=VsLgBCOs200luj/peWlw0Ks7F4xFtSAWMGF+LHI4vujNGlMh0SJt+VYFs4yEFeL4yLcdCgxH3aTzo47BpwT2GGDKyvOrYU8sbEheSXce8R8QwjSa9EY11CDeJsYSqQGw6nFiWuOxIlUk3t9rzWH4ihVpGXbI+pgPMYwnXXK2RDKETmP2HBvn7gocsAncIlIszSI5PgmK3yUlCMwjbQZXA/J1ZCIq6nGxv5wizibs1RxmlsNnLQxZgdX5Epi6627QGnwZn6NBnhXvFnJ4FOkJBl2QsEECVG4BV+zt3iGE5Un4sVy21r7R5AO7Y7oq+gE4/ISLp6N7EGmK/2N8Q/I0yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MSWeHCiDqNIQCAyvnIDMQzvLBtoviSqRFXoTzionsqk=;
 b=HVIpsjRNc5wN8yhZj137jRDASH5k40NsEx7GcCp4MScZeS0WI3XsxQxMoPOCR8txuUwvld4FEnCezOLHpLoNwaMFqIQFD9KC0Wl+sOGvRp9vxp527hDhBvvfRctKNgsHRxJGa3eGNoKxiLZ5RFl511NKsddf7ZDqImNqLpog9C8=
Received: from SJ0PR03CA0389.namprd03.prod.outlook.com (2603:10b6:a03:3a1::34)
 by BN0PR10MB4903.namprd10.prod.outlook.com (2603:10b6:408:122::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 18:27:40 +0000
Received: from SJ1PEPF000026C6.namprd04.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::df) by SJ0PR03CA0389.outlook.office365.com
 (2603:10b6:a03:3a1::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.5 via Frontend Transport; Fri, 9
 Jan 2026 18:27:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF000026C6.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Fri, 9 Jan 2026 18:27:38 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 9 Jan
 2026 12:27:37 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 9 Jan
 2026 12:27:37 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 9 Jan 2026 12:27:37 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 609IRbqI371158;
	Fri, 9 Jan 2026 12:27:37 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1veHCz-0000000CTYg-2qmJ;
	Fri, 09 Jan 2026 12:27:37 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v2] ti-core-initramfs: Shrink size of initramfs
Date: Fri, 9 Jan 2026 12:27:37 -0600
Message-ID: <20260109182737.2973551-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C6:EE_|BN0PR10MB4903:EE_
X-MS-Office365-Filtering-Correlation-Id: a99e8201-443a-48ee-6f05-08de4facc4a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|34020700016|82310400026|36860700013|1800799024|7142099003;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?jjyuWkeKK/xztGsQpPVKX3SGoi3DKsL5Fa5s8N7rpntkWVx70I+HhbbkyKZl?=
 =?us-ascii?Q?M6UDkuz9Nrs9QYkRdFhIzb+/Vr1e3gdNa0tjfw6ARCsQQfV73l8cNK4e3/vg?=
 =?us-ascii?Q?oK8z4A8+wvNMWpajK4/gbXLPwBrJpTVZW9YK4wvbQCRhcfdTX3hDlrL6xcq0?=
 =?us-ascii?Q?BZ2SnsN+ZKRxD0sY/XgaIRbDSKXzl9E5a+SqJMSaTprlNP5XclGu6WbZrRQA?=
 =?us-ascii?Q?v9NwKwna3gD2JHu05+M6jM7NogbKG1nIoc1f7/S7REkTchZtBrSz31e4iMX4?=
 =?us-ascii?Q?ZAxBoZxhKF7+1WSAWWkHVAD1Puxt7J1WQYpfY4+DpHFzY6MztLOZKwoCbvvE?=
 =?us-ascii?Q?GEz/2R8cx+amlSMBDusmhttmIoog7qySBUnXfrzQk57U3nmTr8y0ZbNYSucG?=
 =?us-ascii?Q?DQXBmRWS1bXblTu30gIKMfKcGJQ4XYyneTD1F/j2xInvz1PPfd638y8qQFUY?=
 =?us-ascii?Q?2O3JbzRzLIBuhCWwRFzWUl1A+SBevcTVSZEnWqH8ei5JbQUHpYhv6gCH2jF1?=
 =?us-ascii?Q?UfviFvMmSceea5ozbTMQgMcrp9m1nYcnD909M9+l20QUZk4qLSpEjjVxHanf?=
 =?us-ascii?Q?/bLENUrBsaYNiLoyzTKrlLz1dYENp5YVPlKMxxCTErRWyiJYQvxnn1U7KzDl?=
 =?us-ascii?Q?kIy81uNPFTm0N4YH5ScxFv82EzuqQtISu+hNbv6pmxLgjLI+XTmg2LuKZrjE?=
 =?us-ascii?Q?sjpYFjO3XU8bAJo7MaWX9cOEtsaXuGV24Kqak0LWC8aJ1fYpJ1FAj9f1sjZK?=
 =?us-ascii?Q?r5jDlbkFdv6lxodH/laL7ZUqYr4ENASjkEB/rt+qyv9IXg6NcLSyYLr3/H/Z?=
 =?us-ascii?Q?JVtmaejaDGqDgEblaoIxWjbRPtS1nnweu9VV4+rYxVwbQ97k+fiGv2mnNfn0?=
 =?us-ascii?Q?loFbbj9E+/qaiuLl89B+GSzun5mSqZS+pxaSJItC1Au2THr9B1Sb3bprXznr?=
 =?us-ascii?Q?Osft4OXaZFbRcJkjtReMy5fz/t57vfTQHJicDFe2j2yOvCLs2S8Srm94vjrV?=
 =?us-ascii?Q?IcKqn7UZoNAEilsM4+YK+Nn2da54t/x8FH+0OcvCdr217USLDAYJ1rnoidkc?=
 =?us-ascii?Q?FCrYA8C+lmL/Ir9ASq2HbIt5EHBMUN577/TaKJGhzbcD9MbrXmri1Saujva7?=
 =?us-ascii?Q?bsExcgLVF3C9GPwjjoyCWs9evtLMcuhIFuvOZxZcwnaCBExMrX3hHLU4kliJ?=
 =?us-ascii?Q?NbpHixRATNj6St2AljQddADPNwEJeWep4XS7ZAd+FpwdpXJSMy+Oa2o3/U9q?=
 =?us-ascii?Q?1TO9vWjPhumQHBKwK4lZijJD50TgLtU4Ga0pyG+rNcJ77zR7cgBZZ3OHU20a?=
 =?us-ascii?Q?C07iLDG4XTwmtC6WZtIB1yPLZLkHyffH5DnF3Tmv9QLLVtWON3+wAQEj7tlJ?=
 =?us-ascii?Q?0trGbMl2ChRTkEgKgeX2A+4G79afBmJID0izZKpceJohYMecB+yns/TH1E6H?=
 =?us-ascii?Q?8FI8zSyD/OYtA6xfAIgq5NZIUZQNxJWOe5PYPzQfq8QkWt06N3uhljlWrtU5?=
 =?us-ascii?Q?n+lVvFktTd6sDm+6qWuHrIFNxj30e6DeFBfemGjIShTecd5kBGbO9YNb9GXQ?=
 =?us-ascii?Q?ANPLur3K8g/UIwBs9/k=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(34020700016)(82310400026)(36860700013)(1800799024)(7142099003);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 18:27:38.4224
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a99e8201-443a-48ee-6f05-08de4facc4a9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000026C6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4903
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 09 Jan 2026 18:27:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19400

License-Update: Moving away from packagegroup-core-boot.bb removed the
LICENSE setting.  Just adding it back in.

It looks like we were modelling this initramfs off of the wrong example
from poky.  This setup produces a much smaller initramfs.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Add missing License-Udate.

 .../packagegroup-ti-core-initramfs.bb         | 12 ++++---
 .../recipes-ti/initramfs/ti-core-initramfs.bb | 33 +++++++++----------
 2 files changed, 22 insertions(+), 23 deletions(-)

diff --git a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramf=
s.bb b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
index 86b69aff..c759808c 100644
--- a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
+++ b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
@@ -1,16 +1,18 @@
 SUMMARY =3D "Minimal initramfs for boot requirements"
=20
-require recipes-core/packagegroups/packagegroup-core-boot.bb
+LICENSE =3D "MIT"
+
+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
+
+inherit packagegroup
=20
 TI_INITRAMFS_KERNEL_MODULES ?=3D ""
=20
 RDEPENDS:${PN} +=3D "\
     ${TI_INITRAMFS_KERNEL_MODULES} \
+    ${VIRTUAL-RUNTIME_base-utils} \
+    base-passwd \
     initramfs-framework-base \
     initramfs-module-udev \
     initramfs-module-nfsrootfs \
-    nfs-utils \
-    nfs-utils-client \
 "
-
-RDEPENDS:${PN}:remove =3D "grub-efi kernel"
diff --git a/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb b/meta-t=
i-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
index 1a102d82..223fef7a 100644
--- a/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
+++ b/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
@@ -7,29 +7,26 @@ DESCRIPTION =3D "Image meant to probe boot essential modu=
les\
=20
 LICENSE =3D "MIT"
=20
-inherit core-image
-
-IMAGE_NAME =3D "ti-core-initramfs"
-
-IMAGE_NAME_SUFFIX =3D ""
+INITRAMFS_FSTYPES =3D "cpio cpio.xz"
=20
-IMAGE_FEATURES:remove =3D "package-management"
+INITRAMFS_MAXSIZE =3D "65536"
=20
-INITRAMFS_FSTYPES =3D "cpio cpio.xz"
+IMAGE_NAME =3D "ti-core-initramfs"
=20
-IMAGE_FSTYPES =3D "${INITRAMFS_FSTYPES}"
+export IMAGE_BASENAME =3D "${IMAGE_NAME}"
=20
 PACKAGE_INSTALL =3D "packagegroup-ti-core-initramfs"
=20
-export IMAGE_BASENAME =3D "${IMAGE_NAME}"
+# Ensure the initramfs only contains the bare minimum
+IMAGE_FEATURES =3D ""
+IMAGE_LINGUAS =3D ""
=20
-IMAGE_OVERHEAD_FACTOR =3D "1.1"
+# on the kernel image.
+PACKAGE_EXCLUDE =3D "kernel-image-*"
+
+IMAGE_FSTYPES =3D "${INITRAMFS_FSTYPES}"
+IMAGE_NAME_SUFFIX ?=3D ""
+IMAGE_ROOTFS_SIZE =3D "8192"
+IMAGE_ROOTFS_EXTRA_SPACE =3D "0"
=20
-# To further reduce the size of the rootfs, remove the /boot directory fro=
m
-# the final image this is usually done by adding RDEPENDS_kernel-base =3D =
""
-# in the configuration file. In our case we can't use this method. Instead=
 we
-# just wipe out the content of "/boot" before creating the image.
-ROOTFS_POSTPROCESS_COMMAND +=3D "empty_boot_dir; "
-empty_boot_dir () {
-	rm -rf ${IMAGE_ROOTFS}/boot/*
-}
+inherit image
--=20
2.43.0


