Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C13BEE668AC
	for <webhook@archiver.kernel.org>; Sat, 20 Dec 2025 00:33:13 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (SJ2PR03CU001.outbound.protection.outlook.com [52.101.43.7])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30070.1766190785976085505
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 19 Dec 2025 16:33:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=FH9wQrob;
 spf=pass (domain: list.ti.com, ip: 52.101.43.7, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hdBIPXmrbhFpSX+U3TfKC1ZFjUeen+cdsiudTVJAeB5QO6KRW1cb9u8dHMRIsKErcxqehG58oPxGoP3qaZiERDkJTKkdkU6+EhAkPDqrUywD5ubf5EVPPXorlViyEAwuLfPuB/nytpP/5JuqqowB6TuuUpqXFlnGUco7iX5PfheEDxsHUyhbjZ6PkVv9PiRfCtIkNcOqXpbvma2GdQ9je51p4Syk2/iT+xYI5XdAb5Kv8eRYDFoTzFx6Ri0nmTSKlhWJH+R2oV/vFSo1grXxDysYIQE0wE4256UDq3wE6hx1mPOf67thzSooaoywEgErYGp3GA40ALstAqYpRN/kyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HU7yrKECQp+9U71sdDZo03Ofh6sudTDAj773yJNgJt4=;
 b=ylss3Y/lrGLEOxxxZ+JyVdpES+47mjGL53dMFsj2Cy2/zXGfwYgRlxQIp7OoWBKDncSWKMWFGUs/8ALjMLyaMTLXk3EGdxi+dwjiwOHDLAgKZcmOqU/ekm2MdCueGmJCs9NZWZ4FWv8JTFP19cDbAsgqqPF89j3S6fFfrAPurMyYaiKRIE06jXMlbW+pWiDd32ts6YNpyE5ybmLqnZ9HNsi/dyWonU+XSiCwXxlmabdtRVUbLwYZPmPZaj0f/cFzL6yHzqeaHsesp94XfOyEqu23PKt0BNpQOEqoBD82aGWBqomhm9SNMX97Ai4mLvUyVV5nn786Vct2iyCNnM8yKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HU7yrKECQp+9U71sdDZo03Ofh6sudTDAj773yJNgJt4=;
 b=FH9wQrobcGwbe2iXlN5Rn+Pu81DMXoGB29ZBEr+bU3NPgxGCkG8ims0opNt2+eDkQRIETAauxSesJO4GIsJBCMb4nx+CguYW7FNHw/bTXYA2/3+jEQMztI4jYBeJeFmL9cfxFdBnYK6L3FiZ57pyAJnMjMGOQr/md7IyaskOCqtQEUyXfx314uH87DwWJrUSpiaLgv1Ix0Zwu1AM77WaU0wSMHjI67SsoQnzEJ8VRj5VAjFxvi2uqEOrhkWf+PObYPDAb2f73wS/OgKsRFjtlN7mrKt82Xo+itkfTj96x9BbKUYMfXD7ptvov+L0JnazIu9C9JEAXlP5NZtvEOUzvg==
Received: from SJ0PR13CA0080.namprd13.prod.outlook.com (2603:10b6:a03:2c4::25)
 by PH0PR10MB997616.namprd10.prod.outlook.com (2603:10b6:510:37f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Sat, 20 Dec
 2025 00:33:04 +0000
Received: from SJ1PEPF00001CE0.namprd05.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::3c) by SJ0PR13CA0080.outlook.office365.com
 (2603:10b6:a03:2c4::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.5 via Frontend Transport; Sat,
 20 Dec 2025 00:33:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00001CE0.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Sat, 20 Dec 2025 00:33:04 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 18:33:00 -0600
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 18:32:30 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 19 Dec 2025 18:32:30 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BK0WUgj2625499;
	Fri, 19 Dec 2025 18:32:30 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 721089ACF4; Fri, 19 Dec 2025 18:32:30 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] u-boot-ti: Clean up config looping code
Date: Fri, 19 Dec 2025 18:32:30 -0600
Message-ID: <20251220003230.1023605-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251220002034.2254417-1-reatmon@ti.com>
References: <20251220002034.2254417-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE0:EE_|PH0PR10MB997616:EE_
X-MS-Office365-Filtering-Correlation-Id: dab12783-f65b-4aa4-4ed3-08de3f5f56ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?EiLluJoEDMeZZW5ckB5S4TG4+Th4IutDlv7g9xfpGJGIk/tpmz5N13Ig2Wpe?=
 =?us-ascii?Q?Pjy8cqp90Dmvy2Cv21dBjl49YHaEUqfS5cYziWds9BBHemsh8DaQj2m8jYfg?=
 =?us-ascii?Q?G44aPx62EKJo2HYLFzEvnHrL99eDGeORcBELW5qJ5tnQN7jbn9p6xHSXObsX?=
 =?us-ascii?Q?DnUL+krcOFKtF9lEW1RrBQq/3hKq+O7Gtsl3CM4g6nP8IrnaZNL6TBNGAT5A?=
 =?us-ascii?Q?OPu1erMi2z89Xb45tHZSo3BM8hW3Gw592C5iaxL3fCFuCVa3nGplGxeDqTV1?=
 =?us-ascii?Q?N01dVJlW3qmbvaEDrmosfoEYjdI5TsPXlIVlEGTDnPbJh+rBI8QLCwsUAdwN?=
 =?us-ascii?Q?jaeP0E4HphGGB2modx6PYfyw73W+rXxxgsYzwPI9ka/lIiVp/lgt4WKg/nvG?=
 =?us-ascii?Q?mN0du2YLdYmp+SPOX8YZwYGHRT0S4dQztWVHePj26FGu925gfnRJVIM6JZu0?=
 =?us-ascii?Q?YiOm2JoURchEMG6Q9Mp1mdgNj69BnmMtOEHcp80ZlsqRNNXC+BFAZv5RY8xs?=
 =?us-ascii?Q?mg38/h+JDQJtJ4UTrg2KwAq7GH6OPzwa3QWr+CX57iEQbTsCsCKagJ0/qtxO?=
 =?us-ascii?Q?eqAE/3A4ziv8vZKKpqQC6BCpEGpjiBv+N+XY72hjSotDQRWhlSUGgu3PxneW?=
 =?us-ascii?Q?C8RUW0tQcn5YQCZMWyL4SuMoEoJHaaMrB2LhDGoXDW8u0UUwxy+j821VEUUr?=
 =?us-ascii?Q?Q5rCgmHjaRZby5ljyS+qQeplv1w7HN/JLU5uvDQ3HqmH+57PV9X5XSmDUm5e?=
 =?us-ascii?Q?YBi73BJcG7NyPNUwwHg7CFHneX68+UmUl55KZ+vQwfd+q14Q5ppjgcBS8lnM?=
 =?us-ascii?Q?RosmV0Rw9kfjb7sHTP4ngEA56QVaWjkkOWo7xCpn1PYo71dRqrgSTDQXv0Sc?=
 =?us-ascii?Q?kPRX/eqWsXNYtArxnWdZb0+CyZeJnVbfAym7FGQUr/sGZBfuHHB074a8V7O4?=
 =?us-ascii?Q?59aLq0rl48n5RfReJ+WlTHL8vJV3+4yRCJurVQEvKIeP0uJ5ffN8HGmGF3QI?=
 =?us-ascii?Q?CbiLo3KuvG8Bbels4p59JzaA3ze4HF+773//EnS45mKl/Nb2Irp7dFd35hkT?=
 =?us-ascii?Q?aBgM1dloXtXFx8IkhemZOu2c6Jf9BgVF2y9Xqwqp/VmkcfN8PhimsRzoRt0P?=
 =?us-ascii?Q?l/OTnbX1wziagniV02ljVB9LIdLOTiWFUKyf+pBzPAs8vg8/oyDL3wakoLSv?=
 =?us-ascii?Q?3GlgR4koVDc623vGdC1ET5MfU5cPnXf11POLRo0qBR96bhSMnb9OehItUo86?=
 =?us-ascii?Q?6RnINT1k3kE9JYUV8R0kh2dxl/UPMLau/4zNpgbeVDAAOFKy0VRXPuTEiyUV?=
 =?us-ascii?Q?3rFA/R4W4Ak94nKxjERnVXOoiaJs8ke9kJg/Ekjn7ak6jQaM0IxscYGuF7mw?=
 =?us-ascii?Q?OK+R0coezq7ThlS0aolKjY69OFo4naIEPEN93yHfFG1665c+ugaXsj5fihgo?=
 =?us-ascii?Q?Yl6u9yjLUCfdj6zFhMiuAy9bZmLo4InT//q/DJGH8I2dwrRshMu6YCpwJAsb?=
 =?us-ascii?Q?TjhppQWpuLpk46shkmk0oiY8LmaypehPvrz1n1x0G8qFpVHCCki4VzUZFdOw?=
 =?us-ascii?Q?e3GxVLGbx6xRGqUszmI=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2025 00:33:04.0468
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dab12783-f65b-4aa4-4ed3-08de3f5f56ab
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CE0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB997616
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 20 Dec 2025 00:33:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19383

meta-ti / na / 20251220002034.2254417-1-reatmon

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
- Patch Series: [meta-ti][master][PATCH] u-boot-ti: Clean up config looping=
 code
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Fri, 19 Dec 2025 18:20:34 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 4ab914dd8287015202cd09a9a4b917900=
837436c

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202512191404
- Commit SHA: 8050c16e485b4cf8c3532db43e34ed3609311b30

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




