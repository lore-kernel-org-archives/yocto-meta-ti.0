Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97FDAEF48F6
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 09:05:41 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.34])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.67791.1770973539646040968
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 13 Feb 2026 01:05:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=iYa5uc+v;
 spf=pass (domain: list.ti.com, ip: 40.107.201.34, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xLmqhS0BNl0kHJFGs6QuP20k6ygAsA49sqj9qFQZUunmSJ+bvXr8FZQFKnEdHsQDKmqqb3Ip9DSCcd4lx2mXVqw5i11oOn42AnurkiaQBguv7HmyXPQuy6tVcaBB2J9Z3Xs+5X6Zp5F8DclNoBhU/TfF5cYkvTykO8/HQxydTqeXstEztvGYdY0SzozpXRW8/FohD0GcsAzRp6tAERQk5DX/NpsOluFEYvl5sWWMPpOn6c/9blkIbH0si+tDWk2H0kNkr4KiTjnGCJ7maFlbgaF5Cw/eHM6dNsIjJIm6RSj1dyttcaB2pXOhQaqVIREWBOjUGlAbRrU+2ZIj+dY7Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3gvgXNzIlORy9yFH1dhDweLVpZplewfOajwsB8vjSxw=;
 b=oZ2N21T3ZdKsnmSKjot5rd9LfCqtIppT7fqTbEZb8FrbYmkuN3p1t3/NJLHi12qs65tnj+aMTWmBMjMF91WPH4Jqiqxfnql/SBvkHwlkhv3lY1EVztfkvifAXVhLJGfPhMQVq0Vf0Yxmof9wF8BHGXTAKPYi91hM6eOTN1YWxDrLAtx6do8IkaphIfyZYZqcMn3464qLgGCzHQPTl0wW+Co6dD+1Pzi2sHYrOGPvRryWdF7Pv1o+ZGHsJfxBd+oAMk1P8xzZed1g/805BqVsYv2ufif3tv7Jx4Hct57OO4obEF8rT+OxkOwxIhc1uTsxCqjseI8rD9yXVJ1A1SXXAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3gvgXNzIlORy9yFH1dhDweLVpZplewfOajwsB8vjSxw=;
 b=iYa5uc+vBP8qMPdxxDJqtTCY4MAwZuwwZMT1P6/Gbuozaw/LLeCAs8RZ69wk4/8jUhrrMtJlRESxM70EbW02MRwEZhUotfpjeSDLAYEqv/YT8z9EU6epRm84I5pdfFlitwbzCOzD0wW0AfdEXDHFe6Z9TqQlm4HH/rNlxdnr0uZf3R2jjPuwuBtoFNgrQCabej/dQt8Ae7gTenZYhqYqhd3fNa5UtKTUYVXPI9aDM6ayUzP4YqfE975m0bgXgf24L1BmZB2rBJ3fc5T9zOCibX4bqiXRsWEpUlch9RJQD+taHdXdzG4mNyRomSkXqJsIbyGYS6y4DLzNOUjKYvJr+Q==
Received: from BY3PR04CA0004.namprd04.prod.outlook.com (2603:10b6:a03:217::9)
 by MW4PR10MB6463.namprd10.prod.outlook.com (2603:10b6:303:220::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Fri, 13 Feb
 2026 09:05:37 +0000
Received: from CO1PEPF000044F3.namprd05.prod.outlook.com
 (2603:10b6:a03:217:cafe::d0) by BY3PR04CA0004.outlook.office365.com
 (2603:10b6:a03:217::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.13 via Frontend Transport; Fri,
 13 Feb 2026 09:05:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF000044F3.mail.protection.outlook.com (10.167.241.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Fri, 13 Feb 2026 09:05:35 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Feb
 2026 03:05:35 -0600
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Feb
 2026 03:05:35 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 13 Feb 2026 03:05:35 -0600
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61D95ZS5781055;
	Fri, 13 Feb 2026 03:05:35 -0600
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 49A962A61; Fri, 13 Feb 2026 03:05:35 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202602130100
Date: Fri, 13 Feb 2026 03:05:35 -0600
Message-ID: <20260213090535.1798480-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F3:EE_|MW4PR10MB6463:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bf1acac-a684-4990-8ec8-08de6adf0cf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?WGPkA1nd0uSS7V8MTWoj34qor73oRF6kBx4XEHkSGUp6PBVoD/e9FRAO5J/k?=
 =?us-ascii?Q?V+C4wXMUEL6SkQaMRMJ6hPawOkhRsRlpSrE6vDBJvIyB9lEc5JQ3ZOVjakmT?=
 =?us-ascii?Q?ZwxsozyQq2lj18uFhb9sjZYlgEsYgQkK9chwljPCvL5bYDy0XLhyNmMQnY/I?=
 =?us-ascii?Q?qf1avRuOHS/itSJHbmt2gToyHESktaiRjC5Li+xuup/5StlM3+i0xDeOXKrX?=
 =?us-ascii?Q?Ni4YKtjzuuuDgQcRiS5+SDapu5XN7tBHykzneYdAdv1h9k2POQL6+An/ES3M?=
 =?us-ascii?Q?fAH1dQX0uYKea6amnfFXen7IF/Tvi33p8e0+LvLlgolRa+vOjTAPn3bAiio6?=
 =?us-ascii?Q?D6d500ajA+AAiHvCG7R0kGvBoAkAnsj28JXazXzdq0Klo+EV41DH4Xjh0b+D?=
 =?us-ascii?Q?MLyFOciRgfhPwpofSR65EQ8hFwHAd6azPWFDwBWAeeYJ+koqxaUJxppK6pDs?=
 =?us-ascii?Q?esK6TofD+/FKbmQ9Zbpf6k5CO2yqI9MojoQq7lV9NEyVm885CCB1FuNUaMuN?=
 =?us-ascii?Q?xRq9AIudRlz2Mpd0htAbvh8M4EOCZfr7cb1KFDis/rSGQFvN+EOc0wGHRdVu?=
 =?us-ascii?Q?hVHYmpsNZeS9J+nx9Gip8JcCoOdMhyGNjeRmU5gEBf1OFWsk0sSUjGE3YSog?=
 =?us-ascii?Q?gl2cICXJj1BeZtzE1hRl8fIZi1rDxVM/LXgJZ82kh3rDu6K0XqIq8CXLNXBz?=
 =?us-ascii?Q?JCZ6YEalePLLAOm+SsBfc/4cRTR5kM4RpAlOzgV95zkPb0XOxTChYDO82UXx?=
 =?us-ascii?Q?KRvj4ZrHLUHZWlckQDwjetSBjNR5DNZdcu26Rcw+mnARAxxRY6W8VXa98IJ0?=
 =?us-ascii?Q?S1V81vzf3xkDKkigijPgm7qirgE6sQgY3PHsN0jId3sPURUSMSUtoNYBaUba?=
 =?us-ascii?Q?Q6q5V8opQ/AYsb3Y1s46Ni5xeAEMlbsvQdl4sznrYYeo/72G2CuVEsFnBIbp?=
 =?us-ascii?Q?++jciQh+Xy2owtla4b8v6FZKznFDjpoUZTwuKnmhykTqmd+21/ZRKPDy/SwI?=
 =?us-ascii?Q?1oWHY4aXn7l+U0vQehAKVwYVw7+9u2ju0tnPy2Sx5ucgbiqqdeLdNoDaEx/Q?=
 =?us-ascii?Q?bdNI2pL+eMm/T2B7B2ncH1L6XCrOjtqLS2NQ/cOweJYwaAQLB7+NVtJ9PVM0?=
 =?us-ascii?Q?lYRVPx+KsyesMeC2n9UDamcnL5ugGbx4ciCRIqzeD5YdejW+4Emylujm8Nwr?=
 =?us-ascii?Q?Txyyuvrh3iLfLri1PCYC1XxIaWiEJiF3PbsXy9Q6cNZ5vepAkOmOyVJK41/E?=
 =?us-ascii?Q?KznxBGa5A4XUYYJ7iyppyLXqENpR8lf7FMfmWTMhAqM5/a9ZmuQgiJdGt/H+?=
 =?us-ascii?Q?ju2BY8aI8ZBjxRH1KliKDLeYoSsPQpgArAGyT1LXEfFleFYn+GR7CGGOZs57?=
 =?us-ascii?Q?vvCiqRwLAKHiaHn71bz0un2LlFffgyzxe56+dH8zF/u16d82Pn/p9Gz8mPeZ?=
 =?us-ascii?Q?sV+d1bCoXipcPSOG0A+D5oI3RoEy5qvzjGpZ62GDQXVp6eAhfWnV2MTC5hVO?=
 =?us-ascii?Q?BtETfco/q7mu+FjZH7s9WcJA4S8XxUd4we9w7cFB2R4MnlQbhc1B6SPx0Bt5?=
 =?us-ascii?Q?nP/GjJhq8Oed5z8jDf7zyIhXGzxT93DJPRz5IYzkIigpS8mhs2Ks2sP/4z/S?=
 =?us-ascii?Q?37FzZ/HNyfKu3uapfetsdficXafZ2duwPf8Lev2znXYwxnrV51t8SOhiy9h5?=
 =?us-ascii?Q?HjTYbw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	AR71iIxhZHk4WSiACjeJCo69JyWZWexYAWIhIMlXcWuGY0Kj4sJM7S/PUDzVHwtnmQPO56IjU7BimaUU1zZN6QeacDsxMf6afk0kEyveKjH0pYd2Q1TF7oActFEyEJKdWGZyi7hlW+CLKLyX53mdelT2fJaMpqhek3IApbPqBgMoYVGkRqcKBspknldKi2Nx0YebJE8dPHklFi4GsbCzT1+8Vwc7G3qWEGPVJaAF9nm99nF3JXLsMTmE+qHxa9ihe4GQRpCZgu2sGrD9I7sgVSatvsC2y1ywxQesHzUjETS090IcawQgZmwd43kdhZwzdmBXxjJr+R/9UDb075vXN6j0cYthDGPQxAElKKLxPOfGgDgMdTpiHNSFgQn7de8n8qh7WbD8gheFIiInc/jas43xH/usswAe3ewn0W21BZ48m4HNszoLIo53u13P+EGG
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 09:05:35.9138
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bf1acac-a684-4990-8ec8-08de6adf0cf0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000044F3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6463
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 13 Feb 2026 09:05:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19510

Updated the value(s) for:
  atf: SRCREV_tfa:am62lxx
  k3conf: SRCREV

Changelogs:
  k3conf: https://git.ti.com/cgit/k3conf/k3conf/log/?qt=3Drange&q=3D4e3a44c=
4b961831f2de80606942dd0d8eb508eca..c50875c7c4ad112d5e632bea3301e06a0aa8669f

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc    | 2 +-
 meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb               | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-=
ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.i=
nc
index 804a3981..99ae0750 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -10,7 +10,7 @@ SRC_URI_TRUSTED_FIRMWARE_A =3D "git://git.trustedfirmware=
.org/TF-A/trusted-firmwar
 SRCBRANCH =3D "master"
=20
 LIC_FILES_CHKSUM:am62lxx =3D "file://docs/license.rst;md5=3D1118e32884721c=
0be33267bd7ae11130"
-SRCREV_tfa:am62lxx =3D "d071d093b94852473ae6ae26336f125e107a964f"
+SRCREV_tfa:am62lxx =3D "946454003b9f7e3c8e6d2284e00e0c07d5f56290"
 SRC_URI_TRUSTED_FIRMWARE_A:am62lxx =3D "git://github.com/TexasInstruments/=
arm-trusted-firmware.git;protocol=3Dhttps"
 SRCBRANCH:am62lxx =3D "ti-master"
=20
diff --git a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb b/meta-ti-bs=
p/recipes-devtools/k3conf/k3conf_git.bb
index 95974a17..3e3205ba 100644
--- a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
+++ b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
@@ -10,6 +10,6 @@ PV =3D "0.3+git"
 COMPATIBLE_MACHINE =3D "k3"
=20
 BRANCH ?=3D "master"
-SRCREV =3D "4e3a44c4b961831f2de80606942dd0d8eb508eca"
+SRCREV =3D "c50875c7c4ad112d5e632bea3301e06a0aa8669f"
=20
 SRC_URI =3D "git://git.ti.com/git/k3conf/k3conf.git;protocol=3Dhttps;branc=
h=3D${BRANCH}"
--=20
2.43.5


