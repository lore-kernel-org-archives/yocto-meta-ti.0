Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C717CECD6E8
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 20:04:29 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.11])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28427.1770840259448237678
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Feb 2026 12:04:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=q06m3mf6;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.52.11, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IHnhrY22yHjoIcXkf1RbrA6g1E2B1R3HBuWx8TnvETvNO95fhVchbZN0IeE0bnz+YM90LgpsXRshWRbvhG+SJ54Xq3mgOQXV0N/WL0vg2zQVSSzMMj5bTCpRL+FC+ycgfhTMeaxV5BSk4+C4+JrdO5IaO9u13xRVQXm5S9hDDrB2qBsWspnemw0HD+5ZH0IPvh7KyYpOQyJZ32rfYKPIMun5D84A3Jqu4MpFsOeIN3IXFwHqgme4gRQ3F/5pTcDwgGUQtsevbAuDM9dyawEu+uVvWJDJKQIlqRU72jDv/LybBHaqFSLG2ohfurE5P7De4oeXaVxzJICz0X897pfdWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eAp1/4/iaYV23Emd9lkAJs8GYVjvb7z3JybY+nQknEU=;
 b=kkkMO0p8MpgZ0unZuBfPp3qIqoU1Kc4cwMZ13zzjb/ZIYUFwseHuvXw3JeSbq3ZPMwFPV/mD4M678rvdxlqu5cIRk/kxPlJB4X/MzXBH1+Zyjvm+N6x8Q0/tG8YJCh49rmPfhKEZBfYHC6QrioIfCc8AlYWptNdohjn3dceNSwuzjWYFS2Pa203yEP0oEFk3MMQI6YmN/hivqZsQ+PACqziuV5ZHORUg9W1GuTdMrae5/QevJ1gmXwUcHnlTjjdXytrpMTuY1JH6DgH38a8mwebqFJR6W2muUKR7MoCjzQyHq1QmEsDw0dljslIfoitoQTly6YvGVT/KuxhZPUr5Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eAp1/4/iaYV23Emd9lkAJs8GYVjvb7z3JybY+nQknEU=;
 b=q06m3mf6MyrD/kriLd6pDkv2dYhkUjBkW73r3NKJAQrBDRwkPnIc6/dnFFE5fzl0G4eUHFafvrZSavQ8DcpSjH8fjQY82wU7acFCwpoCMnEYQeGwxToLZDpOG8MD8P5COZ2rJ+90CYfEX+t5MUkj+T6MrJ8pTyEHK554cpzyso0=
Received: from SA1P222CA0074.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2c1::20)
 by DS5PR10MB997706.namprd10.prod.outlook.com (2603:10b6:8:341::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Wed, 11 Feb
 2026 20:04:16 +0000
Received: from SN1PEPF000397B0.namprd05.prod.outlook.com
 (2603:10b6:806:2c1:cafe::3b) by SA1P222CA0074.outlook.office365.com
 (2603:10b6:806:2c1::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.10 via Frontend Transport; Wed,
 11 Feb 2026 20:04:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SN1PEPF000397B0.mail.protection.outlook.com (10.167.248.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Wed, 11 Feb 2026 20:04:15 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Feb
 2026 14:04:15 -0600
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Feb
 2026 14:04:14 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 11 Feb 2026 14:04:14 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61BK4Eww1805010;
	Wed, 11 Feb 2026 14:04:14 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vqGRa-00000006tBU-2kzZ;
	Wed, 11 Feb 2026 14:04:14 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] ti-core-initramfs: Rework logic
Date: Wed, 11 Feb 2026 14:04:14 -0600
Message-ID: <20260211200414.1642061-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B0:EE_|DS5PR10MB997706:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b387a82-1ee7-4859-92fc-08de69a8bb6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|7142099003;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?pApBMSOZsz8U5lNXyKnuFYwOHEHUTYbJE3wgP5IYJH74igzy7zA2ZXgeN+63?=
 =?us-ascii?Q?AeRV9zzi/iSpNmdYm9MMqrSVuQFmlzdHcPJehR06+b9YdXSNpbAKz8UBw93T?=
 =?us-ascii?Q?VEe1spEmp/w+P21lG5xvuS7Vr/+dH1BxdFRADt8XI0wAGVf2rhCwed30GcTP?=
 =?us-ascii?Q?6FSrmQe9Fn2ey7VfYZicPlPv5xEOVw6vIIkv3zgtHNJeXh83eMMFeaZMpL5j?=
 =?us-ascii?Q?k5r8is+V/RitPgoB5JGrCZF3Q2KyOcEURgOdyNFbkdUk6PSmOJymmKHviuBX?=
 =?us-ascii?Q?aK7Sf1KwSXclhZqYDAo5yR8t7WgnSZ5IAHPiEFUg26S2McoYbOPpl4CdcIrM?=
 =?us-ascii?Q?wevOPrNqcxYOSX2iEmfW/5SrvfLf+GvjmtFchw48VJ8BAI0GxILDQKUG+os6?=
 =?us-ascii?Q?eV84qwHFH6LtNu5YwhOzo+O7kzT83VsmwDNKWufNlam+MrpkV/qQWF1oC3J8?=
 =?us-ascii?Q?aPa9nuUYVqlAof0zQL3JwOeL1QSWQm0ZGkeso/oBMEGssBKH7YX8k0ru/6oc?=
 =?us-ascii?Q?Lp5S3PI4Qr2NNjOVLjehAVld95BDPNXjjcd31UC9CSrq8ylGqXmxGJbPbd9q?=
 =?us-ascii?Q?u7zixZ1HuG43vwNhWOFb3IuLHfQhNaVfULRIHoeHipou8kAec17c1DvT430o?=
 =?us-ascii?Q?n2iwboW5EVdms12jEblQ4c2zVVcH3BbGCPXPG2kuD8Al2YT8sX0GcjBY3TfN?=
 =?us-ascii?Q?7ENLAEjXL2GzX8X9jTEhjxV+wra2HAYCGMBEBEB50fknkErDZBTMZBQuwngW?=
 =?us-ascii?Q?TUVBpF0HMC3qEJfjzxinzKRZDwcMq4u52fP2xqaC01/CZdBfc/MYmF1BqMrG?=
 =?us-ascii?Q?XPDl/aNbB3Q8K8AWHz8bQfaX0uV026tP7JwKJadG7GVVS376JV3y20XKgC1z?=
 =?us-ascii?Q?CdOZfNQjZbNixnwAknL9f+L3C56Zj8U/pMnPWP2eH1SuDO+BD7YbRwPU6KUB?=
 =?us-ascii?Q?Seo6VeRiXLJffb87HugWZ9bkkKhCTz1xS+g0k7GJO5z6t9aqB3ySq3zzMatA?=
 =?us-ascii?Q?nVfOsiw+MOQW1Tt1df6aUP/W/lXxiGl1l06yAaibFeHc3phDIREhEzvLBZ7u?=
 =?us-ascii?Q?FVgwX94rfZ1+DUz6kOMnb6qWLHUx4qu8O1XtvLr8Qx6MMytusBkh8kYLbPW6?=
 =?us-ascii?Q?j9oggDUX9QFQ9HEa//qy66M2WWzTOBrCAfaoSWZC7+KYxmz7O+scaUOUobrx?=
 =?us-ascii?Q?AtEF+2Hgv5WH14jmO+uzN+CxAKFGKr4bqA2Vc6u4j2xdkCAjtcsgsKOZrD7P?=
 =?us-ascii?Q?XoWQFyQJFv5YD7upflBFL+4yMnuWtgNRsWGk9MTAyk9+XJwWCbIqpdVzjSPL?=
 =?us-ascii?Q?hKO4yMSPMo9F1YqszbrlmH/GUxs3b32pwNFdu3vXiAnsDjW/jRoMcJIZqkJR?=
 =?us-ascii?Q?iRk4SCd3Iv40SQxKaDpLbr3fqtPy9Ykz6wTiragRKharx4W5iJ8q/ARK5FU3?=
 =?us-ascii?Q?0j75sZHNZs4gSpf9Y2LQqEEZM04tthH4fvjtgIftGbvF7kBnR3t6/FREiUyX?=
 =?us-ascii?Q?kuVnL9aD2C5QeGa5KSlJhKN1DAhb2Q/P3sLCOAmdygnS2p/nydJnnKBCI3Ms?=
 =?us-ascii?Q?Bc2X3LJnu4zhLLEedTcIVPE5+qteSLeokpsVdlau6ylVVCHicVBoyYCjCLP8?=
 =?us-ascii?Q?9YbtClUn7lr6+hWdAOoT6jJO5rXv+6hZ3vE7DO2hbrjf2zzQlqWd8ErN1Mbk?=
 =?us-ascii?Q?7qbDMg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ehz3Cb5G05B2SraniNVNjnut5iKf24Bj+PZitmwblZqv04w961/G6O9EQ+IXcsjDBzSNj9osx8+T95okFFVwvJ31cSSu4llw2uMBnX8f9HMKAAThVrlMED1ndy8hVGCVFbiip2xADazvPcLp5e3wNmWzPXcqbQwZO3E5IEIee99gQQ/6+5zfKvSONLocx3f+VzDNwuq5v+t5QKXskQRtDoT6GEI43QFkIO51jw+Ob93j32MzVBPidpKq1L6wxHQC/EcGxnQD3AawA1JykrX02vY0EycohkIxLui0oEncHFuQTyhEQOJGIER5ywW/GwuIovecKvZNn30cy5Ok+fOuPJsIBpG82c8j5RTdtq5ErPWfwEKWwfFFYBMOe1wTxLrzK6pRUuHY6Fwt6SfkGq094sGDda/kR7CvvlOzRTyeSrMqEqF6nuUb7AjlAE1lhiZg
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 20:04:15.2832
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b387a82-1ee7-4859-92fc-08de69a8bb6e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF000397B0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PR10MB997706
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 11 Feb 2026 20:04:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19486

Clean up the logic of the new ti-core-initramfs to reduce the impact on
downstream layers.

- Flip the logic in the machine .conf files to track the list of
  required kernel modules for that platform, but if the variable is set
  to "" then the ti-core-initramfs will not be created.

- Redo the logic of when we require creation/usage of the initramfs to
  just platforms that need it (ie that set TI_CORE_INITRAMFS_KERNEL_MODULES=
).

- Add a big switch to disable the initramfs entirely.  In that case, the
  user is on their own to make sure that the kernel has everything it
  needs to boot either via config fragments to turn on the needed
  modules, or by using the TI_CORE_INITRAMFS_KERNEL_MODULES
  variable to populate their own initramfs.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/include/am62axx.inc  |  6 ++--
 meta-ti-bsp/conf/machine/include/j721e.inc    |  6 ++--
 meta-ti-bsp/conf/machine/include/j784s4.inc   |  6 ++--
 .../machine/include/ti-core-initramfs.inc     | 29 +++++++++++++++++++
 meta-ti-bsp/conf/machine/include/ti-soc.inc   | 20 +------------
 .../packagegroup-ti-core-initramfs.bb         |  4 +--
 6 files changed, 41 insertions(+), 30 deletions(-)
 create mode 100644 meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc

diff --git a/meta-ti-bsp/conf/machine/include/am62axx.inc b/meta-ti-bsp/con=
f/machine/include/am62axx.inc
index 1fd4a1ac..0577ffaa 100644
--- a/meta-ti-bsp/conf/machine/include/am62axx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62axx.inc
@@ -12,6 +12,6 @@ OPTEEMACHINE =3D "k3-am62x"
=20
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "cnm-wave-fw"
=20
-TI_INITRAMFS_KERNEL_MODULES:append:bsp-ti-6_18 =3D " kernel-module-tps6594=
-i2c kernel-module-tps6594-regulator kernel-module-tps6594-core"
-TI_INITRAMFS_KERNEL_MODULES:append:bsp-mainline =3D " kernel-module-tps659=
4-i2c kernel-module-tps6594-regulator kernel-module-tps6594-core"
-TI_INITRAMFS_KERNEL_MODULES:append:bsp-next =3D " kernel-module-tps6594-i2=
c kernel-module-tps6594-regulator kernel-module-tps6594-core"
+TI_CORE_INITRAMFS_KERNEL_MODULES =3D "kernel-module-tps6594-i2c kernel-mod=
ule-tps6594-regulator kernel-module-tps6594-core"
+TI_CORE_INITRAMFS_KERNEL_MODULES:bsp-ti-6_6 =3D ""
+TI_CORE_INITRAMFS_KERNEL_MODULES:bsp-ti-6_12 =3D ""
diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/conf/=
machine/include/j721e.inc
index f329e269..3e4fbf17 100644
--- a/meta-ti-bsp/conf/machine/include/j721e.inc
+++ b/meta-ti-bsp/conf/machine/include/j721e.inc
@@ -21,6 +21,6 @@ TI_VXE_VXD_DRIVER:bsp-ti-6_18 =3D ""
=20
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "cadence-mhdp-fw vxd-dec-fw ti-et=
h-fw-j721e ${TI_VXE_VXD_DRIVER}"
=20
-TI_INITRAMFS_KERNEL_MODULES:append:bsp-ti-6_18 =3D " kernel-module-cdns-pl=
tfrm kernel-module-ti-j721e-ufs"
-TI_INITRAMFS_KERNEL_MODULES:append:bsp-mainline =3D " kernel-module-cdns-p=
ltfrm kernel-module-ti-j721e-ufs"
-TI_INITRAMFS_KERNEL_MODULES:append:bsp-next =3D " kernel-module-cdns-pltfr=
m kernel-module-ti-j721e-ufs"
+TI_CORE_INITRAMFS_KERNEL_MODULES =3D "kernel-module-cdns-pltfrm kernel-mod=
ule-ti-j721e-ufs"
+TI_CORE_INITRAMFS_KERNEL_MODULES:bsp-ti-6_6 =3D ""
+TI_CORE_INITRAMFS_KERNEL_MODULES:bsp-ti-6_12 =3D ""
diff --git a/meta-ti-bsp/conf/machine/include/j784s4.inc b/meta-ti-bsp/conf=
/machine/include/j784s4.inc
index 42c95b11..4dc3a71b 100644
--- a/meta-ti-bsp/conf/machine/include/j784s4.inc
+++ b/meta-ti-bsp/conf/machine/include/j784s4.inc
@@ -14,6 +14,6 @@ OPTEEMACHINE =3D "k3-j784s4"
=20
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "cadence-mhdp-fw cnm-wave-fw ti-e=
th-fw-j784s4"
=20
-TI_INITRAMFS_KERNEL_MODULES:append:bsp-ti-6_18 =3D " kernel-module-cdns-pl=
tfrm kernel-module-ti-j721e-ufs"
-TI_INITRAMFS_KERNEL_MODULES:append:bsp-mainline =3D " kernel-module-cdns-p=
ltfrm kernel-module-ti-j721e-ufs"
-TI_INITRAMFS_KERNEL_MODULES:append:bsp-next =3D " kernel-module-cdns-pltfr=
m kernel-module-ti-j721e-ufs"
+TI_CORE_INITRAMFS_KERNEL_MODULES =3D "kernel-module-cdns-pltfrm kernel-mod=
ule-ti-j721e-ufs"
+TI_CORE_INITRAMFS_KERNEL_MODULES:bsp-ti-6_6 =3D ""
+TI_CORE_INITRAMFS_KERNEL_MODULES:bsp-ti-6_12 =3D ""
diff --git a/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc b/meta-=
ti-bsp/conf/machine/include/ti-core-initramfs.inc
new file mode 100644
index 00000000..2b210169
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
@@ -0,0 +1,29 @@
+#-------------------------------------------------------------------------=
-----
+#
+# To turn off the ti-core-initramfs.cpio creation just set:
+#
+#   TI_CORE_INITRAMFS_ENABLED =3D "0"
+#
+#-------------------------------------------------------------------------=
-----
+TI_CORE_INITRAMFS_ENABLED ?=3D "0"
+
+TI_CORE_INITRAMFS_KERNEL_MODULES ?=3D ""
+
+TI_CORE_INITRAMFS_IMAGE =3D "ti-core-initramfs"
+TI_CORE_INITRAMFS_IMAGE_FILE =3D "${TI_CORE_INITRAMFS_IMAGE}.cpio.xz"
+
+#-------------------------------------------------------------------------=
-----
+# Only enable the initramf code if TI_CORE_INITRAMFS_KERNEL_MODULES is set=
.
+#-------------------------------------------------------------------------=
-----
+TI_CORE_INITRAMFS_DO_IMAGE_WIC =3D "${@ '${TI_CORE_INITRAMFS_IMAGE}:do_ima=
ge_complete' if d.getVar('TI_CORE_INITRAMFS_KERNEL_MODULES') else ''}"
+TI_CORE_INITRAMFS_WKS_FLAG =3D "${@ ',initrd=3D${TI_CORE_INITRAMFS_IMAGE_F=
ILE}' if d.getVar('TI_CORE_INITRAMFS_KERNEL_MODULES') else ''}"
+TI_CORE_INITRAMFS_IMAGE_BOOT_FILES =3D "${@ '${TI_CORE_INITRAMFS_IMAGE_FIL=
E}' if d.getVar('TI_CORE_INITRAMFS_KERNEL_MODULES') else ''}"
+
+#-------------------------------------------------------------------------=
-----
+# Apply all of the needed changes to create/use the initramfs (if enabled)=
.
+#-------------------------------------------------------------------------=
-----
+do_image_wic[depends] +=3D "${@ '${TI_CORE_INITRAMFS_DO_IMAGE_WIC}' if d.g=
etVar('TI_CORE_INITRAMFS_ENABLED') =3D=3D "1" else ''}"
+
+TI_WKS_INITRAMFS ?=3D "${@ '${TI_CORE_INITRAMFS_WKS_FLAG}' if d.getVar('TI=
_CORE_INITRAMFS_ENABLED') =3D=3D "1" else ''}"
+
+IMAGE_BOOT_FILES +=3D "${@ '${TI_CORE_INITRAMFS_IMAGE_BOOT_FILES}' if d.ge=
tVar('TI_CORE_INITRAMFS_ENABLED') =3D=3D "1" else ''}"
diff --git a/meta-ti-bsp/conf/machine/include/ti-soc.inc b/meta-ti-bsp/conf=
/machine/include/ti-soc.inc
index 74346430..c4472113 100644
--- a/meta-ti-bsp/conf/machine/include/ti-soc.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-soc.inc
@@ -3,6 +3,7 @@
 SOC_FAMILY =3D "ti-soc"
 require conf/machine/include/soc-family.inc
 require conf/machine/include/ti-extras.inc
+require conf/machine/include/ti-core-initramfs.inc
=20
 # kernel, initrd load addresses for the fitImage in all TI platforms
 UBOOT_ENTRYPOINT =3D "0x82000000"
@@ -28,22 +29,3 @@ CLASS_DEVICETREE_PREFIX =3D "${@ 'ti-devicetree-prefix' =
if d.getVar('KERNEL_DEVICE
=20
 KERNEL_CLASSES +=3D "${CLASS_DEVICETREE_PREFIX}"
 IMAGE_CLASSES +=3D "${CLASS_DEVICETREE_PREFIX}"
-
-BUILD_CORE_INITRAMFS_IMAGE =3D "ti-core-initramfs"
-BUILD_CORE_INITRAMFS_IMAGE_FILE =3D "${BUILD_CORE_INITRAMFS_IMAGE}.cpio.xz=
"
-
-BUILD_CORE_INITRAMFS_IMAGE_STEP ?=3D ""
-BUILD_CORE_INITRAMFS_IMAGE_STEP:bsp-ti-6_18 =3D "${BUILD_CORE_INITRAMFS_IM=
AGE}:do_image_complete"
-BUILD_CORE_INITRAMFS_IMAGE_STEP:bsp-mainline =3D "${BUILD_CORE_INITRAMFS_I=
MAGE}:do_image_complete"
-BUILD_CORE_INITRAMFS_IMAGE_STEP:bsp-next =3D "${BUILD_CORE_INITRAMFS_IMAGE=
}:do_image_complete"
-
-do_image_wic[depends] +=3D "${BUILD_CORE_INITRAMFS_IMAGE_STEP}"
-
-TI_WKS_INITRAMFS ?=3D ""
-TI_WKS_INITRAMFS:bsp-ti-6_18 =3D ",initrd=3D${BUILD_CORE_INITRAMFS_IMAGE_F=
ILE}"
-TI_WKS_INITRAMFS:bsp-mainline =3D ",initrd=3D${BUILD_CORE_INITRAMFS_IMAGE_=
FILE}"
-TI_WKS_INITRAMFS:bsp-next =3D ",initrd=3D${BUILD_CORE_INITRAMFS_IMAGE_FILE=
}"
-
-IMAGE_BOOT_FILES:append:bsp-ti-6_18 =3D " ${BUILD_CORE_INITRAMFS_IMAGE_FIL=
E}"
-IMAGE_BOOT_FILES:append:bsp-mainline =3D " ${BUILD_CORE_INITRAMFS_IMAGE_FI=
LE}"
-IMAGE_BOOT_FILES:append:bsp-next =3D " ${BUILD_CORE_INITRAMFS_IMAGE_FILE}"
diff --git a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramf=
s.bb b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
index c759808c..aae63495 100644
--- a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
+++ b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
@@ -6,10 +6,10 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 inherit packagegroup
=20
-TI_INITRAMFS_KERNEL_MODULES ?=3D ""
+TI_CORE_INITRAMFS_KERNEL_MODULES ?=3D ""
=20
 RDEPENDS:${PN} +=3D "\
-    ${TI_INITRAMFS_KERNEL_MODULES} \
+    ${TI_CORE_INITRAMFS_KERNEL_MODULES} \
     ${VIRTUAL-RUNTIME_base-utils} \
     base-passwd \
     initramfs-framework-base \
--=20
2.43.0


