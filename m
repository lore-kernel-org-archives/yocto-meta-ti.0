Return-Path: <jm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57A89D68BC6
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 23:53:30 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.24])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29450.1766015604557552878
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 17 Dec 2025 15:53:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=rC1nNe2k;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.198.24, mailfrom: jm@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t+BQvxNRaT0EkfID6IL8thM1t1zDbmxoxJcA5ywuG1IGJOiNTLRHo73SgkEXSr8w11wsp+DCJP+Eq/CoHsQ8GI+nj4zhN6Se+kwFBg1kopdyzCUKtbJvRwIne+ixaaCpTiRfOE47ZTISrxlGl6PzAHY1T6z52pO6cQEaTzY3P6C+Ad4f68IoAAVNQvm/uobCDSuhenlSUACZ9lQ9i/cMQo3rOl0KICKdWLdTQ5MjBbUCNnekFzx3QarwiQjsECPJc8KPkZ4dPRs92uTs7ANLm4W/PTviAPXPYeOZxiwjs2L40pw2JCnVZWiBBxM9shixTbmTnkF9ZrLygcJ56DrbZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=spWZy/hNLNIytfxP8dhtE7zzLHMA0N1Q5h/wOTPaQoA=;
 b=RjHjFohaOt0yuvsZZrA6d26VKaUgAeaX8AoU79xZ3yW/ptGa7XlwfaIkXg6BSb7d7AFlxJcA+Iv8z+2Q2WzKr+/E0u3QPF3s41n8U3vZBZNccj/4vnvglv0yY3G/ID/kML/s5zi9lystqXzeRA47R4ZX7zn96LGBCWgEpBu25zS7nenJduvt3cpFvxcL6eMrGzDbFGfZdz2qYaT/Ek/fxCQIaqzIBiPm28TgYZGWXW0VI/3WTjo4oyns5xtvbuvnMumH1uq0GgUAebGIW96vvCNR7gqSrW/+dgRG2vBxblYzDzyQboJHCDFid9ia2tNwADT1eXPypuDCFFwSDVMAIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=spWZy/hNLNIytfxP8dhtE7zzLHMA0N1Q5h/wOTPaQoA=;
 b=rC1nNe2k5Qauu9fTuKdw2gqwyxqnX+Jbb6CL121i3pQRb4xQIxK3Ka4Fxf8pUq0nOXwzE5Nj3UKZXZ/hHYBxxV62e2jjV84z0CzRkApHkoeRB7y/9fDGIdkUMCbC4bcSNuIG1lLBd4Clg0/zVpaK7PePl1KIH8iwKASitXfdmE4=
Received: from BY3PR03CA0020.namprd03.prod.outlook.com (2603:10b6:a03:39a::25)
 by MW4PR10MB6511.namprd10.prod.outlook.com (2603:10b6:303:225::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.12; Wed, 17 Dec
 2025 23:53:22 +0000
Received: from SJ5PEPF0000020A.namprd05.prod.outlook.com
 (2603:10b6:a03:39a:cafe::c2) by BY3PR03CA0020.outlook.office365.com
 (2603:10b6:a03:39a::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Wed,
 17 Dec 2025 23:53:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF0000020A.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Wed, 17 Dec 2025 23:53:21 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Dec
 2025 17:53:16 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Dec
 2025 17:53:15 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 17 Dec 2025 17:53:15 -0600
Received: from judy-lenovo.dhcp.ti.com (judy-lenovo.dhcp.ti.com [128.247.81.193])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BHNrFMo2432696;
	Wed, 17 Dec 2025 17:53:15 -0600
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>, "Andrew
 Davis" <afd@ti.com>
Subject: [meta-ti][scarthgap][PATCH v3 2/2] trusted-firmware-a: am62l: Update to latest ti-master
Date: Wed, 17 Dec 2025 17:53:15 -0600
Message-ID: <20251217235315.1333746-3-jm@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251217235315.1333746-1-jm@ti.com>
References: <20251217235315.1333746-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF0000020A:EE_|MW4PR10MB6511:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fd73fa5-0a85-4089-63f9-08de3dc77571
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?DsLdsTrCdmQ0g/XArJci/V0p6wS2DuXxDKYDIZuWJrCluy+lRflHI0QDHvNh?=
 =?us-ascii?Q?ALzWPIM8kocl/337DRpOAPhTRmQyWD9POfRsWOD9nR48Ku/8UEekIZOW1Ww0?=
 =?us-ascii?Q?ESfFESUfipnf/RpxrcjTEY//6q+6al4NJtpwA99pBZ7NBVC+kWSqDdhU6B8P?=
 =?us-ascii?Q?TML10nk7vH7Jwyd6ZBeLnVGLxyRYzyZeK1hh4DtJP9oyGBpXe0xAA5U8BXrX?=
 =?us-ascii?Q?VTe9ZYJzUxfkKxL4aaP9of89waqTAdONOSy9pipNRN9HZ8abHIdftkNE1859?=
 =?us-ascii?Q?0OJxHk8aT7hJIKk0xKPlBQx5zAJFTrMdl+CkhE4q3ApMp1EF2zp0itoqgjh6?=
 =?us-ascii?Q?5nmNvOLs4bNoKoz95JS00Z7tiLadyg3Atl6f2W+ckGnlkOymA8vJZ/NRkMq0?=
 =?us-ascii?Q?qpFvH2QprfLK5LjhlHdDMb3PM8gV8pFON+nht/qvp7yy2du43MOX/BHYPrOy?=
 =?us-ascii?Q?OERgr/CgoBC9DCehSA+QS9b87yeR1aMEImJYCgxN+ropH+exBSWxbd0LqHzN?=
 =?us-ascii?Q?fagBVWWpPKyqsdSv/8ehaaYCNoajlm6u61GKWEGV0yvD1IzNuBPoGTDhKPLK?=
 =?us-ascii?Q?aPcbIgBXD9iYfPwBB7sIrlg+u57do1e5JBgK9eTZnjA9LLuUAQKCGe/ztnhl?=
 =?us-ascii?Q?obHJ6KLqYJ/nr0U8/U+Q8zPn0kOZWVkO5et4Ta4xDTOlCzpghyTNdI4moJtm?=
 =?us-ascii?Q?3wBF5koX5+KuDSZnF4IASfKANUOGU8/YS1ICiPFpq0jJwj32MNLB/BQCZSbQ?=
 =?us-ascii?Q?OA7yW+h+RAykcmXsLXD0wgOCOD1dLSCWqVr+s+hxhvgg9BPLM1GZnyBMLJUE?=
 =?us-ascii?Q?zAk4RfSvlFHb9nIrCnW5qLdvzOhHdgNhd0GnGuNvnhV25IzQrIqmvEQpimaC?=
 =?us-ascii?Q?9ABoolnJf5RsgqZ6N39PYTC2SRtjxIPYStphJQOgA4DK01ec3VyECSBZBjcx?=
 =?us-ascii?Q?zb/1T2eTMlksOSD7rZa9n8EN27ItcGl8WEjVrW9U5z/TUeNx2rmJay7Ioc7k?=
 =?us-ascii?Q?Q2gEYgkbRfO7B4BTNepw3z91xDMOPbA2Zc411Xjbda12Em1VthO35PaXHh8e?=
 =?us-ascii?Q?6ivNumH6Fpy4uClGs+v/cj5SF50vuchd7EX7u48HeKxoqkwR9Vrv3162fgCD?=
 =?us-ascii?Q?XH4HI9tWZs+l8o6xHfhErdD1YO6mORgk2Wk6+75vDneXtf95x7YEL+Fsv5X7?=
 =?us-ascii?Q?q7UOXGWzeeExgI9RRhaiU4jy2BbqfkQbDr9akcrRFZIcWJgdZGLnv84Gw1P6?=
 =?us-ascii?Q?6hiwi5VAiE3c7Plmp5LSCAV/ODp/bZ3p8YNLsXXDAd14HWnsVzvFafwxt9dj?=
 =?us-ascii?Q?vMGVqICLrAQ2IaUJ/cNtTO7fDGC8OuHvPQI59xdzQtbq/8vbhBq2v6wWu52K?=
 =?us-ascii?Q?9ZxlawvpuBYsXuccbNMjpFQ8ZHjX8PIsitMhQUzlUeQUISzDBotnS2DUbPtV?=
 =?us-ascii?Q?FvABtDNY31Q1u4BAwPRj3znKOTFk46EaMnhWuut4pTUWdNjzPgi+HxdOgmUY?=
 =?us-ascii?Q?2xKrxBpnTcovqCYEfH1OAH2A/SPTwMm6W8/54T9CTjdZ+05x9EgMm8qY/9/Y?=
 =?us-ascii?Q?V2nxvytjLRpx6FYhZf0=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 23:53:21.0637
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fd73fa5-0a85-4089-63f9-08de3dc77571
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF0000020A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6511
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 17 Dec 2025 23:53:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19370

Update to latest ti-master commit which includes support for
BeagleBadge.

Signed-off-by: Judith Mendez <jm@ti.com>
---
Changes since v2:
- No change
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-=
ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.i=
nc
index 9e733448..05cc6987 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -10,7 +10,7 @@ SRC_URI_TRUSTED_FIRMWARE_A =3D "git://git.trustedfirmware=
.org/TF-A/trusted-firmwar
 SRCBRANCH =3D "master"
=20
 LIC_FILES_CHKSUM:am62lxx =3D "file://docs/license.rst;md5=3D1118e32884721c=
0be33267bd7ae11130"
-SRCREV_tfa:am62lxx =3D "7252a99fb781075db1987d8ce2c7e37324297427"
+SRCREV_tfa:am62lxx =3D "76800058f24e3eb3fcacdb12106a881ae279f8c3"
 SRC_URI_TRUSTED_FIRMWARE_A:am62lxx =3D "git://github.com/TexasInstruments/=
arm-trusted-firmware.git;protocol=3Dhttps"
 SRCBRANCH:am62lxx =3D "ti-master"
=20
--=20
2.34.1


