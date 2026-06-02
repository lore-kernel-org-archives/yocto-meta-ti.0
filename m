Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5169ACD6E57
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 22:53:22 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.26])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7919.1780440797875616030
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 02 Jun 2026 15:53:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=lMXz182h;
 spf=pass (domain: list.ti.com, ip: 52.101.61.26, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SL2F/nIAlBgtGpN31oxuPcEPnKmIWp+GuiGwCuBO3TxeV9NzZnbGrcgq/07UaZSwYwBKNj9u8/+itZLe9rGDAYA/nwRAhO2GALWwP/J2fHY/Mt0oOeCSwwVJKNUXrtYsRD431WAinP8woUB1n9N0zAf1OuOD2OcAtVve5edRR490h+ryW+FXU32kYlFnpmepzxUQ5AU/Kj1xp6/GaHElxUAuVuUkEyLYl/neWQQ9wW83KNAk2T4pWBbgCgdDiVlb4/RKiMaQDAUInewLeOFil6AT2J80DOVJV3Puq9DRWUzk8NuywCuSvbXbBKUYheoA07BZPk5FAYmqqlO54NL5Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mVdGMtm3xTyeppgRsFiPeWPd7kwtb055Lri8b3Rq+8A=;
 b=wPjA5zqP3I730C+1UOyZ9gDr0fRbxiv5ueqlVwTLDF10k3xRIggJQnmZ7bJLL+RbFp6gqA92+05LSEqK2WjR/EUNylApYR83iNISJ+6S74thnEsoQ2PsjE1V2qSCi4cDjwFL0ID5O1h5vslRx8dlQ4Gw5J6OA6Vj8y7ueB4fn1oEE9Qc0uXHnZ189fZ4l4tlkluR6+DhPz3sGOpxmC5AwahoUHb8v2J37tJj/GnouH/SKzJ07qtAm2xuZWcKSMM9FRhTJyjokSIJ0yv46StYe39AeldJHgRIDPYjsaZmH5Ua4qkyNxdSd+VHrW4feaziISAe48e5PjDQZeUXKyfr5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mVdGMtm3xTyeppgRsFiPeWPd7kwtb055Lri8b3Rq+8A=;
 b=lMXz182hHvoT5w4gY53zTCZdq3ZntVhPirUDSs+uFLXEdGM7VdScXFnP66WdahsKsPphvl/ugDtiYSfgnm2B+ZY6VCn7TFoIzGyfCLBwW2lMxYPSOaK8zqkPz5D9WWhy0Ns4+aVlcUzgNRFMFnvdJ2n5n7Yqp9xEq4m+uNxXfhOEMjTt5ZbNtIN1Pnc23y225t0Rsu6CGQOOsLtt6mbnl/GgiB38/7MGxNOH8yuvA3bQicGs/K4iZd+IjiABRj7NzJDQ88jIMfcgO4RSmVwEA5zDHlNWSyjwZeQ6r5/D0ncNMQ6tsZj0u83/eNGJtGMvNrzFKuH6ShwWcr8u2cfcLw==
Received: from CH5P222CA0012.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::7)
 by MW5PR10MB5666.namprd10.prod.outlook.com (2603:10b6:303:19b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 22:53:14 +0000
Received: from CH1PEPF0000AD7D.namprd04.prod.outlook.com
 (2603:10b6:610:1ee:cafe::24) by CH5P222CA0012.outlook.office365.com
 (2603:10b6:610:1ee::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Tue, 2
 Jun 2026 22:53:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH1PEPF0000AD7D.mail.protection.outlook.com (10.167.244.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 22:53:09 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 2 Jun
 2026 17:53:08 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 2 Jun
 2026 17:53:07 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 2 Jun 2026 17:53:07 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 652Mr7ng488889;
	Tue, 2 Jun 2026 17:53:07 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id B10349ACF4; Tue,  2 Jun 2026 17:53:07 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: <a-christidis@ti.com>
CC: <denys@konsulko.com>, <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master/wrynose][PATCH] ti-img-rogue-*: Migrate GPU driver version 25.3 -> 26.1
Date: Tue, 2 Jun 2026 17:53:07 -0500
Message-ID: <20260602225307.1266977-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260602223250.3054197-1-a-christidis@ti.com>
References: <20260602223250.3054197-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7D:EE_|MW5PR10MB5666:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e72b5c8-fcb8-472a-0f45-08dec0f9b7ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	CqaxiY34ndMS/0VFwG5e1aMbt7mJkQPnHDHzzEZmrogUqBddKOKj99NG5kDt4Beates0DBvL6c9upG5nSb6jgNZ+XhBeEL7d11LEpxzMZNxeNJhoFcp6FnpF3GR8/23ae+f+pc2I2FtasKRd5ac/LSeurxQJclpnWYpkzWj3nuvu9ky595wxcb+TzaCybMgO0mXsTT2vbKgoKEEvwbrJvYyXEUO6RHH+Jf0wPh9DVjJ8qkkFsdVipcUxUk3XcSToMYkdBEhbq2BdSuGcE9Sn3yZ1X+lrZRRptwzPyy8eIbTbmpA0zHgHNaivgu4J+2nWVPyotS+zhHuPDaHHN9YPmHUHLWN1jPWEFyCIUgA5qifDocX98B4HYdSeVoGi2cha8Elnrqmow4+e0FB97w0IHD+eYafNS7Wa7lAbZPCH9jvMmgbwzLwgDb+TrLyirV75XBmC5JmTqXw8BqVKrDquOoblTCwVk2sS0qnB2ce6Tidg0r03vMN5bPLIzA40FI2EkjNRFbIcjFbrzcduOK5J108kdgrA/7rnqDVRLh8TEkOT75LoMv9WdJAcoqapVZyW38z90KCQwqOqKdTUxa0QHsjYkPYIEznrsMSEY1lRxxlUfPQp07fp7RsMDJ3Scd833ik0SAyy9asjirkzXxuVyQ3kHZ0VSJTEpIm/t/Be3jmw9VieqQzm0/NG+FkvPozzDQzZQqeimxwF0t6V4kPhQk7gT9hDmXy84Y2ZsVAPzyg=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	igmbGFsq32DkAAWHBMeEZb49xglk4tvXd26Fm2yjCmOlK/uubSp+D6KIFmZBEydKtyGuSut+L206tPuIygtbguMd1w+vUf6vLZPI/lgLUFdiu7/y8HNbj1fR4A9p8U+uOOtNq1kxV6DjDgTMdQckuXpV+mqw75zyD2l1G0HEovjENJ4fXyZkVkvJEvYTjD+GJRH/08GBHstHohEFnr/TwbHe7LnJE06dPFzlUJDnzGM6s6ipjM0s6W/aIPt9tbwRdVcsloV0WADTZ1njwdaUeD/G66Dr6TkzXJy1ZjvBh1t/2+XtFR8j9QCiHcuW3JoLrcMPDsqatFA09GeTrD1coGgdn4BMy8c8noF2oBOrYOgH80dhBpxnV6yYcB81HGuw5B4szmMfC/YrE2ynMd8yoh7cmAW8mmtllNFKpAFH7lBRh9bewI318SbUYS3miYJH
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 22:53:09.5129
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e72b5c8-fcb8-472a-0f45-08dec0f9b7ca
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD7D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5666
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 02 Jun 2026 22:53:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19953

meta-ti / na / 20260602223250.3054197-1-a-christidis

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
- Patch Series: [meta-ti][master/wrynose][PATCH] ti-img-rogue-*: Migrate GP=
U driver version 25.3 -> 26.1
- Submitter: From: <a-christidis@ti.com>
From: Antonios Christidis <a-christidis@ti.com>
- Date: Date: Tue, 2 Jun 2026 17:32:50 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 88d82d3e7983a38ac625f3b2f0ffc854e=
b55525d

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202605272200
- Commit SHA: efd871d4eb504ec366027fdf6d1f934d2844a04a

Patches
----------------------------------------
All patches applied

wrynose
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-ti][master/wrynose][PATCH] ti-img-rogue-*: Migrate GP=
U driver version 25.3 -> 26.1
- Submitter: From: <a-christidis@ti.com>
From: Antonios Christidis <a-christidis@ti.com>
- Date: Date: Tue, 2 Jun 2026 17:32:50 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 88d82d3e7983a38ac625f3b2f0ffc854e=
b55525d

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: Thorsten Lannynd <t-lannynd@ti.com>
- Commit Subject: weston: fix assert firing when subsurfaces have no views
- Commit SHA: ae9f90cf0baf823a20d10b5e4e3c6af465dabe98

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

wrynose
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

wrynose - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




