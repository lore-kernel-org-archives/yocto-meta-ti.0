Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43D66D3B9A1
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 21:41:43 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.1])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2321.1765316497667711321
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 09 Dec 2025 13:41:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=maqQUOhN;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.200.1, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jBxib1Z3mqSOWEjqMg6ZF347EMq+jJkWUYo8P/8P+25zUmkBc6FtwllhlanGyMopTFuttjcPsnoh06JLC7IT52eAGC+FUdaM17SGW/+s42XtgMi7C5Wb6pgw0SMCZck2td4byZIlgWKwCKlo4hXIYebtYKYPy/0wEdjl/4B9o/iRnkqtaSuBN50sBB3h77aS00z5uaNUEWhIcH2sPvkbqdatM0h+oI8cEbxxJ/09k7auQrcxvTaKF18Wg+ttQne8hMHapz99yzMz0CWSdiGbpQsF5qSFdfk4FqXAIaPgl1cA24PLK6aiqI8QI33FviQf6L6JMCWVDVqbVNaikEgeCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YUXIxUukyfU6O30Rj3jByreAJEG5l2132NRYmsFb2co=;
 b=Z4O7xW0Km21f0NTay1TKriT6IKkBg8NF3k7gTYeE0MbP7KAylLEqECnZhby0vYFQ09GUrEmHM6xTt/9FEJ/98+pIQIGZ9zzeuFc98oVRDjq/u3ux+p04rvUzCajCRPm/VXv+rbdsAJIbtHBcX3uJn5rMncsP4BehXFAALHhRc5pKT2w9CkEIBMZjdFDzzHw8uPMKNwfZmDalQ+AEw8k09duV9ns6bDpY6yw+7IMdvUEeiSd6bZAoMa00yvr5n3w+UB1X+qyjdtFJ1dX+fw1VPirW4wU6CW3J5gaNTg63WuD7anpl5/qZFEa2rF7sC6TSQw7v7efsi0tJzIuo64BI8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YUXIxUukyfU6O30Rj3jByreAJEG5l2132NRYmsFb2co=;
 b=maqQUOhNFeUG/dEQe63Mb0K3FAsDeO5jpbS+5VtvfmdpWFDQIOvWvURCp4uhp/hyUHrUvEPLEF1n3rakE/heTJnskFIXaAD8M1Yptr0dDGd8eOItD5XDUqvsde3Kfn5HVEp8u2+k5xATyvxSswLga6j26FG0ZAlnn30fwLRnAc0=
Received: from BN9PR03CA0564.namprd03.prod.outlook.com (2603:10b6:408:138::29)
 by CY8PR10MB6442.namprd10.prod.outlook.com (2603:10b6:930:52::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Tue, 9 Dec
 2025 21:41:35 +0000
Received: from BN3PEPF0000B370.namprd21.prod.outlook.com
 (2603:10b6:408:138:cafe::dc) by BN9PR03CA0564.outlook.office365.com
 (2603:10b6:408:138::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Tue,
 9 Dec 2025 21:41:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN3PEPF0000B370.mail.protection.outlook.com (10.167.243.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.0 via Frontend Transport; Tue, 9 Dec 2025 21:41:33 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 9 Dec
 2025 15:41:32 -0600
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 9 Dec
 2025 15:41:32 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 9 Dec 2025 15:41:32 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B9LfWfM1846817;
	Tue, 9 Dec 2025 15:41:32 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vT5Se-0000000HIaE-10HE;
	Tue, 09 Dec 2025 15:41:32 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 2/3] u-boot-ti-staging: Add initial 2026.01 recipe for LTS development
Date: Tue, 9 Dec 2025 15:41:31 -0600
Message-ID: <20251209214132.4122996-2-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251209214132.4122996-1-reatmon@ti.com>
References: <20251209214132.4122996-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B370:EE_|CY8PR10MB6442:EE_
X-MS-Office365-Filtering-Correlation-Id: ad4398c2-020c-4cd6-38c6-08de376bb90c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/mkMlsFesy+1Nv52vgWefwF0u6CWOSOeEZPofpKzDFOv2K31WltNIXP03ZQN?=
 =?us-ascii?Q?5kh2lGbx7cC5G4tH2QPVtrqdVcgoyIlWfpP9Lonh+kYe9pBdsj8z/ZPVfdj3?=
 =?us-ascii?Q?p9nUoE8LExUx59nsHtviiY0jcv/a6I5A929feWSEusBhG5yc6RGIy9Py36t8?=
 =?us-ascii?Q?y03uTruV6j16uc0NAPzzk/uRKKaLe9Br6wxQkyVqegsCp3HfMhg0/sH2cBqo?=
 =?us-ascii?Q?jDtQ8zp4uyvdR65ZOV4PBQluOGCzSeGBpQ3lrnGML7QN3uvraV5BIubS9jpI?=
 =?us-ascii?Q?Sq6fWHKiX65QEnrWzsAGI6SbheE3caBwKqQbvqtey37xlDv3cgOlH7qm+mon?=
 =?us-ascii?Q?jrzm8kAQAgM6fE1zBZcisWFAiuMh0mmsLgZ1a1vxInHWYmIZNIqS7hJ4fg4t?=
 =?us-ascii?Q?rKAPuXNXthii0VC3D8JihtbCLQj67yg/s3TeNl43QVnKeeE+MFzMlYGDPecs?=
 =?us-ascii?Q?K4bTequ814ieNAtZmu6ZPfYxh+rQdh5oDU4I82VAmdWN506SB4mcGjxrEK49?=
 =?us-ascii?Q?JGbqqyAjTAjX2M+zs1GJAaCoiM9w5r+1xLG/YsKE1eUfJYkxS05bsmh57Ept?=
 =?us-ascii?Q?SXfVDlnWcFm8+0T/7+6wnjmsVwqY+tneY2Jkp5kQVoXcH2CJgS02ewj+bUXf?=
 =?us-ascii?Q?Jc33H42qidBYTEl47MuLLqukp+FKNGru/brsGfDTCwEBoUl1+Sep8m3gwpWo?=
 =?us-ascii?Q?lMVq1VzL66NOX6bOuDNYvU8be3skAfOSnkbxnQIXuKN1O+c2sDGlvjWDMvCl?=
 =?us-ascii?Q?NgENIQ7icwptsL+9fgEPKHGbGkYclIOUzQ3FcIhUXwSkRJ9lTmFt/b7TJMmy?=
 =?us-ascii?Q?Ee2nLBakcHNW3e8uWmqYy/jVKW9+UlzJ4BdMqO6iE4u+zfR3upUpKUKnoPy6?=
 =?us-ascii?Q?tix4znYcd1xr2D13kaUDfJ5/6CHfCfUpCplRIj+Zo5zdLB3dMLgbywUZ2kab?=
 =?us-ascii?Q?IE8racxZlz7icZxZYICBUulEcbXNMCREqBbaV5JygPpgAvwu/UVcEzjLnnsr?=
 =?us-ascii?Q?/Bab315iWYQiTmT3iLehSY2u8kexaN3FkiAdiCYb7jD6dDsREluxxveoS/AP?=
 =?us-ascii?Q?hEh6uYeaLzi8ZXJx10p670S5VGbURqiU5SA3crDufdXeiozQZTncsmq31ZF1?=
 =?us-ascii?Q?LvA32BnuwPe2604Jl+WD2Z25q4u6kx0kKiAqscYsUExpEVMezRkBv77zfbUi?=
 =?us-ascii?Q?3OcthvQmeuHO3PtH8L9iKY0VpI+GkWiWBgBNad0zKN3+im+0jbwXf44d3qrX?=
 =?us-ascii?Q?IJrZ1IUlUxEsem9pmS3vab9DTcSaxTkKKRgj1fkR3CDETSQpMvrWOIdrMRKV?=
 =?us-ascii?Q?UJbhfwGUA9JsCoPzc6B4DPyHE6fPH+sNZDs+77VroTpGBtwirqL8HAyO1tE3?=
 =?us-ascii?Q?yOXiXoev+/M0d9GDyLcoKFUvhkjimdLpzqcnMBnvBCyxKx4x1mN8MqoMwYdQ?=
 =?us-ascii?Q?2zvPjKnnnl2VOd52nAoQQnbu4WyAVwqaBDOJsQB37H14SI/gFHu5VisAr+iQ?=
 =?us-ascii?Q?pciSV80RyW5AT2IWns4CzUB/fPRCX5dBtRvPZ14x+ugx77XZ5JQdZq19V+5h?=
 =?us-ascii?Q?VsOZpMsSEF9a9E8PwCA=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 21:41:33.7735
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad4398c2-020c-4cd6-38c6-08de376bb90c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B370.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6442
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 09 Dec 2025 21:41:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19334

Add then initial recipe needed for 6.18 development.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb      | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.0=
1.bb

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb b/=
meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
new file mode 100644
index 00000000..41adcb2b
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
@@ -0,0 +1,9 @@
+require u-boot-ti.inc
+
+PR =3D "r0"
+
+BRANCH =3D "ti-u-boot-2026.01"
+
+SRCREV_uboot =3D "c5e6d2ab7eba68cbfb600cdc131c0c375ced2ec9"
+
+DEFAULT_PREFERENCE =3D "-1"
--=20
2.43.0


