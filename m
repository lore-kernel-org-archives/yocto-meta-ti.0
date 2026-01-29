Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1280DD61021
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 15:02:18 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16692.1769698934966782799
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 29 Jan 2026 07:02:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=LalM3VuZ;
 spf=pass (domain: list.ti.com, ip: 52.101.193.65, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uaD/cgpYFX2P+OtM3GoYo2wHHxaX4b6GKUk+W5/oL2Bp/Cg0wVD93EYcf1/DEruTtPE9tY6pEpqkSDyDTKIzvUjjMEO7A9i6NXKrN16MgRUB2qSoXiifV4Ujp0yVwN+VMTWkp1FkzLuTRmmjbBJuM+/ThW5lTnf5ks9lToGDAboFGeW5z0FPskuxz026c5PVCpJL3hzy4pFFb+5OVdFjdvDhbkKQDetqrfleW8awRvl3zKXHQSEwhR/SG6Tu6CW7sgZLA8KBq1tsFCiMCwE0WicQZisRVKsTZOFx3e+teufRSHokeXPBVIa8lpCxhWSVzNuGzA2P7zr2z1ZbCer9tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IxuRJeNAVovOWDFLl6YlywcjvenxPXtMrRfp8QhtuwU=;
 b=ok8BTYy8+O2UM2KC07IAlEmG+TCn4Lf3Z1dAz/nisooIl7bBLHwtsPCbqQ2gyMlwdFw0Q4/D9mIxi5J4VGBe11af4AkYFacF7FESMSIycA9Mk+aFG9ZS2suGCzl6+EGuY1bNn2rpPyOU3GaBewxxlBneHPUkr5vt+I7BtgXYc9FT4TaDyBi3iv6uylHGHsQpSb9oTloZ4bpuEvMOBx93t2F3H2ZTFzUMKVAQenx6utxIir0HeAsXRKqTx9DBQXpBkLbUdhMHJj3xvzBmM6/ivPy2IEg9ZjfIAAOQZjPOaoMRgzV5l0Iqp7qMNrfd8o2UeBQa5j8jcclgmSuhR9MggQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IxuRJeNAVovOWDFLl6YlywcjvenxPXtMrRfp8QhtuwU=;
 b=LalM3VuZAuEw5BVq3iAp0W+y3atbSgfCj+L9SlseD0ZALFXGOkjW3UKK4PYpLkuksFjuTs3OVlv0hfK0esHF6N2/6LvS9UvMfYI4rR0TimTXz2iiyIi1f7QtkxXMyam9sOy5NZGAlTd4XTXTKtBOxtTfoph/gsC7PzhWQwY+b0UX5ly16jVVGoVA388iw3yZCPhKm10a9EDgkZhWweYo7TCGWsQSx48X8tGrbASGlMUIAlOBjHhHV+wPuhgfa/87lkOAJr8BmIPHzy684eXqI8Fcl7lVktJH+cBBucv60KZmkg81QxeK/5FLjoV/jLwktSLjQFGrScAahs7j0By2Fw==
Received: from BLAPR03CA0008.namprd03.prod.outlook.com (2603:10b6:208:32b::13)
 by CH0PR10MB5036.namprd10.prod.outlook.com (2603:10b6:610:dd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Thu, 29 Jan
 2026 15:02:12 +0000
Received: from BL02EPF00021F6C.namprd02.prod.outlook.com
 (2603:10b6:208:32b:cafe::f9) by BLAPR03CA0008.outlook.office365.com
 (2603:10b6:208:32b::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.10 via Frontend Transport; Thu,
 29 Jan 2026 15:02:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL02EPF00021F6C.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 29 Jan 2026 15:02:11 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 29 Jan
 2026 09:01:33 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 29 Jan
 2026 09:01:33 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 29 Jan 2026 09:01:33 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60TF1XAG1716251;
	Thu, 29 Jan 2026 09:01:33 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 506429ACF4; Thu, 29 Jan 2026 09:01:33 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] optee-ftpm: Adapt to meta-arm change
Date: Thu, 29 Jan 2026 09:01:33 -0600
Message-ID: <20260129150133.50831-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260129144214.1879472-1-reatmon@ti.com>
References: <20260129144214.1879472-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6C:EE_|CH0PR10MB5036:EE_
X-MS-Office365-Filtering-Correlation-Id: 15552d44-e9cc-4b95-c3ff-08de5f476161
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?bgOIdTl1CKkNHUBE2K8TzhwME4TeP0itnGDXD5CTEvFj0w0wQj0hHIJK0dUL?=
 =?us-ascii?Q?NWU/NCDdv0/efaUfKTTJZP86SKT88IGwPvcwlme5lJFQFYClIAzQd2IAm0SZ?=
 =?us-ascii?Q?PQkF/0mnS1sLO3Uii/Hl9IdgT9OmnDts5UpwEcWb12Qmdqzk/Ag1hf1TtyNg?=
 =?us-ascii?Q?+IeUz4vUpKkEVsi53ZsEuyetXKTh4Voewa5pBqGvfITX3Kib68v1KjXrIQyZ?=
 =?us-ascii?Q?J2j28pAniDscoc/m9+xTULpw67g1B2MSNCde0WE6Msb0uB/bifD395B1VpoJ?=
 =?us-ascii?Q?zTNgKwe0j3+HYELB5x4DAlHHmEkMYj5XVJ6Ul9w9ljnmLZrrPzDqklchAdVz?=
 =?us-ascii?Q?2GJhEO45vObAbnbBQRFvfe4mpmVr8/XkZtdKZqKwOmnasx9eQGjfreOw2SvC?=
 =?us-ascii?Q?FM64/8J2v7iXTBgAOBRL/fa33JuGeA6Jr/+s6oN73CvP3pd5bgK9ld7akC7s?=
 =?us-ascii?Q?m3m4Ih/dvuGVSMUYsx786JIyIdKBfBm+jFuv2p0r5HZMN4wPZAW4Tegod9AY?=
 =?us-ascii?Q?nO3PMTTz9FE+IxTOAEnNTAXWy8rZaogH6pkTL5V1Ai0lcfyOvESnYL7Sg+KA?=
 =?us-ascii?Q?EOV3VERz0KrQz9CRALvG09gkp3KHvxhOaXA3ysPJyqOJ26I/+hT/W9TF7tD0?=
 =?us-ascii?Q?dgJEoKF4CWBCcKe1ZV3MOTSYYglJL4zItXbvi9PppnNFbQZoABlByH8fY4bt?=
 =?us-ascii?Q?bQ+IKC2m235p+hwWNM0Tgc1VGomp7mn5xyNcBRGf0AbpdlTTUTWxMq1HLrBz?=
 =?us-ascii?Q?CHeE2cllfyu6lh6xGWG+KWmQAoqJ1n+6L4HqZbbZB6j3PyGuSfg8AEsuC8WG?=
 =?us-ascii?Q?W7VtOzTeG4zq5oDbez3G8rhTPRnbND38Hb4gr3a/GAWGGGtnH/nqh0I9BVji?=
 =?us-ascii?Q?8Oil5piBYzNcI3S+IEq7HZpNCOfSyBjQelqKwPEjLjVvZPdMSdk8ogdd3/l2?=
 =?us-ascii?Q?zPEGMp7G8b7U3q1rvzatCaKAp25COt6x3MXRoELaEtu6rL4uOVKHcLRku86d?=
 =?us-ascii?Q?BJfS57OGEDmXUBFUdZe6HL1Gj5VN+pQJ6t+EHyMnQP9cSsVuMYbe4YzC3OyR?=
 =?us-ascii?Q?/MgPFsbb7w/Z+QO8kAiV9g8TxUYYErL+f6C2BovBEKI6x85p9ANBGYawV07X?=
 =?us-ascii?Q?k26YjA37rTu4/OuWJW7rwGVxWmvjhMAxEwljD25jiT998lySre0H964VMddX?=
 =?us-ascii?Q?0RNXhJ3Wh5yWwaggKT2eAhcjdUdgYAwXV/Iki1sLCtzLHzMNlWb3L10WDo21?=
 =?us-ascii?Q?VFnKF9Q9HUg/w3Ggo10nY9CLA7iKHzDhaU6itmIKP+FmsgYS6WHoKO5u7485?=
 =?us-ascii?Q?t+imLEv6sWUZzGxT2WigmFoHBCflHjdlcXCOPB3pYMWvyEqgTAYCp3CmrRQG?=
 =?us-ascii?Q?Y+L68gVcpKnFqRLi9idkwJ+hC5DUoBqmXkIw3ja7uFGV04ugk8Uto3urUoR0?=
 =?us-ascii?Q?Nqkc/z0B4F0d1BFE7GwxfluS4jU1bWKrzUB4fO3H/vfNR+lOfEW0jQ7oAEwo?=
 =?us-ascii?Q?ikSBbrtGZ1f2FcP0x0pZvLajXxOFY/Q2lZr74o/F6n8lmEPzZrdG2nswOnpy?=
 =?us-ascii?Q?1C6vVlAJN6YnUyh52BJUl9gEi6+KagjIml6NQRIlXckSxKLQQoHqJlgYAzxo?=
 =?us-ascii?Q?buBNFU1tlt7X2GaPp+gn7re93vc2o9Pb3U1V9XbdVKTK?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 15:02:11.3108
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15552d44-e9cc-4b95-c3ff-08de5f476161
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF00021F6C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5036
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:02:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19446

meta-ti / na / 20260129144214.1879472-1-reatmon

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
- Patch Series: [meta-ti][master][PATCH] optee-ftpm: Adapt to meta-arm chan=
ge
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Thu, 29 Jan 2026 08:42:14 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 6cd55588c55b7e57078b3fce73675ccfc=
8a85ee6

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master-ltsprep.202601290100
- Commit SHA: ef913d797d6b7589674c112d43e99db858162604

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




