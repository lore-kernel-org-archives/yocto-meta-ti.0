Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C530DC531CD
	for <webhook@archiver.kernel.org>; Thu, 19 Feb 2026 19:55:36 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22768.1771530933557168126
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Feb 2026 11:55:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=QIrUgsEW;
 spf=pass (domain: list.ti.com, ip: 40.107.208.12, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CyG4wuN0vXGxRFGL4uRSF77NFm+yIG0mKXbDaoM5l8yoGolbwcLlh0hYSGEXD2u6c87IojyWHKiHldOHj9rTLetALDmXZ2mCmuF0lRdYj298s955tYgwDzkgF7GoYfeie1MFfIFjJuqSJaoWbfdoRxRPr1HxCjnfNXnw1BBhXfl0OG/u1UZ+bP8ehdLCJS1kZLPu4xzwWFWhWxXezu/0iyKRLzCuYdtvSFE6XMZKkJdDlRhqQEuWw6YObaqD3vaWVLX7K0/ybnxYjAv/jvygxqpVHYsLDpshNp9Xl2IDGzmq3csA70ufdcLle5jd8idGPnTyD5nwn7SGko2WLSFlCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nydrvrdfg2xV5f51n4o53KBgrlUNfFi0v3tJCChlnO0=;
 b=F3Iud7fahe7pkbBQ6aghOBXvcHGqNJLmCc9ObCCF7R86H+rOadYvc+bj8H5eZUHCTSW5Hf6AHb4Wz9YKANyLC+LBJUdeTkhF4ubVvRAuRst/zHmBqt5xAwCN9GTCJuwhrHkmZKRRJMJRCLd4mh1Ku/wmyuDeqx5yQuunZHP3kqWeMru3zd7ZvesA7uzQ4b5jZlMcIDUaYQOj8dZAX0n/btEnG1PCLK1OwFA4wx7asOyQ4S9VDxkhKQbMk2QLoy065MgkZS3emUNU7suupuhu17XUhweAx6yNx8o19K6rL95NHYI9knmjwHQzMk2hZakglOiZ6AB8IMM438XnXGFZ1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nydrvrdfg2xV5f51n4o53KBgrlUNfFi0v3tJCChlnO0=;
 b=QIrUgsEWCWjGXSWLTwVQUtr9qFwMRmdFV3hG0xlFnV0TRyu7LzmGAMKKDq4oKYea/GkXHwozaC9UMk0qwY+mzlNSzidAL/lg0nDqCRv3tZEFfK8JoYepPrJMoFhj9z5jEofL+SNbX2ATefAsoZpnYURDXcexOrEZOCRWE63+JkHzGtbPZ5eLqkfRRVjVo+Z+BCq/q5RRQv5SnuGR2FI9TXiYeheujcrLTUsi4AeSo3TBQK9j5VC39zIg/wXYUXXZCtcL03Ad08KKct3tQShvj5hTknz/RiLp+v7iA7EKjSDlOFQiwkClgkHC79s0nccUwyOpqdHZMfUf3tAXhQ22KA==
Received: from BL1PR13CA0426.namprd13.prod.outlook.com (2603:10b6:208:2c3::11)
 by DS0PR10MB7090.namprd10.prod.outlook.com (2603:10b6:8:141::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Thu, 19 Feb
 2026 19:55:31 +0000
Received: from BL6PEPF0001AB53.namprd02.prod.outlook.com
 (2603:10b6:208:2c3:cafe::ba) by BL1PR13CA0426.outlook.office365.com
 (2603:10b6:208:2c3::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.15 via Frontend Transport; Thu,
 19 Feb 2026 19:55:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL6PEPF0001AB53.mail.protection.outlook.com (10.167.241.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 19 Feb 2026 19:55:31 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Feb
 2026 13:55:30 -0600
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Feb
 2026 13:55:30 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 19 Feb 2026 13:55:30 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61JJtUGb3191154;
	Thu, 19 Feb 2026 13:55:30 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 42BD5138B5D; Thu, 19 Feb 2026 13:55:30 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] trusted-firmware-a: Updates for am62l
Date: Thu, 19 Feb 2026 13:55:30 -0600
Message-ID: <20260219195530.2958691-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260219195158.4121184-1-reatmon@ti.com>
References: <20260219195158.4121184-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB53:EE_|DS0PR10MB7090:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e91ffc3-ec86-410c-5605-08de6ff0d681
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2v9V3a10qxwOgGvtbns4RB4RbGdbGwWK79aNhG4ISC8SPkQkK1MhiGG7jpyO?=
 =?us-ascii?Q?1gHn4jijiV2CED6xoq5+Ly5PpwOEye7FJNGetmVC4ciIcfOsznEaD6IwpvfO?=
 =?us-ascii?Q?nxAV3GWrSBhRtJ7jDpwW2fvnxnimLgcRvGx6z4z/i4TauobpYnkP0uUCO5jL?=
 =?us-ascii?Q?82jRoNtF0EqCukCGu2MbZMripwOKm5lSNto5ptT/FSepD2Pj19YGh+Yl66lr?=
 =?us-ascii?Q?EA4yNTErBixUmCFCallUhBaCyqW1xvpfe4Afzv3Gc2Ir4oIugEVVhgdCNGR5?=
 =?us-ascii?Q?jRyQCh+Cgv1CQKUNMK+lgUtx8XbMBmvW9aQUMSul5UdKz+Ahm1IEpFVvV3id?=
 =?us-ascii?Q?3q35L7fFiikOcLad0KAHcu8df/BQuLfBBXpju0O5XhCRNS5kCK8SSYkPlwk1?=
 =?us-ascii?Q?tnsZCCZy4q8BLNC3Yc4T78Tvo2GDPw2+9N1zcor/tegReK70YZlARhcZDBmw?=
 =?us-ascii?Q?J46eTs/3LOz/fHGO/BdxwOpwzSWAvxUxAWw2B1G94anvunDK5FirWKR0xdo+?=
 =?us-ascii?Q?OZU1mQ15nIXblu7BVOJjuXXU1Gq0zB4EKS2zV2LjKCuZnjEV0Ta+kiNhtFr6?=
 =?us-ascii?Q?PTyUuClfk6nZUTVYqQmsvplsoEFpIu0JaIa2fldpfdChpreB/rRgYSjCNcWw?=
 =?us-ascii?Q?xzMM4+BLHKnC6NHNsVUEHpo20U/0fSSmzLzdS16zZycjXw54SpMIi8HmTSnA?=
 =?us-ascii?Q?lC3F/N4alozIAEvwngKA8hXOaABhF5vFmSZ4n//80V9rqw8e8TT70fCMKJnr?=
 =?us-ascii?Q?0jiXsEPNBzSmPsVtAuBwKmYPVJxMhxYJdHPeg0UshDYzBAs66hhAgB71ALG2?=
 =?us-ascii?Q?24lpcEESsokj9XqqSz7n+6fZ17TAYXL53k/YngFgKOJ8nA0PYnR3+7X4rLNM?=
 =?us-ascii?Q?wWJ+TYE8nGoeDXHjXFmnFoI+wbkCO0RxE7mb6oGKteZiCiVaRUUE4W6ZCG6/?=
 =?us-ascii?Q?x8rjzXPo79cZX67PRUoYBE6n1EBshpmQAU/VWrg6i6LkVuMP49gEaVaA7VQI?=
 =?us-ascii?Q?7fg5/yLIBN+fqMjTBC/D75zxOKZrD5wRn0+OW/qcabigyjLPxoxv9q8BKinS?=
 =?us-ascii?Q?137zXPMMxbqGQ1e6IyA5pC3X2fXfCn+6sDKr+aWrTriHFWCCjA+12J/3CM0d?=
 =?us-ascii?Q?Z4dXhRYS6EB0dmpwgseWfbGi3PUViAPJd5PrJHgPZeidRz6kJ7CfZtwceGxX?=
 =?us-ascii?Q?0iEUl2IOmOaPFqACGl28QmbgkeDFt213AHMYBPww9QNmoAubCgZwzUlYEqS5?=
 =?us-ascii?Q?+t7f0dSf1kxzWYwC8ZY9dTD9zC9xMt0a9jRm/In9+4i2bvSD6L9yQyEiA7CD?=
 =?us-ascii?Q?SGiCh9iuoXSyNU/4a10S+GZ6mLvWiwg+UAE+rTCBCd73ov4dvdWAiaYvCbaL?=
 =?us-ascii?Q?Hsva0w/WuoOfzrfohYW2MIqmFCaWLq4bM6Isg85TzUwYzOd0rAJzJVdN2vLF?=
 =?us-ascii?Q?haU/HPZRUa4BcSWEporrOzXlDQt850PTau+xMNFv9MAgGBkBzOHgo0dZFDVe?=
 =?us-ascii?Q?ZgeP2C7Xbz8onP6IRHQBKknFLuMWWR1G/FgDSXZG6ZaC2Nz2n4M3cSN1/Hrs?=
 =?us-ascii?Q?kKms0mkHBQlC+7ALCTQyUKbt1xqGfrNuvGrM6XJgV006s8Y8jLAV1aH1CpNW?=
 =?us-ascii?Q?xA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	oDS0KfZGYIsXk3I2G31D4hDG4zR9ERbvz+NvdUvMJKU4Gqq9pdEcvwkXUwbW0//ie2SJRvSGurmohAwuBn1T2GmtIg6EgO+9/pDyE9gOd8sx+OdFDaPx5t6ryh5wxqul0CIslRGxEw5w8In1fmbJjQbmd0jX38E1sLxBQA6qo7auKd/J7Kzqw5cXKkJMpJ92d2A9Qfud9LwaOODtdpZiUu6oeNJa7o+n5Cdd6yM9bDTnA8t0jz8D6My4DLnwYEj9kMe+qyXcEh+0MS6+UOW8e50U5aNoQ8lnhA3cyzhjf1wuxI0D/smPFm08gQ6AgZL0OWK0FU9Rt64MAEWh2SYUZRYO4r7hHpI0GPUfLMe3deEzbnPYb9jcDs98HG5QOLCypMGFMB6l7bQKDterLliY5uEFgHtSkWt7J4AJ4AqhCw1/J6Pvn7EaDRR+yAfj1Y74
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 19:55:31.3672
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e91ffc3-ec86-410c-5605-08de6ff0d681
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB53.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7090
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Feb 2026 19:55:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19553

meta-ti / na / 20260219195158.4121184-1-reatmon

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
- Patch Series: [meta-ti][master][PATCH] trusted-firmware-a: Updates for am=
62l
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Thu, 19 Feb 2026 13:51:58 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: bca72793a9d00c7b623a538de6d9bee73=
f9dc019

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master-ltsprep.202602181811
- Commit SHA: ee9f5e1dfe817fc192908d420d840668b7aa7100

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
    ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
        found.patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887




