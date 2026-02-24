Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AC57F55423
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 23:02:07 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.26])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33578.1771974122484280105
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 24 Feb 2026 15:02:03 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=qZDZFe39;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.62.26, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jkDe0JN+yy1k4PiFWXinwjOfVUAO5pN/2P5fU1roTvA2ONiWOB7BoGv4eDQcbqIcFxQUGJLnfbj1LEubq6tfoGOr9KZHeUzTZ/5JyPUgqFfm6dW7QcSE3X37alyuf39Tl2mrVdS3tso8xtCnhOBOqRYr6FFyBXKvZU2P3C5gbgVEFHU6QcF3g0rgCAng9Esg+LZN3WMfF7Uau7XArwYIxqaoJRe1bb7PjQ8sRg8AluPm3vadnT68mo06rMQXURmHGVhcMKgm123Sj97NHWNNr6PFSTUUpS7YB9oeA0cmjWXlcdM2WG/xknmN7aorrHdBSBp3tJ4WRwP4iMQ39rL5Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VP+8Kd854RvETkhwAEnFO9JKbKjf+gRbaXQegllL9bA=;
 b=vedAYor7CVq/K+8OWshLIqNub9qRtuEciZ+5Cy4dMjShKbn7qgOu4GI3lHJ5xRktnGDHLnaiZMOaIrpaLxpa5MGkZIpn0/KJ6z5C9v3BTNryPNqJBBQxhLvgpAoCxa89Lt6zzeCTv0fJ3dae+RQZBZqXfohbVEhsfkl6hwpEdzGvGWdsqwn8UVoQubOddBW3+otojGCRW6dGNcyfU21Gn1hILc5GPNrmXDMnB/MKBBeotFBwzt7+VERNEATswlFSnX9XfDho9tWIgiTWR4D04a5WXn/ccOHZJlHzO/NzXId10GtYJRaynCuONTE1t14L9fHyXhLFfapkyKJH7E6o8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VP+8Kd854RvETkhwAEnFO9JKbKjf+gRbaXQegllL9bA=;
 b=qZDZFe39ZDiFPKlZ2Wyz68vflihIurelSwhkv2baQnSMWnN64hNBaP4Ro3CmocLrbuYkct/FedJPFfvZA+BI7hYgu8n0uJlVsyBR2cowzwAY0F+QiJ/yFm0m3vTHK2JSalIgG9uU/OlOdELnZmblBaXc+05V6DmW0rAgi6T6o9M=
Received: from BN9PR03CA0886.namprd03.prod.outlook.com (2603:10b6:408:13c::21)
 by MW4PR10MB5701.namprd10.prod.outlook.com (2603:10b6:303:18b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 23:01:59 +0000
Received: from BN1PEPF00004685.namprd03.prod.outlook.com
 (2603:10b6:408:13c:cafe::60) by BN9PR03CA0886.outlook.office365.com
 (2603:10b6:408:13c::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 23:01:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN1PEPF00004685.mail.protection.outlook.com (10.167.243.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 23:01:57 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 17:01:56 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 17:01:56 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Feb 2026 17:01:56 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61ON1uq83548762;
	Tue, 24 Feb 2026 17:01:56 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vv1Pg-00000008IL6-2rEt;
	Tue, 24 Feb 2026 17:01:56 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] ti-rpmsg-char: Set DISABLE_STATIC = ""
Date: Tue, 24 Feb 2026 17:01:56 -0600
Message-ID: <20260224230156.1977027-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004685:EE_|MW4PR10MB5701:EE_
X-MS-Office365-Filtering-Correlation-Id: 321774a9-136f-43bc-0ffb-08de73f8b60b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|34070700014|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?qZOeJrNBiw3zTodrmvLBMdqUs+tu1pFqZHkmffECVNyL/NCH+RhZlkgArZYW?=
 =?us-ascii?Q?9TmEiUay1xSFNH+pxf5Mj3LZOfgIQrBtXg0mv07Y0I9L0qEYMN9OgD5h7FZN?=
 =?us-ascii?Q?vwVLcXv4iVeWj4AJ8yfsJbUkj2f5HXGPLvO3UM89L3auUXwWKv0DFzyHKG37?=
 =?us-ascii?Q?J3JLGffSU0sndkQVBBiVYHMQWk+iWvQ0ksRR0xCgEjv5yF1Jyj9NMpQGhyRk?=
 =?us-ascii?Q?v2Z4FcSbxwcKX4mjlfogRFGd/rLWJUffEOMeZuUDqzRvoq6FEv1lupZUQRK/?=
 =?us-ascii?Q?NpBwTc6XoJP55kOs+jXA04pSt5mFAQXrblyXdXBq3vX06t9jdDP4G6eIyYGm?=
 =?us-ascii?Q?qIN7SMWR4ElzUuafhk5OoznuIQPE+mnEolEYjw/pXb8wBR77SbUX0SgPQkXb?=
 =?us-ascii?Q?jQ8/IHhqzy2CAPpzCf3STxtdASzS6uwDdRPMozNSBmoGKacJsU7jfzuwCgFg?=
 =?us-ascii?Q?vXELHVS4Fg1e3kXnzIPHnq8dUtWsSv4iKiOpcQS3v9pOzYIgY7/V57iSM5/R?=
 =?us-ascii?Q?47I3n1iLzGFYIRjwPBCOPAYHZ0LroJvGzs8np0RDtSOwwLNecscq3oHZfTyd?=
 =?us-ascii?Q?K5ZXNfxfa8ktF0Fcidgbu6FebLNixySdkEXJ2+Wvu+Y0EBPEijT4tzMou5Wl?=
 =?us-ascii?Q?ph5lTQdYb0msbDRT3dR+ttDpzfzXFyShF5/wrQ7C44teDzy+PYEIN9EnORmn?=
 =?us-ascii?Q?aM20DBDNpWojS+tRAwlwy28rRcoz1uO8+9wM3MpICYebyqiIoc4wnigP9mK9?=
 =?us-ascii?Q?kaR85njjwsBizsKadWHt/vfCO1OwR2n63fNIsMEMU/jr9taCPTA2VVedHkfh?=
 =?us-ascii?Q?KAKkISXIyuv1uPnMzW17tL78l/Me07IHeMlIdKH+XEiqxezwkd2hlAvt8Feo?=
 =?us-ascii?Q?XVkCN1nMp5sfWl+EPONuxDn4OL7eVKlMtHYkYOOYCTyj81SQj2DvayiUOVKs?=
 =?us-ascii?Q?/BRkDu29n5icxPcb5KGCu2Q3bbbbQaWrKQnfEGI5ayOQTuYbB+8dBj4alcJa?=
 =?us-ascii?Q?IEprePuObjNGg4jaSVzTOhFpAO/h8s5NZRFOMT98LykjXYpZUpnHT+BNatRh?=
 =?us-ascii?Q?9wslizdtGw63VwI/Smpnw+i+rRskWubk6KmG+G3jucyJwmd+TtYdu4rMw4SG?=
 =?us-ascii?Q?7rDGwHTig3LAOKEoGqiN3p8ko7Hbs3EGWV4WyFbJUIiFdod+4yb5WgNPGxK7?=
 =?us-ascii?Q?QU+QJ23wohzhz18olssYfgd2fBpPLDPmRA5KMmePXb74KQMs8MLF1E5DwqiE?=
 =?us-ascii?Q?DXcwmC4CYMEmIKw4oXI1M3zdza1aEY7WI5s/GKU6pnXwwY3IuBCFPbO3bpOW?=
 =?us-ascii?Q?fON7UQZZ6GS8bB1zVNHut5U1xaJiHkIWZ3245bxPgSRw4uZI1twpfXCMig42?=
 =?us-ascii?Q?1pYNPcNQH0+M4iZQdYvj5INOihqv5/vs5cRgiILwqqdu/FbljQgCXbKaCrXN?=
 =?us-ascii?Q?cRYe2pRjFhXR4Do+R1fMcZB89KoK2c5rFOMYgs3k9xk8gXcN01od5Rvpk1MG?=
 =?us-ascii?Q?1cHzjWc5oCiu2mwu2+bLfXRbRLHVYZxu2rDcWO2iyRq52MssRdrRIIFMufIe?=
 =?us-ascii?Q?NUs01MgqLaAreUxl0Z1xlncukvxua0o3uDycO0cl/zI93Mi9nNo7HjaAPh7f?=
 =?us-ascii?Q?S3DYeHAGLus8vZ8VTNQQtDM4g0KtKt7tOqJ8ZuMt6lD49ncqJD95ee5/lAeO?=
 =?us-ascii?Q?Xbsgog=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(34070700014)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	44cC2jpQ0dQA8iGMkQ4oAaN2wm58t4fyqw2rRA4ooksp2EAe4F+okiklNd6ivECS1LAwmjshn+Rw0v+5CSphoRVyVkDVuA0R4RzwYMFea3SAHHp1wo1d7PM7mXv07ePpMtlJ6E6K1rXHInR8hoQeGWOEvssIhSEmQrcczQKvliQW9Rplm+y31v4W49tmH7EpNx7SiZnnnMlZQyvmnolNxPK3GL3uDc1L7b03cGHlUT7JGLH3g7HmxPq+gngaHfqnA6xr0sGIEczQyiL9S4hlMnzbUXXxKvKrfzRZjumkhbjr63QEyVByyjOwTNqQtYkJn030CDE5Ufc4XGKNUSjXm6OGyA1gqDhHMxzylrgO4TtSAvirRCFl9oL/08j3NFAQ5eA2/AxSKoY50caFwLwXtQo3YBcS+NSZImIcSGFKbcTFS/yCBb8Eh/yPE/vxrSNL
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 23:01:57.4896
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 321774a9-136f-43bc-0ffb-08de73f8b60b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00004685.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5701
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 24 Feb 2026 23:02:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19592

As of [1], static libs are disabled by default.  But this package relies
on static libs, so we need to allow for building them.

[1] https://git.openembedded.org/openembedded-core/commit/?id=3D03fc931bfe9=
ea3fa9f33553e6020cbc067b24291

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc b/meta-ti-bsp/rec=
ipes-ti/ipc/ti-rpmsg-char.inc
index f9fb0f25..f8b9adcf 100644
--- a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
@@ -13,3 +13,5 @@ SRCREV =3D "dd4783422bf4fbed1015bfaa51054e40057b4f04"
 PV =3D "0.6.11+git"
=20
 COMPATIBLE_MACHINE =3D "^(k3)$"
+
+DISABLE_STATIC =3D ""
--=20
2.43.0


