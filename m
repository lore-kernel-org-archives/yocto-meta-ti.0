Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72C14EE3696
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 15:15:55 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47690.1770909348395227900
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 12 Feb 2026 07:15:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=AWI4rpSN;
 spf=pass (domain: list.ti.com, ip: 52.101.201.47, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rfuWAEUR4jpqv4ivSPQVwQIBPlaneczUPJ8Q5mr15C+w7pJ0r0g2NZanS+PECQV3XSWKXafyB6AunIlmRu5eEfl4sbjJNKIi7myJ2fGDsipWkQWkbpYtjAAKm7nuOn1L+W7dALWgqJPXuv0Qub2cEbsGTO1BQrj7MjHXy4HBBzHpGecbP5gbBSBFu3Zn72w0OBqQJEt1U2BBZnXmAn39jqiBNoHtKNYSGWfNohef/Vahuu6w8M0D/C/EBeoj5aJDpFbV+tNzn+SbJsftIDXlzQyK4yqBg1Q5DYgQ2u9IEaVQP4njuzO2BzEWm20/aRDaMgtPExfhcqTTTLhyMm07YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4fNgdqRFqmB4aqUwoH48F08t02P9vFqn75RwIwVeR9w=;
 b=MQnCM5+jbcPqpHOqeamXivEry4c/3rJigRdk0/y69l0OiJGEclxiuFBnaQKh7B6Jm5vfxAEOHPC8/UqFob6wcf87vByd5AebFOfFU4t0SoWFwrRrtfonAmv1k9UKPiwAOeMc82n8B7CO6vWM1wKCS3A18PxrGlUOWhT+5Osex/mYeRVoCoxUuQ5ZKD+BBBb8WhaQs28JUfdih1Oqhg7WOKSOUCTpIyG8pbwTwYaOUSB/IyQQvM3zIDZzh7L/qSC8PpKpukGI5nP/YK2Xq5lGEIE7/fivBStCyChNecLsv+IxesS0RMMBa0S5XgBnjlpftZImWN/Y5td8Dv6K5rHljQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4fNgdqRFqmB4aqUwoH48F08t02P9vFqn75RwIwVeR9w=;
 b=AWI4rpSNAEHBflHLlQHd5bbFrpjcHtorNEHTninsrnUV1nT8tUR0siyBANlwURo5AlchPgeOhaiaKVBzX9JY8TeRFHFnxuu9P8EfbEO/YjoCx9R3qvLs1hbw9lQbDqWWJzNY35CX1zIMRxSATsWt2EWdD38pj0PBzCqL43lwDcjlLyRCIbrbzj4rhKkASwyvfmpycFcLn13/rnPjE5mZnJyCasU2I7Q/jxqj1slfZSj7OkF+OcDy9YoK7z3jXr6YY9v9Q6iYgmx5Bka6PKQZOIOo0IHpYDSRBIuUcLDM65LajbyCn+cB3Y9ObgqDDaU//t4DWc0x+Qj0Ji1ewWVopw==
Received: from CH2PR20CA0001.namprd20.prod.outlook.com (2603:10b6:610:58::11)
 by PH0PR10MB4790.namprd10.prod.outlook.com (2603:10b6:510:3f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Thu, 12 Feb
 2026 15:15:45 +0000
Received: from DM2PEPF00003FC8.namprd04.prod.outlook.com
 (2603:10b6:610:58:cafe::8) by CH2PR20CA0001.outlook.office365.com
 (2603:10b6:610:58::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.11 via Frontend Transport; Thu,
 12 Feb 2026 15:15:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DM2PEPF00003FC8.mail.protection.outlook.com (10.167.23.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Thu, 12 Feb 2026 15:15:42 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 09:15:36 -0600
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 09:15:36 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Feb 2026 09:15:36 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61CFFaA83271830;
	Thu, 12 Feb 2026 09:15:36 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 87F9013F519; Thu, 12 Feb 2026 09:15:36 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] ti-core-initramfs: Add TI_CORE_INITRAMFS_EXTRA_INSTALL
Date: Thu, 12 Feb 2026 09:15:36 -0600
Message-ID: <20260212151536.3304802-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260212151051.2036528-1-reatmon@ti.com>
References: <20260212151051.2036528-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC8:EE_|PH0PR10MB4790:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b1e535a-5deb-492b-3572-08de6a4996d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Snat8rbR6DjbiwcdENI2uwOMg9wpb/X8+LzVIAsjWNP/LnWtq3v+90OLW/WQ?=
 =?us-ascii?Q?t1jhzFcTEiCHz27AKjPjpgPByS5wFPnNcvmUfZq2tLcJ6WxNc02h925CBtUW?=
 =?us-ascii?Q?8wOktBbiivWW3WRr0XiMqFp7mNLdoDBK7J0IBMhUyWJqJJhzNjLh7BLhXDNt?=
 =?us-ascii?Q?Hx37I0tYR6KQMLUR7oSr5JbaPPea5bYRn+pITMzNQkHuIaKBUStVNt0km3BL?=
 =?us-ascii?Q?n2Z/h6OP+NzbdyGhvJuuXhYY+2Pw5Ls/kjLbeRpJOFQPkq2kMH4/sc9OYN1R?=
 =?us-ascii?Q?JxsQ4cYI4r6TCIt90nLvnQhmF/FT2RQ0GLy5xrlNcrsMjCsx+4crjZZw6CWu?=
 =?us-ascii?Q?DctZWKKKDqpRY+8AZqswm0bsGJk8MWV26bT/ZaFmbiiPpBvXnFpmVR9fqgql?=
 =?us-ascii?Q?dcAEdGWPG2s18qkzRhv7LYIM++jjSDN8rK8wxBxY2QBC9rCGJMYEWKKauMcn?=
 =?us-ascii?Q?KYABjjvd34xebv33z5a8VS+dvrcJl+DiD+KM5L9R3/AJ3ckGcvBDwJ/SVNdl?=
 =?us-ascii?Q?nlIXqe6dmGt+xcGULJcjFk3FPOg04u0vPJpQnqahT2cPAVPjTnyYHwAvNnxh?=
 =?us-ascii?Q?UTnJTG6clWpdg/XdCGr7+OKN8XZAzCmZrHnUauP1w9FW5a2UInOFZJ6fXbKZ?=
 =?us-ascii?Q?vgT0FnCmatWhZFGrzT662fRzCKHBC96Ne9nKR0e5tRi/7hrLyolgQUmFslfu?=
 =?us-ascii?Q?ZdEwp4j/5DydKPezJ7UogcW1qbPYvG766/SQZWI6AZyayoZcXUL9iRK4mQQM?=
 =?us-ascii?Q?uluv9NGlCA071n4uIfySBHYDDfF78Jt4Cqy6D79BeAdV87AEj4TPvmnhFI6z?=
 =?us-ascii?Q?Jhheo5wnxS1/EgSuoOF1zCHbWaNhJKyFIAJOrP4RHen5juhz2I3kLqmrK/Yy?=
 =?us-ascii?Q?ynT9SLhJYbqZmeCp+BtHh/wVbVHrwY9flDMPdTFKQ7mbvSC8Y4uUp6jUC86o?=
 =?us-ascii?Q?TANFw1JkMApx7QBlRPZufzqXGy2zNRCqPTNCiIqDaLhquC68LtHV5/QHMflT?=
 =?us-ascii?Q?lM96FPCW0XlTd4P1mxNfojOQX7ueo9oChCxBPgiFcUz0Qwf5vcx8EuQOhrxB?=
 =?us-ascii?Q?kYwO3gSCwa3Y05oxMmC1AUsLLFml+bRbGHadyQYfsZyvj5CexWkqLYCvsoo4?=
 =?us-ascii?Q?c8us/zv6yQKt6/b912WxQ+iOrwU+LQ+OO1MX3wqdk0OBnc4uDZUgMW2xcBX5?=
 =?us-ascii?Q?9DzfmEkRq7aTN5cjbh51xSOHZSls99yKpAB18a6LhLaQieRwSu/h7hMpEfX0?=
 =?us-ascii?Q?v0k/sSXTHttGxan6fxXuWdwYBt/knOwgklM4S9UxAWMJ3e+/4EnKpmvSaFdT?=
 =?us-ascii?Q?LFLJvM5H2vUfxei1CMTnoMWWWlYNPJcXGn+WoeWHRddUQf8Ir4gm134Uo0Iv?=
 =?us-ascii?Q?xkUpiXH5K3Jh4zxhdB8Nk3CgjDn9K5pD3pnvT7y8fgIUVnHl9NSSVYyeCTH9?=
 =?us-ascii?Q?cAkrHKRMaORXcVXrp5nRAyebIVCgaJIl/U94WjLj2EYYDEUEnJ/x67EglZ3V?=
 =?us-ascii?Q?Pp1zwUwOLb0dUkB53JQcqiiiOB3rJ3f/ZfRVD/t/zz6fQ9QKPPldrNuOEa0A?=
 =?us-ascii?Q?tBV1wpD3WOuDiPP1kFxoxtew7eGzU49MVYOOU3xia8YY5fqs81QUVcNx1Qx1?=
 =?us-ascii?Q?FdCWwI2lmT1sZl+/47HGAobcffgy68TlweLOt6pnO/kFNxmcX4OHyKVJXygu?=
 =?us-ascii?Q?F1uWfA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	sVeHTwvn5cxhao4iLViymLSabBte0PmSQcARl/iO65yXcORwaF0kIhrhT9Ux/7VQilQ4opRK2Sbu8YcN6wsOSCesTYLd5hKXad8nLlK032WZScqmlEYtsQDRZSZFNoeE3W3Ge8zD9KMaUFf3RDt0yg6rdWbr3oH1I9ozfIV5f4LY30g69tOY1q9taIrqV+pj7SYhmgWOAXMYmcTOB9jQCoIaMMYtXmZk9gVH1VS0cSn9CV4B6UKOU0Q2nVrJlsWCtRe2INZGfu30KYdK1C3eDW9m+JtYhTQrde0zrWnu5jo2w+PLQOfH++245S5tMkZO1lZO/v+K8upSqyPFDKEtaDEzBxE/MVDAECg+4bmyn9gHIeSAM4xLAI69LuAAzyCWzWI8eupxhUVXGhl+8OXZZU/fXICIzhmpQldss5b1fYNAEObMtXC0yYOsFHMp7B80
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 15:15:42.8149
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b1e535a-5deb-492b-3572-08de6a4996d9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DM2PEPF00003FC8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4790
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 12 Feb 2026 15:15:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19504

meta-ti / na / 20260212151051.2036528-1-reatmon

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
  apply-yocto-patch: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-ti][master][PATCH] ti-core-initramfs: Add TI_CORE_INI=
TRAMFS_EXTRA_INSTALL
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Thu, 12 Feb 2026 09:10:51 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 3b1a66e9a2b85cd14a4e0c80a6bbb6297=
e98410a

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master-ltsprep.202602111800
- Commit SHA: a6bf8a8f6ecbd6c7f8305690a9a0dbd0f67b576c

Patches
----------------------------------------
FAIL - [meta-ti][master][PATCH] ti-core-initramfs: Add TI_CORE_INITRAMFS_EX=
TRA_INSTALL
    error: meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc: does not=
 exist in index
    Applying: ti-core-initramfs: Add TI_CORE_INITRAMFS_EXTRA_INSTALL
    Patch failed at 0001 ti-core-initramfs: Add TI_CORE_INITRAMFS_EXTRA_INS=
TALL




