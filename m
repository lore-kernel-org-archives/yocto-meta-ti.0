Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94A61D26D7E
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 18:15:21 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.36])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16548.1767982516293018720
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 09 Jan 2026 10:15:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=tHRwWxuR;
 spf=pass (domain: list.ti.com, ip: 40.93.201.36, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rkZkXVTM/AxX1kTSajYMvJVbB2ARxCiC/j/QpH8tEzsRuwmGiwNWeYyDcgyKXA58Pr03w8nwKcmnqPyHhxyzZX1Ta2oNWZqsIAPgDW+PND8Ay1pJZuQptCiAXBA3wQFsV1IGBS+QKDYkqyFbAytYvjm0wlXxOpDW4lXhRvnK1GuXANelVXGZja5MVTtl3pkZgrdtBSf7lNZk98qxTZIPqGCOSbvyoQa3Ld9O8eHyNR+8CyUIIkC841x4VuT/gDGqR4+vVO5WvvQPn98dmrRGcYMGF1wq8SFDueBl+6N3YE1wY6nax6DscM4k9m9g9J7Wa6R3oWSp5v0xq4n0jxO+8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0cs8qdJWRpOfPpiQEfNuV6Soz9HMzApimKr5ZlT2FD0=;
 b=I0wwAtRgSZfv/Oe4L7etglQftyinaWP8s2ktSMgQp3VDZzX1xNHiJm4yum4Z5Sv/2EWwlI0SDGU1I6ARVokcLI8X7eg/u1i7Dr6L/yviBfzbp4uCmThFghuotVCNNcoLb9DKrahcy6KTpM2jVXR8CrFpL9m15RGdpY1LDMdLnxEGLiANdPMagzHGSIk2Dz5j+fqB6oYGd3+FrGxnCAQNuFTU+Cqnn0yzdA1arKBeS8eZA014RvTNdK1Sg1YfUaHkhNdXXkW7uKV9Eke+MlUsi0VX84Sp45OgXwrmP8E69W/74I9hgVbS3i+RuOH9nhx+4BwPqQ6IflzEzVt3Ipd5Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0cs8qdJWRpOfPpiQEfNuV6Soz9HMzApimKr5ZlT2FD0=;
 b=tHRwWxuRtQ+lmxMCJWYFN6VMKI7wWiQIB4sWJSlx3m/+fKG35pl/k5J8cp1RXNDG7zh7jfAHHs23P7+LPXNSJZsG0q9zJALsjQbUZ0+yUpU1yCBM+e8Ov0rNQLTA2jrqgALK7BjMqP+JWMsd5gRxaZuMdhNU83CTLkGdXCrmiD6tQ1aP0/JQLbyzPZOwuc5qlEzk4+bjSJ+ixoYldhMLr3tx6osQ4/TbeGwMo4vdkLpZI/Hm6cZuVZ1950oMQJDUmDBw7mdcaEgKLC1/uPQbT6uOV+IOwt57OH1tFAgzYOtwMnHI6oSqc26Ta5POx/CSo5OJmFUz+14R7wlUwpvQ2w==
Received: from PH8P221CA0052.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:346::16)
 by SA2PR10MB4684.namprd10.prod.outlook.com (2603:10b6:806:119::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.5; Fri, 9 Jan
 2026 18:15:13 +0000
Received: from CY4PEPF0000FCC2.namprd03.prod.outlook.com
 (2603:10b6:510:346:cafe::e4) by PH8P221CA0052.outlook.office365.com
 (2603:10b6:510:346::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.5 via Frontend Transport; Fri, 9
 Jan 2026 18:15:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000FCC2.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Fri, 9 Jan 2026 18:15:13 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 9 Jan
 2026 12:15:12 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 9 Jan
 2026 12:15:12 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 9 Jan 2026 12:15:12 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 609IFCIk2279645;
	Fri, 9 Jan 2026 12:15:12 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 685E29ACF4; Fri,  9 Jan 2026 12:15:12 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] ti-core-initramfs: Shrink size of initramfs
Date: Fri, 9 Jan 2026 12:15:12 -0600
Message-ID: <20260109181512.3922275-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260109181018.2453840-1-reatmon@ti.com>
References: <20260109181018.2453840-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC2:EE_|SA2PR10MB4684:EE_
X-MS-Office365-Filtering-Correlation-Id: 1da6f93b-f635-42b0-8699-08de4fab085f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|34020700016|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?pK0aNOc8Bf7m3o99M5NuwqHGl/MjgToRDUWgDUCe8DYfFlPa5d85dk3QWCjh?=
 =?us-ascii?Q?8NeHwQn9gZb+qVdxlSwHYiZes2DkNetn+xsm6SEA8S67QYaz8b9AT062uRpx?=
 =?us-ascii?Q?W+ODTrL3dMxulN5AiRiRJIiQWIUXHKm2DWrrwJffq0ka6x2dgFiaVKK08BD5?=
 =?us-ascii?Q?7raBW4yo++nycbf9KxdlOyTXs8TYESteOGgGFyfz1xU0iFzlVddP0YDYBwTs?=
 =?us-ascii?Q?aCXQ58SC7fWHALm0hEV7+J3tEnwm4bpKHWbv8ECskLCRvMzORojkUvLMzt4k?=
 =?us-ascii?Q?iy8cTjUYTX/0m91GQFVy0axRpD4YvmqDbBrCTAzZX2L4Uw3CK3KrFQVojvXc?=
 =?us-ascii?Q?oJom3I60BczkQvs5X3CtPksEb9Cw+Lh6CkLAr6gpqihuCwsK3bQrDUXt4cnH?=
 =?us-ascii?Q?kxx7dPvU89bFQqkCZjEtvUnakpY2Dult7r9CcPkq7rlHQEoxcpQJsrFpqCOx?=
 =?us-ascii?Q?VdS98d686T112wRJvZBD1c4PwMHbxqynC/C819U8mMMpXfiQuGmvSDWWI9g3?=
 =?us-ascii?Q?tF21DtO8/XwhwJ6+mXPdXEjmj831qFU7J6NMF1LJPtFvlEUC/lemC2DW1NCX?=
 =?us-ascii?Q?8SaQn0rG4I45ZsneMCYSxqL/hBAHB0kKkJKH9007ZP2KUhqqf32eUkEz5c6M?=
 =?us-ascii?Q?aKuYAnV2wakl4r2jPz3QRWQjb+UumOW49AaiNKKNVEDZxAMMs5BZ1olquhIO?=
 =?us-ascii?Q?HR7NJtrTGz1eNI5+q3f/CFk7y/+SOt1c25FcM2jZKEogfhjvTtvjZgAPmi7b?=
 =?us-ascii?Q?f+x8+oYjV7vQ23zX8/T5/B6uyhrDRcHZKd87dwTuJ8B3o1VF43UDD+YvmFRz?=
 =?us-ascii?Q?d2TSQ49lvkBmQlIH3Ifcum9PG3WKw0BCUTkoMjmSMbMCUJEXSYLQPiLRpYIV?=
 =?us-ascii?Q?KT2i3nzFKXccYIFY2/K2k+QdmnSVN0SAmqQQn+TS1mjIQV72/mFYTMoT8Hzt?=
 =?us-ascii?Q?bpZUAy/DYv1hHE1Go8mXPz5UPkqHreB/ucolg7EzmSPxbGp9X9TlfcR25yd2?=
 =?us-ascii?Q?w7OU3UkI+wsG3JifI9RAgAej2QaXpFJALDNVZ/ycfdIAmPgqeo/QHa50nYZQ?=
 =?us-ascii?Q?MVVJ8R6A6+1XVz8Oz75m5YNiHfZpneB+CO05o5105dTmn6eVXNd+PmID0TUQ?=
 =?us-ascii?Q?iqO4c/sXONxJMYRolxJMUhyyB9ruFQwP03WEgCJSs8jlFzYyXpozi/kTYm/C?=
 =?us-ascii?Q?S3oSpYkQ3oh3kLpc7VG2B7QaLFcdWaq64twTVCz85j3YinI4kj7ZePtb+7Q6?=
 =?us-ascii?Q?E2ewc9rcM3ZtPvhoiL5crRli6Hmg3UDi1c0NWY8IKs9HEigXWtF2d5pjx41b?=
 =?us-ascii?Q?zvCxlvyURoag6DPCJ7bXy4PzGA5YDMnmI6RjnEeO0NQFCssuv/PiOEgllxF+?=
 =?us-ascii?Q?SwKAUGL+4s/f1Kt5U2Nw0l/JOfXK/XWdO1XeIiMSO+Ohhj/we7AN0tXOuJPs?=
 =?us-ascii?Q?E+gRrvTnBZIfGnebhxRQ22hvIId1hDDhz1mBgNQJWPYyZWmIJ3jY/L+mtbwO?=
 =?us-ascii?Q?uJY4bckBepbhcUdBfKRppL9hiGQpE2rnsEA8boWsYMKFRJkvX7owRss+AoP2?=
 =?us-ascii?Q?VOw2CuLO11kkfunjzT0=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(34020700016)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 18:15:13.0833
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1da6f93b-f635-42b0-8699-08de4fab085f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000FCC2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4684
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 09 Jan 2026 18:15:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19399

meta-ti / na / 20260109181018.2453840-1-reatmon

PRC Results: FAIL

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
FAIL - [meta-ti][master][PATCH] ti-core-initramfs: Shrink size of initramfs
    ERROR: Missing License-Update for change in LICENSE. (LICENSE-UPDATE-2)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887




