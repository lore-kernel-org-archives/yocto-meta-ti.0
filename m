Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1582FF8855
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 18:57:06 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.25])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1286.1778007417863670686
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 05 May 2026 11:56:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=mfFvodRH;
 spf=pass (domain: list.ti.com, ip: 52.101.61.25, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hVrugZoVaRj+ARuLgheO51ZbjeKbDqzViBh3che8v21w3rv8Y3XKyaR7yGMs9i8S/mjw+ujtqfBRkpbA4quzCucHPffycwNqP33F4GQr44rcCN5Nmrfj3uKKLHoXhMQo/3523EK7m+NCMR7MsuUXmG1MLfL4vdX+bmutobU46z3iwvN3NF5xPxTJtOmB4juE85sAiDgr9Zf3Rj0crPUgkxoyxaDapVhwhixsS/KABwE4KIh+CgH4YWM95tL4VLtl8vZIq4ALI0oWi7BsvXLh+k7/b8368J/Id87nb+g9CPUVwGsq13LULQZPx00fOyZl0WJULPm/b6joyK+O6GyF5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLUA9inEPPFO3G+Q4sckTQ5BJ7sKJlQEojwMqpFtNv0=;
 b=hr7iGC4yOBHY55yNn4lWt4V7cfebZAsA3aQD94GoTXJUTrsJq1mn3rx3A9G0FkP5/46il/ytq/OLXTc/7d/XyalZfC7QM+6qFGjljQD/B3A8euPjxnWQnfnhBQ4K+chAdJLQO7ksPMGBAd0amMBZddme6PRGCChKnn+VHb7H+pp0o/CJBsZYprj0J3zSP2tG1sQHHkC67xBsfEQ5crLGJ6aS4P1lVpOThZt723v8+kAbvHrLAjqLTjoEN0PAsx/xSsUJ6MydR39B1Mr7icfVLBkqjU2Osacn3mLU/T3WvibkJkT4eGocL/dyDPrKLau+gCv9f4t16Kr67qXoIBLgRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OLUA9inEPPFO3G+Q4sckTQ5BJ7sKJlQEojwMqpFtNv0=;
 b=mfFvodRHqv86ElagE68Hz8Q5FYuddu0QPIzO9yOHF/PVRFAs+kthFiiLwdLd4GgWJJ02N9408mior+A1POhEzVYaQymx/zdVRVqhgeD/RQbsQfGbFHizCkmQkOQBdU+iuhG0OW8nPQTEmu4xLiwbEzvm6AVrIACJGJQz+04PITFPoRhKB8ss1anx60pgcr+WT82zZCL4zfj+2QO0Koiq/wAKrWROlS4S1nX/ccCJy2LlHzAXOEbReRK7fj6BwOFD7m7OFdKei/cYNmJSVZOTOVl98FBVSkFjykDaoIhNZ5DEbQPjQCaKGXqOXwNvr9dr9BvlqUfu4ZaqGVdRvomKxg==
Received: from BL1PR13CA0188.namprd13.prod.outlook.com (2603:10b6:208:2be::13)
 by SA6PR10MB8205.namprd10.prod.outlook.com (2603:10b6:806:43e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Tue, 5 May
 2026 18:56:55 +0000
Received: from BL6PEPF00020E66.namprd04.prod.outlook.com
 (2603:10b6:208:2be:cafe::40) by BL1PR13CA0188.outlook.office365.com
 (2603:10b6:208:2be::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Tue,
 5 May 2026 18:56:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF00020E66.mail.protection.outlook.com (10.167.249.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Tue, 5 May 2026 18:56:53 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 5 May
 2026 13:56:50 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 13:56:50 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 5 May 2026 13:56:50 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 645IuoNi3902117;
	Tue, 5 May 2026 13:56:50 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id A471F9ACF4; Tue,  5 May 2026 13:56:50 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Andrew Davis <afd@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] trusted-firmware-a: Remove TFA_K3_SYSTEM_SUSPEND build flag
Date: Tue, 5 May 2026 13:56:50 -0500
Message-ID: <20260505185650.3876659-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260505183358.58730-1-afd@ti.com>
References: <20260505183358.58730-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E66:EE_|SA6PR10MB8205:EE_
X-MS-Office365-Filtering-Correlation-Id: 398fcf2e-c0c3-40a5-efab-08deaad812fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	5eYt43UJh/K94dk0nbkhSzlZxB2VumYXrg8Bj88PJtsFTwRDLp0Fso2bK6+R2bt7sir7b3gK6IEzBhvRadMWPu0VtR1+Fn7D9IHcbFgNSVc0f8Vf8CEIUSnpac1syI7MOmqjIeFWv7aJoMA0in0sgm/ZhtrA/oYkTHD/YNJqlo1rxeNFW9WX2bp5/nNXTLPq7ZWaexK3LAttk5FcrOPdF9XpJU3U4WPYzI2x/64JU4RUjQBfGfVNrOavfqy71yJI2VTl5bB6KxA2JuWMh5lj/O6JLChbGA9OPM3xo4JLL1KcQlwTtL9noRZIRs0wFUL3Pdd0IJmhOWabXSltuV5zQxtym4EkvrG+KV57URTPYi0f3ATkRQrcGOWLo0qlLAcyGYt1nm3rwNdmZb6xzbrz1j7P3op/xqW9HMykOkZUZ7pKYcTvkNjs28pDWF3WnoaBdvIhnDPiab9v5IRrYsu08sWOVD8k2UmUxMYnUHJyil7I9BLAvfjQwJ5OEqxJip8KUSX1Wm/MA9Liuh7CuOaTK/XvEmQa+NgdR+U8rpnb314cgXsp5XalwPx+ysw3eN4HVeLPDeHUixzl0LZP7ahixDEVbPGniliM3KDfHvtQ2colEootKfPKekp2lV00UL7+DwO/7iUJ/UslBxVhlx070nm4XpvweSY27DHHUW1e7RVBHzD/0e0IO/mVwS5IiJbTABB6pQioxQ07g6FxaeaqDODEL7pE/ne3522i10A8zW8=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	M8eJBfK1m/z+bUsru75s04dzxRel5UdVMCMs+n4ZxZNzv7ba32IMSWpxZPEcdkLJ03BW9ShayJvkSH56wkmkBhWP9K7eoo7q4cpgmMWjJJt1QUXBBpIuxQYLX/eVMJvpObrxDV7U5bvhxPD5x5QWb+IwzoxCxYci//YhHMct6U63TvLWvkLzmjmxOD0uXBuhWEmkbmWYrtDLhRMK2xsD0MTo07kp3WT9fotqMo/FhP79Tqwc/LRq7p+ev1dJFknrQnZ7/3bX2GwwTP833SWQ0jpiT2zmMek9qH+f0pihctRJJHgN5sE1k8zJcpW4QyIMR8kj/BC1HsLSOx4VnkC6uGHIYMBZfMwMLAFcX9ItUQhAk9oLZTVCFkYUUbgYeQB9uFpuGA/HBzrwou1tXrkTKENKUPZGio1X8xZFxCUFvazvjy6a22hY4gzEvlq/u6Hz
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 18:56:53.9441
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 398fcf2e-c0c3-40a5-efab-08deaad812fb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF00020E66.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8205
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 05 May 2026 18:57:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19930

meta-ti / na / 20260505183358.58730-1-afd

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
- Patch Series: [meta-ti][master][PATCH] trusted-firmware-a: Remove TFA_K3_=
SYSTEM_SUSPEND build flag
- Submitter: From: Andrew Davis <afd@ti.com>
- Date: Date: Tue, 5 May 2026 13:33:58 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 36eead46a6225b5ab5f200dc17156dcb1=
eaeb9af

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202605050400
- Commit SHA: e9cdfbae18486a66eebccb3122cac1508009d7a7

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




