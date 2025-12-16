Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35604D637DF
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 22:21:24 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.37])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.411.1765923677436865554
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 16 Dec 2025 14:21:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=T3unhBXM;
 spf=pass (domain: list.ti.com, ip: 52.101.85.37, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GUA83vKoP5HLjAWXogsUTVAS/jhPKuYkKoBV0spcTLRT6waqYKZ6FdKKGXF50EIxhzLeQrOMfhgD6+ptOwuH5fyhnbs21lQmNkYPvp6IjNzzZiZ+rRTGZqOISG69GVopHET7eGMEM7SZp9c7z3pcDqQ7HNc1v7jqplQVoKrCswJBWhp20cVjTomKUS/g0iufBwPTjkeHN/Ri/CIAbxmI1ulQI4XHWUQd6t9IJCU1/DUgjv7YUnTKmKnQiXikBveDXY6aKF1mh6ZC+A5MCskOCYdSYwRK3ohqUkIJlPuEdoX7KS70eY4J4HaszxyI0Cir7k005UWPaFVo9FRgutb0WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5VCtDke6RbDALapjVE+KxcnJW0xWmjWilI9iMFPUYao=;
 b=Q9FGPaumaz6t5JzvWmbamh6lEvcOPm084EU48aNNZE69dDkrpMJsKmlWk1IvC8aSXlz9BY5NIuGOyqdBdJyARTUsMVwNPyoSC4jlAySA3mS8NZ+u3SxlCSPkPnQlhdkaeXAF9meYPqts3sy22f04EqkPlwIzmPEr/9mz2ewr/r/kpYgmWlkG1LqJsHJUZwa79UGxYtxNDA19RM1sdqaR6Kyj74PGhbiHczG/RWaVmHsRr/1z5bZVtzyVTIFNqSH91i3bQbxFBHNZTk70Zo+ySuhbJzg4T7xhOFpXFyleoyZxVskvXvOggXjSH122mf11qr2pa5GvlssX5bl/A9ggMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5VCtDke6RbDALapjVE+KxcnJW0xWmjWilI9iMFPUYao=;
 b=T3unhBXMAgl1xNd2ZpvvxLWGrDPWynTzWPZVt+cvuaEbIPn9yiWYvJ6F1fnN0mW2xKtDTTO6HEf2oFj5e6U7PVqnSnLxaPMKk7X2BC1ep8Xf3Wd+38RrPCENre96mWgbRacOg6ckx84QMUMlhqGf6QsAwoc83wYl/jurMxZzS1tDvDlrjO3vxkaITETL09++zvMESNudR6a+YqY0wAYhTbmochs4BUKjb8yvOwNRQQN0opQQMy7TVsrjeWRyTQJyNq4WZQBKvekF7wbt5QgfdoYL15fDJWLpXcpQlpu4kuqnJ+hsFpxDiEXETSjz1Ay9FLR2TGg6jE6xRCkGqM+3oQ==
Received: from PH8PR05CA0022.namprd05.prod.outlook.com (2603:10b6:510:2cc::10)
 by IA4PR10MB8280.namprd10.prod.outlook.com (2603:10b6:208:55e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 22:21:14 +0000
Received: from CY4PEPF0000EE32.namprd05.prod.outlook.com
 (2603:10b6:510:2cc:cafe::ff) by PH8PR05CA0022.outlook.office365.com
 (2603:10b6:510:2cc::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Tue,
 16 Dec 2025 22:21:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000EE32.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Tue, 16 Dec 2025 22:21:13 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 16 Dec
 2025 16:21:11 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 16 Dec
 2025 16:20:41 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 16 Dec 2025 16:20:41 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BGMKfre3577606;
	Tue, 16 Dec 2025 16:20:41 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 57B4B9ACF4; Tue, 16 Dec 2025 16:20:41 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Judith Mendez <jm@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>, "Denys
 Dmytriyenko" <denis@denix.org>, Andrew Davis <afd@ti.com>
Subject: Re: [PATCH v2 0/2] Add BeagleBadge support
Date: Tue, 16 Dec 2025 16:20:41 -0600
Message-ID: <20251216222041.3458512-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251216221652.2231748-1-jm@ti.com>
References: <20251216221652.2231748-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE32:EE_|IA4PR10MB8280:EE_
X-MS-Office365-Filtering-Correlation-Id: 4372bf32-b19f-4faa-ef8d-08de3cf16c57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?vYgmuK3/JNoaKZPgAAZ8RTYAKBC/J+Jv5jzdjm1UppLsXzTFf8+SvBXifZNe?=
 =?us-ascii?Q?n9QSxEXAbu3QcdeXwQSKACNCgxAwIdXCfRPfIXpp7bcbEp2AzmJb3cTEzI8q?=
 =?us-ascii?Q?n2YtIOVBOe8Wc6J86JF3BeeKejcpwy4tWJkaRYjwxQ8eAhXSlFKzwDS8oLwc?=
 =?us-ascii?Q?nSpAuQpcCTHfJVzp6SAFMQcI2QH47JsJYppP0KJdqHkcNsdSxJxh9AvI6Zuq?=
 =?us-ascii?Q?0xuW+sDYHvF7wOPq7iDf7PGx+/jjaAnQS3c5L7Y064DvZcQDP64uhjdi/TG/?=
 =?us-ascii?Q?RiXkQEa1KZSeJ1ZvlxEOT8f7ch4dGhXcSh4KdtRzOQqwX7GBW72FrcTkKcP1?=
 =?us-ascii?Q?ReJwfSA/0inxGJ0v9IVxDQsw4EOx/GYi8bD+NuuSY9pDWaCPlpS1/IKE+lvb?=
 =?us-ascii?Q?Q82knSVWNnprz2NxxBhktRBp/JR8BtxYC9XMaHfLe+eb4Wgq/kQgUfhflilT?=
 =?us-ascii?Q?k+AQmT96muV8e1ZZUhCZoQDxoQATZYURRJV3VgoaWueyb50mWxE+jcYytzAa?=
 =?us-ascii?Q?Jsvf2qbhyKc3BB5AvxhXf5F79fThN9i6AE5svBCSvaru6wFtBRsazOxTaAlu?=
 =?us-ascii?Q?lJxufZBWZrZlvxvnTYWCd7AqO5QdaGuOqVM8ry22peCyVP0wE8+aQN5hZai4?=
 =?us-ascii?Q?dvFsMqP0u+SxL/Htd+++e9L2US30gRxXkSeS7IK7bltujzQX+Z8prmmw7Biv?=
 =?us-ascii?Q?2PqprGjW8H4++PxMOH2sryK+79ZWURVMHzNp9FWYj37iQpAZcpNc2Mfegexv?=
 =?us-ascii?Q?VItz12+ShqNDoBPNs5JfixmAgG7RW7Q4e+T98IbY8Jg0qNYCl9Ddo7Y9Y9Ih?=
 =?us-ascii?Q?5J6slNa2cnFqCEV87bTai/Dp489NlRNllHzlplbZjGBpQ5yo5ZQgcV7DwEnP?=
 =?us-ascii?Q?w1CxQtG5Igc8qhSb4ZBq4vaRZLevwN05kpIlCzhHdYkT2ZAuSSW8rsCl0uDO?=
 =?us-ascii?Q?MqL/NsepLG0Rs4GASYFccJ/GVBEmcNIv0yuJ2hdLbPbqOPinNXcnMlstTIt5?=
 =?us-ascii?Q?pnhD0xRamQ2/lckaFOBPjW4mpuTGmAXh3W86ACiYxlHO0scrLn8NsIB50h/k?=
 =?us-ascii?Q?6Ozn+3xqEmjiefOSotSuiNRHXRRCo8MYlaHaENoJ9xi8WAC58wsljyii3LZq?=
 =?us-ascii?Q?jPzYfk27wg5p6N8TUOTnjmQjwbMm/1Qpllzdf/1KQ2ZSGgHOcYlnk3rZsIpk?=
 =?us-ascii?Q?cmHs2mujJ0EoHJ99lF4X2q3PKkOL7ZcSLgtsthRt15FuIDnT8TGOwO1Svnpn?=
 =?us-ascii?Q?SdM4SHjgs7JHCUYp99otV1mLEEtuc+A7uIeXJ7E7xQPMGQDJdxNllwiOBHiP?=
 =?us-ascii?Q?tW9ohQwDoAjLsk+4usnBY/Iiq/Z6gaH7FEhsX4n4d3kY5/UIB9KSMqzzd3Js?=
 =?us-ascii?Q?/bkf/11ynMm7aJMeW4PWeCm+xRKjEGzYTYJOZ8805PcYgI5tih5rRJo2wBSd?=
 =?us-ascii?Q?NaE5KydXE2X2tLgnDbng1KhSgl+qOx9nXTvRKQjNWHia84V7B5pw18jZQEzW?=
 =?us-ascii?Q?GzSihvMyyTTUpWWZRLOkxB+C8Lr8QMIKXaQOEVY+RQUoz3sQuT+Rdz6ukUt5?=
 =?us-ascii?Q?7qHi5hDbVpIOOColVxk=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 22:21:13.4785
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4372bf32-b19f-4faa-ef8d-08de3cf16c57
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE32.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8280
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 16 Dec 2025 22:21:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19366

meta-ti / na / 20251216221652.2231748-1-jm

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
WARN - [PATCH v2 1/2] meta-ti-bsp: Add support for BeagleBadge
    WARN: Missing branches specifier [master/scarthgap/XXXXX]. (META-2)
        patch:68
            Subject: [PATCH v2 1/2] meta-ti-bsp: Add support for BeagleBadg=
e
   =20
    WARN: Commit message does not include file/recipe name: meta-ti-bsp: Ad=
d support for BeagleBadge. (COMMIT-MESSAGE-2)
        patch
   =20
    WARN: Commit message should not include directory path to recipe: meta-=
ti-bsp: Add support for BeagleBadge.
              meta-ti-bsp (COMMIT-MESSAGE-3)
        patch
   =20
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [PATCH v2 2/2] trusted-firmware-a: am62l: Update to latest ti-master
    WARN: Missing branches specifier [master/scarthgap/XXXXX]. (META-2)
        patch:68
            Subject: [PATCH v2 2/2] trusted-firmware-a: am62l: Update to la=
test ti-master
   =20
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887



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
- Patch Series: [PATCH v2 0/2] Add BeagleBadge support
- Submitter: From: Judith Mendez <jm@ti.com>
- Date: Date: Tue, 16 Dec 2025 16:16:50 -0600
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: 275d057766b0208ea671d0fff8690f4eb=
fdcd062

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202512040100
- Commit SHA: 2b3ca72005639850bbb6a47a046812764a09d526

Patches
----------------------------------------
FAIL - [PATCH v2 2/2] trusted-firmware-a: am62l: Update to latest ti-master
    error: patch failed: meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted=
-firmware-a-ti.inc:10
    error: meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti=
.inc: patch does not apply
    Applying: trusted-firmware-a: am62l: Update to latest ti-master
    Patch failed at 0001 trusted-firmware-a: am62l: Update to latest ti-mas=
ter




