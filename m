Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 555D7FEC109
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 19:51:48 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.35])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6035.1774381906446843976
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 24 Mar 2026 12:51:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=SbZKZqAn;
 spf=pass (domain: list.ti.com, ip: 40.93.196.35, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IgrO3WOIuYQGs9WdRgXlhqCTm0/ltkVg3psTdSuQUWaKqGDtTbhMZ+bZ07S3bW1X/9RHArxcrLxOex8tzTmhF4I9SnK4r1T0g/wW77logMB68j5L6VnJ3H7jCV1oCguuMa9+U9mi2J1iT1/Eu8uR3maJTThM5yPMBXM3ceoiSIkXh0Y69nqH3qOoAWudBtcV6f4HG7MB0utgCKN/1kaFZS09+Pi3m718H8EBgnRKCzhXYWZMTmAoGLAQ9KZiUAENWnZYqW0cc+5zH8La/Yi9m20ONUJIRNtYanZ1vvyMM3r1eAxKrcg4dB+/TSKXhhNIvPHbIHPo0g1GE9H+gQbxAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pn1ANgjv8YhIQ60xalkhMvqtb0DRn3GGA1yXp3tnLnQ=;
 b=AbxRDJutPdnI2V73hjalLxVOJLNDGFLEg7roPNpl7E1izGanmET+AFlP1CWXiAfxggZHEkFpRLvByXRSxndfFSZjDnUOvUAJ2qn4Dr79lZokO2Rjo9luAzfaVDM8tcLauro1mBasU1RRJ+0i0tZTI2+TSt8o4FBpOFivF7idXEFkWldTYRhAl6PHSVECwTqQO4O6+61PA7amWMOxkQWdHgCn0gE+dvSwE9G0MKifpk3fSLiV46kiD5QteWYEakEl/7fCuYhUbrLsOb3sxpTCs7UY8xxLmDRAhUFNN1EFJEGxojpG4r5L5OUR+/rqpaA5Kju6j8dmKKxUFNOnN8CNHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pn1ANgjv8YhIQ60xalkhMvqtb0DRn3GGA1yXp3tnLnQ=;
 b=SbZKZqAnsaAroychOSXveaKV4Erc+KbKUXgNNu2c8l0oHcIQIi1KxhGbAQ8ze/d7/wdLKUl1TFUk4C+XbRMIumuIJpv8NUQ/O669QTjZWgZ3gxtmNKGXag24XxZVYb3SkDt+w5NifPV1Wh1r4Upn2E4AeY5jfTK5bjbv6ZlbggfHtCLPGeNPiduKSEkdFghV848OX/FlohkfJWiwh77EpgndI2sE89U6WKgGmJKPFtzYdRcZ/594Zk1p+CtUtPVkWaBsIDzTLrnXdYKNp41Xpj0V2WKXi9AyQiGWc/4OV7FOZffKcnfc2+nagSQ2ubfNOkwidcDi78WcHlFYJpP7ow==
Received: from BN9P223CA0012.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::17)
 by PH7PR10MB5770.namprd10.prod.outlook.com (2603:10b6:510:126::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 19:51:42 +0000
Received: from BN2PEPF000044A2.namprd02.prod.outlook.com
 (2603:10b6:408:10b:cafe::cd) by BN9P223CA0012.outlook.office365.com
 (2603:10b6:408:10b::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Tue,
 24 Mar 2026 19:51:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF000044A2.mail.protection.outlook.com (10.167.243.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 24 Mar 2026 19:51:40 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Mar
 2026 14:51:39 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Mar
 2026 14:51:39 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Mar 2026 14:51:39 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62OJpdRl2733216;
	Tue, 24 Mar 2026 14:51:39 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 7C7469ACF4; Tue, 24 Mar 2026 14:51:39 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Mahammed Sadik Shaik <s-sadik@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Prudhvi Veeramachaneni <prudhvi@ti.com>,
	Ryan Eatmon <reatmon@ti.com>
Subject: Re: [meta-ti] [master] [PATCH] ti-extras: update srcrev for jailhouse
Date: Tue, 24 Mar 2026 14:51:39 -0500
Message-ID: <20260324195139.1036597-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260324192849.615116-1-s-sadik@ti.com>
References: <20260324192849.615116-1-s-sadik@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A2:EE_|PH7PR10MB5770:EE_
X-MS-Office365-Filtering-Correlation-Id: d5cb2192-4b85-4025-acbc-08de89dec462
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	gEXput5vBrw0crA9GqUBMwvHd01rBLh6U/zWbroMqw4f703tFM28BPb4E7O+7puRRx5T0BaglFdI/jgI0u5spbZ1SOsjouMEDHOU2rnA1+ULLrvJbQs3RdyMrithWnoFiTZN7EHIc/9sAKEnnNgQHbTqv/WMAKOJpPOf4rHYFsTmhxOmSivb9h9DfqiyLyBJJG88UfxrvqT49KkQ11O9NZafX/N0fckKSGFMTLGcAXlsJoxc5ue1eSru2XpCV9W91EVT0YwBzs8d1mL1bl1BLigUuU6SiaeLfHSzTCCtIbu32S9G4fXjsmLfcDIeCZCA384b7VL7Itry4+9hLXWrfbm8cYcg2Ot698jiEChjs5FgjPRy+A11TxJaZHYgoIipJn4+ECbmS+ee83+xD/3C0uTh/adOEpEmeaNe7K9A91LmoUEhGyhIwN2096RQQwORkLjCcbSRzzx4FpfQC9QCBQrI6Pvz2FsoPxIlGFkJqeyETmVt1nR64kVoC5KRmLn7q8MWwhdUs7ChDcfOlSLqIuHOuAAvF8v02gbsNcuuY/mIlMx2jeILAPXIaW/8Stc5d8v0kbtAz9t5skCAnQ2pgqwtitHcjM0ERHDPlHnQTB2XMH+6mHevuMVZ5KDVCKLYrodnqlb1razI5Sq8/8vLgRdomWHvwLbNw4QqztHxoiFnKsVaYw/hm1WzWiqF/6zHHnhL1kElpIrIw+YG90rMQ9MT3ikPQMjJM16gNllv/FTJDqjRcWTPsr4G8ECto9gadhiTLf11+6ci3iVh0G6Mbw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	/vra0sNcmKLsM+6k2lyYpshSlqRL6mZpF8errJcR0x8cnVssk0WAMXHIHjHOaOcySNGbSZn2yRNmcIyMqxDhrunhespkVr71HybCqTyOOUfGMZ1CDBKgO1qt9Az5Jq/tkeKWSVyPRHzldM0/WhGUjHRnmd86WleZ1CjCIAtwuHdbNZ183XeyZ9juxka9cgmVPioFJ+LL91xQ6o8uBzKgWQbZOey2NQm3W7+bE7PDE+f3bjhU4McbLSXW2MfqfLFRFTsnK/EK8wJT9fHfJcQiHDv4DGSjeGVNWkwH5t9sbFcssVAGmpTX1+cZtzNZaP4dhDw4DmLMjhgR3RWvRWtwBTDzZkHKIP4ls9CinPFZ9mjFiBn5udQdyYUZyKz2ZUOMut1KyXN9rlv5Ccz6aDj62sAEqE/nYcjsRj6bzb8amIPQ6JHf2NyIjclcYFi9BuEK
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 19:51:40.2586
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5cb2192-4b85-4025-acbc-08de89dec462
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000044A2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5770
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 24 Mar 2026 19:51:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19810

meta-ti / na / 20260324192849.615116-1-s-sadik

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
- Patch Series: [meta-ti] [master] [PATCH] ti-extras: update srcrev for jai=
lhouse
- Submitter: From: Mahammed Sadik Shaik <s-sadik@ti.com>
- Date: Date: Wed, 25 Mar 2026 00:58:49 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 87d759a2da2b735ff7b17ac39de23144b=
357624f

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: weston: Update to 15.0.0
- Commit SHA: 455d07604fb637e662485936390ebb34c819e8e8

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




