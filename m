Return-Path: <s-tripathi1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 711671090258
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 16:59:23 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.15])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1045.1773939557705516181
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Mar 2026 09:59:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=fzL94w1A;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.194.15, mailfrom: s-tripathi1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kPgAU0EkfUg2JPqpACNEBAve7Y+rH/6LBrNvsSZfFZ465Fi8sXDBn5jxmHQvACC/rLy7L5XZTx6KD5bEqAoKbcoq6G7VObFYt4jdNnE/BBJ9Vcbc/LagMExHrmsBviPdk6Obn0+I0vtpkhQJ/8SKz+wO5Uwj52lFWoBVt7CWbGNdnnCO9hrHjEsw6AgTyCBqoMYFIe6+XKVQqf9XRp3WURBAibWN7RjDsDnUbswC1W51LfHZFebeZDGa5Sg4WHVMhkmh26Jb2U+WroSt/gLn5qBxv29Bsg9PUPwRxJ4qyKyfW9lBh9Xs8SqmGkAq7fJEGL7vuS5rOswGqxVBhZrXvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wTHPs1cITnwnxyANG0S6j9o/S4h+y94Nr1PDOghAGms=;
 b=LHH61bRrolg7CnwRYrInIVYS0wSorTgO4qERNqlty2/BApqOViCG5T3oU3MiEGt7LXJ7mfeQcMQN/r0cnwQsK/eTW6NCVOqrUfOYxD6aAi22P+4w1cNuj0draH56v3uakwwYbaTdrNniR2VbzuCG0rbeZTHEKkKA1cyfCEIHvRXFDbKjSPX+v3lxAlU6gusurQbXkBVAXfeMPb9dvpVVJMuB8x+gXtK6VZGcsCJTLr0LvZwbpRlxjyTL1Fp8xJhT9VrdzoNsuSNgQyUf02DzE23vPHfP/JJzzsZyDlQPRj9D2swvqZPB2gl6zSZcdCsTYh1L05S2QnfrGxCEJqugTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wTHPs1cITnwnxyANG0S6j9o/S4h+y94Nr1PDOghAGms=;
 b=fzL94w1ArBPHosiXz1cD34kU8ViBTna4uj7VB+s80XA0XccV6zUMeSbNi4AKU0sUOCKeWXmEuM2OJfmPY2Xf1nGs57WM3wr5EPm2dlCz/CLTFzYq20+DM7Va9S9tGarYcVxQwNQEdWiN1MVvdzAih8G07q992RucgXu4sHsVX1c=
Received: from BN9P221CA0001.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::16)
 by BLAPR10MB4961.namprd10.prod.outlook.com (2603:10b6:208:332::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.20; Thu, 19 Mar
 2026 16:59:13 +0000
Received: from MN1PEPF0000F0E4.namprd04.prod.outlook.com
 (2603:10b6:408:10a:cafe::73) by BN9P221CA0001.outlook.office365.com
 (2603:10b6:408:10a::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Thu,
 19 Mar 2026 16:59:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MN1PEPF0000F0E4.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 16:59:12 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 11:59:11 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 11:59:11 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 19 Mar 2026 11:59:11 -0500
Received: from HP-Z2-Tower-G9.dhcp.ti.com (hp-z2-tower-g9.dhcp.ti.com [10.24.68.200])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62JGwm562883032;
	Thu, 19 Mar 2026 11:59:07 -0500
From: Shiva Tripathi <s-tripathi1@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <rs@ti.com>, <jcormier@criticallink.com>,
	<praneeth@ti.com>, <kamlesh@ti.com>, <vishalm@ti.com>, <k-malarvizhi@ti.com>,
	<denis@denix.org>, <vigneshr@ti.com>, <afd@ti.com>, <s-tripathi1@ti.com>
Subject: [meta-ti][master][PATCH v8 3/3] conf: Enable dynamic tpm-layer support for LUKS
Date: Thu, 19 Mar 2026 22:28:33 +0530
Message-ID: <20260319165833.137342-4-s-tripathi1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260319165833.137342-1-s-tripathi1@ti.com>
References: <20260319165833.137342-1-s-tripathi1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E4:EE_|BLAPR10MB4961:EE_
X-MS-Office365-Filtering-Correlation-Id: ec9ad1ca-1886-4d56-d0b7-08de85d8d884
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	4nFPAdOllBxYGqhmm0uDWMZSWgbkiJgHqr5Nlf9ebI9lqYifwoypwJ7xEZCSkEvB+q+NW+nQoOEF9k85VJE6RHgMgBpRvbURFhT3JjGg6naeR7C0kL9YfeEc8Eovg5eJ5I1qCFnZOkJKldMWuclZOVorKM7CG9TJXgROEjDWDLEmYwaL7G16Ifi6aqJ5vCNxBx3AMAsROL1TUbgT2Oo1URUzvfQRr9t5y5J6i6fIdNA8S6rCFI1qkaD1j43RfEzZS5zZbi93LQwt96UG1MhXVl2FGKoEQu4QKydDBskAuHD0ouoPxm6NgiTbyzocC/+NA3g9TfNWK98yqmpEzr1N0P2OSWpT5qH7T0wTtHBFYU2EaG52YZnrszNQOyz6/j1BpCaD6xV8sHCZPqPvDA3cnJ1oBWMRCIgJQzO0o3w+ioE5LNkQRAsk7pfTh6Xj/Qwp1lxkPchvkjZZ2kIOgcMQ1RtK4nmyjZ7XlvRK2FwrWG9qbwBRM87NfUDV4TYQ6mE/jVOsCRdO6UWwD5tgzDjDnzh0btVfbBCvIykwjMvqPhFCdBdHUAk6vq7qzsX1QPWdIFqf9GShItCD4ogKlN4/EU3eTkqXh6vM9952d6usOHAKLHK9HV+URTMjgA+Ggb3Xb8vx8pqs/aRmrZi9KoIlL9EpDydPRIJEfviQDxB4cmBJA83sRR7iRNdop31INbNGnbKehgjpelpHb3YQhbtyqC4IjZDxBltZ62oH/gCrFHYrzf0NWTYVgGZfIPRUVWmVTXK5gIKWblMxk6P3v9u3CA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	m5/2RUjXKF9+pI8GcWohUP5axsa+ZigPl3WNv5ZYwjk4lrpIu5RcY16uB6agjjWjmIyOquivORs13cE5MEgFFiVdeA8D/SYHZbew1gHjhQNhMU2jywCV/GjAjRFDQTCGBewLTJQwi+QGL55QgAvdH8KvVfO/5uIG2ors0+LI/w/J0otTvJNoYscGv2nrlbKtYXydzIH1+A/3rxT4kqG2uKyy5tfEVKfXenI6KQICwLx0+CmBOYhcAK6Y0SbgT79fbWH3ETuProj6QkBjE/2jvjQVJWRIl4gBpQ7tjPxcyJsFv8Y/xOZjd4BNmGGtlnl1bM74Tffv3XWVE6b9L1WTeGsIwuodQm/FHa9N8Ovjxh0gKwoSSIlgbq3qAbi2w9V/31xC66jAmoUWx0rk+GEjd2jTr5M3y4fx7pP5phZWwUN6VxElfoQoZU72YML9+QM6
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 16:59:12.4072
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec9ad1ca-1886-4d56-d0b7-08de85d8d884
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000F0E4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4961
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Mar 2026 16:59:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19785

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
index f78da573..6e66ef56 100644
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


