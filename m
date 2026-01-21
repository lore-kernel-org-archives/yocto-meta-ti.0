Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6944EC44506
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 21:04:24 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22471.1769029454469079541
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 21 Jan 2026 13:04:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=UQre0MHa;
 spf=pass (domain: list.ti.com, ip: 40.93.195.9, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h6GDOCy/zEXC4Jt/yE3AiKbjjYmROZ9hvqk/+cKZ9er/MvCef/3+HCIdWUUPnsTqzGphmd8GD0euEpcNXcMwaQZmNB9E8PZt9AVFZbss84AoJSDIPVJbGHKhe2EuBpZnlUsOWnXbtGkxDRHWjNtayN3sfRWfa1/iGLF//U3GfvwUQOcl2N3CBOIh++pRI/Z6T+6CXTUAKy6nP0CqvvVC1zP0PgIe/Fm5TePs8gPx1801AX7168W1eafHEoxINwGUKhq1rGTUl0dpIa9Wb9yrPVPbnu668JB1oqE6nvwPe7BsoezT14waP+0aX59QcxmDWR3djvUT/4fYQ+gd2wVyrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ebtOAcVmj5PkJ6gpxsLQksdE7bYNjhxMxn7tXMZjp1w=;
 b=H+VG2+mmvsirkmDybu524KtGB2PI4bNhrjxR3NiDev2SEJ56coWecNFaEFFEX/af5mA5/Y/XmUusBhJh1rld+5gPBGFxxUmsE8SQQhwVvRsUKNjbJt4sejXZr5duvjoREltaPjllqxebCHgt0IYglYdW0jAsrcykpz0T8gEqTLgQCArGGJ91o5YOqpwVQuz1Nt0LZQ4c9/dvy7JDclV+Fph8RuU0xP5T9viMj7tjc150a/dKSc22uHWMaea2BdpoytxeILxGcWYrj35AYQWY+YIKRncfhSvzBRuDjQVslcC+PwdawsU6M3hrDz2AldqlmLv+jXYzhQqOM6A+jrvevg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ebtOAcVmj5PkJ6gpxsLQksdE7bYNjhxMxn7tXMZjp1w=;
 b=UQre0MHa5xw2Uebh2acXN7vvHNY61qB48mzXA2o98DHlOoJHwqlp3yO+kvbLon8gPYGI96nvj43GFaQzPSIZXlrYT2zA9wgeuxcxk9EpzTx+Dq13rvfl5P5Oc5YajAk287u7NhYtZeRqYp+0ZvoOLy3SiEwpLMUSFHNy5UVWZ7y+zrqVdeBsWYuCTYjywA1bhu6TpyFHyeLC8cwZGj6D8QaCLg2ir0ZBt6kHEZ3/AkpjNtr6UkbOsdyjYHw8CXw0tQpFD35MliMSYLXPmuGZX/b31JO+y+0jBHj7UvbQTg+Psj6PDAExjwrc3Y5KvA+2yQNMGc8pdQRddRdfXBBqkA==
Received: from PH8PR07CA0030.namprd07.prod.outlook.com (2603:10b6:510:2cf::16)
 by LV3PR10MB7794.namprd10.prod.outlook.com (2603:10b6:408:1b3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 21:04:09 +0000
Received: from CY4PEPF0000EE31.namprd05.prod.outlook.com
 (2603:10b6:510:2cf:cafe::d7) by PH8PR07CA0030.outlook.office365.com
 (2603:10b6:510:2cf::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Wed,
 21 Jan 2026 21:04:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000EE31.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 21:04:08 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 15:04:08 -0600
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 15:04:08 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 21 Jan 2026 15:04:08 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60LL48J63503208;
	Wed, 21 Jan 2026 15:04:08 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 3CC4A9ACF4; Wed, 21 Jan 2026 15:04:08 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] u-boot: Move ti-extras.inc into u-boot-ti.inc
Date: Wed, 21 Jan 2026 15:04:08 -0600
Message-ID: <20260121210408.317820-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260121204726.811442-1-reatmon@ti.com>
References: <20260121204726.811442-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE31:EE_|LV3PR10MB7794:EE_
X-MS-Office365-Filtering-Correlation-Id: cf7a6c36-baa5-4c6d-9b4d-08de59309ec1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?appu+PMkuZB7yl4GknPjNyehlsUuiKpCceitkrFlcr+RmEU9kWEfV4wsPi4F?=
 =?us-ascii?Q?99PBWqjmoSYGGSeC8Tixjb4N9O60l7FhSp6yvlHIvg5t8d/rbzO7X24kz5VU?=
 =?us-ascii?Q?j2uHd6ZxrzAs6VuafiinnaCkN2B77umRlroGlwjDrnD8+jq7zFvBorq4a1Ka?=
 =?us-ascii?Q?ZtXhIfz3bEr9Uisw9ZMTFO24RzvxM1KdtvnEzKR4pK37zg9Qb/f0Ayqa4+J0?=
 =?us-ascii?Q?1b0jXAVG5ciuFcffIMbsfnmQSjYIlKp/PiihTZaUnFzz7Y0LXnLqFlqfSwxX?=
 =?us-ascii?Q?ApIHGMjpGJ/f1Kch2+95VLYeX9VArVHcBSiHTqpklqhfA4ZAonGXoagzNNJ8?=
 =?us-ascii?Q?FWbY4asYu5VYek1tEC6Lz1Q+J+nXWtXcRiI2F+xG1UEVV77OxvaKPl2CKtIu?=
 =?us-ascii?Q?o5chjIAs1UleoXeM7HqGHskboom8LtEld7QD2ZNVzkHi1L4msDKxK5jY7JU8?=
 =?us-ascii?Q?FS0W9CkDx6qaNBwlKwVP/IaKnTc2u4Ka9qcqRk+921XEtkwgGJvf9OrOB6j+?=
 =?us-ascii?Q?O2Wq90g+NejTN5yvlo7/4hcjJ8nznOg5dUYkExJjo/RwDXgemnUOjzqdBfzJ?=
 =?us-ascii?Q?3O3hC5tlDLnMccFf7FYNpV0p0HeaN4ZSq+IdNJjnYe3cUjwzdVokDQMdL+Gc?=
 =?us-ascii?Q?/ls3kvevl1d30D76dODzaOKN9yFI148hMOLHg9dMb5QokmVRiqkKfB1gtOVh?=
 =?us-ascii?Q?30PLLeDErWnPpb+IyV10p7SAxOhgJZP5ORNQ86wgvfWIlzr2+uekMaSiyeAL?=
 =?us-ascii?Q?dAtxduhZOJcfLIpd1lcyW1I7sjjUq+QCByeR6gFdOxCiCkrFtXrjr8to1VF7?=
 =?us-ascii?Q?ecc6drbIDMqcqc6vwlSvQASYC03dgthoXcTaHWGci1SGa1jI/i13445rbqsL?=
 =?us-ascii?Q?uQV7TJGD1NM9h/IZ3ti04qLU4+aDH6/i0UzJ4t0JfgSPDvge3HQwYz/b3Bzv?=
 =?us-ascii?Q?rgC6FW9tCU+w+PfmFLLj8zsYPnKi+4IRvZ52eaq2rjMwkxZsXXzgRbXkuCTY?=
 =?us-ascii?Q?BlKR1/0K6NTrHhm/HxE7CIihSXrBpJDMqG/7Fn/7qdnMWeBlhdGM7/WMzFhD?=
 =?us-ascii?Q?tnQe7h7XdjUIxsEm31unJBfQP6ANWfOTc6OKuIJ7jAPqXPvk8DznTmi9/Tfz?=
 =?us-ascii?Q?NsNZU2iGaid8nhZaBooS7dQkGx+YdyB6YlJViWWnVsDOGKXGXatcCNd/lDCS?=
 =?us-ascii?Q?nJll8i+OoNmFU6TZBdVmek4kx7PJDZa0gYap0nmPYuiBCTQg3md2xcAa7WjN?=
 =?us-ascii?Q?3spt5CpI+E45EjmKryO54/LP7bLFvl7qG0rL7G8ei2ENzBBKNxZVGWmqVnCe?=
 =?us-ascii?Q?FCFfhpNA3xQrne9HfrAMdcetIq0xNjNzsnbLan+NS9BPYRFMXejfOLmhT5me?=
 =?us-ascii?Q?VkbtowEea3FevmqxRpLLSO/1sakVwThgOPCfFjGTYqF8UAsbNTC5x1f/L/47?=
 =?us-ascii?Q?jZuhejKOnyCO7JIAArMx0xYZCX1jA0NmNqaLBMj7cGfpMU7/P/Nb7VYH4vyI?=
 =?us-ascii?Q?LQKzaDQ2g8crCijEX1lEOensIOhtvJhbLF/LNYjlSJHEhZPYdbFiouGTbQ77?=
 =?us-ascii?Q?W6mWXBA1DmiC1ZQgKfT4qsPl3VXgxffP9Uwbvm/WH2BYC0YtBYOo+OuYmRL2?=
 =?us-ascii?Q?J2hCC7zuMye9xqMc4BZD47+prgELeuBY8c1mPGV28nSS?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 21:04:08.9110
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf7a6c36-baa5-4c6d-9b4d-08de59309ec1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE31.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7794
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 21 Jan 2026 21:04:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19436

meta-ti / na / 20260121204726.811442-1-reatmon

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
- Patch Series: [meta-ti][master][PATCH] u-boot: Move ti-extras.inc into u-=
boot-ti.inc
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Wed, 21 Jan 2026 14:47:26 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 37f99fbf9d7bf936e2db6cd6d1a9b891f=
80f5543

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master-ltsprep.202601210100
- Commit SHA: 7ccb6f04d3b589df321fb9957884d80ad35afb21

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
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  yocto-check-layers: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




