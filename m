Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81905EE368C
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 15:11:15 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47579.1770909069330582799
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 12 Feb 2026 07:11:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=ZjW8uLJ5;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.193.68, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GlqhMyNBNwElXYS6n22hbQhxE7TM5xOcvHHkLQ3KXO4uv/BeH65YR9SVF3ENzYzQJoP0N3ysJ6W5++9JMrdZRMxVrXi0/h21qNGY+lTfEVAMdrcscZzb1hCwyqXV2G4wQMQNeXuXZNMbpsS8Xkvlzc9ebw3lXGKpkFvwibMqWzDc11nXLJARA99vf07KEe3Np7xoAYf2HZT8XDCv0/X4x4G7btH0IaH+PYOhDEorVjKOjS8nW2sxzaSKd8o5anDlSlFIn92i8fvSM1HgTNdhKcz3JEd57Yrwk7wm8Oz7yRKMw7hg5WE6dEgDj1npluxtmOVdQHLo1p05DfekXzkPuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nPDDXuN9KK1dXX51VNHjfA4dLXBfL5Kn00c4O86y1GI=;
 b=aZQ6gp54oUNS7mJfEa+HWtc8vW3XCDQO8fBakcq0HQ1UTi6rdYlWQY9Br2QbocrWht7X+v21+wtbTqvvZHqOIswx2CN4Wc0h597WxiCTU+BbjkPER1/qKSc0YdWtXHe2pIb9oPB9ltGvR4Yon2y+BSAxs19TnwaLvvQAvAm0kdoTz8KVlzgiUY6oLUHJhePrRo4lOQqdB4Hur1z9hTatccghh0rUY0IBnkG6mthig9SIfBJWDSWH7TzNiPjun3YUxl6dYzUbvgg2eVi9nAN1wGp3yaTaoPRFRbYPS/dZvBNVvZkaKxOcHlgsseQDEU2tK5XPbeMKZezgPvh/B79GHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nPDDXuN9KK1dXX51VNHjfA4dLXBfL5Kn00c4O86y1GI=;
 b=ZjW8uLJ5iqG/4bvGndyhW6ocWKw51b2kqozJW+PPPcBiVsEbFCPwEt0IAvgpcZ6bNnMzOzArAjYRK7+P3qvMZyWEgtdg4NlB5xMsECMcvVbaBCALgreIDZSu8meKzI0W8YoPaoRvovY9UCktamGTV7W3WMvB2k+CiPspWyPDIsk=
Received: from PH7PR02CA0024.namprd02.prod.outlook.com (2603:10b6:510:33d::10)
 by CY8PR10MB6852.namprd10.prod.outlook.com (2603:10b6:930:84::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Thu, 12 Feb
 2026 15:11:00 +0000
Received: from SJ1PEPF000023D6.namprd21.prod.outlook.com
 (2603:10b6:510:33d:cafe::14) by PH7PR02CA0024.outlook.office365.com
 (2603:10b6:510:33d::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.11 via Frontend Transport; Thu,
 12 Feb 2026 15:10:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF000023D6.mail.protection.outlook.com (10.167.244.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.0 via Frontend Transport; Thu, 12 Feb 2026 15:10:58 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 09:10:52 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 09:10:51 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Feb 2026 09:10:51 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61CFAp3r3265776;
	Thu, 12 Feb 2026 09:10:51 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vqYLD-00000008XnP-3W6A;
	Thu, 12 Feb 2026 09:10:51 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] ti-core-initramfs: Add TI_CORE_INITRAMFS_EXTRA_INSTALL
Date: Thu, 12 Feb 2026 09:10:51 -0600
Message-ID: <20260212151051.2036528-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D6:EE_|CY8PR10MB6852:EE_
X-MS-Office365-Filtering-Correlation-Id: 57a424f1-fbce-4d3d-cf33-08de6a48ed9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?DpTc+zCMLXjJiXchF0j9GvlTXfP6wRwFODDedmGByTvfy9gnATXfp04kwLjL?=
 =?us-ascii?Q?TmwHdHjHI10Ps6yGniaM1U5prNYKmzrU8xee2Jkn8QbatI3zfEr4cTRyKl/9?=
 =?us-ascii?Q?1O1x00JUIn91AnLPGeJdWVxWfj8eyUiEuiqIG0P3P/G0OlyzbdLT8jsarEsD?=
 =?us-ascii?Q?tjCte8X1rwt9q3wOi3x7Hk2RJFB2DZ6+Iqrzd/fvvSAE1EP6Poo/NJXgF72V?=
 =?us-ascii?Q?TO7Hi/fvH0nBivisB/LSkusa5TwWx6HLR+hvcefCtRDc9g9LwjLnKYEJ+FTl?=
 =?us-ascii?Q?BnVxMC41lPopVyRd6+c09+AClNb1IFQulOSLoC5Q2eSszSRdi32CGxl9x32O?=
 =?us-ascii?Q?HCyPcKLYqU+Ew8XVsovZ4ZqMRVht3fKToNT2AZqYehosc5T2mgl5ksGdiTM7?=
 =?us-ascii?Q?QY0bHxk5y2crXa/39eBRqb4IgDX9aP6WypMksoY0Si0CHZ2CE7xSbhcb90WW?=
 =?us-ascii?Q?I/eNQ0wy9aVjPtZ+UmAfo1Xtgp65qasxhGwT2eQNPOghF3rjvDoanSScVCPp?=
 =?us-ascii?Q?ZQ4wI8RtpgYhdXvnsP7SDiR/iWnJy9+bMI8O5EhQn8OEmeNr5JO6d9VFD+MM?=
 =?us-ascii?Q?ntBpz1+/Epj0IQn1wMFiDXcy0fdhvoy++W8dp4kVYamsEioPf6MCTz7Qqa2X?=
 =?us-ascii?Q?500jEA47o1xSwx3FEMMdsByhecTOQLiLvaL6IJIt0Sgc3Huy4dCZeKliyoTF?=
 =?us-ascii?Q?NWMcCHWchvVz3yLj/7Fv1Sf+21whqAL9mpjdbgskaNWYbBI3ZMLZhjQUSo7v?=
 =?us-ascii?Q?O+K9YrD1Fr7VvQT0L4wmMIZev9LvmRIpq51qyn2WM3BtepZgZeW/to83kT2s?=
 =?us-ascii?Q?5zFjaVYJ4TLvfnpax8pSXLN8FiFYKutl175sdVVCv8sZurtEftBnhHAhIEa9?=
 =?us-ascii?Q?nT2NR5agJltdEh74rm6f/0gBwauKl2IRcPLyOLRHlhDR0NLmaTop+3PbYJH/?=
 =?us-ascii?Q?m+03BZQIOdMAKifpu1kXg058s1ib/oSEBR29kK3A8tFW6YVFjX/IzsngRPbG?=
 =?us-ascii?Q?IPT6Rucc/2i52Vez6vWDw52SDdFdufX/TOHbGdO5JHXMjroBWSY+fItbFTIF?=
 =?us-ascii?Q?GeWI7VL80L1nUVdbYXLaaMnvyyvv8PzXGpuJOCL9qZwh0PhsiLgxhQN6nlr8?=
 =?us-ascii?Q?PsyObSIredQMBnSZhRIBRL1ZFUQ5/ySOJDfy3v9xTLmVxj4rGW0gub47hvvU?=
 =?us-ascii?Q?u9fS0xL16ci3Pv/QtCSZPDqNFpaU+KIiAfVyWtnkCmmGn1KwxFiFc6n4+vN0?=
 =?us-ascii?Q?HtHIqiCXtenPrCfKhQqPi/ysy/XkKVJfG++Pikr8qmZUZ2dkfMTLS7FBCMr+?=
 =?us-ascii?Q?fOsgKTTBKP9XREqoinQTYiVKR0MN1sMHFT9SKqDTmNSsR5D6THZQfdfTT8FS?=
 =?us-ascii?Q?F5BYiR43RR/Pm7VmPZB+Y4mq1XnIbk3jYzI400QXis4vDxSZv1T+lK/HZzuZ?=
 =?us-ascii?Q?g3cykYT11I+UoOvHHPPn4/QWdECToX+4FDuAgbUWh44xkcE5vTT9ESfu+7bx?=
 =?us-ascii?Q?iZynJY0cBQpqMDlBTwF6HTDRTb1Gr5+0a/4PXlEwKCV4Ij1Yig9eZnHiUnc9?=
 =?us-ascii?Q?qrfZqwR8tL6pvHX2mY/KKGd16IV4FUPOC5o5yJ4FaBHWEbpqJ5dQGQdP7mPt?=
 =?us-ascii?Q?kP/TfMVlWXbb5p6j01CNwsULkLd8J0bE0pDvKkFoTXklXQ7CtFAgJroXRbPu?=
 =?us-ascii?Q?6zMjww=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	BgorT2isR4zqlUFzDbg/sP53dTm1Z19IiyQLFpsxRDqLKOK1dr2lzbHNDKpWCTiHi0uwrxIU+DI9KLMbGlmm+Bi8i24gOqgydZBP4pomSHtFi4q3kikmzQgDcwuKljlhUlor2keP7O0D6TOvIM/RiDCh+SRfxAIiRNdbF+Y7RHdUFJVD1/6J687ycPwddw373k/mjmhQMVUMCd1HEasW+PI6xiLxYUQKLN1Z6r5VxrwExoWXowiQXeb+LTs4lUeF2fcTECQEypAsy5Uddr0bAYTFJjnI1ymf9Mp/jTp8DIQvde16Lj9z7kN2EVCm1NYdSMaNWe5ffaZWMi2+prA9bntaoEnXYXxFUrrWejEKYGNlaVGYS9iSQabQnmbzf4uYpzdquDd9K4sYHZTkoIxLS1MV7AcQ4M+C0xHxEjckrYhiGlik+HDJasgmVDkVZHxj
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 15:10:58.8456
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57a424f1-fbce-4d3d-cf33-08de6a48ed9a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023D6.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6852
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 12 Feb 2026 15:11:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19503

Add TI_CORE_INITRAMFS_EXTRA_INSTALL variable that another layer can use to
install additional packages/changes into the initramfs.  Setting this
variable will also turn on the initramfs even if the platform does not
have kernel modules to include.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc | 3 ++-
 meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb  | 7 ++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc b/meta-=
ti-bsp/conf/machine/include/ti-core-initramfs.inc
index 3b749e37..9d3cc612 100644
--- a/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
@@ -5,9 +5,10 @@
 #   TI_CORE_INITRAMFS_ENABLED =3D "0"
 #
 #-------------------------------------------------------------------------=
-----
-TI_CORE_INITRAMFS_ENABLED ?=3D "${@ '1' if d.getVar('TI_CORE_INITRAMFS_KER=
NEL_MODULES') else '0'}"
+TI_CORE_INITRAMFS_ENABLED ?=3D "${@ '1' if d.getVar('TI_CORE_INITRAMFS_KER=
NEL_MODULES') or d.getVar('TI_CORE_INITRAMFS_EXTRA_INSTALL') else '0'}"
=20
 TI_CORE_INITRAMFS_KERNEL_MODULES ?=3D ""
+TI_CORE_INITRAMFS_EXTRA_INSTALL ?=3D ""
=20
 TI_CORE_INITRAMFS_IMAGE =3D "ti-core-initramfs"
 TI_CORE_INITRAMFS_IMAGE_FILE =3D "${TI_CORE_INITRAMFS_IMAGE}.cpio.xz"
diff --git a/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb b/meta-t=
i-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
index ddf4e5b4..0180f09e 100644
--- a/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
+++ b/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
@@ -15,7 +15,12 @@ IMAGE_NAME =3D "ti-core-initramfs"
=20
 export IMAGE_BASENAME =3D "${IMAGE_NAME}"
=20
-PACKAGE_INSTALL =3D "packagegroup-ti-core-initramfs"
+TI_CORE_INITRAMFS_EXTRA_INSTALL ?=3D ""
+
+PACKAGE_INSTALL =3D "\
+    packagegroup-ti-core-initramfs \
+    ${TI_CORE_INITRAMFS_EXTRA_INSTALL} \
+"
=20
 # Ensure the initramfs only contains the bare minimum
 IMAGE_FEATURES =3D ""
--=20
2.43.0


