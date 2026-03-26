Return-Path: <s-tripathi1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5239106F30C
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 08:58:00 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43120.1774515477362459945
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 26 Mar 2026 01:57:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=L1q87qv9;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.62.44, mailfrom: s-tripathi1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yt+kUBSJvHbMUNRW5JDvtEAUMzkBQjts1loZE/b/e4Gf9jEa16FPnYieWsbVJLX4F5CaZW3yB4ecKI5Wd6HVSWBHHkpBQkooAvShF30tvqzQrTB27D8/KYCG4KAvn3606KAgmC8hTKty3PTghMPEaLscMyYU0LiijPw98o8/vLs9FA1lM7IfnyBe411987weFUKXyYIVBI1ufalzAN1lKqi4f9OesFPxp/IjpooQiK54D3XHb5OGdF7AxrMGFdU/W29wceQ68kjWriPq74ijJCMKTiJeJ6exQLWqNT7oNhyVgW1vmW2/niqwYd9steQhQ3qEsvEMwoasJkk5/vfDKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ip+4CjNML+NTlRYtPsiSoyrYpmuiEGHYomgPV6jFSv0=;
 b=LBoa9/WdZhDO+T72a6Ve3qncTTkrEc4ObnB+Tz7B+NFjdvh3Eud3eOehOtpwfNhQwAN/5aT0DJALAp5WMkmfXCdNQGC8D/PFB5aID7Q0yewraEWFFivfNp8zvNGodSNqmTTdqr7LM5kY/c5oE0UPgAKTjj51R3LnW+LGg99yNEvXVH1hfIAPWCBW3Q6Y3rHyhmJqQU9ZhLfv2wcKxwvcAvzdi22uLAtiOcIYFIXZoDD9e0536o7f157fg+1TeuCva65rbjPbXIZBi1HyBzp3Gy96OoW2GAsmLtGdFFHO19ap901uwD7rkPo2p2coVdXVZL+EigL7pa8MpkkhlKeC1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ip+4CjNML+NTlRYtPsiSoyrYpmuiEGHYomgPV6jFSv0=;
 b=L1q87qv993b8XvFLGy/1jfHlDZSCb1BReYsccDV3CVHHpHrIoQmj4Z9qhONwsywT1EaeRXsJybbMS2pAf1Oxpc2U5D1xJfpJEOpXPvybdbIrmh4WC5rVPVV4DlEqoxHCQcB9DkqsZXQQ1a/qOIPcqvNXxF8TpIwbLdf9DCSnlH0=
Received: from PH5P222CA0011.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:34b::15)
 by SN4PR10MB5655.namprd10.prod.outlook.com (2603:10b6:806:20e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 08:57:55 +0000
Received: from CY4PEPF0000E9D7.namprd05.prod.outlook.com
 (2603:10b6:510:34b:cafe::62) by PH5P222CA0011.outlook.office365.com
 (2603:10b6:510:34b::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.33 via Frontend Transport; Thu,
 26 Mar 2026 08:57:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000E9D7.mail.protection.outlook.com (10.167.241.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Thu, 26 Mar 2026 08:57:55 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 03:57:54 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 03:57:54 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Mar 2026 03:57:54 -0500
Received: from HP-Z2-Tower-G9.dhcp.ti.com (hp-z2-tower-g9.dhcp.ti.com [10.24.68.200])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62Q8vDGZ1858872;
	Thu, 26 Mar 2026 03:57:51 -0500
From: Shiva Tripathi <s-tripathi1@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <rs@ti.com>, <jcormier@criticallink.com>,
	<praneeth@ti.com>, <kamlesh@ti.com>, <vishalm@ti.com>, <k-malarvizhi@ti.com>,
	<denis@denix.org>, <vigneshr@ti.com>, <afd@ti.com>, <s-tripathi1@ti.com>
Subject: [meta-ti][master][PATCH v9 3/3] conf: Enable dynamic tpm-layer support for LUKS
Date: Thu, 26 Mar 2026 14:26:23 +0530
Message-ID: <20260326085623.864201-4-s-tripathi1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260326085623.864201-1-s-tripathi1@ti.com>
References: <20260326085623.864201-1-s-tripathi1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D7:EE_|SN4PR10MB5655:EE_
X-MS-Office365-Filtering-Correlation-Id: 11be0c5c-5b26-406c-3d47-08de8b15c52a
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	99IDrGA/7k0yAGcrhh0hb9nknH189KOVe//BJuC7uMqRliCJ4ZRkAPyYjdlwwS5PuB1k+7r/SNfIGPijsUpnfQGeltd2jC3Dv0DCfAxe/4iAGZk+WT9TAdJNI55tf8ePqWUlE7EriVXFuxUWUxCyaRtodCBVRw0XFpVl9EPnJpl1bgjnbhsOboJXrKFJI2nSaK9EJAxMYqRlYCLCRn5xXWpKDsenIaGIfwkVILTPFXelR3IjoYkZ8+P8F/0IaZsbq5Vcf+FM24sWhs38L6kW6z+yhaVzSRuShZQWW5avR239YUKObgiS2u4p0pUmVigCT9oMX4ya4foScljxHuBw7XT4jiCLdLTIEDUzkIBTIEAl47DoezECIAp5T9BKEoaOXxr/1Vtq4rFclqfgU5WyNcR4Y5Zj3bNVOycU0FCtNtZnVpx7+oUvu7p/jSIN4SCibNbNftOeVT8L478pgcUYDjpvoDRg9LRPn8UV+NYGJeOAH5mQa0fd6oSXpeHqqF4oEhbIOfaLFy+hgLAnsOFMyAcCnZ/OtBLFTIjRa9Hr4NE3gR7mZnwEjhB9jo830OGLxSG7D4plUvG/ngvzMcPaNHx0/jp1otGZeIVqpbJo6mYMa3ijq0NKmZiQJZdjvfDAaIALpIii/YxxZiWxZVbL1mDG10IhtTewzLS+Ew61RCw2UaKt80v3oJNPr2PpPl8wIw5V1DdBNlCt1UFvA1kkdU0239Kf9HkwHXcuYDvsJHmB+p6TLVVgNWDxqbOhUgMm1gX2RcXeF5b6PE1FL0IkuQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	SCExcERWbEEe0Bb1hTPUlTpNwfcmXxKWCEhil6hZfdZxw4yBZVTlLk39UWsuXlcTct4AVhZIs8xZo6BQjiZ2/3ISY2sQuo9E8XbVoJDa4HvfeIu70hpT9bYlYrB1gdM6fl7NUAqJV4DA6LH+kBaQPP+SM1FhBkSxIk1Cv3iKPaQYeC88F7rgOujeScLNeuPYbsFPLHF0Fx5y9cwvrrVxERqLulYwKsEJ1HOyYuE9wR9a0JoQ1RoXjCJm8pk07jWhIUy75+aLKz+O//BEb4R44FNJST8YFAIAfo+5SMe7K0buifr3104A50k4kLreTuTBgg58ayAc6rkxKBtdXndIRsL5FrH7SbC+bHPo8R6u/VwKFy7cP+ao40Jv9xYU3riotcD55OAudoLNG3wxtoWLl+OeewZc7wa6DY0dz/6BStt4a32y+2TIwHbryd+Vll3L
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 08:57:55.0784
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11be0c5c-5b26-406c-3d47-08de8b15c52a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5655
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 26 Mar 2026 08:58:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19822

Add BBFILES_DYNAMIC registration for 'tpm-layer' collection to
conditionally include LUKS recipes from dynamic-layers/tpm-layer/
when meta-security/meta-tpm layer is present.

Add tpm-layer to LAYERRECOMMENDS to document the optional
dependency for LUKS functionality.

Update ti-core-initramfs.inc to auto-enable initramfs generation
when DISTRO_FEATURES contains 'luks'.

Signed-off-by: Shiva Tripathi <s-tripathi1@ti.com>
---
 meta-ti-bsp/conf/layer.conf                            | 3 +++
 meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
index 86744b2f..c8e4cd39 100644
--- a/meta-ti-bsp/conf/layer.conf
+++ b/meta-ti-bsp/conf/layer.conf
@@ -20,10 +20,13 @@ LAYERDEPENDS_meta-ti-bsp =3D " \
=20
 LAYERRECOMMENDS_meta-ti-bsp =3D " \
     openembedded-layer \
+    tpm-layer \
 "
=20
 BBFILES_DYNAMIC +=3D " \
     openembedded-layer:${LAYERDIR}/dynamic-layers/openembedded-layer/recip=
es*/*/*.bbappend \
+    tpm-layer:${LAYERDIR}/dynamic-layers/tpm-layer/recipes*/*/*.bb \
+    tpm-layer:${LAYERDIR}/dynamic-layers/tpm-layer/recipes*/*/*.bbappend \
 "
=20
 SIGGEN_EXCLUDERECIPES_ABISAFE +=3D " \
diff --git a/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc b/meta-=
ti-bsp/conf/machine/include/ti-core-initramfs.inc
index 9d3cc612..15c05e04 100644
--- a/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
@@ -5,7 +5,7 @@
 #   TI_CORE_INITRAMFS_ENABLED =3D "0"
 #
 #-------------------------------------------------------------------------=
-----
-TI_CORE_INITRAMFS_ENABLED ?=3D "${@ '1' if d.getVar('TI_CORE_INITRAMFS_KER=
NEL_MODULES') or d.getVar('TI_CORE_INITRAMFS_EXTRA_INSTALL') else '0'}"
+TI_CORE_INITRAMFS_ENABLED ?=3D "${@ '1' if d.getVar('TI_CORE_INITRAMFS_KER=
NEL_MODULES') or d.getVar('TI_CORE_INITRAMFS_EXTRA_INSTALL') or bb.utils.co=
ntains('DISTRO_FEATURES', 'luks', True, False, d) else '0'}"
=20
 TI_CORE_INITRAMFS_KERNEL_MODULES ?=3D ""
 TI_CORE_INITRAMFS_EXTRA_INSTALL ?=3D ""
--=20
2.34.1


