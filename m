Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 589B0ECD6F3
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 22:03:50 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.25])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30874.1770847420138397672
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Feb 2026 14:03:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=Q3qahoxo;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.201.25, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kIqiY3tQCStQ202QKWr037031lsiWUeGECiMibE/M057S7LmB1Ck5QiT6qtRfZvsTa6BZiQZtvc/rjgPIhLC4eNyY7wo3Y6hcLr5i92e1UAbPqm0KY1hYPrNGo9KrEOJgF8hA040c27rCyHxIApa9JkR0opFpn5tPdfg7Y3DpP4kelxjd+ZO9mRrzu0DxK9fV0tHKouqm4yEvncBATBpAnT7uGbnL8d6rVkd4xz/Ifrpxzz3uDtYp6ZbGhauEKWrwT1oMhnKgfpljxJAgBuz14TGKE2FwplB3CIfh6FW3a3m6e9xxTZzsJNipWkETBBHVOMqLJcoJQ409AtfHuLFZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7bP0xbOnwLI9UvPpZynPBzWkKK61xJZhhNKFgzsfw+A=;
 b=BqXhU0RT1W6eIgXfW31ydzoXqX9DiURCfBMa6dUZoVg4B6xErWpossSWdgXw1ozTUx8Wyai+6i5yPEnJ1YAUnbBhvfzCswKPpLy6lrHuf6VJoviaRNLTlMTbG5mSzQ4ejZz9xgmBBbwHf4bsxAmkt312fhU2cVGjBsVEJS6JW3kOl7jtofslGzXjglQ1KKcNpwM1Go0c5GDghf+k+ZYWtItahyvfhAykVLJqcdt1DSExiyRN+THQUz7TR7+q0kJhDk3hd808hnYaOFbsDIBYTeBLn4uXHvsYK5GaOZFfF8LklzFmstnZ6qpdSkh2FYwEnmVr5qsLAZjxbwtE4FP/mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7bP0xbOnwLI9UvPpZynPBzWkKK61xJZhhNKFgzsfw+A=;
 b=Q3qahoxoPJDJo1Dxl9kG3iFfjVdk4zffWuVjj2E5HVePhCmNMJBHlNeoPNMzW5T+0PvpKIL/th6g7r8j/6yVwgXvqMzt1kk7q0HAhX2k5wuB5Zk+uS0D7saxeo3dJwiec3vdLUH1daE3gS2pMYW004cTNHkRD8oks9gRd2smAWU=
Received: from CH2PR07CA0065.namprd07.prod.outlook.com (2603:10b6:610:5b::39)
 by PH0PR10MB7080.namprd10.prod.outlook.com (2603:10b6:510:28c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 22:03:36 +0000
Received: from CH2PEPF0000009B.namprd02.prod.outlook.com
 (2603:10b6:610:5b:cafe::91) by CH2PR07CA0065.outlook.office365.com
 (2603:10b6:610:5b::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Wed,
 11 Feb 2026 22:03:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH2PEPF0000009B.mail.protection.outlook.com (10.167.244.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Wed, 11 Feb 2026 22:03:34 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Feb
 2026 16:03:34 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Feb
 2026 16:03:34 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 11 Feb 2026 16:03:34 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61BM3Yx11945387;
	Wed, 11 Feb 2026 16:03:34 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vqIJ4-00000008Ivi-07Pf;
	Wed, 11 Feb 2026 16:03:34 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v2] ti-core-initramfs: Rework logic
Date: Wed, 11 Feb 2026 16:03:33 -0600
Message-ID: <20260211220333.1979383-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009B:EE_|PH0PR10MB7080:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fba5dab-5b61-4b0a-4cb2-08de69b966dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013|7142099003;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?i47SGNFsWQBULcPY+JrLjSP8x5vDxTStk85cDwFMPbidvLcwftvtzP4rZLo6?=
 =?us-ascii?Q?omJx1+petq0n4jjsO15UjrSXCZ1dLsG2h1imIF+C89pTJgJ+/QelfaHVjWI7?=
 =?us-ascii?Q?X55ipQDjB+nB1r8le8v9c4t9K2+X7vE6Dk9f0ZbixoshcEhlyAzVQbslJHPc?=
 =?us-ascii?Q?EKdL0M95SeW+Rr17A7Gp0mDp5wSbXpd5Wn8N4IaxFHL8cR93L8sPsm3NFopp?=
 =?us-ascii?Q?X2s3K173JhscU55hMC4yOH32MUYBRV+KXJlN9xHaEf0vZY5db6cZm9/F+K0E?=
 =?us-ascii?Q?DvtKvLGyUuNGnX4PizPr6RP0sg5QZeHQJAy4KXcSMSRloF/LIFLFlsxCNgM/?=
 =?us-ascii?Q?YtRX8i4qH55T7tXTkGf5MkGgoiXkkW5QuZhXmv8K7+1UWj9e6GKg+LpoeaBP?=
 =?us-ascii?Q?oRAnPzEUDhZVYFu/o1lkci/AvwzAcplbmSVci0PdjksDqnIM6QjWuix/GC6p?=
 =?us-ascii?Q?IRcaMkYof3jthb2dYXKJg5Xz9hMlZbANJI5/yCuFitnX8PiMEmF9gh8LC40C?=
 =?us-ascii?Q?ys9Ow7Eqsa/sbU6qRlfXHcgzGLk2TOcoWtAEHKHZMGkgckRJiKIRj3Lo2atL?=
 =?us-ascii?Q?kO0oygLLyV1eWbD2TCAqTrpCDwT0GWlxy1Oy63K5YXYciQ0azXkuII4/Xunc?=
 =?us-ascii?Q?Uu9taLo1D3MhehLgvYAjeZxAkCaO74q+QXfN/UEnj6qC6xFf2MYVCkVeUjXi?=
 =?us-ascii?Q?OhIK0Sddn4cFl0jS4ddFJtmncXypSKjwhQycONSOMwFcfRKvMuOp1zARIno/?=
 =?us-ascii?Q?d8to/Xo7MQeeBxMM6VAz3fVR6QXZPsCMnm+6ARjX0OaY7VXDMvLgYmGXJzev?=
 =?us-ascii?Q?EywJBJ+7Tt+dp9xSDuatYPeBAWbV2gZzl9jOPt6QxvvTiqEaxt0Cm7aXQ74o?=
 =?us-ascii?Q?JfrAZWrEaouMSqOR1a8SkScX+4aTM/dVS8qOkSWkF4PiCu7Dk1oe3G21ksLO?=
 =?us-ascii?Q?bdjeN5rZuLxpIuBnEheJhlEYtj2GJdX0binVLAFejI/gOaFDXW7UNpzQOE3m?=
 =?us-ascii?Q?xjVZ2jQu568ZQpxT8CaphkywLu+dapGnNt+zw4FLoO0Vf5PR0EoLaUjqnV5b?=
 =?us-ascii?Q?lGZk5D34mxsHIpViaTVEulLBQbE27YylKdZa8vuy80naLfPIHKD6nGP6F+x0?=
 =?us-ascii?Q?WHud5MWXnRyt9orXnwFNbbNwkD8uWO8+2z+vbzPqgihMgQG3K6W/fxOnTqBa?=
 =?us-ascii?Q?tsO9Z5isZsIaKQ68kWFNr0ITsnBFs5J79RtoBtGcMN3N6B8S1w8Rr2A/LaWP?=
 =?us-ascii?Q?ZdNIkcQadKqWO7fFK/fW3/cb5y2UygF8tx6doR9a3/eey0hSO/yhJ1lzzwsP?=
 =?us-ascii?Q?VXTe+TtZ1mirx0fwPsCAHSl7G6uPkMceAJsKlJrIEtgJKBiV+FXTFZK8N1Bh?=
 =?us-ascii?Q?TaX2RpwUO/nasxMpyktFBrE8vpvpVwVfDUrHSt67bR4EXwWBBaBhWD0zYFnm?=
 =?us-ascii?Q?PQaud7/+5QqNKpdXiQV8snCoJYSl+//7kEQhszq6ZClDqDOf1y4EvBeTq0wj?=
 =?us-ascii?Q?SueXth7o4i92O6BYkJZRe0chDXFoIRfoS2drl4xbJAVmm4XmbF13XdTdjzwY?=
 =?us-ascii?Q?bjPay8TCVVi3NYRxYTDjWjz2uJNgFgCS8nNv7jLtjb+HWaDkwRFaF5iLi7hJ?=
 =?us-ascii?Q?9W0VBdZFveyTsGZDCICt2xrd5z7VghAW5AHf/vprNHLpx5VbYOIkFlypajv1?=
 =?us-ascii?Q?q5B7Wg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	au5GYT2HQS1sqbpjHL2O5JJZeljmj8bC4pi+MCPeUysuCaMYSBTYl00wdQYrdnNaYuvIsrFZQiSQw3Ag1niHyhg77+29g05RIbfVIQYeipQ82kGEW23e1Cef4r60CS6kyCXHSLw9oQoqgGDNXuJxizOd9Adzl/7hWohekDcX8Zx8s4GXGIxC7Eao5zq7GhPGV2eLG9rjJ5wGkOmrY9C51RUqqANk8ZCQ/kR9dX1SMHJirNnRWpP2VoyNnXjOitesmGQJtaRGX/6PWjiotLwogcNg+HnuWe0OZ7o/VLEj2jE4DS2uMxVT1n00PSSjd2xTqd3XjO1bWv2fdpONN5V863UnCwgC6XmB3SZtLj8e1MMc0/ZsApovJAGebyzVzejGtJtJcagsrGimJTpPyUayfwiVPGrzi6SyQBPAhtMXcy5MWCzLDV+xocGGV5/QNqIY
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 22:03:34.7839
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fba5dab-5b61-4b0a-4cb2-08de69b966dc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF0000009B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7080
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 11 Feb 2026 22:03:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19490

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
v2: Fix default value for TI_CORE_INITRAMFS_ENABLED.

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
index 00000000..5fe78202
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
+TI_CORE_INITRAMFS_ENABLED ?=3D "1"
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


