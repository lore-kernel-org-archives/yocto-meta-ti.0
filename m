Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFD791099B3B
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 19:39:57 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21308.1774035591447438627
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 20 Mar 2026 12:39:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=EThAYsea;
 spf=pass (domain: list.ti.com, ip: 40.107.208.4, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Di4Zw8kd519B5K06Qqihb1ySBpglE1LRTZIupJw9ERW1HzoMKr4o6cgM611ocIyYObX1VlAx75lPNz4tOlKkCHKVstz1nimYF8ozmnGEGTbUdb57qS358Q8gWGTEDpp4HyGZg05cbU902mHjYgVsiYA/5/hEHXvlD4V9ELz8FzqOYRJsHvITwML89Wp1zwWQq+fuKypS/0u/WJJWpYgw8HVGX/6iIuuSvNNMAoOoEess/UywZ0JLQJgMc44+e8YyuUlz+XR/W/tFK/dVySx/GgWmxRj+TxEaHiuySJimlq0ZxUtBGNIiPynoMYebQvLMKOwLCBWXs4oRZDHXTGL0RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=knTN11N46K5nwMCb9GesV+6DIymNPY5RSP6JUfz6ncI=;
 b=OQ8yEYilIf/RA4GSaigr4F7WPOIuo7crCj2oKjGITLIOWbnCT7qRJJh4/pI42Syp3vuZ5Zb6rXYcEbj//BUymDuKG5Y9ZOjyu8Ul8IVSgCAO2NV4bHyNAygjAQNHtiDPdh4Kj8PLEvFNZYFmvl6w8fWYzwDZPrG8NbAegrNSuD2QTPZmS+q03YQuvct59wuJs4Gs3J9JO8GLFN06S4ZZaftKLAPWnO4fC8RJeD7DQyjII+tzCB3z+uyagxF//VK0evGZkf2qdOIdeLNXTApyvzSSHXRIg96SgD56fg71wpFdh5tzew9lkjwdAFZ6jW9d4nxf3t71Rq3RR3q7nju7VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=knTN11N46K5nwMCb9GesV+6DIymNPY5RSP6JUfz6ncI=;
 b=EThAYseaZY5cngUVBzh8L6p0cxtSbBGbqZsft7G3ZROd6ofr6UO8zNz6wyuDs1ZpcJMDgdIop5riYKNMoGGIJVY4Blt9PA/CPz2yh2Eo9Aq0rAIxAbKvehS7IVBciSrcdxBXAZza6C78rw9zf31wB2hkffSnh51GlcGEiyINqhdU2fPYJc1I9AGVz0NyR0aAm5LIAT8HqBiSNDSD9tqMgM30+CV7H539pVggLLzMWcHO+l8KQjzst3AQFIWVBu92yFgcjRbmTVSxr3N9bvbLCPPyfP/N9qIica4EdVzbrZ1KKvwpojgc6PRntzkC9e7EtAJEGEbk0G9X3sr3UKBkeg==
Received: from BYAPR03CA0007.namprd03.prod.outlook.com (2603:10b6:a02:a8::20)
 by SA2PR10MB4412.namprd10.prod.outlook.com (2603:10b6:806:117::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.18; Fri, 20 Mar
 2026 19:39:49 +0000
Received: from SJ1PEPF000026C9.namprd04.prod.outlook.com
 (2603:10b6:a02:a8:cafe::15) by BYAPR03CA0007.outlook.office365.com
 (2603:10b6:a02:a8::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.20 via Frontend Transport; Fri,
 20 Mar 2026 19:39:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF000026C9.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Fri, 20 Mar 2026 19:39:47 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 20 Mar
 2026 14:39:46 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 20 Mar
 2026 14:39:46 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 20 Mar 2026 14:39:46 -0500
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62KJdkT2628494;
	Fri, 20 Mar 2026 14:39:46 -0500
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 7E0AF142E1F; Fri, 20 Mar 2026 14:39:46 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] check_yocto_rules: Add new exception
Date: Fri, 20 Mar 2026 14:39:46 -0500
Message-ID: <20260320193946.1714718-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260320192456.2510384-1-reatmon@ti.com>
References: <20260320192456.2510384-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C9:EE_|SA2PR10MB4412:EE_
X-MS-Office365-Filtering-Correlation-Id: 93dab849-e447-4523-2bdf-08de86b871d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	edIUwdH2/ExQGccK6UHGZDYt2lqSsJm2LhLIJbNUMnC4c4h+IFZMKVb497xN/r1E4hHQGOdgK9FA4r55QnH3HRdzph479h0kGxlDscML7T48JOWdrKn9mxRG6QLJUH8G3CDmD2sW648Rz9y0d8GSRCQlIPOSUkCzxqQaBVq4oyEDED2YFzTWdw3mkIzmXkR9ExEWA9829be1+gTjG5A+2+T66ANiIfxDGEXmn5mlBXOfRtMBpE76zu5Jh6VruECh+DMq7nu5oUl+KWEbvVJgtszZ2m8UXDnDjGPd6HseTm2qazeMw203U8psxtjpRdg788+hvYx9H0cl4KJc4CxhWY8yXdQWEu3BpYAdoR5cEkn384bhx0x1ta0y9ywXSdWhbLExw87AGitHeNw8NDhxaV57+1TNpnk/Ty9wbnqq5UEIOnYoLeCePvaqTUDjvs/eaKYh6++QNn0n8+TuZKuBhtPeI9n0ClxUKJIovp3yHZWWUE9XoX0W2ps5IngopNzucH/2TTPzII8mbfAvpCojR2jBBD+6s5Sd0TEyzNZYQ7C/8WFk9yfILI3oBkwK5N9Jafk3RfVW9Bt/Uw8pVaJRwWnObONeBHEAHidLTVCW8lPNt7zpke2PMmXXqLsbQ06WAD/a/jPYeZzOlc8LAG951tgjjeLXScpb022bsZplqjoK91dgaStIOxL/M+1QyafUziqWArHgV5ucs+k00t2oelGcUdfEp6bxst0uKQuSroVB02X1vtJCa3aXApLa47seki4JbBWBJaI5VWBDqrzLBg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	k4RwsOkLhrCyQfnfJB1APsKJnXdvBKO0scdmqLdd5vITqD8vrFUhL6VP0JIGRqDcJU55sSJcNcqwMw/JAT3AW7OlhBFx0sUhGZovQiCnuaIjnl8gDKvuqbqpAiHESIg8kW3Hogp6RfmmV9JYaY/mqHUMr0hSy0+KL8mmpRA834Q3F0SKX8024ae4G1N4JftctXB+VzEZeN3Yq3M2jXyV6Fm0deUFb/6TD9TCJYNFNvnzNswbR6h9Sicig06ytScnkCAo0TNCSSgS9PIB+phZWKAr4RDeHRd6PQEczmRjGb0DwdIrEYL//tFg/WsUBvmaA8lLo9WZ2z51oQ+3g2qcICAh2t2KCH4D7u3zesDkFPjizpzSabZoQBNTD3NFjGm/GYG6ucgTI5CXAFHuKUpty84Hf8un0+WXjsi3X3hpq3cQfT7yDYEzxjMFi88TNXcX
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 19:39:47.3520
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93dab849-e447-4523-2bdf-08de86b871d3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000026C9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4412
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 20 Mar 2026 19:39:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19801

meta-ti / na / 20260320192456.2510384-1-reatmon

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
- Patch Series: [meta-ti][master][PATCH] check_yocto_rules: Add new excepti=
on
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Fri, 20 Mar 2026 14:24:56 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: e8f34129b46f0e51c3308adf06d312250=
ba23b0f

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Shiva Tripathi <s-tripathi1@ti.com>
- Commit Subject: conf: Enable dynamic tpm-layer support for LUKS
- Commit SHA: 503701f246332b8e37784b10a89f702e5c9d7da5

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




