Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B99A3D232FE
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 09:16:36 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.69])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6606.1767950192225024360
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 09 Jan 2026 01:16:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=VjEGZjaz;
 spf=pass (domain: list.ti.com, ip: 52.101.193.69, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GpyaDXM1ofBnHCNg389e+NPl0DOYEcstOC+9mqDz+m9s9dSIO4FxQl34cG3oaawA4PjCeLxBhdq/0P+30QzN8OvySWlU9HISXIC0R9sLoUnqhQkkCHv3FzbM+HV8g98FUizNGUl6+FyTBwDksS65I/G1Giv30Y1ZOxpi8KEYlb48PYGz5uqd9BycuKM66T9DnnAVcwru/w1STaeet82bElrwrTZEM6YzSDFwCgIFSax3CD87apVdy2/jj2GFCfkH+GPZhmM7cWWzr4ZICPFg/3eCdsUe3uLPNLpzg3ZnhDNjlDA1BV8A9lTv61N2jt78D1jXe2456PWWPjkjvjysaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=645SBGn4u3hxofUDLZWpjOV5D4Y4R84EO8JdMfo95EE=;
 b=ufiVHfMHU4ZngXEj/RbVoaYzYWTuD3ftF7CG9X998EJsgXF33ZedsgWjGoeNd5lT9NDHFqIHtOHVc87FnYqor9mu2vpeVjP0A3JZBYjMCZOSmv7XBqnuQoDShlbFuFFjtKl3JPoxkKM/Vpf90ED/Gxe6ahxpycThHmuYKAKZS6wsfGUsymb3vgCmmXsein9hqyi8/sfBqmGkvOVYBhzDA+jjbxjd3XhuzyXhO4j1Vn8kgS10t31P97/RWvLxmT+aenSfIiTZS5/inkgA+G7a2H616VKN7PQ/zSwNeHJYP4TgN2I0XnjJ/ZlcEpirJYVV/0Fkljta9eukP2au9cZeEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=645SBGn4u3hxofUDLZWpjOV5D4Y4R84EO8JdMfo95EE=;
 b=VjEGZjaz5sipDd+GUZjHmhK2EbNU7qrpv+JzqHYz8j8HWThqNTo8zUfLLrzJwR7FGWfM/DEsAjjs2U3nmFK8P6d3lecwDlsRWdCn4echYfv1ZG8cH95muXzDrDfJVKr5kWUAudE5xnkCErQaDrxLpzu2vjOQ/RB6oGtH7+VtNC47n916A9kfRoqGVKLVMY81ePO0JVOgWUMWs3UgHSGyDk39SdcTfGGqtP4URBz4yueidhb7ziplIOqjqMN2if0MoX+L7EFMxaE2mLYmSx344mx/uktUPlrn3E59DMYs//iMBSlN7EhwRNvfeZdMR+LKYAO05oEd42iFyf4RxgNI3g==
Received: from MN2PR12CA0017.namprd12.prod.outlook.com (2603:10b6:208:a8::30)
 by CY8PR10MB6731.namprd10.prod.outlook.com (2603:10b6:930:96::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 09:16:26 +0000
Received: from BL02EPF0001A104.namprd05.prod.outlook.com
 (2603:10b6:208:a8:cafe::62) by MN2PR12CA0017.outlook.office365.com
 (2603:10b6:208:a8::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.5 via Frontend Transport; Fri, 9
 Jan 2026 09:16:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF0001A104.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Fri, 9 Jan 2026 09:16:25 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 9 Jan
 2026 03:16:25 -0600
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 9 Jan
 2026 03:16:25 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 9 Jan 2026 03:16:25 -0600
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6099GP671891341;
	Fri, 9 Jan 2026 03:16:25 -0600
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 2FDA12A69; Fri,  9 Jan 2026 03:16:25 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202601090100
Date: Fri, 9 Jan 2026 03:16:25 -0600
Message-ID: <20260109091625.1379754-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A104:EE_|CY8PR10MB6731:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e409e5e-69f6-4fb3-f456-08de4f5fc3e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|34020700016|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OhMZ7Kn1LsCyCaAxnIcJddSNlm35pT+IDXYSoYZ+PU278sON6uaVgGSZdn3a?=
 =?us-ascii?Q?qba8JvBoFLNyAs6Wdm+UEgg8Zi3CK53FjJ6FceHR0K5eJdQNpUnTeq3OS/dz?=
 =?us-ascii?Q?7b/fmNCXUZ0mhk4Fn8uoVujRTu/CRCdKCBM2GKEEz8KZTkfkp/maSFrz//ls?=
 =?us-ascii?Q?XDxALUE+9+lpsY6sAHfItJW6HVu31ZD7VHLc4FbHQBHK1Xv834NfgiMHkdfK?=
 =?us-ascii?Q?ef3B0JaHYMrPplYZO365yPTtfw+tREbA65uvqB0Zxz6AVoSMdw6g8+nlZHeH?=
 =?us-ascii?Q?rdW9tiRF2w2E+9M1VG6n+gCg/vWXH1y11LnGgec2eJIaJWxiTMFBE2L+0VGF?=
 =?us-ascii?Q?AgOXQCk9XjvhcpSKxatu7ADBlv6ds4Lj+xTzRHHGZmLSF0OJ1EbTUqadEFAH?=
 =?us-ascii?Q?y2txbVGh7mS2sKZORdWKbtciuvslhnhsnL9YO7vfmg9tgWXD1PF+rLWyDygk?=
 =?us-ascii?Q?EJp0K56rikivLaqp1YWZpp4l4f3uRzPv7aiHNn9BW3AyU+Sx4y21YbwWDgyu?=
 =?us-ascii?Q?4U0+gvFg2NdFqPlihHrpXxGmTWmdqvpDcsLx0mTVXKzJl+F9kqz+E6454w15?=
 =?us-ascii?Q?FVpeV+fixw2QRKf3qgTWTvtsYwhnYMx5ODXRQN2sLc/hJe3FIy5rnVx0ZUS9?=
 =?us-ascii?Q?dpbRdZYbZlf0Y5QIRM/LIz0k03UbeCrU+V44YY/+eogAITYVsTfHZt+2dPur?=
 =?us-ascii?Q?bDTPXByaj8v4s1lnuAWswWrIu8cyMX+EwuyIHDO0a1PNyensV5gBkEk0FF/5?=
 =?us-ascii?Q?ZeYKbJXR2EO/pSrkiA5l7OLMiBVq+eCoxelK5nBw2v7cilB6/3mSj1RITPoW?=
 =?us-ascii?Q?DjVPLPbwtC66cWCxY2leaPD8DHIOJHooI7JIUnD/u5HCF/2MANbRe+NIGp/T?=
 =?us-ascii?Q?PwZTzjsSNZuv2uEXKwXo7697mKivLXklvTxQIL1cuHcoL6UAuS3Z07mvtCGA?=
 =?us-ascii?Q?iySxNRSYT4DwZ9i3PJZ5YB78mKBxZkS5YwsOcxl5ySeyDU2wx9apqSiCee/T?=
 =?us-ascii?Q?QjcAlc42V0wXDSIALtmnyN6Lbt/oDkun7O40PQ7bW57OLeKZvIVb7za4JOLE?=
 =?us-ascii?Q?HYXOV1xyBsMUvhiWXBXlN+2WYaFaF+8LlPAQhsPLkVkZ2a0sD3Wj47PvrSa6?=
 =?us-ascii?Q?r0ME+0oMbrot8Do0ENBFDmBMuwYU8hrU4bSh2+6c3hyiA6xtw/S1SppiHSwF?=
 =?us-ascii?Q?umyxGT7FAPLQ+sZr2ZyGkKAqGR8Nj6qIFMWXzlS0rucxA9Uu6ryPIal+qUlz?=
 =?us-ascii?Q?2ywWdr9VzL1ZXPqmTxTNdjExAVSdmX/IMuOEgKXBMrfJyaXka3qUOjPL+nga?=
 =?us-ascii?Q?EbIWN4hkaCr9cYRy54yWOtsHNtLtrKQbPIH8mCnOEw+IhE+Lj4Zo18chjWgu?=
 =?us-ascii?Q?7bYF8FktEbdTUUYn33jJVu7yZUo8Ft8m6NyySzB+vDKTk1bMUa3G4jRfwDWq?=
 =?us-ascii?Q?D/tDPN9CPMJ6ZwyZaVWk0iQ7ZT0C0/mGwjMqMhOiJM1qgXuxim+27hsM3J+x?=
 =?us-ascii?Q?mpfehRCAp+p8YnzqSNNPpu6alB14X5Dmf5XM633eFg2O8/bskkWo2GA4ob/g?=
 =?us-ascii?Q?sWwQvtN/tnE1rmXhPhI=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(34020700016)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 09:16:25.9368
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e409e5e-69f6-4fb3-f456-08de4f5fc3e8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A104.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6731
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 09 Jan 2026 09:16:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19395

Updated the value(s) for:
  atf: SRCREV_tfa:am62lxx

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-=
ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.i=
nc
index 70eeeea3..060a8c87 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -10,7 +10,7 @@ SRC_URI_TRUSTED_FIRMWARE_A =3D "git://git.trustedfirmware=
.org/TF-A/trusted-firmwar
 SRCBRANCH =3D "master"
=20
 LIC_FILES_CHKSUM:am62lxx =3D "file://docs/license.rst;md5=3D1118e32884721c=
0be33267bd7ae11130"
-SRCREV_tfa:am62lxx =3D "11e6effa9128d62f7fb085f47adbf01a7c4a1134"
+SRCREV_tfa:am62lxx =3D "2efbddd1caaa8c2126261225fdfe333be03c22f1"
 SRC_URI_TRUSTED_FIRMWARE_A:am62lxx =3D "git://github.com/TexasInstruments/=
arm-trusted-firmware.git;protocol=3Dhttps"
 SRCBRANCH:am62lxx =3D "ti-master"
=20
--=20
2.43.5


