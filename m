Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90726D26D82
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 18:10:31 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.11])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16452.1767982230569543826
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 09 Jan 2026 10:10:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=ZOZ/uE/W;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.195.11, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZQf5PyZaWoY3a4HGeNwWCqS9X93yhgUgEluoIrHEFu19EmGTZ4hoGl8dNkEBW3TfVxdjVcqK1kaskr4+3mz17cf59+uC+VibWYILoanckCxkvM5NKC2gqQkJlL5jkmgP6qb+q5K9QwavclbeBrOWoFrfMD9G1R7RoUF/YRdOSksan6o0OJV5uQPIRnZGqzFaS3zCpi7Q4aGkRE4QR0UooTTAwFujfFr+Myj0taqXWYA/XUHRoTNRS5QY844CzMzXajOXfWqSCUaAsdjcpDjWQfvELZQdusKgIR5DOAyXVhDvVtJf2y9z4n3B+pXvufSkm19HfMNRaGwqwq6kDM0NPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YEVbtgdUA3xXaE27EqMVlaLn/GaBof/j2P1CZ+4CnWQ=;
 b=E402hki3PPH3WtvbXN3h01XsbbsKRSU4jB3DNZ2O0cpf9YOV0T6udXOg0c49UDkH0TCjQ5tZJ1OizgQ7HDCsiFP7KsoCveZbuBcYytWBUFbGH8bOqyYEoe93oxwwWiFouLqBwbhc7FBrn7a/a5LNkA9FL1SXupqUe/re/3T3Eih6brDgRv8xKIWpD6AUjwig/arb36SXFWOGyJvcAlgArahaqXgrh9xDg+Sgk4CHzmmxvox0qnTMhS2De7XQ13yZRfe931hNhJ6ZW+rWQ00zmy4g+s5GVwIvqWIvoTQTt62N2JzM9eZbbDbzCBovPVzrV0iAV9M2YG6SIV+ZW05jvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YEVbtgdUA3xXaE27EqMVlaLn/GaBof/j2P1CZ+4CnWQ=;
 b=ZOZ/uE/WoM9w1vABGq3tW7BgYaqrwN0VwGG9pTR0itaH2ruuglHuCn+/gRYNMgwtq6PydpMSnMq0fK+h1eFuhttY3yXE+FknQCy1oTK6UO67Fdg7dCgw24jGrM60FK+MSHt9hqHpT6msPEK6P+2jGHRQdCqbrwQ17mDFKLO3xOQ=
Received: from BYAPR11CA0053.namprd11.prod.outlook.com (2603:10b6:a03:80::30)
 by BLAPR10MB4995.namprd10.prod.outlook.com (2603:10b6:208:333::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.1; Fri, 9 Jan
 2026 18:10:27 +0000
Received: from MWH0EPF000989EC.namprd02.prod.outlook.com
 (2603:10b6:a03:80:cafe::48) by BYAPR11CA0053.outlook.office365.com
 (2603:10b6:a03:80::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.5 via Frontend Transport; Fri, 9
 Jan 2026 18:10:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MWH0EPF000989EC.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Fri, 9 Jan 2026 18:10:25 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 9 Jan
 2026 12:10:18 -0600
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 9 Jan
 2026 12:10:18 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 9 Jan 2026 12:10:18 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 609IAIZ9352047;
	Fri, 9 Jan 2026 12:10:18 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1veGwE-0000000AIMz-0QYE;
	Fri, 09 Jan 2026 12:10:18 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] ti-core-initramfs: Shrink size of initramfs
Date: Fri, 9 Jan 2026 12:10:18 -0600
Message-ID: <20260109181018.2453840-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EC:EE_|BLAPR10MB4995:EE_
X-MS-Office365-Filtering-Correlation-Id: 31128b00-b284-4918-fa3f-08de4faa5d29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|34020700016|36860700013|7142099003;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?YhyJHi4G9m5d3V5xkl+YBzSM0PHe9vwvWGVVlkUwUm9yWXn60LN6aDSDVdlR?=
 =?us-ascii?Q?nBIfZS5LXeZfAnqf5C2RA0uOGaAbAXrR2W+wIbeL21lUj9c27fVUzPhfbVup?=
 =?us-ascii?Q?W1HdBK+R6Z/fLHKVKPZCd9VxpGB/FfVR7ZQEKQj/ZPstaGuCr8pzfttYcTWB?=
 =?us-ascii?Q?YPcen44wHF4HPZM5ST8lZWeplx2rxHPtbj8+EGHJq+jL+IKu4efMGZokchMs?=
 =?us-ascii?Q?6Xxbbd4ayT7wz3qPJ9FqUuLcI842UWbMxB27ZJ52Tx2jHwZe3xH47Q9MkM7Z?=
 =?us-ascii?Q?kwf8Ebmp6A1KtaNboe9lTV3RVukzfOgQNcUZQ45KEOCXXD4/P4wsqW/eUKW4?=
 =?us-ascii?Q?a602BjtFXkR5ANru/B+auCAtzS8E80VC5KezTpi1mCrei37gAyBGfanrTGna?=
 =?us-ascii?Q?hypbKJxsdtITv9oJhBL1e48kPe5R8RPvN2CjdVEzxLdBPxEUXPrJ7przq8wG?=
 =?us-ascii?Q?Mni85Z4upRPo6xZc9Q/FviqHgArg+MaWeTrqNh+rhFdcLUqsMtoPmhdDzzSr?=
 =?us-ascii?Q?nb2YjHIybFBBWdST+yBfI/3mjCWt3JM9e32lfJlxiBFPJQcw7iiy4/ROPwRF?=
 =?us-ascii?Q?AEuvgRuFwLTN/emFGGE/laNzmXMEUBpvHsnvzAdCY9JGhOG1pq0WmgQy+KUt?=
 =?us-ascii?Q?gULKLBfjVpwxj0TPVOcJG+3locyFnoUhEXjD0qknGeJ/Atx/QD6DLCRfjr4G?=
 =?us-ascii?Q?vLkfl69R5rKeS78UWdaYEcg2ChS9s6+CkypqmOqF9oQDrI8AOkJ4yglsvU7V?=
 =?us-ascii?Q?SOWMdKvI57jAAQwASuPKFHUX1XGhM1kac5H+PlBMF5ZkX7ERv0QSFMzdLsCe?=
 =?us-ascii?Q?285B2r2H8OA1y9/7dAibwbW5HPRWI/30aUXRsxNoaboY5y9xvy5ysP8Kq9ep?=
 =?us-ascii?Q?gTPxhnSeqX2DlGd5IH8XNd9oAEi0JiSIjLsRQleK7KOqXUmHCXI3bXEE1swk?=
 =?us-ascii?Q?cLC3aYmEkB2MpEM3MAxlEze+QvOjNQAMYJjVQFfsPP4AZXXOXe2imCzIGqCu?=
 =?us-ascii?Q?gTWD2pI1lhfvoyiQfUlKUs2/eHvf6NsNRR2dUUQ4EYnoI7q4DI+nungGz9B6?=
 =?us-ascii?Q?vCU7xVDctg9wSAFvbNccSXIfjMcxhwqr6fLH9Z6nwIBWX3vc7sgFqYec99Hd?=
 =?us-ascii?Q?aVytbrPm1X3CyegdS6lGnkh6bTh/IB1xlXGZmdeSE6IHbcaKLWlRgBMUVwUj?=
 =?us-ascii?Q?kecCs5NxvdZfasEurJqHM4Zw+oSZpwccclpY+hrurETljqeE8eX0lyR5XmH/?=
 =?us-ascii?Q?qDWKuzvpWmwtliApTkdkrtq9rp1GWFBEKxhSjIBs58imkwlxlPzcqItlCztP?=
 =?us-ascii?Q?PDRz72i70WOxOnL45kyVLmzO05Wc0lCqnOBBxPka97aYPyyaOayhnhfGfFGS?=
 =?us-ascii?Q?B5c4gZPGIl076OSwJaJbXHzgwaXcrER8XzJYKyxW6W3mkcR+/AuPvQF/+9DB?=
 =?us-ascii?Q?xAasi4z1axaLEA4X8uYDcbgeLGa8WDyOoFU+2KvcVnJ2qJxM0bfabIQg3Z0u?=
 =?us-ascii?Q?cQ6jZqyyb+0jIrgdm1sabwkWDQDPfX73RVJCwPA56clLpJuniqqvVWZ4gynk?=
 =?us-ascii?Q?w1vJZWCnNuNgq9tXoNY=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(34020700016)(36860700013)(7142099003);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 18:10:25.7885
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31128b00-b284-4918-fa3f-08de4faa5d29
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000989EC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4995
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 09 Jan 2026 18:10:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19398

It looks like we were modelling this initramfs off of the wrong example
from poky.  This setup produces a much smaller initramfs.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
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


