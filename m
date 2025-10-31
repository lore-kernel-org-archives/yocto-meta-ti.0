Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D97ECCFA00
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 08:21:46 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.19])
 by mx.groups.io with SMTP id smtpd.web10.10613.1761898897714237242
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 31 Oct 2025 01:21:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=EOOwjrC9;
 spf=pass (domain: list.ti.com, ip: 40.93.194.19, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dh2pa+Ur1s3dv2U7eBjKQAj9QDUkkinedK5Q5P66hNw5FzE/fyQKGxP5KXstcQ7PbVIdRBwKbbrKGpbtGE5Dv9SpD69Lx+nJ0A9eI84ED5cBBM9o1dU8JNPNKb7x+msXbPOh20qey4P5qk5iBn0RD/xPv48BiK+vjUFBu/K0onLBAtJgFjoBYs3Pf4a1/PTLXgfyhCrbEm6wPCZ+Cgg/SykINa6LzfkjYL022BuAR52ikz+73IIV870V7zlnHBwwY4LKogNdJ9FCbbBuZnN6/Y3yoqxH7aUgTujr88hyP4/PTJyAggNdE70wk8X4usaSi0zZmrXgwZwpNURW8EnAug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yNTmfKg8hqO0/R7zw3onO/0ZKbbCdV6OPDnzxKFsez0=;
 b=L0IIoehZT7JSOHk8+UkondWNJWT0XITnBvOuowpLOZeIqF3O+YtRU3edD8cJbqoRdufJYG93HUKAsAWBALNH5MzlvI+1N8JaCS8kVEF1Rbtn+uZZWDGzXr+6GMZjQIZP2g2fmGEviYDUL0njYWR/IhRtiLU51jpnM2GkVnqVVXEd5yME47JGBKuG/ZRvlQSVXCdpasvhtCJBKmoCvaNIeiJyk0ov2IlU3cJppqINv2Z3eaCD5ZfuKK2Aikm1GeJ07M8qsGvCedeMEodIeQgicYKKyQ5akwT6JpAxgUbyOKqYJciZFGFLQAROFe4JfAFtVZ8ucbCMkVmSZfOXrwb7Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yNTmfKg8hqO0/R7zw3onO/0ZKbbCdV6OPDnzxKFsez0=;
 b=EOOwjrC9Qgxln+9urKVef0S2r88l7EO06+USlGEJrwBqtM+o/j6MQNFvpR+wpT6jgeyIeBbu39btVlKRs4ykztiPZiOLpENbBiggpDUwqYOCuNf/tYT5Cg6WXomxOrQBB+yOJXANb6IUnxEkPR3RUWjh9GQWARB2k/UFGlP6LtAjI+DzgoBCN0wvw8R01JVZDu9MY47rxjmvuDAeUhzjaE8msYOrz4E4P+Z4A+p/Mh5nXtlFQzsGiPI6dq/IJrg/+MWBIiBKTjnF7frPS7PvwD3V21TSOyINcWH4tHAocLqd141We1orHOzPNT8KQk6wO5fyza4zHUHqkyTbrzqGOA==
Received: from DS7P222CA0025.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::31) by
 CO1PR10MB4577.namprd10.prod.outlook.com (2603:10b6:303:97::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.15; Fri, 31 Oct 2025 08:21:34 +0000
Received: from CY4PEPF0000E9D5.namprd05.prod.outlook.com
 (2603:10b6:8:2e:cafe::ea) by DS7P222CA0025.outlook.office365.com
 (2603:10b6:8:2e::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.14 via Frontend Transport; Fri,
 31 Oct 2025 08:21:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000E9D5.mail.protection.outlook.com (10.167.241.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Fri, 31 Oct 2025 08:21:34 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 31 Oct
 2025 03:21:30 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 31 Oct
 2025 03:21:30 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 31 Oct 2025 03:21:30 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59V8LUIm3324925;
	Fri, 31 Oct 2025 03:21:30 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 333222A61; Fri, 31 Oct 2025 03:21:30 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202510310100
Date: Fri, 31 Oct 2025 03:21:30 -0500
Message-ID: <20251031082130.3317930-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D5:EE_|CO1PR10MB4577:EE_
X-MS-Office365-Filtering-Correlation-Id: f604a630-877b-4dda-539e-08de185680d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|61400799027|376014|82310400026|34020700016|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?XODk94BB3RW4g14pg+d3kzRece0J+7V+kXC89O3n0J+l6wwLMBndDKqYwLrr?=
 =?us-ascii?Q?y0nkz6VMURxT+8OKOC2tQJQtF7hvDgYUS8sYh/3iHxPTf9rcXzzWbKwaugy8?=
 =?us-ascii?Q?yDorhEHA4Le4Kmqupf8WXKEWJdF/EvUDm24Plbx71RxatrC7AW11hVVVKhaF?=
 =?us-ascii?Q?01j/va3V6LsEBa6v5+wgN6dtlOCQC0XjJhwy4qx5Jyxjo3f2vjDPi9EMzbsz?=
 =?us-ascii?Q?xUNboISsdRX0mSo32lvVHrt+uuz2saPzxSLfic4YGWDRUsbUZuwzfLN+ZOrT?=
 =?us-ascii?Q?64IClTpkUEjctcQtDfwG35a2VjIcXTLM2Id2cfPheNLk85hzo67IjOF4wbgJ?=
 =?us-ascii?Q?opKbVhGKmen3G5cLPlS5seSN8I6FpX64DzBW+hPOyO4JqJi1sWt+FSC2PXoI?=
 =?us-ascii?Q?D9BWJaDQruKO6sPREBM6vhpDZJqfpbKp2DDyCQBG2PaWdmFQ0IER+CyL15ar?=
 =?us-ascii?Q?RhzRKa6Vw3eptL1WG2B5HhFQpRQ7XldbQMdHDLSh6jfShUt7/vzlni8CdEYq?=
 =?us-ascii?Q?7OpBqcgBE5Ndxl2uQh1WDNc3xAfxD9xpHBoWxde3mBjxIjoYvEMPVEY+2/xR?=
 =?us-ascii?Q?HS1j8zn5aD42gLlE/31BLao4gZggvX/KnYVq7p7DHVzC6RQxbMz5p1b5MG5o?=
 =?us-ascii?Q?D8A7Q+icaACeVOwiYAAqhlbd2S9QAUGOy3h7s/Va4t7JCdtOirVUAqmuEBFa?=
 =?us-ascii?Q?7HVs9z6JzoCehAi1Y655AQuq6CQ+Trc+xcR/plwH2JESR4Sv/W5qwp2crQqd?=
 =?us-ascii?Q?IaZsTnstCVLi3ntcGcCb1uOTI2M9LtrlERirJ1mohVlfQDD1l+bDUOsa0tu2?=
 =?us-ascii?Q?HYxBY+GXeLyHSFZfImJio+wjNZL/l+ovWkfGz9LRRdU+NLVlh1Ln0L4rsP2U?=
 =?us-ascii?Q?kfLQs02DDgMW6+jon/FHUMyoLOaD0OkrFVONXir4p2LFsh0WfVbTtrCmckc/?=
 =?us-ascii?Q?KC56ZD3mY+Jpel+u/ATpk06jqAa4erBxMw1kYO3cKolVqldFNM+kpTxg01Vz?=
 =?us-ascii?Q?K3sx07vbxBcANvinHK3zzYwnWRdSaUZxskaGBet23xBsKIMsqq0TTZ5p/2ms?=
 =?us-ascii?Q?ab4ciUrIUAPy1wMnkd9snGo8wfHD6x99+TpEikz+kCtQ7GiAsjipnfdbvcp9?=
 =?us-ascii?Q?dsfZ5LoQYMjDXKohMMvhQgY6mAAwij7rhRBEXKYsj/kwAa85EcZ1gW9ptgH2?=
 =?us-ascii?Q?xt11OIPu7I5HkrUrzrKyh9i1cDmGmiLCcI5MwkwQRqxUrddKeCr8sG/+2IGg?=
 =?us-ascii?Q?ftMAnQnpw1k2i3oxZ48w75+Wc/bMSZdI77cmozy/Lo1iv1C+EYDHv6qrRxQM?=
 =?us-ascii?Q?l3ckQz50kskd4Ud2MQglqgbSHY/wciXlYs1BsuaHiTMb6QnwDBwhe9rnKpg8?=
 =?us-ascii?Q?O/mMOhddoov7ZYP9bpPtBL8G2nBA4wtg1nynYkfM8BkSPZiT2wCBTOAtVG4O?=
 =?us-ascii?Q?HbA0yftxYgi/nOcXLF6toEi/sZb7LEb/50rkQVkY/ZkWCK2ltUcfP5xIyt/V?=
 =?us-ascii?Q?VY+yxDqrJVE7Gg0u2rVryBacHP7EE2oyvOSv/k+nzY7ieK9IQb0I8D6m8uq0?=
 =?us-ascii?Q?d3fgb+EPQMCrMgEnT44=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(82310400026)(34020700016)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 08:21:34.0155
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f604a630-877b-4dda-539e-08de185680d0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4577
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 31 Oct 2025 08:21:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19213

Updated the value(s) for:
  atf: SRCREV_tfa:am62lxx
  u-boot-ti-staging_2025.01: SRCREV_uboot
  k3conf: SRCREV
  linux-ti-staging-rt_6.12: SRCREV_ARM32
  linux-ti-staging_6.12: SRCREV

Changelogs:
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/lo=
g/?qt=3Drange&q=3D87519a151561393ce1244ba53401196b011b7a39..aa613c2e8329990=
6b121fcf0d6a5824f1d1c3ff9
  k3conf: https://git.ti.com/cgit/k3conf/k3conf/log/?qt=3Drange&q=3D4612157=
b45912dfc21ef49e364931c5ce3cb27a0..cba7dc13a39191ac18bf64fccbba429faff112b4
  linux-ti-staging-rt_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linu=
x-kernel/log/?qt=3Drange&q=3Df4bae38e160972f3dbfee640421bad168443cc0a..a55e=
fe5b7adbb88ee55b67f4f044c2882978d1b5
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-k=
ernel/log/?qt=3Drange&q=3D2edd47b56fbddaa47a5b85fe3440bb3516bca8ea..9b2678b=
e3a92ebdbf376000f06636eab8f7c1dd8

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc    | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb     | 2 +-
 meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb               | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb    | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb       | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-=
ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.i=
nc
index 526732b1..62f992bf 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -8,7 +8,7 @@ SRC_URI_TRUSTED_FIRMWARE_A =3D "git://git.trustedfirmware.o=
rg/TF-A/trusted-firmwar
 SRCBRANCH =3D "master"
=20
 LIC_FILES_CHKSUM:am62lxx =3D "file://docs/license.rst;md5=3D1118e32884721c=
0be33267bd7ae11130"
-SRCREV_tfa:am62lxx =3D "9be79f82555404fc89455fe10d7c1bafc182e833"
+SRCREV_tfa:am62lxx =3D "075e9d21ef52f85a5b455101b55997fd2efd3298"
 SRC_URI_TRUSTED_FIRMWARE_A:am62lxx =3D "git://github.com/TexasInstruments/=
arm-trusted-firmware.git;protocol=3Dhttps"
 SRCBRANCH:am62lxx =3D "ti-master"
=20
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/=
meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index 3eb7a168..17359591 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -6,4 +6,4 @@ PR =3D "r0"
=20
 BRANCH =3D "ti-u-boot-2025.01"
=20
-SRCREV_uboot =3D "87519a151561393ce1244ba53401196b011b7a39"
+SRCREV_uboot =3D "aa613c2e83299906b121fcf0d6a5824f1d1c3ff9"
diff --git a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb b/meta-ti-bs=
p/recipes-devtools/k3conf/k3conf_git.bb
index 1a0880d0..cfacaec6 100644
--- a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
+++ b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
@@ -10,6 +10,6 @@ PV =3D "0.3+git"
 COMPATIBLE_MACHINE =3D "k3"
=20
 BRANCH ?=3D "master"
-SRCREV =3D "4612157b45912dfc21ef49e364931c5ce3cb27a0"
+SRCREV =3D "cba7dc13a39191ac18bf64fccbba429faff112b4"
=20
 SRC_URI =3D "git://git.ti.com/git/k3conf/k3conf.git;protocol=3Dhttps;branc=
h=3D${BRANCH}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb b=
/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
index db9f9e6c..88c34431 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
@@ -10,7 +10,7 @@ BRANCH_ARM64 =3D "ti-linux-6.12.y"
 BRANCH =3D "${BRANCH_ARM64}"
=20
 BRANCH_ARM32 =3D "ti-rt-linux-6.12.y-arm32"
-SRCREV_ARM32 =3D "f4bae38e160972f3dbfee640421bad168443cc0a"
+SRCREV_ARM32 =3D "a55efe5b7adbb88ee55b67f4f044c2882978d1b5"
 PV_ARM32 =3D "6.12.49+git"
=20
 BRANCH:ti33x =3D "${BRANCH_ARM32}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/me=
ta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index d606c6c5..4cdcd36a 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -22,7 +22,7 @@ S =3D "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
=20
 BRANCH ?=3D "ti-linux-6.12.y"
=20
-SRCREV ?=3D "2edd47b56fbddaa47a5b85fe3440bb3516bca8ea"
+SRCREV ?=3D "9b2678be3a92ebdbf376000f06636eab8f7c1dd8"
 PV =3D "6.12.49+git"
=20
 KERNEL_REPRODUCIBILITY_PATCHES =3D " \
--=20
2.43.5


