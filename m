Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E71A4ECD9BF
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 02:40:28 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2776.1770345626231693808
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 Feb 2026 18:40:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=SJkqXsd4;
 spf=pass (domain: list.ti.com, ip: 52.101.48.53, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vtvOdZFeM9zQpx0HAdu7UXNLkwnaixgQs4uJ4NcVlz/dmj7xGMGUhyfleUwxCeEgNtQL8j6F+rP/NYllG6R4hvdWEEixTLN1pb6DgEB/9YuY2/4WV7LtNBwVuQS3xvj19qTenimtSjWBEqt9XiT2qjKRcXb/tHTUxz3A931J/7RgGNmzEd0MOtHbIeVVyOFES6NUVKnOnF1E58JNRCHh2MKcwqFLsN849va9dtJ97dl9sA1QRw5jo2XzqHIBgBVKwNAqXCUmpqByNu2b8TPchkgnGG7XIsJXBXvupco+7mtuWelP/pl1PJYyQezcyEPqh6x5hEhxQ+51wBdek59Gvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vPs3sGMkrsgU8c3WMSOjIsqGOUiWdR2WqIbqts36U70=;
 b=GG5x0rQ1N0SDHytsuI0wykCThEyu4d9kwYLi7jIc/797T0qKHpkIE2gTKhxPqusgSfrSJyaxdXC23WmZy5FYXDofVAWWiozzCdl/kCKzs784XTiWUZTbADwf6wHMszNoLODQgH9Q5/vq2xiRnQrpipd77e7isx2KTBHpdhYn/m2QdnZ1ypviN5NiH8qf2ayHb1sbr8mYQ+9hQisJxZZfu7fAn/CZNINWRmlwfHms48/L9VHO28A8tfl1BsRziNiCxL630Y9hEx7OY6PhFG3sJODcrNlk2wfKM9/0BHY/m2M8yVGmPZ6rX21yacObLBuOdsZcri9sQTqfD/HY0bvFgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vPs3sGMkrsgU8c3WMSOjIsqGOUiWdR2WqIbqts36U70=;
 b=SJkqXsd4fwMijaaHVkhlcrzvYbTNVXgV23VwY9zjYTMRZVf/tOZ1bVhN16Rx1AF/tN9MHPhXR2KdVWjuf8sKH2aAF+Uoz2onynMlAItoa+AazgbX1KpEe13UWK5zjChLbwOMcOk3EQo/1ekn6j1iDdIztt3zPMsi+ao6s0hMzPKTJ2xXndj4zCab1/reb688cVKrdGAbU8JoChPI/WbfP+cbwE6kaRiDQQ+O0arg9SLobxl/Y/DYbCSjQaXbcLOUft9zcgSM21Je8o3FBQyjBTsShNOfJuyWmo9S0DpPZbAp5paW7cWS0PP+VGuTNbX0ZIV5wA6jG5kMFHcMuq2D7Q==
Received: from SN1PR12CA0100.namprd12.prod.outlook.com (2603:10b6:802:21::35)
 by DS0PR10MB6053.namprd10.prod.outlook.com (2603:10b6:8:ce::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 02:40:23 +0000
Received: from SA2PEPF0000150A.namprd04.prod.outlook.com
 (2603:10b6:802:21:cafe::1d) by SN1PR12CA0100.outlook.office365.com
 (2603:10b6:802:21::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.14 via Frontend Transport; Fri,
 6 Feb 2026 02:40:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF0000150A.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 02:40:23 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Feb
 2026 20:40:22 -0600
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Feb
 2026 20:40:22 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Feb 2026 20:40:22 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6162eMw54116481;
	Thu, 5 Feb 2026 20:40:22 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 87CEE9ACF4; Thu,  5 Feb 2026 20:40:22 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master-ltsprep.202602051800
Date: Thu, 5 Feb 2026 20:40:22 -0600
Message-ID: <20260206024022.3826847-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260206023526.1046465-1-lcpdbld@list.ti.com>
References: <20260206023526.1046465-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150A:EE_|DS0PR10MB6053:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fbdc598-0b75-42be-6a17-08de652913b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rtX8ny2bFv2qYdtaI2J9OqcpfZQe2J2cyfhzQi+TwlYfXU9gmXNbWFxCUAUw?=
 =?us-ascii?Q?nR4uV67GTE3kC16NQyp778cE5YXx+ifS2gpVHWUPd/cy84T5F7pujftPGenu?=
 =?us-ascii?Q?2FL7pXbbvQ/W9RUfXxz6/6iuWtGAwth49bmCBjESPtoGVBrXjIUw6/w9Z9kL?=
 =?us-ascii?Q?6wtuCEuW5/8a5pAbkWk6XbqjVBQS84KE+xOVG6grf55piP+diJRasM0IN7FT?=
 =?us-ascii?Q?4joaLnRc8VxHrbpandoZGKaIGtjL/XXb7c2Au8vAuXeDHOvJ81HmodxF27F8?=
 =?us-ascii?Q?1N6V2PfpAFtHZ2Q0HzgDdY/rLyREq9YESapKDi5YRWinOTqIl5WLYAkeUf3g?=
 =?us-ascii?Q?zG0IpVHItJfm7mDVfwF4TugUJnHqKHd8ayo73KKkTiS5RsDWQuLfUmlkn9Ha?=
 =?us-ascii?Q?kzHZKsv+lx1migtivHojk1BJzTAHBVY4MbBaugfSryktcYTvALErQxkcedPI?=
 =?us-ascii?Q?1xt+8yJF9b2cnmKQ2VS0cSv+v/fij0//45t1earE+r1AcAcFnC1gbRlao34a?=
 =?us-ascii?Q?BQYDtThZA3HI+DKJdSjyJ35M+ZDStJp9PxcewoIzZcSaQm+Y075NdyavpXlL?=
 =?us-ascii?Q?ueOmXDK4GTus1gnq4/Hr+ZN9a874YEkEQQuyy5ZmLFM+VLf/p2DRa/oRYs3Y?=
 =?us-ascii?Q?KIPlr6uJaGfD5kGl/L9IsRnjg4DMBBVUl0yxA4KqQfF9KJTJN4bPjT+i71nr?=
 =?us-ascii?Q?H7iKqv/8gQXlo/d40aoamtgVRZziIRgxcFANY6E/HkFOpIM3/ccCBDqxiuGv?=
 =?us-ascii?Q?LbLcZi8vvBvCv7J444nsbqifZ0auqV2iyhqIk6gmbkMZBMID171rAIqy+Rbh?=
 =?us-ascii?Q?tuzp1JGcHo8B+ZklUDL+UG0w+wfgDxmLFpvbWcaxEUbFyDEPPyrh9qAWB14B?=
 =?us-ascii?Q?aLNyRjh5gWnyOs1cZshArpKZFgs71QUI20z3HfLJV1w6XoVjveFytcOx/Jio?=
 =?us-ascii?Q?tUYHlz98sQ9tioi+YJgmPnBNvIws9X+A8k2STrbqhKYrQ9n0oHsJ1EJwJV7z?=
 =?us-ascii?Q?IidTYy1WKr+8EZJjZLzCZQTw8EjAaf+FYndxlSVfXdmukGOY5YX8Dv/Jhu0K?=
 =?us-ascii?Q?ttG73gpFmRwSWAZRC6BUe9NU02zQyMYe5vrBhLldTtldjcVvoAQAEiAgp5aM?=
 =?us-ascii?Q?USDUvs8cTGKQp+1GTHcD+Z70Db8VXTRCfdnXi6oA4p332SbTPT/As3z6Sfjr?=
 =?us-ascii?Q?JjN70m7J8eqEn5MfAHJsMEPm/cLJ2JzeNcXsdBTqoL2MW3yEEhw4R+r3E+g1?=
 =?us-ascii?Q?iUCb+aXJHAwacXXck/0UKwR73gdQ+8e+fo6t4tWSP2OgRju/qFnfEtbBARoe?=
 =?us-ascii?Q?9OTUObTFKuBii6rYSbu75E8gYJZNPcoy5uf3ZZeN2XNEiWBtEVHB4X8v442r?=
 =?us-ascii?Q?iFofBIV/XkNh8x9uxZK0QbhhGlxp6mzFqn7UIl4YbbmgIkz0JtxiEF9WA6KE?=
 =?us-ascii?Q?9E/TeQuGVQsDllaNSJc1E7Rmk166Le8JWf/kQY7MMk8i9YYppq8rfReqSKC9?=
 =?us-ascii?Q?bxfi6I33QwithdOcjE3aBba5XdnRmaWDPUvtTqOiD46NaMaE/thRakePWgfI?=
 =?us-ascii?Q?5x/RbZ/mCyzHngQDp32NbP1M6U9Jhwlc85yD57p8P7ZGscgRe0sGQX1n7eAD?=
 =?us-ascii?Q?TtL9vbpn9QtmAno5RiGf7C33xJfBi9qlOwNKK/QeoYDaRWk5WmommYsYMX39?=
 =?us-ascii?Q?LqILRA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	lF1mQ3/DzRJy0Xl62tzAeQamKXjmna1CHlDWlbQsB0Re6Y4FG2mEkDD6bv2TwRLpmi7BRP5GUgMLKKS7kEzKQttZv3wmEpUqAN38VjXuPSAbxlhaBxK7DiSP8/QRG5LGDcfpaFAQKwZ92XL0dGJlDVCXDG/5jaSsFLzMmmc0slnexubpM/SyfyQbXPp47XNZVIXmDVnTeA9fE2okZKc67VD8o1JJU+TUU7/9DqPQk+IwukuXHEra8hLtRyZwgL+BEv4XncyGE7x4Ebzv7eFv438W0J7jWeY/CRLYolj9yk+cjaxPvQQM4UtQ33SL7vHlK18l+yLNCh0EBJ+hTXXVoJZcNaeSklLfF3xU58BXL0jP+ZACXcndwGo6efjgxcUkYVAZ1rk1V8F0NlKb9fiMuNLNy9MCusZIZC+O/OJqpi6RPFwT5VqlSZmGmQVUwIVa
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 02:40:23.1396
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fbdc598-0b75-42be-6a17-08de652913b9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF0000150A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6053
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 06 Feb 2026 02:40:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19463

meta-ti / na / 20260206023526.1046465-1-lcpdbld

PRC Results: FAIL

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
All patches passed



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  apply-yocto-patch: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master-lts=
prep.202602051800
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Thu, 5 Feb 2026 20:35:26 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 01c451ebd024622db451dabd7593069ab=
e6e03ff

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Vishnu Singh <v-singh1@ti.com>
- Commit Subject: recipes-bsp: Add TI PCM6240 ADC firmware recipe
- Commit SHA: ed9cec65ca549410f6fa6e288e6c52eef2fe25f8

Patches
----------------------------------------
All patches applied



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-repo: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
FAIL
    WARN: You might need a " " as the first character for the :append. (APP=
END-2)
        meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc:37
            SRC_URI:append:k3 =3D "${TI_K3_TFA_CFG_FILES}"
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887




