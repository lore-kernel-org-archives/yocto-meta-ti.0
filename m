Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7A88ECD6F9
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 00:00:40 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33238.1770854430798700568
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Feb 2026 16:00:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=kgatcD9+;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.193.28, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KEaekG5HmFq5QEWBGfQv1RvIX6feFypdFjQVCoBpQ78qOVLLU2bQr1zqxh+LA1vFF7+eNwMlOn3Y7EEt/BXNgZUq8MR+GpVqbnQEmgxUnJO2i4izYm+SNbXnqq18+0/vcXfs1aLpp9hTlVI6iTYYNZ53mWUz7qnwyUHenEhvSdW7qGm5IirbFY0Q8QWPgXr7btedwoiLX3mORMbOOQn9UOz0q60BN7RybRZz7LbLjxkoKHdnutgJtETRyuraqEpINqxCez71GSKY/cPQuAJOMM5QgPFQ5ZNlcHiTiLrMdk7JecrGRWHQnOVQcApf7KQMB6VGWR6vNr/Na3J0POmOUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LAF9Ofd+iJrT0x6qaRkVjt4f3wYEimGEwsDbxx919xk=;
 b=H6JIAA/MpW0fmznByut4ENJTjZU4/eP1HnwvXP/TzfQcbedcVmGnW9y131zlcgbI9HEQK5ii0P1oV3U9Kdx408YBksy/a1TPcrQ3HBqkaZDdvVK3+HdRfoOcgle24lozubHdaR3pDDQ8QAOgFALmZ1mCo4yeWtWo9osDlXxc9tKGDWWsqH9pogVpBI9s3Akqwulx8P5URYWWQ+4KPMyKkVV+a0vyDp4ZsFQg24w09czgP3Os6cidj+jcbYCwHhWqN1r0ONLmm/ocqZcYJVuGzUSiCjx+WsGrw0gpkeTBX1kSyvA8umTveaP1iqidRkTfabaMvUP4FKeY+z55qilCmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LAF9Ofd+iJrT0x6qaRkVjt4f3wYEimGEwsDbxx919xk=;
 b=kgatcD9+vjkbv/72IR0iyfsYMfo2O8Sn+D2j6tQKPG9rL0I0I/CqvPyoe+mD9Oh5PocBvlmSMNPFdxinY1tFaLje2Aj12xsuqw0fCcn1WOWQqNEHges25siLcLFsq0cxlpEr/kia5Xp/NYX/G5fotPv0Wl16G/sTKLkRM6Q6eWQ=
Received: from DM6PR02CA0050.namprd02.prod.outlook.com (2603:10b6:5:177::27)
 by DS4PPFA043F25E4.namprd10.prod.outlook.com (2603:10b6:f:fc00::d39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 00:00:27 +0000
Received: from DS1PEPF0001709D.namprd05.prod.outlook.com
 (2603:10b6:5:177:cafe::76) by DM6PR02CA0050.outlook.office365.com
 (2603:10b6:5:177::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Thu,
 12 Feb 2026 00:00:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS1PEPF0001709D.mail.protection.outlook.com (10.167.18.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Thu, 12 Feb 2026 00:00:27 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Feb
 2026 18:00:26 -0600
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Feb
 2026 18:00:26 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 11 Feb 2026 18:00:26 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61C00Qv62081790;
	Wed, 11 Feb 2026 18:00:26 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vqK8A-00000008LLZ-2dCe;
	Wed, 11 Feb 2026 18:00:26 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v3] ti-core-initramfs: Rework logic
Date: Wed, 11 Feb 2026 18:00:26 -0600
Message-ID: <20260212000026.1988674-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709D:EE_|DS4PPFA043F25E4:EE_
X-MS-Office365-Filtering-Correlation-Id: 3893f7bd-3947-4503-058f-08de69c9baaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|7142099003;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?UtX3oNqOw97Ht9S6CExwQl8haS8HAE/wCKUGX+kBPMTgJXFj17QhV9cht0kS?=
 =?us-ascii?Q?IxrfIzo5tLBckDAMTNxBOxLx0/Is5KB7gCqam/osUpb+KHrAwxZ7KmNwJwpT?=
 =?us-ascii?Q?gxTNSqRbnwWou2eaGJgVe3n686DttRwK0IMPg+XKmoJM4W/1WMuEIpI7eIlz?=
 =?us-ascii?Q?mcnyaO6i8r+814yY84/ReBN5thniQza1TiWMSwJFpjFjfJwHtE3/zFN2IU9E?=
 =?us-ascii?Q?l++8mNGL694IVeg+mjN99cDoBBq5IiUIPRaVmsH57SU2BsciDTezSEkTYQRm?=
 =?us-ascii?Q?nR9CMbHSRujFQp2Na8QBtvKh5cxYTXr2BQnMLEgZpIqF7TU1seZqv4nxOjKD?=
 =?us-ascii?Q?k3jG3cHY8lmn/zlND6GjjDZOb9TEA5xEtaFkobJ5mxqw6omVli7oFQQKBTDT?=
 =?us-ascii?Q?ewdf2slidLPxFZJhCbCXR3TsWRGoxTELC9qnUfcv0jznO/XML3lr13rU4BJ6?=
 =?us-ascii?Q?meFpIolBlllaeuq3c7SVWIZUJzBDmD9FacH4BwlSUnOl45Ce89I/ZXb4aix4?=
 =?us-ascii?Q?LfktCROzWQ8IG19FNtWTTDUiBWK69IU1frixpcdQ4YtWesIRh0W2UbUqWeo9?=
 =?us-ascii?Q?VhMtFeU6rdjDswLtHvPWMj4xDkDwLt/VMdOU4QtnblGK1aiIQXV06EyEef+M?=
 =?us-ascii?Q?k68YIPxH6JF9JzXXMFh5wH+JMDtQvIWoyHI8e6LzRFOXafciA9lMRZSkHPyB?=
 =?us-ascii?Q?yk7c6ifbati/IpOAk4n8ke0ftlntqrCX2/XMV5lCUuOIG20evqLWgFnPOszr?=
 =?us-ascii?Q?mglOszxaA3cHBLjUziw2OSY6AeUNwf/lbB7z3hMwMFvNKkcIaV7eEIKWKKwg?=
 =?us-ascii?Q?ALtZfVxBSDJYThtC9UURwfkKbs54sbhkucRbigSxghQxu6bg1cGoEV48RL08?=
 =?us-ascii?Q?OVCI3MtYbcTZca9eGl9gtweMUGXWkorUP/B3qrdMFBTdA5CsKm/poBkFdnkW?=
 =?us-ascii?Q?CzA3MOZt9LI/C2auWPEjZFtCoCNv0r50QGoVT0WMzTOwolkYYBsKKvoIgHWk?=
 =?us-ascii?Q?8VPGNw2UXqqbjY2yMTuwgQ0huYp/N7xAR0Q9bhHMKj+JstZEMc/fsKzW1PUe?=
 =?us-ascii?Q?QlEZQu4Y+nNJuNkwjtnP/0jJTw5lJXnfW+kRbHi7x+jwL+roUS5Vfusew/fz?=
 =?us-ascii?Q?dQFvaKIqDlHb2Yprc2BvaZP7tleE3ooL0OBAdNC09roCsetNhwlAZ+xBfw17?=
 =?us-ascii?Q?vfrGwOT41n7pA5qlKIbcQ5ohUGD0KqOczXEhvr6ucWo44at30pPAfI96eTY3?=
 =?us-ascii?Q?Qdpivq3rbaUIk37MFuN1mMy5b59Rc6nFs9N0nsT3B2Lti0MgiitQ86FfDU7a?=
 =?us-ascii?Q?GtmYI4NEVme6ICi4hCRPWJvSHk7H5foljH92bp5boOxLQibD3Nl/VkddnDHp?=
 =?us-ascii?Q?uYPXXxhYyaI8x3BxWnp5BxWvmpwRd5UQb6mDkhxL1tvTHdGm5756GE2TWeHX?=
 =?us-ascii?Q?b8+plfrvGahs//uSzVdOmar9L/rty9MrzelfUnH10DkZSiA392XIhfHGNeLy?=
 =?us-ascii?Q?EXCZYGSPy4Gdb4jKJD9GMQXIe3V7qZu8+V7vv3YkzP6enlPH6jEnhxS217E9?=
 =?us-ascii?Q?VzJhXqmdSOWIanVCGFsMlhG/a0xXl8syD4BIMIRehs+BhZFT9xTB2kAJ6n4p?=
 =?us-ascii?Q?FRSEnJA7hZ2sewargxE89F5RNm6BXK4MfTtzOGidRzn1tAPOAgdn6AmTxFz6?=
 =?us-ascii?Q?J3CCLw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Us5a41GVGv+sh3od+3ovzkJ7R1Z52Sw0zHKIH9LcB6XZov/5KKGvNx6Z5t+cdx9AJVbb+SlY/P+SaeEfl6KK3lewFP1xDSVRzZ0Unt5YChtjQzZ3j/R53j+mWJAbs3LjtHRH8WWPAHVkyxRNb7JB8cxUHlFMusFNw+YNtGnWGYRM2SZT6R995/r0LXDpTa2PhVXJ7Eyxd8Zvgk1zweRBwTj3gzaRUgDRT/QmuT7AtDRnFEfnKFIbp+uWEKTm1CMEnA5w6lCkTa5GP7iyFpsBbPMSNLZMKSQ0z7H0QyZdNMeDfk5bBUWGe0ei4O+hofZVfEdh7wVpx5bvDrubaz0EhOH8KC0Gi7MvbGHWuaAGxP5j5BXupfuCiVCaTznYvtegsl4SMXg6qFyN0+Yj6fJ46+FctiOu2wMcZ4QINR0Nb49kge6h+uKtZsYE7uC7A1Tk
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 00:00:27.3569
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3893f7bd-3947-4503-058f-08de69c9baaf
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF0001709D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFA043F25E4
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 12 Feb 2026 00:00:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19493

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
v3: After a discussion with Denys: change default to be based on
    TI_CORE_INITRAMFS_KERNEL_MODULES and remove secondary layer of
    variables.  This cleans up the logic nicely.
v2: Fix default value for TI_CORE_INITRAMFS_ENABLED.

 meta-ti-bsp/conf/machine/include/am62axx.inc  |  6 ++---
 meta-ti-bsp/conf/machine/include/j721e.inc    |  6 ++---
 meta-ti-bsp/conf/machine/include/j784s4.inc   |  6 ++---
 .../machine/include/ti-core-initramfs.inc     | 22 +++++++++++++++++++
 meta-ti-bsp/conf/machine/include/ti-soc.inc   | 20 +----------------
 .../packagegroup-ti-core-initramfs.bb         |  4 ++--
 6 files changed, 34 insertions(+), 30 deletions(-)
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
index 00000000..3b749e37
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
@@ -0,0 +1,22 @@
+#-------------------------------------------------------------------------=
-----
+#
+# To turn off the ti-core-initramfs.cpio creation just set:
+#
+#   TI_CORE_INITRAMFS_ENABLED =3D "0"
+#
+#-------------------------------------------------------------------------=
-----
+TI_CORE_INITRAMFS_ENABLED ?=3D "${@ '1' if d.getVar('TI_CORE_INITRAMFS_KER=
NEL_MODULES') else '0'}"
+
+TI_CORE_INITRAMFS_KERNEL_MODULES ?=3D ""
+
+TI_CORE_INITRAMFS_IMAGE =3D "ti-core-initramfs"
+TI_CORE_INITRAMFS_IMAGE_FILE =3D "${TI_CORE_INITRAMFS_IMAGE}.cpio.xz"
+
+#-------------------------------------------------------------------------=
-----
+# Apply all of the needed changes to create/use the initramfs (if enabled)=
.
+#-------------------------------------------------------------------------=
-----
+do_image_wic[depends] +=3D "${@ '${TI_CORE_INITRAMFS_IMAGE}:do_image_compl=
ete' if d.getVar('TI_CORE_INITRAMFS_ENABLED') =3D=3D "1" else ''}"
+
+TI_WKS_INITRAMFS ?=3D "${@ ',initrd=3D${TI_CORE_INITRAMFS_IMAGE_FILE}' if =
d.getVar('TI_CORE_INITRAMFS_ENABLED') =3D=3D "1" else ''}"
+
+IMAGE_BOOT_FILES +=3D "${@ '${TI_CORE_INITRAMFS_IMAGE_FILE}' if d.getVar('=
TI_CORE_INITRAMFS_ENABLED') =3D=3D "1" else ''}"
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


