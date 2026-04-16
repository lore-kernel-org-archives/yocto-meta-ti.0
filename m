Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B03C2F8DFD0
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 22:26:04 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28094.1776378358346061947
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 16 Apr 2026 15:25:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=S4zx94dn;
 spf=pass (domain: list.ti.com, ip: 52.101.62.29, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E5VJYDE/HTZQVGYJMfvJ4/gEaIIRAkPHm8d4rl4cmLfrfznhZzKTIqLIHmM1MInT8Y7qcGCWKqRbYfm1AVNkGgaq4xnX51zFiGgrdvAzbr/aCWUATo5UbguJU08m/oOasDv+ELYXLswWNvBDaldwnKheDz8nS6l9D/CawkW0IWkWHnzemiwkPr7vqW0ksBWD72zopEgPfz/Zlzi8P8jLUboI0sjjRYlzQf+cTreYU3HGYXgY+XzgnqElSJ57O45wlr/LRFAFnfl+Z+AFhGAsq+hH1qvRzU5oSYLj0nT4Us/4JtUxz2he9DXQEgudUVWoFawH6IQWBmsV4SmdSsjung==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ukcvn8Qj6adtSJQ22lj+sMH9+hkOczkV761aztiPlHY=;
 b=qQKz0Y4H5C/oy5uFJ/lEpd25TIsPBVi2k+m3+QM1cCo2bnPeyGvoNq8emlx7b6Z6sPBKIDdJyxExjPaG/zsRZYwfRUx14R0vZi655ma9k/5t4ClMoMm7fXEWecZ4XCtCFM0nr1LHSdW9s5f2CPRBppjRhVnW1k6nHkm7H3Xq1EwiXjgRS2NBAgad2ojNvWkxW5Evoh8r4490N2+6K2EZ0TSZ7B3edUN+T+BJ7YWqId38RnyuGe8nJuiS7Cvihm75E3VA/ztTMyd7ZJdFpLVch8wyOrvSKVyjxHByVtq9OpiA+giocS/6/FFuZJB7QnCVLA96vmdaJWVVvRL4orGlEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ukcvn8Qj6adtSJQ22lj+sMH9+hkOczkV761aztiPlHY=;
 b=S4zx94dneemLaSx53/wGVZqOCBPKJgTywjzBLWSIoSSGCq6+eyyuuuIwoHPhtiYyuKOnVLpmnnO/Uim5LUEO6zJ2WuBYacrOPQ7gcEbSn3tDM+etn7oa7q9Kvfa3Wu2vFw1mQmZAB+qHNJA/SN2CBEQG2rcLXK4EIwh3vCakmfH2+fyibXvmke+kpm5AcxscUTHQwh9Iij0ItPx+wUtoWaWOVs/DPVh9xhQ5yWjHy7risKVo1i1mvbqUod6YUpdUyRwwZIc0bxjD03ON1JK12WS6VfTZOwxR9M0ui2/AqS0ssMK6GU5eObeDlBYbPQ+1kHEmzrG90qtcvppyxNLyFA==
Received: from PH7PR10CA0020.namprd10.prod.outlook.com (2603:10b6:510:23d::18)
 by SJ0PR10MB4528.namprd10.prod.outlook.com (2603:10b6:a03:2d4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Thu, 16 Apr
 2026 22:25:55 +0000
Received: from MW1PEPF0001615E.namprd21.prod.outlook.com
 (2603:10b6:510:23d:cafe::25) by PH7PR10CA0020.outlook.office365.com
 (2603:10b6:510:23d::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.52 via Frontend Transport; Thu,
 16 Apr 2026 22:25:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MW1PEPF0001615E.mail.protection.outlook.com (10.167.249.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.0 via Frontend Transport; Thu, 16 Apr 2026 22:25:52 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 16 Apr
 2026 17:25:52 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 16 Apr
 2026 17:25:51 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 16 Apr 2026 17:25:51 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63GMPpY62673530;
	Thu, 16 Apr 2026 17:25:51 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id D20459ACF4; Thu, 16 Apr 2026 17:25:51 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: <rs@ti.com>
CC: <reatmon@ti.com>, <denis@denix.org>, <afd@ti.com>,
	<meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] k3: use ttyS2 as the primary console
Date: Thu, 16 Apr 2026 17:25:51 -0500
Message-ID: <20260416222551.3385334-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260416220111.3933721-2-rs@ti.com>
References: <20260416220111.3933721-2-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615E:EE_|SJ0PR10MB4528:EE_
X-MS-Office365-Filtering-Correlation-Id: bcb8790f-f0af-4888-31ae-08de9c071ec5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	g6z+N6Ux3/UnqOHo512/RbShIsPlCLeko6JBjkYypTkbwPAmU1qywZco3sLWECpSuACN6ZSelrVIrT+MJQ7hKP7I6+ggMfpObCCagIxKnCvWxOya3NOV3sLkcl1F6T7/dV6s44jFr8eCmwFfrN1EjNaeL7eQqXob8PG/k1JywQAU3FKKRKw2NeT5rHtWVgF0Rhl676KZfGwQdeVKYHVZwTa/vA3RNPE6md4U1k0fI/xgs4wqSKppJ/fnML2UFljGudQtJzV8TMb5MhjHJIb//kBI2BYurRzzOPpfoZhjP5zf6Y0AMPcqidbbqZ9zBHZbZptp+uUQCS4QHw0VyWVmacXXMDzXvUJQzChzGe6Hx8u0q2mK6osNUaTb6UKFmXhRClqHoOEK3QGrD8e/HI+C8g+W5Ak1r543Vyjy0TjOhps6c8Ua+gRQKMxKzVd/D8kR3M6SlQV7tXRfCH/6Tp3ctmXMIzqMr2n9TycFtur+UvWAiqykW1fXvwZ9FffFj8CS61iqFm+abKcOkx/x8r1CyynSqrccvdVz/m3F5B60GgnqLxJ6mIK8e4xsAPiE1HzktHHDxwppYRpHHkPBmFsbNwgFYg9gkxN8Eak6q0hlW64idDgImB5ZXG7wYEwr4OSTyCDzPbaEig+i1uzWAcrIgL5NZyOs737kBhW937fCUg74+Wb83IeRX2P7UeXnW+oqu5trCHU72utAXuaZdzuBPVsHXkXnHT2uRKxB05Ae1c02bP78MbEOFUar7GN39BNoK3Lc75UjHpsjXdQm7+rjkw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	CuHCldde2FX77gCSh2JllK/NyoBL74alsEDSEGjQD7XekG/WeYqgS4ofNEgIMM0+ICQM0dIbLJk+39+aI24gt4jo+XibxIT6dLW0IkGFtW16xoPgFu6pH4EsL/E8NTCesc+2oeUVxEgy+1ktmYWelRoVgiwrnZmg31xrXg3BaI2fgp1oP++8IN7SpJLpD3j/Izpo74MLedTBPrlLB7VBhf5qc3Cyi6mCBVwaEWWKzVKTvgBBRWm09SiS5cpADjT9XFOt0grZERmR3jKxrxnRJyGAjqUOGPIQU7PMCC+T394quy2Z97eidl260/t0Zl4FcTupHmVXgnI8lAr5Y0jARNpY0X4aEu54wC8G94ckVKHcB8QINh9OXl6xwfZ/powkKZIXlfoF9dFpwGVO9u3tDGUBbL6aESRaJx+kpttLHINTCW48DssEFyKfJzvW84Qf
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 22:25:52.6840
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcb8790f-f0af-4888-31ae-08de9c071ec5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MW1PEPF0001615E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4528
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 16 Apr 2026 22:26:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19861

meta-ti / na / 20260416220111.3933721-2-rs

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
- Patch Series: [meta-ti][master][PATCH] k3: use ttyS2 as the primary conso=
le
- Submitter: From: <rs@ti.com>
From: Randolph Sapp <rs@ti.com>
- Date: Date: Thu, 16 Apr 2026 17:01:12 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 0b4eda5aede7cdf317d06483446346839=
73f72c0

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202604160400
- Commit SHA: 7c6fb32dd72a69dc4be844535137c17a35fc6f5d

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




