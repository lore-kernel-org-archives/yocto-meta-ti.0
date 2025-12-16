Return-Path: <jm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15C47D637DE
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 22:17:14 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.57])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.304.1765923429833412363
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 16 Dec 2025 14:17:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=v6NsL2O5;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.48.57, mailfrom: jm@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d1yWqzwzFeY5HoWidgSSTYnObUoelVNv1hkufjB+yMQA63trDceDXMPbdJ18S+8tRIa6e8AossjG/OMLcFdvxa9fi8ZHmNbpAgWmC2pOew5b2jyXIhmgYY+gwYTqzulzWSA1fi84g07DOIdrJfJHVf2+jMuhu2JEC95cEW37iCzUF6RQhq5VXX5UDlki2sI8n/IL/hgj1WXcbBQrb8EJB8cXjv9vAjKQS0mG+BH2qf+3TmDmChKX7Em3T5fjWx8eDdsCj6NUYI/1WQVfFOrj9pR3Fax4P29Q2WnjY64ZXIEEqlV083zbL4vF3GsELE+8zDgoPMGq9ogkPDURHswiZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jkEXGGElJU2PDIwm4oDuug5uCI3ZexsxIlUpsrLrR0E=;
 b=kHCuxuROZ/m0EAQOmHwLWupQQJC/AwKGDguxKHOShoVT0mHGDva28WSI3xJfXAa1ZX+ee1DwJg6pjnzZHbuBUTR7f9lWpcZw3IVJDXkhcQ5mQ9WIMrGs/vu1aLSQ34bXzEgxjnfHi+gkjskfpM/AqsFN/k/ustWOZ6GhY7VpvHCC4Dd8vOZKLtp2tZueQl/Ics+RukJgYrFALqgZVuw4EfmzCQ9ZFJy0HcedNowU0dr3W6fGY1tR5cWEfHAoO0Kc5DYenrQwMqb1aTSaNDLc423qCX9jLuWD07cg5zw8Qxb7/AKlh4IvWHchaqjkrrRxZ0woEspsgTdTUkFsVqHJ2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jkEXGGElJU2PDIwm4oDuug5uCI3ZexsxIlUpsrLrR0E=;
 b=v6NsL2O57pV20Dd29pLo9peUSMn/RfJOEz4s/LeSYRNe/cqAJfXNQ3mvqm8ZMMC9bTfvoqBoFHhyJm4ozHwt/vQY+l3YmQbi/uek6xC499ztLy1+kM4OAiMcKgcgQdHlbcZahy5MCKTvdDxRRQTxEcwdg29mTrDsSXhM6TKkWc4=
Received: from BY5PR13CA0029.namprd13.prod.outlook.com (2603:10b6:a03:180::42)
 by SJ2PR10MB7617.namprd10.prod.outlook.com (2603:10b6:a03:545::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 22:17:02 +0000
Received: from SJ1PEPF00002310.namprd03.prod.outlook.com
 (2603:10b6:a03:180:cafe::c6) by BY5PR13CA0029.outlook.office365.com
 (2603:10b6:a03:180::42) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Tue,
 16 Dec 2025 22:17:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00002310.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Tue, 16 Dec 2025 22:17:00 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 16 Dec
 2025 16:16:52 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 16 Dec
 2025 16:16:52 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 16 Dec 2025 16:16:52 -0600
Received: from judy-lenovo.dhcp.ti.com (judy-lenovo.dhcp.ti.com [128.247.81.193])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BGMGqJD514024;
	Tue, 16 Dec 2025 16:16:52 -0600
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>, "Andrew
 Davis" <afd@ti.com>
Subject: [PATCH v2 2/2] trusted-firmware-a: am62l: Update to latest ti-master
Date: Tue, 16 Dec 2025 16:16:52 -0600
Message-ID: <20251216221652.2231748-3-jm@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251216221652.2231748-1-jm@ti.com>
References: <20251216221652.2231748-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002310:EE_|SJ2PR10MB7617:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dfc431f-af92-4779-95a4-08de3cf0d5d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Apak3Z42+Z0OLY1CEZCYcywJ/DM4PZYKJwp99SRSXpPQQKL0Yi09WVBlcqV0?=
 =?us-ascii?Q?iKOywnyd8uvu0fr73g1mDcPiApxdgmqnvHqK+Vg6/rAk8ZM/EPZ4gwZ/6dii?=
 =?us-ascii?Q?Z77HZ13dVoggejCwhGmr05NLCBO2jCT4o4fbazDXrGfW4lm/WTpREvU1qu/N?=
 =?us-ascii?Q?RIesDVn9LqSNBXYgp+BUUVJXGCMotlJtXPyHsg1hDbY0Z6hb3W1SqpmWTNvv?=
 =?us-ascii?Q?mzqKsM9T0f+PffDq+oWDa12vjzDM3eGQOyvsBhq2sB5MUYmfM5v6A+N0mjNT?=
 =?us-ascii?Q?gEdHvU7Sg/97xxFx6Jcbfb8u4kyJtlW8AFIJFLtQwqFpZFA+ASUebXdtElQt?=
 =?us-ascii?Q?qEZVxTqqW4nv3uaRUNKXwF+fJkMh4ja4LrTmeKUWWUIji1s3mVUhUpe3bqVo?=
 =?us-ascii?Q?XyU8zppK8h6rRWvViV4WGu4ez8qDfkhODeKWw+1FlzIUkxHVk3xezzQRGEQ7?=
 =?us-ascii?Q?T5st2DTUADSQPincRp/fluPrSn1NstsoR1GI2W22iHkxbvIk5YoVrvOgOCGA?=
 =?us-ascii?Q?fk249ywKNV9ou2C/oY77qBLKH1qjyqVtoer4ov+MNLqjELqREeCJeIuySRGV?=
 =?us-ascii?Q?OSIQVZjETvp7SCqbzf+00+NcmpGfmfiInQOCVNH6XBNbMX/wIPjNvR2GXfbw?=
 =?us-ascii?Q?NMSm8dSYNuXaoTq0/VDpDFs5AMlhFEui8AUQci2l4DQtFNXC3sPRV3Aht1mY?=
 =?us-ascii?Q?X8ejiSavp5L07Y8gHKnukzeoYz2GBMUwncX7qzV2spVq0aq8uAARFAzI+clN?=
 =?us-ascii?Q?ViuGwQhr/w8LY9Nx+ruuJdxWFfTeYMlLx268zKv2m8PAWC2hdkhWy0Jptjo2?=
 =?us-ascii?Q?l/yMQNW405mNNiHkpEKS14daO9cHW2MWeKF0jL8IE9SMkmpQc7/CnckvbOk5?=
 =?us-ascii?Q?fS7/+ONszdQmqnnnmrEdnQfCDgL1KWiIMe6tETOF/N7Z61DlVZWhDdGT/tEM?=
 =?us-ascii?Q?kVdb/oLXYN7UtS2m9BdG4Zs4bFakMas8+PqznXl96WS9Xj5V58MrIqFm5OAY?=
 =?us-ascii?Q?kBMp9W1JEdLH2m54uHEERQK0R+KLuzM3mBDUoSgD3xKuoc9a0PGGZF0PhqKi?=
 =?us-ascii?Q?W+c8J6TGlRZANPEE9wfOCf2LqgCRP1jVBc3x07rKi0sA9sC9ATSHbfRPq6zc?=
 =?us-ascii?Q?35J8dj3GGB56aCbW/GG8Oit8Wl0wawZunE2hsUdIVJAw01nf5oGT92+b45bU?=
 =?us-ascii?Q?MV53+h1XLJM10mztrt3zkczb9BIDLjy8YYzVk69DJ6tk5IvBi4L7T0GzKCJ+?=
 =?us-ascii?Q?OuspL/vI3GwWK3Ccv5RVLwKanfU2DMgfJwyYNGuwCN3NvlWbN8jK2cXo1B/c?=
 =?us-ascii?Q?cQvXqawmD46KNMBwsCGVp79vExnyMeqS17fmVZYWbZiVWTnJ4d0l2FkXJkxa?=
 =?us-ascii?Q?FEweGNspyDq1ah9+0k2YzPn14nDXiM0OHw5W/sNkW4avwqPgSK6u0j0FT5SC?=
 =?us-ascii?Q?nRDnQpPpNih2ZI8SzesyuvgYxfWVlBJn/MEc/wYa7bvjfJfLcEWHuhbpSi1/?=
 =?us-ascii?Q?X2mCuBsa9Q9TvCXt7mc2oLTA3Qa1dDylsfyo1NrCtCUjnKFQYmI08IKsGMy5?=
 =?us-ascii?Q?1OYzYMgul6UuKKxIWXU=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 22:17:00.9816
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dfc431f-af92-4779-95a4-08de3cf0d5d9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002310.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7617
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 16 Dec 2025 22:17:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19365

Update to latest ti-master commit which includes support for
BeagleBadge.

Signed-off-by: Judith Mendez <jm@ti.com>
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


