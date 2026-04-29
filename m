Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAE66FF8873
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 21:07:16 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.61])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6449.1777496826460684254
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Apr 2026 14:07:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=blJyWVzn;
 spf=pass (domain: list.ti.com, ip: 40.93.194.61, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t57x5HseHCNPk81X1IETGL/+7d27HoiX/yXxJGYx1olpPbiGQUm/HejIXlIbwHWInFC2o/QaZayhGgzEygjUilt+YnP9XJfLtm/39sUZIq1sutY2ciRMSRTvYphNvV0DLCdsqPTCrTL92NL9o3VBbz/I/Oth+CoeVY+TVuxNLMaGR7kaYGmhjRXAmcO2Tu8Tm0FB01Z25Dq2lryXMDh7elhddaiKhxww7auuTEEMMlgcBMX6r+/Sp16eTpXLA1dK8ex2u0kUZ7ZbkQrQdt25DioiaTPsZXAAnBeBCvlb0p6GKnSLPELBZmunSRuTGZJ+9BkId8TCf9jZSmK0AM9KdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YF9QYtMlrlEUre1ZjEZ+AIqYNOZSDn2apgojNXs2BCY=;
 b=NWG+TPbCepQ9xfgLwwl7Q1Y+PtJJanoAtLEGRZQ24gxS76OVR/6oe8Wh7WCs5J9aioFaCFeDmYuhtH/zvQ86QZxo4G35OylgDDRN15cynQ6IVEHB1457k215Hzt4Uk3p02pUDfl4+FMN23UuY1x11DSaUHY9T3MI8nh+o08LUayF8Vq2I5ta8uG3ECQo+k1Ou4qtjtBkJx7AkfJB25E2SFZEfYkDua3MSyDrUgsZqDcSsZtAcD9RZ4RbZPwbTi+Z5Q2hz1HL9L4TFeloGD/WIJR3jhy4ZBw8ndJK4/tWXITzas4WPOC77EAE+lxGecEXCQgJNbGo1lf2ZRBoDfbitQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YF9QYtMlrlEUre1ZjEZ+AIqYNOZSDn2apgojNXs2BCY=;
 b=blJyWVznYO3xVKILfzXPjcClLfp0NsWxtJlgLRhbIjv3oeHo88zIeqoBxCX+o/C6nwRFhttVKPKb/DD3LWHqS2fFm5UQkmVRRsU19Wul5qceZk+u/Y5eRoOeF7KLJ9BlonIh2ZRLWhgPKNjG0z+lQCyHtVFz1FG2aia/v5+BaQdy0WQOEx6lMx4XvDDuXCobHAe16p32kpX/JtBEb2x/tYThMC8OATQvNRQdnNO6u35psJzr5AXE1XEjkLEGeG6j/ILPxDyIt2pXNs0VD5garR97oVjBWUEINvibWjTio5qd2tyC975aVVhlAv7d42kKkQEnLa67JV3kVlfrFDCzkw==
Received: from DM6PR06CA0080.namprd06.prod.outlook.com (2603:10b6:5:336::13)
 by IA1PR10MB6686.namprd10.prod.outlook.com (2603:10b6:208:41a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Wed, 29 Apr
 2026 21:07:01 +0000
Received: from DS1PEPF0001709A.namprd05.prod.outlook.com
 (2603:10b6:5:336:cafe::fd) by DM6PR06CA0080.outlook.office365.com
 (2603:10b6:5:336::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Wed,
 29 Apr 2026 21:06:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS1PEPF0001709A.mail.protection.outlook.com (10.167.18.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 21:06:57 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 16:06:56 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 16:06:56 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Apr 2026 16:06:56 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63TL6uiU605023;
	Wed, 29 Apr 2026 16:06:56 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 70E689ACF4; Wed, 29 Apr 2026 16:06:56 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] ltp-ddt: Remove orphaned patch
Date: Wed, 29 Apr 2026 16:06:56 -0500
Message-ID: <20260429210656.197683-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260429204745.2593539-1-reatmon@ti.com>
References: <20260429204745.2593539-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709A:EE_|IA1PR10MB6686:EE_
X-MS-Office365-Filtering-Correlation-Id: 21194c10-b25a-4f70-5af9-08dea6333fd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	GL0BZhah6W8TABfPuZ4Xyr62hX/7NbwdAIwPJxQVwyxH2DdAWQmMaxDDTntBUkAKXIdPSY7FW/SB1+ty1XYUaQyyVMc9q9InBIj+bLCRjEuxI1gkfMWpfGY3VmlfGZv04N4k0YWJRfPXqHzEStYhk2SvLxE/fNbefPJzUx/PmzR0/ao3ePkN9nxcaEVXqqj7vEvPGbF0HKaxvIabOC4VkIvSuK2JHwCVKpOW7uSi5f8rFbwjRFsgv8BizoUm2wPVFE6x9Lcmb068fJPhLMBYZAKuOoklsyO9fnTdt+3PqKljkyGf9mczKarcOaUsfCxJl5iSaH7gJ9dq/Dz+MQSQiSZ0VqKFOvHHB5wrDRwrsUE4Bn8ykyyoCXhcwcGeJKNmynDFyajV/V8zaJDH5lXDlUtaQ+Rfp0FbioaUhrDA/mzANKBO+etRglhU/acFbmgthS3n2ODJv6Hr/L2+31QPozTCnjpDkbUk5R2uMkgLvvQsR8Zl4PW0EVojSNzdjkW6Hvt1BwZ5/PUwGTynGY5cNlqFvFSoODqdixs+gY1gkfN9DLtlQbk6y6uh4kE416BDAsT6/3HSLRK0E1ZeChgxxlIhg8rOaJDmWD2P5poAoHjM9ee01sfKMxrwxjW155VND++oa+hkmA0N6XOu5vQfaNto8VkgrZ4AgbjHauL4b3P8AoUda5/Bv/KI+5CltCr8NJhDJ/MCZlhRP80Eq+VLx/JMI3ElDOwZI/1MScgTwKtc7J2IXWFkwTeM26RD3tXM9PVJYlPXayM8poNoLb4zXQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	9hnnfux9rff6QyVgGeXb3rSKlEKjfCwTdRXzCnOywHos0jINX1lEXWF5qVfxQpHWpxa8aRO0CIKDsyLArzi5+wXjGyogdhMAzJZiq206fBYwzolM6S3aickTr2sUpG6gMiIR+g+lf2fsEytChwQNiNOPr9bXPoyf2hQfy0jUF8i3UJ5vLBqZyddrETc+UWnGS24wh4e2+vAeYw5tKU9EBg6zhhYVEtyHH/nETLu5+DksQxHFmtf7Z5tNwIz/1fi4FfzlAp+D5ghFlXzRb1HemO3Mbc5IDOT0i32XoeuQ1AV923ZHa9fBl9p8Ec2TduUVeTor0TSmlxgXZ85Ox3uyFf7l9LPmKnJ7BpvVPePzScsv3KOEgRE70Q5hMXeppPI4QjVZCqQ0/O4dUlhWPFXctMafRnhByS94N6qf//0FibVlnAUDhLah3mfi2Z7Qxj2d
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 21:06:57.6881
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21194c10-b25a-4f70-5af9-08dea6333fd7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF0001709A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6686
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Apr 2026 21:07:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19921

meta-ti / na / 20260429204745.2593539-1-reatmon

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
- Patch Series: [meta-ti][master][PATCH] ltp-ddt: Remove orphaned patch
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
-From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Wed, 29 Apr 2026 15:47:45 -0500
-Date: Mon, 27 Apr 2026 11:02:32 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 7ffd91c9bb4746cf4365c5888ad89627f=
2d796aa

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: Add falcon support natively
- Commit SHA: 82ae4b828b3c5adcf725f73d2a91de05e4da81ec

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




