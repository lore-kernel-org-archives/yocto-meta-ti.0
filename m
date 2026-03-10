Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2B6CFCC9BE
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 04:50:23 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33229.1773118216533157882
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 Mar 2026 21:50:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=vw/SBXEb;
 spf=pass (domain: list.ti.com, ip: 52.101.62.64, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x1fipKtpDPk6zgQVfSfwG1P4i40CAYAFn5GCT+jHORquWzpb/4sADgd6umo7QfkdlO3At1i+Ys1ZnymqcAH/BKlwE/OjRP3JXWUmE5WfmV0XTRdHfodPTLDU0pRTf5ynNYDPkIJC9fzcAPD00MU0gr/c4X5dov4HEDKSf7kK3IcGZHf6sM5H2cAbdAJcedwKprLQlCa32As1aLX5x4tldfm0rIuFm8ehCgO6HyHwLdYFs5eHx/lpXRogkZfjW1S0rVnRave9xXWnyGC2Zz/b1wZJ3c7SHhyCm51ZB1ft/rGaYmL5NOPPg97aAMyI1CafARtM4Y57W8AHR5OCpVwVqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DQS7hnHhAJPpOdJNPB6TwAo810i0kA45W2/qSoAIAvs=;
 b=lEuz1y5a5FXz3v6xIyruPvsCBNv/x1moz+2brdgLJxsP9IHegK2qhDx+H2MfD2cdJxNAqwGOf0tGH6fyca5g8A8Y9JZFm4AP8gtyn3Qv2IgJEKK61HxgVveD7VBXhe3/HkPVQ3d2UCgEfobe4EKLN4fpswqlYaFsA5O3ZgrPdmPrG+7uyhUmTvvc7lXRjKzVBOWEglN44P57c+IX4aQwx9zZDDNsnJeyYqwzFULbozmXzUBQkgDma1WKM8LqJ86IERV7yRh5b/4UV37B3s6Bppfjr66aHIi+WCkW4G15+fHcyLhnvCKtMg8TalATiQQKaTRqvvzKZ1nOqQp9SepT1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DQS7hnHhAJPpOdJNPB6TwAo810i0kA45W2/qSoAIAvs=;
 b=vw/SBXEbY9MBqEMRnJzm3DC+P/WlF5HRNzFLv5l4VJDhM2UX8/a36op6DIvg4CXTaI4dmp/4aFMvbsbONKSMaPki+lk2l0HGofkN6rdWtdokpt6PuQbTXUlBpo7Nc2lQ7uJ/S49k+ND8bBvxzLK3pvPaJ4eQLqpqbJ1uoACpJ6oDh5cozKtDGG2+R0Jufh/ynn33aId+2hN/B5KYZKR80vQJKFGQFZuQBiX9MT+5oDXagsHADDb20xXjvG4mGJQFJYb+d8Cxcj9oVX7Hp8FwmAcfGtDJY6ne5I3CYsh2ExnTr/W3ehbpbdubVPZCefRVJGLJtwUnp/iYmqZPN8+0VQ==
Received: from MW4PR04CA0216.namprd04.prod.outlook.com (2603:10b6:303:87::11)
 by IA1PR10MB7200.namprd10.prod.outlook.com (2603:10b6:208:3f7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 04:50:13 +0000
Received: from MWH0EPF000C618A.namprd02.prod.outlook.com
 (2603:10b6:303:87:cafe::c2) by MW4PR04CA0216.outlook.office365.com
 (2603:10b6:303:87::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Tue,
 10 Mar 2026 04:50:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MWH0EPF000C618A.mail.protection.outlook.com (10.167.249.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Tue, 10 Mar 2026 04:50:12 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 23:50:11 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 23:50:11 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Mar 2026 23:50:11 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62A4oBAL2961981;
	Mon, 9 Mar 2026 23:50:11 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 10DA9138B5B; Mon,  9 Mar 2026 23:50:11 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202603091800
Date: Mon, 9 Mar 2026 23:50:11 -0500
Message-ID: <20260310045011.682622-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260310043605.3034427-1-lcpdbld@list.ti.com>
References: <20260310043605.3034427-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618A:EE_|IA1PR10MB7200:EE_
X-MS-Office365-Filtering-Correlation-Id: be144191-e426-48a5-89b7-08de7e60839d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	GV0oNbUWkWy510eBoD69di/cDO548pe5gSW0YhQ6VVkUr6kKki2IgKjR3T9FrJdUlduYVETllD0go9R1C7iU4fHC37mDfTVOhUwNEYtJ90y6SyD9YY++PQeIcMYRVzARuuWpfHZrBGAfBoO2qREZmoC9MWPTFHhw8kbWmy6p2EsFXeUP94ZfXu4ox3umpef5A1agF+YaDoi2Yemr2DfrwfEpWgQiO0vr7QzPIaptNEDiiXHN8rT9RKemW6N2D4o5puWS+XN2x8GS4p3wRQ9BY8LiA7DgYC4vkFnQN1lqHMo0T/x+kUJaS57DLZ9VbvwwGFv06sa0gjCtkIGd911/4SPhEudIOP7Q4Cg79vHrDPLIbopGBX0bxsDtnlSEnBsGlmODZ8p6TvQ82U6Dzzm7HFRVFr0unug3oNb0q9PgZIFuMCi2+qf1T90wNZLND8gsmXI9GFoszbC4fEK1ZU4x4YtiV/pRKabRFDJDH0ZaJ9lVmoTPVuGHuPW9UKgmYv/V77pkPetXGtW14jvywHorBkBUbMsfAVu9dOh/RID2/Ebcyy7wgTJ7ZmoytMFTSP0THhDpmmlTajJqrRyuJIRR/HMl+kQlgNVSM7U7lN/PZelIGuLfhF3bPpoTwzhL3C3OWAJHSKWq4wyCo6aWKwootT0fNAzwHSL2NCvOr85agqdMTt/l0sfGPAWMxkFMnNpL42XY6Bclsjm8pxKMwlsySiUr3CoY0JhyJvILfeYbWetKDvpSCS2Ph5ef215qWihKdm5mO4KaAMu65FE8HT3+MQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	GqzgmA1/lyJh8N7WSELWsyE8xbwoffJ69+0c1if+g3UWiiVS0kWeeTtT6rBNm1cqCOE/HZnmowZG8i+SQ6oHUnQkwvGuHapw5BMhhwFdH0OlIZ11Kvinj4G5boWz+S2U3lcKFncLPexzdyQPmunZLKzlsXPbNbyAxxCmMipcfoGaEk2GEiZht4PjVAxE2588z3WQMMoQnqLl0MhfRognFcT/21oMld+aiWKTQ+nAewgTWkGAzbEyELfFauV/tsjkCoT0/LQk4xtSuRfwujIndpYMcA5xu6gqga7MD8nFKDydk7Sqjv5cZgpks33l6umlYtAFD5sEJzP0qViY0Yg13p9/od1Lpc00Egl33tGxtaJCB2ppcbQCnJjlBaEp5J+Ke23B7zwZYvCgjGNSnmajngT7FmFQHJ/K4spwKnRSuQOPW1gvHZaax/OgpXVkJtup
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 04:50:12.2033
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be144191-e426-48a5-89b7-08de7e60839d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000C618A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7200
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 10 Mar 2026 04:50:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19686

meta-ti / na / 20260310043605.3034427-1-lcpdbld

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
- Patch Series: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202=
603091800
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Mon, 9 Mar 2026 23:36:05 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 27be043dc18b5724488f9e0e03a5015c4=
c0ad5d1

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: Add falcon support natively
- Commit SHA: deced73fc1a79071913faddb857ca79c2f6c7b72

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




