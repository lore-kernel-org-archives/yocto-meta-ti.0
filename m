Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA98DD43348
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 20:25:52 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.39])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.190.1765484743125489172
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 Dec 2025 12:25:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=ACRyP9LD;
 spf=pass (domain: list.ti.com, ip: 40.93.196.39, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ySNLbdHAUENfw9DoMikmS7mG+y6aRw7ifV4mQ4RzuKvmE7ItRvwosbUczxz/xDtuagoCdCNKvwqjwmTjf4e+D5BpbDiSxVZ793ude3k6JP1y7UJvAfuZPJU9Km5bPGJC3NOUmYazq7Ejl6NNV/Rt7/Z1+LHYU4CU+0tRxHfLcLRR0Y2/jrQgNG67AlXnoWzXdBMziKrCIS19BH9MnI3Jj2ej7CkMSvZxHJpW6j502Y7bd9xdin5Oa4qi0r7AbssBhP35+0APdKoYIwZiRoOOIKyv37v8rK8ksaVuXLz1/V+CK353u8M6MqLl53g+sOHKeet94+ayrVhZbZSQeYvAhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VgdCaPsGapoVDZxsYPDB3EzwSJ5fT0IF/8s3ZaptRfw=;
 b=ISoNayyxMQUuJzqDs+JcW1uKP1/tFe6h4RRDsuxQK/yEErJcNRVDBJ5BglRojIG5usBA5D2kvQivR6OlZ5QEC4KdZpMQW5Ovur7GPfm3r7pipOO9H1OHSHlFgcVsG2hPZKZvZOXwQaKr55B5w5LkB67tV7vjp0G/Z5kPkZLLyxnn2bdfiKAIRgxiYBscS82nQDfpe1gngRwPQIJOKnNkrL6MkZSztLLzTJzwfydoo13knggWsMCqCW2dKUTn0ImrRlE+Wqa28xCbdjbQ80GTQfWgiGn+j5XDyqDL6xWo1ZVoc8yDJJ7lNgBFBqHx3HUw/y5pI8zBada233YnzKJmRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VgdCaPsGapoVDZxsYPDB3EzwSJ5fT0IF/8s3ZaptRfw=;
 b=ACRyP9LDzw4hgjQ4TYNHQJ8aSX+QP27bQ3QdzKxwkbzhrXn1xiWBrSTCC8p4bHyJ4ngSVQMioEJNaHUk3XuUXqsUWUMLsxJ+7uuNOmC68hlGvbWEW5zUmlKTJHGs9txF+VgLm2yYkQ4GYWaN02AFqeYZHo2BiHEI33fgEJzjsKeoRszpiSDcnWsIFib2CdXE444902UspCyYmrWGU2H9i3TbFa/+a5EdlRrAl3ZEXL3eN74TEydqkEvtk43+IbGKYiHndIN2LrKDgx6HJa8dRV0a5HWAhcvNIb+x9Al22yozi98RPy4re+p51eMKhnuOGFMNhSmNW+3roIhdnsAh7Q==
Received: from BY3PR05CA0032.namprd05.prod.outlook.com (2603:10b6:a03:39b::7)
 by SJ0PR10MB5630.namprd10.prod.outlook.com (2603:10b6:a03:3d2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Thu, 11 Dec
 2025 20:25:34 +0000
Received: from SJ1PEPF000026C9.namprd04.prod.outlook.com
 (2603:10b6:a03:39b:cafe::be) by BY3PR05CA0032.outlook.office365.com
 (2603:10b6:a03:39b::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.5 via Frontend Transport; Thu,
 11 Dec 2025 20:25:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF000026C9.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Thu, 11 Dec 2025 20:25:32 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 11 Dec
 2025 14:25:21 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 11 Dec
 2025 14:25:21 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 11 Dec 2025 14:25:21 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BBKPLit1062993;
	Thu, 11 Dec 2025 14:25:21 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id F35229ACF4; Thu, 11 Dec 2025 14:25:20 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH v2 1/5] linux-ti-staging: Add initial 6.18 recipes for LTS development
Date: Thu, 11 Dec 2025 14:25:20 -0600
Message-ID: <20251211202520.4120831-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251211202234.4064350-1-reatmon@ti.com>
References: <20251211202234.4064350-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C9:EE_|SJ0PR10MB5630:EE_
X-MS-Office365-Filtering-Correlation-Id: cac4ab65-a16c-46ec-8be9-08de38f36f60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?BnIhq6Ksca4hF4VwEMMaCewaMSjAjnJIKNCA2oXI/mzBuzags1cjMlsZzxr8?=
 =?us-ascii?Q?xWVOie2fDGkhVuZ9ezpMZWhXcUYglxdOlcAdKVj+nlzUkjRJQQ7apJ6OmpjH?=
 =?us-ascii?Q?BuwDYzhvdQHfDoH1hw7MeJYHbejOZVpGMSPW6Hhypqzfq2t573fXqD4iRly8?=
 =?us-ascii?Q?RAgfIuVeIbw3P9ytaVGizjPUOpVA8GvtJcvtf7W8wAdNPd8lLup2oE3HsL0Q?=
 =?us-ascii?Q?MIbI36r0i60o4efAbXJs9jIQ91gzP/RW0moQMI4SJdB2MPEndC7NbNzGrZaM?=
 =?us-ascii?Q?RwyoYPDR/i+WBlJrCZCOdZDq8Grw1OeLyqJAg3aYVs5AP+XI0oqRq3N0Doc6?=
 =?us-ascii?Q?2iVnVcMC8ShWHnuxlMtJ2glsheIFvUPDiNooT0gwabwTz8QBGRtsntaMW7xw?=
 =?us-ascii?Q?scEe8zveNWXrLOgzduqQ0cX90lcDTsNiEdOPwoP/mbYm+YFMW39/tZ6WwElA?=
 =?us-ascii?Q?gdsPtXsxKlKnzoBgKFA0mSxenRa5UADHbRDlQxAtWqTmF9onjNugwA8PhVOu?=
 =?us-ascii?Q?Ts7Hhybc1Dkdhudykte61rOnRAjIoWvxykp82apxsrZj6lEFhMQlFXxyEPT2?=
 =?us-ascii?Q?vXl6bpxJyinVBeuVnRxyRR+jsFDlf9sHBicHpxylqP0GdvSeuZDaztn27eA2?=
 =?us-ascii?Q?u73ySrlhGmCpUqvIBwrTrdag4nTc69L5gJbRfCWJKpZo/vHt64wjdVK64Rf5?=
 =?us-ascii?Q?vQR5dp55Oual/Km4kyPSPHSX1tpbXjOl1epS9PqT5h1ek9uj7YCsTmzMU/gj?=
 =?us-ascii?Q?1LW57NcfkpODOLtdOVgDw+CMonPh7KZTT5icTZZG5hvBenESKqO1nDtBAegQ?=
 =?us-ascii?Q?jFpeazqQrle+z5ez1d/vWxc/0cfPSr0YjvSg9kH7KkhBf7tEJpw5ZLrUF/Io?=
 =?us-ascii?Q?2qcITu2CBc+Plg/Tv9Z3QBcQJKKcU2hd1BWieN2u7UAbyeZvAoY1ERTG/ACV?=
 =?us-ascii?Q?n9uR1I+bN08rohRoAH7UQOgocwgISV7O1PPaVRAHf08//QzXQcGm3iz0MpYW?=
 =?us-ascii?Q?ehwLbo+Dw7eInGttJN2ar7ii1BAq+msngnsuvgSl/Bcu0cbhvZ9KHOt6k5Ge?=
 =?us-ascii?Q?IpFD4ABRy5wfPChIAyohhp4HscPiAIuyFqKdU6pKnP2np748Y+MbbGFWe9Qi?=
 =?us-ascii?Q?jxqvNWpokosFPlJKMIotgxvNnlArAJLlYRMoQnj5j48PUsZzorlPBMnKpk/c?=
 =?us-ascii?Q?9Qm+1GMVTjc4EBjG8ocB/CjKqWMPxWCuUtu2WHv2gL5mmh5CbLJrSqE6/KPw?=
 =?us-ascii?Q?CHYJOqBzJiSaJgPtV3j8oB8FEMcHyG88n8rxEoEUUt0SxRTCHmAbF6PyDD1t?=
 =?us-ascii?Q?vsnPkrduKLdQ2pVy2jU2qtrottVz3eYXVKZJ74+76VDhliqbyeCIdJ83TAaY?=
 =?us-ascii?Q?qWx4DNVJbg1hK6FKx9IqcQgNvuVJfjEtN/82NUsMAqbh5d8qCymh+5ToQc99?=
 =?us-ascii?Q?wgQW3O6NQuVKm2yu5VeGB2LY5QwXjTNQoU2WA2cUnbPJAei1kX77mihkMDPX?=
 =?us-ascii?Q?BfaiZeseKcP77Tq68+lYRMeQn+N/h/vLYnEe9ptnfRA9yTSAY03wJJM2i/Zy?=
 =?us-ascii?Q?8rXHRYwpSL8NTmD5cAo=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 20:25:32.8631
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cac4ab65-a16c-46ec-8be9-08de38f36f60
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000026C9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5630
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 11 Dec 2025 20:25:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19351

meta-ti / na / 20251211202234.4064350-1-reatmon

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
- Patch Series: [meta-ti][master][PATCH v2 1/5] linux-ti-staging: Add initi=
al 6.18 recipes for LTS development
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
+From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Thu, 11 Dec 2025 14:22:30 -0600
+Date: Wed, 2 Oct 2024 12:50:49 -0500
- Num Patches: 5
- Mailing List (public inbox) Commit SHA: 390b9573cd2482a20139c19da5016ee86=
c07ecf8

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202512040100
- Commit SHA: 2b3ca72005639850bbb6a47a046812764a09d526

Patches
----------------------------------------
FAIL - [meta-ti][master][PATCH v2 1/5] linux-ti-staging: Add initial 6.18 r=
ecipes for LTS development
    .git/rebase-apply/patch:117: trailing whitespace.
    =20
    .git/rebase-apply/patch:119: space before tab in indent.
     	  printf("/*\n");
    .git/rebase-apply/patch:123: space before tab in indent.
     	  printf(" */\n\n");
    .git/rebase-apply/patch:124: space before tab in indent.
     	  printf("#ifndef __ASM_ARM_MACH_TYPE_H\n");
    .git/rebase-apply/patch:125: space before tab in indent.
     	  printf("#define __ASM_ARM_MACH_TYPE_H\n\n");
    error: patch failed: meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_=
6.12.bb:13
    error: meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb: patch=
 does not apply
    Applying: linux-ti-staging: Add initial 6.18 recipes for LTS developmen=
t
    Patch failed at 0001 linux-ti-staging: Add initial 6.18 recipes for LTS=
 development




