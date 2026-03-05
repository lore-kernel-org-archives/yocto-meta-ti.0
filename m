Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFC94F33A6B
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 14:04:23 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44771.1772719454717741754
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 06:04:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=eKPBvMyh;
 spf=pass (domain: list.ti.com, ip: 52.101.85.4, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S7yB90qHUX3z3uaVnXE21+D02MhvfZ09N5W7NIHtx+aUzJlgIP1HYiibsoAFezAwFxgW49RYKKujGvB9y3OFoqHfMi8T9E0qx+OwMqa//VGSbYto33PtaUjZ7qjeSVv6Kivjg3BMWoS8WO6dec0XdMNHTY/Bq68IBwhqhm+skEOCuGbj5eOL38KuE94iBeyDDtGSZJroa9D5hX4WrilgiPNFCQEN3Xx3ITbDGBFYPC5ZghSL86nU0Uk5kYO6K4XplYxHM9UNdNZMup1hdRhH1NQR7PcIlPw+iT7/gG/HtKa8n7QQ7+mzRlwGhR4ZLz47vnxsZBZmO1BQlA9gtAQfEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vN7nPRpNbdOc1H9pInD/84KsRdB2jct3DNFOUazd96s=;
 b=Uw6ZxmBcEQ+Cyg+eodEjBo+IU+5i72bgUXQTWsAyzzmfFMDk1X8dJB5x6i8C3E9TUuETRTMIAyUfwC/Wb5kNZ85yebekG/DdTlK5lRhLDEM6cM8AJm4X6PttGslitnGJWBN8petbuvNSx1GT1qJ6Y1YyFeaoFusEZC1HaZEZSuH7ODXfJsIg0qoberdR5P0dzmKsL7zrCt6EIIs5JA6OKxxStjIbGxmDjZmvLpO7co1fskVOOrbW5cqME3tkBexxbsjrlutajyMDGIVcHt09GzHXBdbY+0pu/lK6jiwTsCVyWgfxW75XSWvWLfLRo/B9OrDoO1IXF7+ZBQS0BLXusw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vN7nPRpNbdOc1H9pInD/84KsRdB2jct3DNFOUazd96s=;
 b=eKPBvMyh5XMcdjCbYIjFg48/QdgZCLaM9xQZbwPwO96+D/ulh+jwoyKMA3uyVbos7TDbA+eKXV42Twk078DqRn8Gz3q4tz5L49rRGxhhavuRCCyp0uLbp/rMEUju88RH3InYpGiYrlvAl9lo6F/BY54NTwAWSV4ECKk4j1LEdCf9RMvjYwO8GUyRPYL2foRKy0pKHLR+IGN2vJBtJFEl1FAd4de9NGcctUw1jSQXdZ2WWZgy7aG2HFm0gjPb+07cCHQn1NtqBTB2XQu6Mot3OsZ2yvjwo58s2K9LWJ2SzPstXOijcuNzxVLTbxV2I4KSFphjC+amcpUT5Mf1JDxrQg==
Received: from BY3PR05CA0039.namprd05.prod.outlook.com (2603:10b6:a03:39b::14)
 by BL3PR10MB6113.namprd10.prod.outlook.com (2603:10b6:208:3b8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 14:04:11 +0000
Received: from SJ1PEPF00002312.namprd03.prod.outlook.com
 (2603:10b6:a03:39b:cafe::bc) by BY3PR05CA0039.outlook.office365.com
 (2603:10b6:a03:39b::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.17 via Frontend Transport; Thu,
 5 Mar 2026 14:04:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00002312.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 14:04:10 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 08:03:48 -0600
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 08:03:47 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 08:03:47 -0600
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625E3lC61959958;
	Thu, 5 Mar 2026 08:03:47 -0600
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id B9D9E2A61; Thu,  5 Mar 2026 08:03:47 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202603050509
Date: Thu, 5 Mar 2026 08:03:47 -0600
Message-ID: <20260305140347.808953-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002312:EE_|BL3PR10MB6113:EE_
X-MS-Office365-Filtering-Correlation-Id: 127152a0-6cb7-4f75-2b53-08de7ac012fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700016|34020700016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	8D6RPQg0bVquL0aaZigTtXHxttftsfnOsKIXAIlKQE/10h+aA3HPWqD9c4/Vk0L3sbz7XZlWxs2TZLZf5qQWIXmvWb5jeeFnG65WDCKXpLk6rGOlzi//Sr/47gtSjgo4HdZTkD/Q1nATpwOBBTOBqOk8/oVR/3Pab+t7bxQG2K0hc8sK4PbL6/+6gm5FMtZLF0LX2j97oaBjRJy9n/NrOqhak4+D/pOr82BqbbBTmcr0f1kj9L29GbO+kZnItqmm0TXCaGUZ4i54kP9OzG3sMGG3yP6AoE+Mq411lJNVWj479dC697L4WXJ9rdZ8dvDlMrIlSc1csYF2JvQ7xl0Q7tumFGP7XsimWi3jmxwM8qx4V1tz3XlJ8ZeSXTshLwGFTicar+e3cGrTbi//Ah0iYZY6VCeCiO5gwWMaKWalcXTT48xqKbrkKTTuuWQ233agCk5PArvHw38k9/ybkr43rdcY4L1FMGEWljpFvXLRkO3UrdAXg3vvTQOsW9e/3pPzU9bCesNmB9zaRnBTfHQHtQC2rV92HORIuTI1BCvH6hioh/6SXuSF75NRTKwB55SUdKvEp+5iqJACklBm47l4cfRAmyqO8tTtTyXoHEHMh+DFmKy3vAGELxptndvDwhqOaM5JHdGdnFf2eTrAbG6GJ9EdH5snJT2UkArvRgWvX5ZXLPwvWikG/DkDaVssTNxfL2UE2Pek327NQdWeF5gezS/usC7cFloqCLvNdEuD1LxtniR4yQaflh9JYTZulc9m3vIWo49axtg4oaDj7+xG9g==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(34020700016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	iJ0vsDasEoNYMdsYXQlzWc+U/1mQ7o+bInkYTj9lUxPCXs5dBR6v1QlNeN+WKgQl57mT85dMoE1c7MkOghDNsgSqQ/pDA9ZiHpgjJKWmOGk7JmDhKGpYBL3wnHHU5v1bhQV91cOCuM38MFcCzuT0e0Vvq6jQ00kNnTYVBPSTOuiSaBVWZ10u+UIGaGO3e7d8Vxt/0w50Cu+kdacXWoDDNbrkptHiGPoxor7w/YqchC7uXfHX+koqbVbedcSh/15o3neelmvCXtGIL3/+I8BjBaG8xFFcrHC/kZNWnt6tjzzjs8WqUX8r1Rn7JIZ1WxwSYpcfZhS8O7xiAmE/9j/A5Vy1exMqEE6FjiycBy/l2CcRgc79cfubCujAU0jW4L7VT1AN4uqbol71y9IhA7l7MSF2g/l29ad1WZ+LSij8oR6fDH/Fe5gJ8qBnnipkL0Kf
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 14:04:10.2770
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 127152a0-6cb7-4f75-2b53-08de7ac012fd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002312.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6113
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 05 Mar 2026 14:04:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19650

Updated the value(s) for:
  atf: SRCREV_tfa:am62lxx
  linux-ti-staging_6.18: SRCREV

Changelogs:
  linux-ti-staging_6.18: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-k=
ernel/log/?qt=3Drange&q=3D8f753312db559c2f1f0867030e5fb36b89f2ea05..30182cf=
3ac7db7fd66c36870f3fc5db91a32f36c

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc    | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-=
ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.i=
nc
index 900604bf..cebb5875 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -10,7 +10,7 @@ SRC_URI_TRUSTED_FIRMWARE_A =3D "git://git.trustedfirmware=
.org/TF-A/trusted-firmwar
 SRCBRANCH =3D "master"
=20
 LIC_FILES_CHKSUM:am62lxx =3D "file://docs/license.rst;md5=3D6ed7bace7b0bc6=
3021c6eba7b524039e"
-SRCREV_tfa:am62lxx =3D "8fbd7df901ccfdb3ffcd2d38a54ababf94b4281f"
+SRCREV_tfa:am62lxx =3D "6f5afcdd2c5f07aef0fb325ed979d49f63ae9c4b"
 SRC_URI_TRUSTED_FIRMWARE_A:am62lxx =3D "git://github.com/TexasInstruments/=
arm-trusted-firmware.git;protocol=3Dhttps"
 SRCBRANCH:am62lxx =3D "ti-tfa-2.14.y"
=20
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/me=
ta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
index 31391383..0e5ea5a5 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
@@ -22,7 +22,7 @@ S =3D "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
=20
 BRANCH ?=3D "ti-linux-6.18.y"
=20
-SRCREV ?=3D "8f753312db559c2f1f0867030e5fb36b89f2ea05"
+SRCREV ?=3D "30182cf3ac7db7fd66c36870f3fc5db91a32f36c"
 PV =3D "6.18.13+git"
=20
 KERNEL_REPRODUCIBILITY_PATCHES =3D " \
--=20
2.43.5


