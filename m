Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9208CCF9E3
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 08:49:11 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13543.1762246150568140195
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 04 Nov 2025 00:49:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=au6dF9e8;
 spf=pass (domain: list.ti.com, ip: 52.101.48.42, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IVxaeemGN4FCFssalgEiMkmc2ovq6fcOYzisQ0EF3NqQcsyE3G0IcA0yfI506xJ+bfxB4MYNJazOAkDh0OHoNmGCmwTZ2tdDUCr+FTrINbSLvMumzjvIoT6Oh0R+G44R6oUjMkfZdmzMXIrkH2vUY68mhasxdwL08vmIgLTjfM9ItWFn1vW+hOIbsiM811O0uUuhfL4E0H+0a+E8AEHcOCQLt4ekvl+TrxCvwu3/1I59rVTfiYq+7eTFWXjE3Q++AKq+Xh+kuVSXojNNVQDY6XDgCoCnaKOMaxb+e3bpgDj5ckx5cgQUFHvXJqaPiflSghQbD9eTmATQRmACvQyTdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x84oRQB0hTGTKY9mgKfyVshCxbCYvb+uMOx6RGr7Ors=;
 b=yKZEFQ2s/yGZTaPM4XQnOcsAG5xQu8Hbn5oERoLU3RkFxkJcOSvCamnPeSB2+xoCgfWUQeLJxlbhvqbnB5qsqJCntO9qwUN2+TIQjiG+N6z2Jk7OkGRXbVEY5gI4Cfjk5T0O+hdZ6GoUP2Zs+AHRMlsE8S7mnb6NhbRM0V4qMYhSs1f1hm2XeszjzVIpi2FhVe9Fy8Zn7Fo6Zo4ZmMWJzmBioq15VOq2JTqshC6+vowaWI7zNgpAk0lCmyVW/eQCYLsC85GYke+W7OB19weoA6/d1CM7KSnariMSKgHTHfCi6z3pu5d+QAMkJ+1Xt5rafwk+hAhHQns+giAq1hbP7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x84oRQB0hTGTKY9mgKfyVshCxbCYvb+uMOx6RGr7Ors=;
 b=au6dF9e8t7BQZeewMWF6IYW7TRF1ilk7z95TFaN7QqbBVCM65se1wrb2AMPm04+OuzHMMk7kE5IGBVAWJTZGeGeJKfoQ0xwJZI/xyK88UMp+0PNT7e9/0reyYoqYxk0NnQecKsOmxD/FHggiX4n19p6CWfB4nYkDNXaJv+vCcVpk+rUr+SwZXnX4KrdsgCh0Z+UZqN3aX3Vt+MwoYXWgAoYk0t+DjvBcwTsO3vlZn5DO4PiK2C/kZjnduOKbDFe3XYNgVbxj4crFu1i3rlQVjgs9JRo7D3I4XFcjdKShuRoSObJA1Y4CqXxTZ0L9dtT47uIXYtuezXl+X5dzD1O81w==
Received: from DM6PR14CA0055.namprd14.prod.outlook.com (2603:10b6:5:18f::32)
 by BN0PR10MB4933.namprd10.prod.outlook.com (2603:10b6:408:125::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Tue, 4 Nov
 2025 08:49:07 +0000
Received: from CY4PEPF0000EE3B.namprd03.prod.outlook.com
 (2603:10b6:5:18f:cafe::8d) by DM6PR14CA0055.outlook.office365.com
 (2603:10b6:5:18f::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Tue,
 4 Nov 2025 08:49:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000EE3B.mail.protection.outlook.com (10.167.242.14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Tue, 4 Nov 2025 08:49:06 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 4 Nov
 2025 02:35:15 -0600
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 4 Nov
 2025 02:35:15 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 4 Nov 2025 02:35:15 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A48ZF241614587;
	Tue, 4 Nov 2025 02:35:15 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 195FAD6F2B; Tue,  4 Nov 2025 02:35:15 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Suhaas Joshi <s-joshi@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <kamlesh@ti.com>
Subject: Re: [meta-ti][scarthgap][PATCH v2] meta-ti-bsp: optee: Add flags to enable RPMB and PKCS#11
Date: Tue, 4 Nov 2025 02:35:15 -0600
Message-ID: <20251104083515.3102339-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251104082759.711246-1-s-joshi@ti.com>
References: <20251104082759.711246-1-s-joshi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3B:EE_|BN0PR10MB4933:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cce0aa5-ca0e-477c-5ccf-08de1b7f03a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|34020700016|36860700013|376014|61400799027|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?oTd867zFM4jPLWSex8qV2d5ldPytnmTZcvRUg+W74B4dyCnz/1TRVkpVD+Yd?=
 =?us-ascii?Q?ECa1pJTkkxV4M1Z7xo4fVdPhTJhq8I+YVzrALzQ7+XxMw8Q8WYgZHsTBK3/a?=
 =?us-ascii?Q?UET86eHzTITt+qD/7YBzYUK80hGEMed9HzEjS2vpcrQbCHY53uaR1+HmLa9v?=
 =?us-ascii?Q?Dr4bjY3ydrSdh8Y2aDoofdAqPM2wrJKlT2VPoGRSExYvCE3hK7s3azyWIGhX?=
 =?us-ascii?Q?ItKgFSI6BMkwAcKuJuVdwKjWLAsiPPGfhJ6ZZein5lTKVSimsVWi2Fl4WjE6?=
 =?us-ascii?Q?ERJNF3lYSp+q8KkFRkLBA7RrPeVCdHv+ou2NBFMVtjDCS5tLrDPW0857GP7k?=
 =?us-ascii?Q?hRAbdwSUyJBJGvu85bFhetPLDMRWfPyZfri7kqWWCBUGgmAuIBmm5mij+chl?=
 =?us-ascii?Q?CwuCng3oW49vVP1Mq3opTmP64vvQY5Rbg+t1wQtf4FRABbmU4NgFlW8ntwLu?=
 =?us-ascii?Q?sbYQsTYykuOpaJseQjAmoMZ6kQbt8pw99dDjOwKnHWNWJy08p/ZXxQL1o+M4?=
 =?us-ascii?Q?sIVaiOpQ2kHbSFDlQ8JUpeV/VZxBtYJSDJKFn557kVt8qDRchdIWIc/ZeIW8?=
 =?us-ascii?Q?kz96b2rgZrMFhevlYN/PXHz2O5oGqGUNEdkSeqCABS3LckXvXPpONJnInOIE?=
 =?us-ascii?Q?WQFkP97va2K8EqNjXMQOpxlzHRmR+kYfy/fSmoyrYyImFFEWQ1v9cgOvuofA?=
 =?us-ascii?Q?6sCYUqAZHc0yVoBgcEu8J8R4l2AYPUDuJp92Oaut3mb7Xj0Xi1YbN2W/vdTn?=
 =?us-ascii?Q?ZiClnnSdJxJ9eKRJAewWMDv7KlExxfCARGHvu79tsbhl6KuL9iqaUlqWG5c0?=
 =?us-ascii?Q?nWZXjs5oXLday7ilbIitIViWq4Mc9wBq360NVrq2InVELkSV+uMDHrh997jy?=
 =?us-ascii?Q?nm8YG1VjJoQ+nKAiCxw6x0ZdYIqh9HMihBOzYqDyEoisNJ4vtCNneUE4ZN7O?=
 =?us-ascii?Q?e9VtTWL3ETccxt73taPYOfRpQGKQ53ZuJ86J4bryVFCJpFe9kzPcW50TUfN5?=
 =?us-ascii?Q?0EyX0tVXogQYjUQGuxB1lJpUW4OrzBnfh+UtNbXFZRdBV9MvHCwoSVLDFjRT?=
 =?us-ascii?Q?kGRyVUYlOPJ+vTu9G7mjZutWM02hjXbHWUUyMm/FSstweRhve784pa7tBJPy?=
 =?us-ascii?Q?8MGS4WrLJVXm7v+qbfs17EnZNs/cc0g8uD2gv/v6gewk+gqoTOghKsktvuX0?=
 =?us-ascii?Q?iLXKqgabTy5ey+KRmcP3ThoOfzgs7H+1jq2P9zePhZlGsEsYtYUNwe4Y0Jqh?=
 =?us-ascii?Q?QRWn+pbUi7AISetuV2oN7qMnuLeSeebwCqrXJG0QBFWxo50hkqumXQ1rUA1F?=
 =?us-ascii?Q?Zdg8zq1XMB6XXL1rMTyb3fO47J6wZ1jsZoRg3AzH+NTB3NZo98U6Rvl8D++s?=
 =?us-ascii?Q?iqvIa7iUWmJdcC2BuFtDvDrTuWTs0oWppJlIKJPqD5j7l6hOOdPipFzsLvIs?=
 =?us-ascii?Q?PwjX08ZpXTKAi7PQgaQWZXshgJXhnLgZ33LUxmxVWYevF2P8d1OG4lKU81bM?=
 =?us-ascii?Q?Q+NPQ1Fw2HN71AwnTsqlNaURYaJTfzQkIzBrXQ6K8eaEJLci6cXfsELPwBxK?=
 =?us-ascii?Q?F+1L5USGUXxYYe9Ug6c=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(36860700013)(376014)(61400799027)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 08:49:06.8715
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cce0aa5-ca0e-477c-5ccf-08de1b7f03a5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE3B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4933
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 04 Nov 2025 08:49:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19224

meta-ti / na / 20251104082759.711246-1-s-joshi

PRC Results: PASS

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
WARN - [meta-ti][scarthgap][PATCH v2] meta-ti-bsp: optee: Add flags to enab=
le RPMB and PKCS#11
    WARN: Commit message does not include file/recipe name: meta-ti-bsp: op=
tee: Add flags to enable RPMB and PKCS#11. (COMMIT-MESSAGE-2)
        patch
   =20
    WARN: Commit message should not include directory path to recipe: meta-=
ti-bsp: optee: Add flags to enable RPMB and PKCS#11.
              meta-ti-bsp: (COMMIT-MESSAGE-3)
        patch
   =20
    WARN: Revised patch missing a comment. (REVISION-1)
        patch



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  apply-yocto-patch: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-ti][scarthgap][PATCH v2] meta-ti-bsp: optee: Add flag=
s to enable RPMB and PKCS#11
- Submitter: From: Suhaas Joshi <s-joshi@ti.com>
- Date: Date: Tue, 4 Nov 2025 13:57:59 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: afd486232381d1996ca3a09c8a7c3151b=
ca4d3c7

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: Vishnu Singh <v-singh1@ti.com>
- Commit Subject: ti-librpmsg-dma: update ti-librpmsg-dma SRCREV & LICENSE
- Commit SHA: 879abf6914437e3a4da45fd515f33ac583bbddc5

Patches
----------------------------------------
All patches applied



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-repo: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS




