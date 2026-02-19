Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C466FC531C9
	for <webhook@archiver.kernel.org>; Thu, 19 Feb 2026 19:52:06 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22666.1771530721604011233
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Feb 2026 11:52:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=KOi6k3jo;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.85.31, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MlL+1G58gXgAji33LiUZRfC37g4gESYpiAPPrXDWqgTWzvN1H868wSfqL8hUKpqd1tjPkZIvjHpR5kiS4A4y+j/77r+BYxbBvq4j/qpDFayLK+vIRzpBjFTXRG9ou+PO/MYxgTsUthYbVLgVhBjSFgmypAxq59VX9ALiITu3bqJ2V9igx16Te4+5Enkd+A0ydmJ4w+PjcWu5FuXUw7YtdthWs9YD+iDeoYXEgkmCrDn9zog7k6H6+wBE2OZ14Qmd+9ui+Uzd+jvFm6j4FXAUV70fTJjvLRYcgPTzUzMih2cq0F3GnRk5xVEIOFh+BzO/QVJMslQvg658913mrbfT1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iddb1rzoqA9FBVQK0eUqNABA4reqbbInP1WnWWAlgY0=;
 b=eYgsLUZLMeQkEoiRmVrrF+E34T9p//2pE2zigBkRQCK7k98ZQ4h9neNhspE3VJgtrc3GTERtXXCKT8hKAyfeWo3VB+sPAiBgBzlUgodiXRKzHnn6R/E9vWSiHZYAuAyLtfq37pecTVNpYPqk2tHKrWgnRblVT68NH0Wc34HkkCiFrkQgdhMCxCMQg5tpKxJ+uYe7slYcesEhly3H0ocbiF+5mol1MBu7tsui3W1+YcwXESKpnl83xJAkL4kEnyGjGRs+Q/C8FedC/tWuHuzB3Mgkg2wkrb5kiB7dfkY32uLUkcWBAQrwSaFhkshzcANjmlS39S70R3YwMt82RzURng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iddb1rzoqA9FBVQK0eUqNABA4reqbbInP1WnWWAlgY0=;
 b=KOi6k3jogmO3Mp/Emz+x9BD7mbCsPSV7JvGzneieQUmAMWVqql5vTq2SQKrne/fVOGNZAAxQGl7tWCvmo/c4eGurWHyKXAhCM8IBkaaO82g2iYS2vnadnfB4ot/93GIBOrjQ5rs3JhTrWOAVB+Di3v+bmS1meZOtT0EaoQNGOyg=
Received: from BL1PR13CA0203.namprd13.prod.outlook.com (2603:10b6:208:2be::28)
 by IA4PR10MB8256.namprd10.prod.outlook.com (2603:10b6:208:56c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 19 Feb
 2026 19:51:59 +0000
Received: from BL02EPF0001A0FB.namprd03.prod.outlook.com
 (2603:10b6:208:2be:cafe::f0) by BL1PR13CA0203.outlook.office365.com
 (2603:10b6:208:2be::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.16 via Frontend Transport; Thu,
 19 Feb 2026 19:51:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF0001A0FB.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 19 Feb 2026 19:51:59 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Feb
 2026 13:51:58 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Feb
 2026 13:51:58 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 19 Feb 2026 13:51:58 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61JJpwka3120057;
	Thu, 19 Feb 2026 13:51:58 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vtA46-0000000HI6t-2p9b;
	Thu, 19 Feb 2026 13:51:58 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] trusted-firmware-a: Updates for am62l
Date: Thu, 19 Feb 2026 13:51:58 -0600
Message-ID: <20260219195158.4121184-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FB:EE_|IA4PR10MB8256:EE_
X-MS-Office365-Filtering-Correlation-Id: e220fdc2-e51d-4b45-02f6-08de6ff05831
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?cSsOxeQcWrQDlUd6ZxAl6pbB8Y2aFowYuqIhUP9bvwrBXRTQLUKvYDliygwT?=
 =?us-ascii?Q?59iHTbOwSJC8nnpeEGuQImFCKAOlO2Zwafegd1Ct9rUrA3pizKV0RoipWJ5f?=
 =?us-ascii?Q?9tDYwAsWGYSsFsop1YWClFn5vmAXz0uOoxHgg848CPwvE8m9IOoGaT3GLYlV?=
 =?us-ascii?Q?GVI6sDOEtKjXM/TU7P/kucOZdbizVUa9BjFbN9BwNP0Db9fALcoFZBqop3zt?=
 =?us-ascii?Q?NKTcIVwrvJmE+IO9nZO9PmhMMB2F1tPdK4+eriL2tA/1PrTbn7ZKqD+qqJ+6?=
 =?us-ascii?Q?0sYz15O5V4mnHLmGC9MRSI+8po81nOxJU2T4FKyo1ro53XOkZa8F12vcBHgq?=
 =?us-ascii?Q?sHZAWHPkzjnu/hjD2gwtomkMkoY9qX0o+8blq/LxtMQe9YRs84XOFjNAXWbl?=
 =?us-ascii?Q?AgD2AN5OuDF8YOHAF+HYEUcOLZrZ9wVsPiZCKq9AXTOd9Wd2Cggo1peJ+vfV?=
 =?us-ascii?Q?UgLY6Fq4XgyzKFOYQjbyDxIQu4R7E516+cyX5iWdgkxU4GQ8S9Bcbf6un03t?=
 =?us-ascii?Q?ViD4m2atobvm7Gwb0NxAncmymZvG4ameYR9OaSO9f7PVye5JlxRj5eoGf0dO?=
 =?us-ascii?Q?JwBM2SPz2DLRDB3KJUqqcmJqrN+N5Ypf18q9scmupDjAldMUVynO8a2/fWWy?=
 =?us-ascii?Q?zsadSbT/4ALqrYH9vXkilZcDJQ64AazG+pgBwWRF+n6pKHZxnCdt+Y4QWcju?=
 =?us-ascii?Q?N+SKJ0KPI/x4r70yn0zaFPhGQsLwWE74tzs5Ps8o+Ho7h+aXhVDXE0ADEMBv?=
 =?us-ascii?Q?tHH3LEO8HpHHdK9s7XXOMXKUELnLlN7gBP4c2umga4NpQIlABW4BkSTAUeMi?=
 =?us-ascii?Q?nrLdjj3KIBs2MluSQfznWHWyB33dA1vEtqzAYpPZgYU/SpdAW2mcQfA1MFpS?=
 =?us-ascii?Q?1XymubHA6dDoOhIDlwxsKabBvhQM8OceukI404abEPY5s0SaDuYQ3HQT0K/+?=
 =?us-ascii?Q?w9DLJSRme4gsWO9+nKTfnWvbTq7t1v+B+CF+NnqGk6xZZFZTUblTaEeNf9qO?=
 =?us-ascii?Q?cFSF/JKC90OpLBABSg6XarYTrYcYral98DZ9LuAwPAKapgUd2NffyiUyeZWG?=
 =?us-ascii?Q?doeJsj0gB0luPo2N/I+vV5nnH2HLDKPxHB2mMVqtu8ui+XGa7bynXBA5Nw6L?=
 =?us-ascii?Q?4TDwLg0zJ4oXnPeUc4VXBsyGEw/QcCWcNL5yMTVs5XHK/gMh8wg2/9IlIzG4?=
 =?us-ascii?Q?HWuRmhPteSfq9yC7BkqjjS8bc6O+PHYVxN62w3z1ix6UzOKSDapBYY59sXJF?=
 =?us-ascii?Q?TtcWWRz9F4o1MGIhFJZk/U7qoY1rYJc6hGUqT3dOwd85Qko18HAfhg6x/0D4?=
 =?us-ascii?Q?oFMAwYtBdlKGy54iWDcFeKIYyR3IOGuq9qGnnvftPuUNIbnhSE7UU3mqxHmF?=
 =?us-ascii?Q?FQaZRVGk7eSpaHyVTRdZTU1jK2CorH2PLoLiAKrK2QCumMxKiUKDXr7MJRwx?=
 =?us-ascii?Q?GG/TPTH+m318dA8y1cOL3dKNgfnyRGUhqyAx+zu9dYvYKOx8ihzyCv0G41hH?=
 =?us-ascii?Q?NU+1dnxBAtDYl71VDOVHYwyMb9OVdB4jI1facm6pV2q51UbbxPb8VCA4gqyH?=
 =?us-ascii?Q?9EYJnQy1bU7ysugkR53HXm54ohDLgOk2IU5xJonOS7lABW8tz68vaLsnogqv?=
 =?us-ascii?Q?9/9DxEKNKaRtmzgt8aKQNkMIkPD6VNurf+Co/22HP5spQB5QmOis5+FhYmVP?=
 =?us-ascii?Q?YIX6Mg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	0RFh9DMst/5j39KUC8t/NLzQwulzTiMyQ3zUKfu5auxl+pbMtvW6U71t7IPDP6ycVzw9zWxNScDGYCpGm5IZdXliO1tBjSA/L31k3uWu6Vu0PYfGSvPlFR2jxAPdF830GnvQt9fxx3jtuzMwyMovX/WVY/hYJ1H/xCNjR5MKCmt52Nq5bkyi7/fet5PtGWeSwHFGrPvi6NdGrDWDLUpiKKuGAymY9gkg+2aZkTUlyprJkWHeReIbU62g4Ied+RsoAytYS0XlCggnAKzoq/7Zqj4a0If0Jvfca1jgHUPr1Q6SfesMJt9yy4qe7hEcSIYepshU2ROzY974ZTF3Nsk/TouQBUZkBelz6bHV5gcEjpD/F8R1ctypj/hNGw4NPAckXbhSmbUArQNxnzow1zq3naP1RPW5GotCubgZnHY2mpOzCSRjHv56binMyF/3k2/z
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 19:51:59.4373
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e220fdc2-e51d-4b45-02f6-08de6ff05831
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A0FB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8256
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Feb 2026 19:52:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19551

Change the branch for am62l to ti-tfa-2.14y and change the TFA_PLATFORM
for am62l.

License-Udpate: am62l branch is now in line with master, so the md5sum
changed to match.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/include/am62lxx.inc                | 3 ++-
 .../trusted-firmware-a/trusted-firmware-a-ti.inc            | 6 +++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/am62lxx.inc b/meta-ti-bsp/con=
f/machine/include/am62lxx.inc
index b4f0b8c9..12c8d6ea 100644
--- a/meta-ti-bsp/conf/machine/include/am62lxx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62lxx.inc
@@ -3,7 +3,8 @@ SOC_FAMILY:append =3D ":am62lxx"
=20
 MACHINE_FEATURES +=3D "screen"
=20
-TFA_BOARD =3D "am62l"
+TFA_BOARD =3D "am62lx"
 TFA_K3_SYSTEM_SUSPEND =3D "1"
+TFA_PLATFORM =3D "k3low"
=20
 OPTEEMACHINE =3D "k3-am62lx"
diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-=
ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.i=
nc
index c1e415b4..ca5fbd94 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -9,10 +9,10 @@ SRCREV_tfa =3D "e0c4d3903b382bf34f552af53e6d955fae5283ab"
 SRC_URI_TRUSTED_FIRMWARE_A =3D "git://git.trustedfirmware.org/TF-A/trusted=
-firmware-a.git;protocol=3Dhttps"
 SRCBRANCH =3D "master"
=20
-LIC_FILES_CHKSUM:am62lxx =3D "file://docs/license.rst;md5=3D1118e32884721c=
0be33267bd7ae11130"
-SRCREV_tfa:am62lxx =3D "946454003b9f7e3c8e6d2284e00e0c07d5f56290"
+LIC_FILES_CHKSUM:am62lxx =3D "file://docs/license.rst;md5=3D6ed7bace7b0bc6=
3021c6eba7b524039e"
+SRCREV_tfa:am62lxx =3D "2838c4785805ae8ab50e5692012cc071fd065c24"
 SRC_URI_TRUSTED_FIRMWARE_A:am62lxx =3D "git://github.com/TexasInstruments/=
arm-trusted-firmware.git;protocol=3Dhttps"
-SRCBRANCH:am62lxx =3D "ti-master"
+SRCBRANCH:am62lxx =3D "ti-tfa-2.14.y"
=20
 SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A};name=3Dtfa;branch=3D${SRCBRANCH=
}"
=20
--=20
2.43.0


