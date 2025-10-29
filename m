Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C7EACCD1BF
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 03:00:34 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.36])
 by mx.groups.io with SMTP id smtpd.web01.101.1761706829128044536
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 28 Oct 2025 20:00:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=ZwoZuc9x;
 spf=pass (domain: list.ti.com, ip: 40.107.201.36, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sGdpEdlYH24Ql8J6xRR7VFn363mYpnnoSECZMKtUrfTpc8ZvZMJh8nkH1xqUwlBVboPbt95mDr4j8M2TiXPOjJI2TE/TTIRKzZjmnkgyKfW5FEy/rGRUPFhYa5t859I5y6hWUHeQkIfYDOCOVnCf4JMrtc54KyREI1NyxUR9gY24xfkYYYRYqMJRLBC7fA5nSaV4/jn5cHX+DN1ViO7YujQXJi+nFsxyJx6VIhycXlULrgCQpcLEgQlJ6m4Z1ch9Cf4z8Apo8EbScp3h2dyZvPhID5hdUKhs35XGNa2KKrfe0GJp+sqhtitrEliz7wDxe/W4M47aA4O3W6lsUzlpnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HY/QfR9QLfJRTA6uoEi0X1EjuF31O4mJ7hLnwO4vRJo=;
 b=l+7sll1HPZ/4E2K4X7OEChevOQypN/GVWOIF49DGuGcB6KGuuggDF91LUCmJfi53w6gmU8fJ4iUCLUJJm82OKMvvOjcpf9TtqBaJ9A4zHGGJYYjdI9rKdGPnIZoJU/Jyp7GCFlcZ5ShHPm1TaJ3KLwXrJYSrsY4mTNSGvmCYfwsoUOvSJ5Tt10ox/lNVNsX+jyUbEJQFC67TggMbeQOQBqRl5Z4Riz/lLwdhMUvaj0aGh9lccu8/9m6gZ77Xl92saRia45a/EkNi8pB1i3RrEEor9kqT+9GXVmfhYa2WbjUe55cLSz95uBF3sLPTW1bEK48WeOt/ikPCxbDjFP8oEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HY/QfR9QLfJRTA6uoEi0X1EjuF31O4mJ7hLnwO4vRJo=;
 b=ZwoZuc9xNrn1xmT5KbcQ1plCy5IoSn8kTY3byaoCPxRMtj26ntskjrWingLyqvfbc5x93UHqQwWH/hI/SgVtHdDYgkTqHtDxRtl8kx4hFOuMMBeJ6Cdtc8luLmzEfy5jnxtvV/BarYsRjQW4XSztatMWgBEV3cmrbglYbpedKUXnlPL7frNvhmKe8aQYsXnNKJIIgJWiEHXeqK7tK1jejX+aM7/AxumoU7+dcB8upHpDszdoXBXNxUDo/yCg0MFr/Qf1YG/JBBSQKId7/4ubLs0+uzZIJaqbH5HkFOXSwOTw8Uw+I27NP5NXxQT4qwl2y9uJYN1YXl2629RS/7dDeg==
Received: from MN2PR08CA0013.namprd08.prod.outlook.com (2603:10b6:208:239::18)
 by SA3PR10MB6951.namprd10.prod.outlook.com (2603:10b6:806:304::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Wed, 29 Oct
 2025 03:00:26 +0000
Received: from BN2PEPF00004FC1.namprd04.prod.outlook.com
 (2603:10b6:208:239:cafe::2a) by MN2PR08CA0013.outlook.office365.com
 (2603:10b6:208:239::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.13 via Frontend Transport; Wed,
 29 Oct 2025 03:00:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF00004FC1.mail.protection.outlook.com (10.167.243.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Wed, 29 Oct 2025 03:00:25 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Oct
 2025 22:00:16 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Oct
 2025 22:00:15 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 28 Oct 2025 22:00:15 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59T30FZv3329110;
	Tue, 28 Oct 2025 22:00:15 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id B040613F536; Tue, 28 Oct 2025 22:00:15 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Paresh Bhagat <p-bhagat@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <denis@denix.org>, <praneeth@ti.com>,
	<reatmon@ti.com>, <v-singh1@ti.com>, <c-shilwant@ti.com>, <khasim@ti.com>,
	<j-sahu@ti.com>
Subject: Re: [master/scarthgap][PATCH] conf: machine: am62dxx-evm: Package eHRPWM overlay
Date: Tue, 28 Oct 2025 22:00:15 -0500
Message-ID: <20251029030015.1893372-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251029025619.499855-1-p-bhagat@ti.com>
References: <20251029025619.499855-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC1:EE_|SA3PR10MB6951:EE_
X-MS-Office365-Filtering-Correlation-Id: a728d53a-6c30-4e3f-fbe8-08de16974f22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|34020700016|36860700013|376014|61400799027;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?1Nk5da5zW8iH7xNdzw6OzxPSFDd7nSBFaR/5LuyDmxbI3sJ2L5E512oOloff?=
 =?us-ascii?Q?iWY/Z9UYOFuWgrtUVk2yyOTwtcq96FSPHQd0R7oyLkc/edUNJRO2LiET2C4W?=
 =?us-ascii?Q?fVyTURjcI/pl+SDmoTU9EgGLOFLnVePTDFP/77cCj7VOKhkGWhWuRS0MnWCl?=
 =?us-ascii?Q?HCJVhMM82P668cFNmGJuNv9kWmv4G5tjPSoxw0llQf7VylBslejG72WhmQDE?=
 =?us-ascii?Q?81ywKmpX5A7DSHxxatrjvnewsbCjdzK6qGDkA5WxAMU3D0AGexXb3QUy3H+k?=
 =?us-ascii?Q?nRxIjEPQjQs0u7/VkGPluzpVmSktha6USgxvJSAdcOjuK3Sh08cSJwOpgM9G?=
 =?us-ascii?Q?CPlEef7vJ6jYljfNByYnzRC2Sv990xnh5Me/LTn5VSVsUe70i2vjVi/OIMFG?=
 =?us-ascii?Q?hkY1XOZLTuu2TKxgDsbfs2ZP8jKaDb+tUyjSDFtEXLboBz66Zqo90WK2vhj1?=
 =?us-ascii?Q?EjKzG6m3xkeLWBCKg8ffUzkaRR9o9MvipyEUy8VFB7OsYpKc4/N7z6dYTEES?=
 =?us-ascii?Q?6zUZuFq/9t99u5CPRMX2+Ea3UKlpDRhxHP3eGjnhcXqYf7jr7EtjQBBcC0Wq?=
 =?us-ascii?Q?fTGcZuKfAlWCz93jA9UJ+5ZhLswI6Zxl0/9L0zBbtha/M8SdM1Vzc4nze8K/?=
 =?us-ascii?Q?7Uqadroo9tzukxNK6bk8sP808NgXkenbxLftlVXee8dxdpqFF7MdTjupfZhu?=
 =?us-ascii?Q?AALBP6/D7R7EjTVlcXD+9K6dUcuB3tLrGLzEoUHw0bp+x/+6j7zjtVazeTot?=
 =?us-ascii?Q?aVGBXALYXBeHGSGxQqk4KTZC1DF2bY3KJ4LFJ8dh0+mNvQY+tkwiW2gixeGO?=
 =?us-ascii?Q?qw1HCWHyAgjLBJLlfqnBPokvSAJw+bfB0vw7cBwgPxlRs7ozPQbXcC3xIusz?=
 =?us-ascii?Q?/PXzL3Gkf5Zg1oz+v0yQGeU7sHayV3cCy2uak8qCrYB/68U1JpQYOJIMKIlP?=
 =?us-ascii?Q?eVn+MmejHECec+rqNkkN0u6GZ5lGxGP2gMLniUmqykE6R+KaiO2i0d3k1EtH?=
 =?us-ascii?Q?i9WaxY7hDD5PbkI9QWaNiBztamm7NnISGQSKOm8HpMRfkwHIyMf7f+XLxoK/?=
 =?us-ascii?Q?CDsEkjqjl+fbnlVVGBS6HK8bcT/WylNHJ5+eqMEehBIfU4r9zGA4LeRdCK/i?=
 =?us-ascii?Q?fw3Eq4tgF14OgVmxZGUV+3/+dCOo6XLg0FooYldR10CtC/OobNqrhx6cdymb?=
 =?us-ascii?Q?pHJs/Dd43pk1qO9+8vTWOB26cYzrLkPreuI6SvXG4GDulIt2G8qqEz0KAwEj?=
 =?us-ascii?Q?4tDyvbsgVFRjkjG1Ykkn8tclDIq6IkpMOn+HUh5cUVSwXwelkdS2R5iN+f7q?=
 =?us-ascii?Q?Pxk0pd+KptB9UIPFrX/iCUZyqaQj5KdaUULR1KJ7ZitERa7cAqrtMHwnDDFb?=
 =?us-ascii?Q?Ferh9hyc4HmQ/HvBFXyBcfQa8ScZ+E7o0bkvgpOkWET06po37xQUMEV9VyAX?=
 =?us-ascii?Q?N6s+W7T2t0uiMD01j5OE5Oixxd5/uXIUZ+8nqq8ahCpcKal8hwkol6SDaMGc?=
 =?us-ascii?Q?UWUOjA+hNKVEjVrDI+VZ40CNSzGF7n8XNFafkD7xhCqT2HAHyS3tz8HoSQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(34020700016)(36860700013)(376014)(61400799027);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 03:00:25.6190
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a728d53a-6c30-4e3f-fbe8-08de16974f22
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF00004FC1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB6951
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Oct 2025 03:00:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19188

meta-ti / na / 20251029025619.499855-1-p-bhagat

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
WARN - [master/scarthgap][PATCH] conf: machine: am62dxx-evm: Package eHRPWM=
 overlay
    WARN: Commit message should not include directory path to recipe: conf:=
 machine: am62dxx-evm: Package eHRPWM overlay.
              conf:
              machine: (COMMIT-MESSAGE-3)
        patch



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
- Patch Series: [master/scarthgap][PATCH] conf: machine: am62dxx-evm: Packa=
ge eHRPWM overlay
- Submitter: From: Paresh Bhagat <p-bhagat@ti.com>
- Date: Date: Wed, 29 Oct 2025 08:26:19 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 84684152fa952ba1a50c1819dbcbbd499=
3dbe3ae

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: j784s4: Add k3_bist tie-test-builds config
- Commit SHA: 91a018116239c12c5d57da646fbcfd6f4af12c2b

Patches
----------------------------------------
All patches applied

scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [master/scarthgap][PATCH] conf: machine: am62dxx-evm: Packa=
ge eHRPWM overlay
- Submitter: From: Paresh Bhagat <p-bhagat@ti.com>
- Date: Date: Wed, 29 Oct 2025 08:26:19 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 84684152fa952ba1a50c1819dbcbbd499=
3dbe3ae

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: Sabeeh Khan <sabeeh-khan@ti.com>
- Commit Subject: meta-ti-extras: cc33xx-fw: update cc33xx firmware to 1.7.=
0.323
- Commit SHA: 6245469825ca824c83b2796553bcb9163c6daf66

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

scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS




