Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A01CEEA850
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 21:02:27 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.62])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.55876.1770930136855708010
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 12 Feb 2026 13:02:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=AXvIYlyd;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.48.62, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CMX4urOmgIyRqSQfE1hWrh706QbidfzipMGg6a5dePsIBOq2XIpKh4rxo9a2i4a1nZ+r41IWgqv7NzqScFUsVtcpVS+828NptWvqLKWdujpOxc1jSGP48jjs/ILVLrK66y48Bgq78Jx+GNyCTLV4qrFbbxdT+qdjbh1h1o/fdMjdPX5lLI2uuCt0JFS0ZyLa5nPNi/fe0z/ESeL0iAeWMIJ2YFl822nyWitw+46JX7D4IqoK/PScTcz+DxIX8H9b3vzMhj1JCYZ78bKXuOv/mM8ZI4+qCM212SdiA54QyfIWKwguwNeKDz8GZnZn7Y0P81XqYSVsCkq1PonwszhPaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NEZ+snITLyQewrzihb2hyCj7dHSRm0KTgxfgPrWH7xc=;
 b=Bz3eTYsLYarci3yJksDw+9j6YWSgNfcpqB5lHskF5QAEL00A+1FC4L8F9+EURjf56eAbWHfFlg8oVE83tuTYffDzwMkmxwUZZWsZctPU4h3nY65uxso5ixp13FgEqPLfHzhxOctbSzGYlX7ec/gS67p7Urd3hm0y+4uDAX0fSOKRoDDyPmIimqNPck0zA35bWJ8YJMVqs/wj3+wNn3xlw/e6u6pRqBZeWstt7SVX6F1IBOVFiWRINB2MgtNdE1vnmQAybeVfKFFYBWM1d2E7RPBAmBcpELCgAxnZYGfMZb+LaIDdcsayJgWGeGClnxo+VlSw89s0vcL+zmbPHpynXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NEZ+snITLyQewrzihb2hyCj7dHSRm0KTgxfgPrWH7xc=;
 b=AXvIYlydLHK6IUkCVqgh2wOlpH2d3gl39PQHJ4iX7fWcFPqHinpj8leAXbCADN4n8l8QsPQakwCONDBtMhZz5GcW5uJJ335bJQXeKD9G2cOZE4JchsbSD2XShqEoYHbvELBS6wwn8IdMm/aDlp2P6IYr3kqFF4tl3q/zG+FGY4c=
Received: from BN9PR03CA0867.namprd03.prod.outlook.com (2603:10b6:408:13d::32)
 by CY8PR10MB6905.namprd10.prod.outlook.com (2603:10b6:930:84::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 21:02:15 +0000
Received: from MN1PEPF0000ECD4.namprd02.prod.outlook.com
 (2603:10b6:408:13d:cafe::f9) by BN9PR03CA0867.outlook.office365.com
 (2603:10b6:408:13d::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.10 via Frontend Transport; Thu,
 12 Feb 2026 21:02:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MN1PEPF0000ECD4.mail.protection.outlook.com (10.167.242.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Thu, 12 Feb 2026 21:02:14 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 15:02:12 -0600
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 15:02:11 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Feb 2026 15:02:11 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61CL2Baf3738513;
	Thu, 12 Feb 2026 15:02:11 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vqdpD-0000000Ac8g-2ska;
	Thu, 12 Feb 2026 15:02:11 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] optee: Update to 4.9.0 tag
Date: Thu, 12 Feb 2026 15:02:11 -0600
Message-ID: <20260212210211.2529878-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD4:EE_|CY8PR10MB6905:EE_
X-MS-Office365-Filtering-Correlation-Id: e921ce2f-b7c1-486d-825c-08de6a79ffd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?WMCHKJMmTBStcH8rwMY8pUzu4/+jFL6h3FZohT/BeZxCKJ7RWJ3Ji2X53k3I?=
 =?us-ascii?Q?IyG0Do8Mf7TF00LS+ltTBJDxgg6Mn8FYlXaDnvdBSuYWCL+U19muRg3SgHbg?=
 =?us-ascii?Q?E22TZFng72nMFpEr31r2hJTpkiaWkJCTSlal+9LUr1mxCs+v2V9xQGHxm4xI?=
 =?us-ascii?Q?CoCmAevKoUNfD8otIgFL6vXuK1Es190FRcYAbBBaZhwQIhhovgu0ObRueojQ?=
 =?us-ascii?Q?wZO8CJ2nCU6F2vasDcJTD7iDpnwiZRu3iJp5v8gsSWfRHznFHoVhg/Ll0G28?=
 =?us-ascii?Q?PVHD3OsCJdYK4mekBByLnC0haGDF2LZKCk+IIGMYV+TcP5FIhxWyaHG7JjT0?=
 =?us-ascii?Q?MoI/oV+JhrPmnNaUINv1fvFBTUAH0C2u80kK3QyGiGfIt4cHcdjj2n7LcfZQ?=
 =?us-ascii?Q?TmKp6WcEFD/BKATr6AIOzYUmlSyePHxT+MVHHKHj20zZLz0/chGzxBhZqZMz?=
 =?us-ascii?Q?oWMZYGnu6HW3/NoYxKMrVnIxwb0fZHHYau77jEvr8BLiHcK7wSJ8TBJyKF6r?=
 =?us-ascii?Q?2DONizBa5jklVPV3VL0zK4cNPX9cwlYsQp+wCrL0CGqKYl+tfeHbWPr/IjP9?=
 =?us-ascii?Q?4WAKqLpWnKZ0gGM5JZsytc7+q2QjswyInwaKQJuo/HFsHlGk22gHjZzjP38Y?=
 =?us-ascii?Q?RM9bCG5bncEmB2ejO5/8xoVcvGSs8pyXl29ycEFKUz1V+fN0WXlEj8tWtpZJ?=
 =?us-ascii?Q?s/dRvNDopHynp+rfodQhf0fhpFyZQCqgYBgZnfDBaRFwrGBcYgErK4tqqX1H?=
 =?us-ascii?Q?NLBB2Yp5PWmcV9/ERUqJQQwtqB9yXeJkMgVHmsEQGp6Ep2uyoyL9Tl6W73qP?=
 =?us-ascii?Q?gObY3tUlNYzOefA0An1MKPvJPRWSJ2us84hLtrVXMz7R7tkLl/mZwHInXaGx?=
 =?us-ascii?Q?ZeA8tnMcKE0kWb5GDIA4eP6R3oD5b5H+N4q/yC+UEPUHlL2yRy2NBRoM//A8?=
 =?us-ascii?Q?aHVLr9OmVIuW8pHDaC9tuDgvL+3pA4M7xbgJ8GWMgONtTOq63OVRHJBQjvVy?=
 =?us-ascii?Q?l5RTwy6LEzHP0BCFkCA9B4azoD2ctk9awvCXj1qLrdEhU58f2tFMnYnFaFc7?=
 =?us-ascii?Q?ISv6vIbmfepAFGXWBvzibzpG0OuaB15M8i/jdYyySccftNlD5sNUPwbwvvE8?=
 =?us-ascii?Q?zolhAPZLD5LSVMadjjeyedS1VMBfskCi1g6djkTObKxD/6ct75zaLuzdK0Ys?=
 =?us-ascii?Q?XdkBmy93f0Sb5RDCgEhTapO1kghbWb84UJowosjj9UmfPZyx1B3R3GQcyTHN?=
 =?us-ascii?Q?1uM3n/px3HSduN9sdoDrsI9BuBxQw2AG5tHihyGMQKEwlMo0SUS66fQGXYgN?=
 =?us-ascii?Q?uZqNBq/YUmx+J1/JOOzTnV5RYpoIVqomuKgJBhppsU0Tn9Wno8svDxJOenmv?=
 =?us-ascii?Q?SZCxxUh4PyzBaTUFjYtwtZwfdpOobWObCUPETfErSu5ntsH3cSoNDqwMQmXz?=
 =?us-ascii?Q?WUCOmRUEEg42940Ry5dPEDpNXbEcTd07VfsXTP/q+z6sbggNSoRvpbjmtrmz?=
 =?us-ascii?Q?gd81TGDVaKOM1DhbEu82i1SKIjgimFEbxJZmLENdXdQnyLkQSdG0s8jdAn+r?=
 =?us-ascii?Q?KFJ5RYwUgqBpM/4CM90nQbF2XzycVEdRLuI0bkwxFpYHjvzNdAhVYOspsNoc?=
 =?us-ascii?Q?FihCRiFDS07uZOzhyFwtymh8WgvS03wcNeeys5lkUb3J0k2MRHzU3GTGM6o7?=
 =?us-ascii?Q?umKPEg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	6DJWZBoLc1oc7vwtDvYUWyU9tBLxTS0CNoV62gHWjZMQmNIAirArhi/HA3TN7gS3dbULm8gRyQd1G/QsFNvGvI69BkcNNoIvXqy/6LMUGTBv9I+9TVHjIbsEJ/5qL5bi2NNvaCiNtXzZh4QUOK72no9qVk7QJxCb6O/WApFahVNjdC240kdWPzCFttYh4p7Aky8rq6DdDunjbM2v/2i9VdRKJbpqIqcfEcPk++Qwe67Yq7tJUtGsKiaMIlPQ+wbvzut1STfpBqbfho8ByhSBbrFWKewwTjC6RUObpubj7xPK3G9peWvenQcucncqnATvbSPz7rqZYS3LDeFM7R25gwLBDwnZI+MoBZ8VxXN7KvB5Eq8bv2l8p7KmPCiKQfS7S3IT6nUMvI7qFs3fEW8+kgEowmIjq8HY4nbnfYWLlsSbMGdd9cgbcdaW2XxIRiCq
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 21:02:14.7422
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e921ce2f-b7c1-486d-825c-08de6a79ffd0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000ECD4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6905
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 12 Feb 2026 21:02:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19505

From: Manorit Chawdhry <m-chawdhry@ti.com>

Update optee_os, optee_client, optee_examples and optee_test to the
newer 4.9.0 tag.

Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../optee/optee-client-ti-version.inc                 |  8 ++------
 .../optee/optee-examples-ti-version.inc               |  4 ++--
 .../recipes-security/optee/optee-ftpm-ti-version.inc  |  4 ++--
 .../recipes-security/optee/optee-os-ti-version.inc    | 11 ++---------
 .../recipes-security/optee/optee-test-ti-version.inc  |  5 ++---
 5 files changed, 10 insertions(+), 22 deletions(-)

diff --git a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc=
 b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
index ec10cefe..68b6b262 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
@@ -1,6 +1,2 @@
-PV =3D "4.7.0+git"
-SRCREV =3D "23c112a6f05cc5e39bd4aaf52ad515cad532237d"
-
-SRC_URI:remove =3D " \
-    file://0001-tee-supplicant-add-udev-rule-and-systemd-service-fil.patch=
 \
-"
+PV =3D "4.9.0+git"
+SRCREV =3D "9f5e90918093c1d1cd264d8149081b64ab7ba672"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.i=
nc b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
index 91dd5e60..6ec2a83d 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
@@ -1,2 +1,2 @@
-PV =3D "4.7.0+git"
-SRCREV =3D "14321a0607db16099d158478b21a2b2e37b3a935"
+PV =3D "4.9.0+git"
+SRCREV =3D "934c7edb74a26e90f68024cf441073528444177f"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc b=
/meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc
index edc9d68e..350eb9c9 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc
@@ -1,3 +1,3 @@
-PV =3D "4.7.0+git"
+PV =3D "4.9.0+git"
 OPTEE_TA_GIT_TAG =3D "${@'branch=3Dmaster' if d.getVar('PV') =3D=3D 'git' =
or d.getVar('PV').endswith('+git') else 'tag=3D%s;nobranch=3D1' % d.getVar(=
'PV')}"
-SRCREV_optee-ta =3D "ce33372ab772e879826361a1ca91126260bd9be1"
+SRCREV_optee-ta =3D "a09269b15de635e1816fe832e26adfbfb44c5455"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc b/m=
eta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
index 9b1db77b..8f75db04 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
@@ -1,9 +1,2 @@
-PV =3D "4.7.0+git"
-SRCREV =3D "a9690ae39995af36a31b7a4f446f27ea0787e3a4"
-
-SRC_URI:remove =3D " \
-    file://0001-mk-compile.mk-remove-absolute-build-time-paths.patch \
-    file://0001-compile.mk-use-CFLAGS-from-environment.patch \
-    file://0002-link.mk-use-CFLAGS-with-version.o.patch \
-    file://0003-link.mk-generate-version.o-in-link-out-dir.patch \
-"
+PV =3D "4.9.0+git"
+SRCREV =3D "c2b0684fcd89929976a8726e6e3af922b48dd2c7"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc b=
/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
index 2d8fd8b2..15b43063 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
@@ -1,5 +1,4 @@
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/optee-test:"
=20
-PV =3D "4.7.0+git"
-SRCREV =3D "a15be9eca1b7e935917d834284726027dffc8cfb"
-
+PV =3D "4.9.0+git"
+SRCREV =3D "b27648ea8472cceceb8dda368a965c709066f7aa"
--=20
2.43.0


