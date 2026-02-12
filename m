Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6405EEEA852
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 21:14:47 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.37])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.56132.1770930881435047139
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 12 Feb 2026 13:14:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=w1IrCaAG;
 spf=pass (domain: list.ti.com, ip: 52.101.201.37, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kys94al/YBLxXNfn6BtQ5s8BsWiSM/3i6EXvfkE7ZphZGTAStb0+qyZaJ9aFxxA8KSJYNRkLaOOdX1pCiFvVG+O/j3gIHdOrmYuzahEbSnJjw4o4uOMsru+XYg9V8893ym2IJhw1fRVgyutgbqFKa2DS0IV3vmRT7kwjHTgbBZFTyv4gtLCTkezuEY0K2TYebe2FH/zNIP4gGp8naNlKsf/xLQ9QfAh+vFntt+GInaxA7t7vKcpjV7x4DrfncLzZ/4BOp/p8LvI9H7cAz37+ht6TVdcsospqFmCkq1JO73SFszGe4CcPPY85+lc6OrKx4YOpeDXXPHcu3R77yDFSIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n9hcJATaNevFGxamqPr2h8Vr18qplt/Fev0RdQ5Jyt0=;
 b=INEncJ//9ZxwgOYRPm/PdveTs4gfJBtXqjqkxQM13WVFfCxDd75DC5tIbkMq4i1TNOyu7tPlNj/lSDK2TOVJnYk1ktDPmvGrGeCxZmW6/NazMr9qZfbQLDrKUWTPlnYrnxZcsw7YXAjC10iLawYb1doTneo7Dh8lpbuVlwXJUSPsV6G90A51IVU1M0ijgLamttwEf8eARZtCMy/ofd8cpoxw1XbAh7ZURvyWwc0kaRqyvTyUzRqXoRXx3NrxkCDkzBleUTj2hPqLXr2co/24aeTf1R2gwhIEiDGmMCNqIA1Eg8rukR10nLCUtOz6thctfeRlIX6eeeSBlQHd2xVgOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n9hcJATaNevFGxamqPr2h8Vr18qplt/Fev0RdQ5Jyt0=;
 b=w1IrCaAGrvJ+qr5GVsu7uqGL5iixtc7j0K/vKpT3f5N26WxxG7NROTEk36hK1qkcmVAUmmyPUi8GikJv702QL1YSkWizG2LiyDo6KZNMzoDCFywldVjanUsFUCeAPprCop3zS+SfUBFlmCjm2BDNH2itRkYl93NyDroyji4MAW3LivHvtrCvsNEDTp+UzDBgzuaWIkmby/vvhCBJdGGhmpqmSKV4ywjetcfZcFVr6jC2pNwNPJaDkGCPNOGtMY2zzo/ApRh1BVtZjQ/v8hs4POsGlxKLRMkvXiBJMiqKbCrhF/s5v1nqs8+RnK7bcRZyj0Oj6+HlJG+xf05K3smjZQ==
Received: from BN9PR03CA0148.namprd03.prod.outlook.com (2603:10b6:408:fe::33)
 by DM4PR10MB7403.namprd10.prod.outlook.com (2603:10b6:8:184::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 21:14:34 +0000
Received: from BN2PEPF00004FBB.namprd04.prod.outlook.com
 (2603:10b6:408:fe:cafe::44) by BN9PR03CA0148.outlook.office365.com
 (2603:10b6:408:fe::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.10 via Frontend Transport; Thu,
 12 Feb 2026 21:14:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF00004FBB.mail.protection.outlook.com (10.167.243.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Thu, 12 Feb 2026 21:14:34 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 15:14:33 -0600
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 15:14:33 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Feb 2026 15:14:33 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61CLEXQ13752226;
	Thu, 12 Feb 2026 15:14:33 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 434A7142E24; Thu, 12 Feb 2026 15:14:33 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] optee: Update to 4.9.0 tag
Date: Thu, 12 Feb 2026 15:14:33 -0600
Message-ID: <20260212211433.2873591-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260212210211.2529878-1-reatmon@ti.com>
References: <20260212210211.2529878-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBB:EE_|DM4PR10MB7403:EE_
X-MS-Office365-Filtering-Correlation-Id: b73854c1-0d16-473f-0089-08de6a7bb8aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?KhZN3I/lAZmPe3Ekffs9ekbM9MLBlemTGGGJQlvucg3n1RLuv+OfNg4fejmH?=
 =?us-ascii?Q?pCvxPSl7OOSQxFZI+u5HmJIf9Dj6xf8Jooj+RfiaKrhLRcZuXtPbqTpQM8fS?=
 =?us-ascii?Q?ZjZIq9lORRp6yuHHzu2t85LMJoyLrUuMy4mBB6DJZJxOxvHyzNlIkSPfI+ll?=
 =?us-ascii?Q?KX6oaXjP6+gyCIq56mnrs0F9pwjhmzD0SYWDm/d8LBK9wkV9AmAB/qNiLgeM?=
 =?us-ascii?Q?ST6bnonOCdORIRktHPrvjr2Fs6nEtHSXP7RA8kKflw7JmXY4wQzJFluDe88e?=
 =?us-ascii?Q?DOX3QcOQ/KkPaG4Waaf6RVnQaX5BJ7pc0aV3PmqcWGgy5tGIh2fjMBMFC0Sz?=
 =?us-ascii?Q?IYZTWXQgGzrRcBWL+GsMWlrZezvDtjQ5tNS3BPMdXbPZ53H3Widp0guKxvym?=
 =?us-ascii?Q?bvK2/Dvx6EekJoE0bN5jKtqrnY3IPrTHi5evesHDEC+866YZhfpKM2OxU12q?=
 =?us-ascii?Q?3OC8wux3nMMgcDd5FPv/RdIbEztHN+9B9GwND1TSZTtKGbuYYkci1cISa3uZ?=
 =?us-ascii?Q?i2spz+wqvuce21QCC8Rh29yXBlJ7zdlpxmVu7YaD1Sh5JrQm9FvqC6O3gLsc?=
 =?us-ascii?Q?xPfv3F52qXPgzV0G/iY7GunA3RFtyFPO0Xg4pERyE0ERmE+9SRq3GS49kRhT?=
 =?us-ascii?Q?YhoZZykD/W1bv62Fd2qCM7nMg9+RKNEXobyfRGJx6o4Kpi1FYntGCFjBamUi?=
 =?us-ascii?Q?95kW8e0BHGHhYOp8FEpb3n0ZeUOBkgYW0ELfsSwZhUH2GNrTRGmMSGwSGRKf?=
 =?us-ascii?Q?gkz8torngsbxk6QIOmYFOi1wKVt35ckO+40ZVwK8wXyeevhUyXHmYIfI/Uye?=
 =?us-ascii?Q?X6iJaP67iOvKj8fpXyKn5XUizH/X0V0E8WmOtMqz1QphL1JQi92J6YCPu5pH?=
 =?us-ascii?Q?VTPFgp+UdoZFQmI7m1TUBTLbInavaottFxZKAO0jHJVP8W5oxa6CVkFaqjLD?=
 =?us-ascii?Q?GA8CJEvxI0ESKqxJaqRSkJkb8LOojMo7oc+5GCAoRmoBTcRDrqPkVeSQExbI?=
 =?us-ascii?Q?rRz02ZyVXpimXJBGE5Nm6iwE9zA3xn9SDnUnT031+SOmDR5m4Iam6DKNqHLA?=
 =?us-ascii?Q?Ie3VBzeB+D+w/qDo1QRtyY/daK98ONLyagLWzpKf9/QVydxWJv+1vK4DGQ+q?=
 =?us-ascii?Q?rx5ZzHX76BsFjweTGCihFlab11+Ks8zD1n3WKOvAea1vL/lumX2MdCab+mZS?=
 =?us-ascii?Q?pM8frTR+X9fxzgQSbrRPoq06rt1MOaAyMhGcMxNcDB6WchMGHuORWPAu/d20?=
 =?us-ascii?Q?j2t/Abu5Kc4YJfUZhWKDb1M3KnNpSkw0EEtYcu/LICmFsP7D7b+qiz9CJXbt?=
 =?us-ascii?Q?4aQA+0W1GHj4AaQhjKlT3rfBpMCn0FD/liwHURSlAac6C9N4oPUlcQ+qAr+C?=
 =?us-ascii?Q?PTkBgXX5OQvoRUK44qaFsOAfedxNXOvPGD6IO1xlw/xdJaJ2oTK4wmdJl6iY?=
 =?us-ascii?Q?EC16MXUGYlsoEtIzwLV9O999U0dnSBz9tleknl375ZcOvBA7GW8ujl6UUxux?=
 =?us-ascii?Q?eVz09vaOtR+W72QkBO4joOicICRP5ORvKxdwuwk1PL35t6s2kXBrKWnjQGKb?=
 =?us-ascii?Q?TTmQ9YQxzWkwtyV9YHPKVajdmlxIpRTqq/b3bTyjNVVvq1Gd+h52Wg7y7Qiq?=
 =?us-ascii?Q?zKP1b5ovS4Y4+74zgYeRiznhkh018lS7aN7nC4P8vcH4?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	zfmSiARt6hVR7qt0wgSlhZtFJkcdjO1X8IPm7iHuLf2QDMh/Gpw8aCxn5NlD2/C9KJrDZp5cAH4y+HT9iS5mHIRfe5BttBunqLIBbYBUiIf0BPiJHtZidV8RjUTbuiArEdY49MS9Y6QAwEXRn+kZzWcP9X8/8WqAXkZGCNnREfX+TOI5ipIT1s2CeQ0eP2gULU2OGUgPBoEf93soyOY0ePzwEYmHMFW+R4u5HllRz5C4HG0JuDxqZUyuKuaN1bj4otYU62A9dya99Ms0fEBYqKbffH0U/YYMsLmG33Ak5gR5Y+whDquwuJXETKzj9CTcPVB0JWsnkER12NeO48PBqFLyJy37jCgX2ovGU6Zn8jjXzXiRX0mUMRQAE3adgCNZYtH0u7UvtVrLd2ZaqUWuLL9lu9UqPjRfnFwv1Z09d3BCWz6nbF2hdQDjGFwy0zKd
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 21:14:34.3714
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b73854c1-0d16-473f-0089-08de6a7bb8aa
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF00004FBB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7403
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 12 Feb 2026 21:14:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19506

meta-ti / na / 20260212210211.2529878-1-reatmon

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
- Patch Series: [meta-ti][master][PATCH] optee: Update to 4.9.0 tag
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
From: Manorit Chawdhry <m-chawdhry@ti.com>
- Date: Date: Thu, 12 Feb 2026 15:02:11 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 246c0fedcefe8e14a593f5668c591e54e=
f60a77a

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master-ltsprep.202602111800
- Commit SHA: a6bf8a8f6ecbd6c7f8305690a9a0dbd0f67b576c

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




