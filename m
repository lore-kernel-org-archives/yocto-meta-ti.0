Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB2A6F506F6
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 22:29:32 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.63450.1773700170974671648
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 16 Mar 2026 15:29:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=i5n9wRnJ;
 spf=pass (domain: list.ti.com, ip: 52.101.46.52, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PuMRZQv8rWHUJLadf1roURU9YPwK0zf2H47g6Wk3XgvtBHmE8SLX8fS4ZAPj839zj7jD9Gxw4JD7L0lfsPPez708SYEU0vd8f4OnhJraoHVq4oiBkXlI+PM9vLRPuHRMABKoq1OuhSBHuxg1VYM7CMP27rc/PI9UotmwgnyY17fOqEoZU744XgXFZDMq12n/WDvwEzVQyfrEIw8QO8UzPYv/5NjHl/4ycdMF0E13d/j7orXcgfkH/trYx7pElbg2Lgvmfed0k5DJJMYpLXbSLN30zxkThuo7LhrKjv0OL82Z+YV9MA67W9xDax8yQCvrsrZfedJWi4RsZp2R9Usmsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wgmFGKDBxnWgL6Y1wg4QZhErez85QGE/a6nfpDzwvzU=;
 b=C967o6Is0HOZ/08mF9teb2WMLH34g8T7yddJx7QGi8RVDiwRqHVFZqr/JneWJ2WhnMqmWWeTbXYCFA9CnzuUCCjQWK5IGwSx0f+0M9TQt+DJaQugbc2CeHKjd3LvgHcL1rsOog0/UqJBjt5+Lt2MuFo036hWqmoTth6iug4vKqDkv1xwN7+lSRhlmg/WKc2v8js5n0XnJHXAIT1JYBU/fVOgCZ8lHQEmFJxuM8IMGkq1RaDN+AGbaAozVvhdgWnn7RiXXLep71LcVnB5eUOzB91g+HSZRqm77/4zT5nznu9QrTSiBz6ht1T3wmeF942OTe60mbphOE5VmpUAtCRsmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wgmFGKDBxnWgL6Y1wg4QZhErez85QGE/a6nfpDzwvzU=;
 b=i5n9wRnJOBSCP3hcderT2SpSMNVc6gbAQeNDQploBL+qn46DkGMtq5HcQatB1es8oubFKO+ken0TUssHk2103TUhq0oiq8rjMjHr1dx7wBY74gvt4cJSfTkiWc8KVEcXEurPVShvM+RkwefE4QVZFDa/g4nXQVKu6vdtGtgY/msQgUFgGP3JfchvDl0TcwfBg9JnhKhqqpmHatQCuYHmuoMe73rTTxk3a8VtGuQ6pAPCwkqCROmxmLmtsL0g33DHcUt8846IY5sogyQL46Z/uOXy5vllci5DJh6VVEwVfH5pOP7rMC0iPFbRjvP1h2CPyMt5G4j+ybaAle/ehkPShQ==
Received: from BN0PR10CA0020.namprd10.prod.outlook.com (2603:10b6:408:143::11)
 by PH7PR10MB7696.namprd10.prod.outlook.com (2603:10b6:510:2e5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.25; Mon, 16 Mar
 2026 22:29:27 +0000
Received: from BL02EPF0001A103.namprd05.prod.outlook.com
 (2603:10b6:408:143:cafe::de) by BN0PR10CA0020.outlook.office365.com
 (2603:10b6:408:143::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.25 via Frontend Transport; Mon,
 16 Mar 2026 22:29:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF0001A103.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Mon, 16 Mar 2026 22:29:27 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 16 Mar
 2026 17:29:26 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 16 Mar
 2026 17:29:26 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 16 Mar 2026 17:29:26 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62GMTQYx2035155;
	Mon, 16 Mar 2026 17:29:26 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 3B8682A52; Mon, 16 Mar 2026 17:29:26 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Judith Mendez <jm@ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>, "Andrew
 Davis" <afd@ti.com>, Praneeth Bajjuri <praneeth@ti.com>
Subject: Re: [meta-arago][master][PATCH 0/2] Some overlay updates
Date: Mon, 16 Mar 2026 17:29:26 -0500
Message-ID: <20260316222926.540595-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260316221815.2502448-1-jm@ti.com>
References: <20260316221815.2502448-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A103:EE_|PH7PR10MB7696:EE_
X-MS-Office365-Filtering-Correlation-Id: d09ebdd2-3cca-49b1-7945-08de83ab7bb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|13003099007|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	25MHA2h1UzoC13R1clJ0oChTLfYa8Eb8nOE1GJ6xd3ZDYzSvoRwQIJ/x+sl55HKxPShrR4iHKYKC+3D6fBF4E11k0PLiWYeTCPXiND/ztEZRQXtzkVyWlwLKfYb1JTvMHoIJYnyFFRyvOQ3KVVBxbNxAcWEzpNRA2CyCZwuMkzdXWVn6OviPvXUjLJknoZLutP41uD6rqD42FxdZ6Fb4xuOLsDJA6yzMqLd/SJ2R8hnz97fjuqThFGHn69To9pI0B6rx18M4nKOaPKSmvhUHTYTIIAt96NB6tLdpn/Rm/Gkb1ptcTL9tCfnAnxaoVtqkCFj1GNcf/5fgyeWL9/4qZYKIAfBd2IFu0flL3L6AqOHTcFqKhcag1Kl/VevEKBIsf9ZvLBkZFAYctMBFYRJs4EUj1UQRZ9ZTrMYgQDKb1fOApv3rK69LmIYW6vEjUxdeX8q99cH+NkslqMTvm0BZSp93lEkIbaiRhIvwpCZDoQRWoLCl84uMIu3mrGoWYKM/peB3Hs60xetLBpvesGwekxHseO1MRtBdqwNrGSy/R3S5ZKQcw3JnPpwtJobr9i73Pa/MtE4WkX0Xm92k8lsUP/ryHngKiK/FNBboSgJ6HKLu4GBMHG7AFDPAeD1q1QZ/RkcvrniIPPakgPg/TZCnCqsgKkQ4h1vCsT8o5Xlmkehc/65p3lPHwsAkYAj/t9nlYCRpyOhTKIHnNCUC/9yUSfQYfHNA8xGpHg6d8/YyDH6CkfNOP0X/ZWVWBFIIIGaaZtdj2s+wL1ZtICyXOfjP7g==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(13003099007)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Gm6PHyejjsUeOTWWW6bPTC+rImRddoTdvsgjZKa6asxXo9kvHTgbontkWInDPe/kT9fHzJNODM6Lv1Chm5xAXverDOgcWifjWCsfNX2IupYwnpVUKlQKMN06i+g6zri0G2atgqPk9ft7r54P2ymnUZ1x1OLZJQcYdungOmT27HIrG4ogPVlJjtbu8fD7zPr8FLQ4T+oHiMqGzFxaijp6HOBt97pM8aalOvmtpzbm4Z0+5s0QFVhEEC7MctIH9gMfx3jG/jJzgTeUIfGvvFmba9tW85tRLW4Bjghi1V7u59U71OmAFWPFndNo9/29BpQRTrqXM7U3Y9qH2JSZ8Brl/ssOmiuNzkRQyBoUlEl4GpVRh3AyCIfPsaYOPDD6EDTK5chpsXTlcs4vrKvCoVAzROCQh8ZLUNXHLMA0Pz66E/Tb6h6mWgPaHnbzTfw7f64Y
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 22:29:27.0174
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d09ebdd2-3cca-49b1-7945-08de83ab7bb6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A103.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7696
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 16 Mar 2026 22:29:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19725

meta-ti / na / 20260316221815.2502448-1-jm

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
WARN - [meta-arago][master][PATCH 1/2] conf: machine: am62a: Fix overlays i=
n KERNEL_DEVICETREE_PREFIX
    WARN: Commit message should not include directory path to recipe: conf:=
 machine: am62a: Fix overlays in KERNEL_DEVICETREE_PREFIX.
              conf (COMMIT-MESSAGE-3)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [meta-arago][master][PATCH 2/2] conf: machine: am62-lp: Package ECAP=
 Capture overlay
    WARN: Commit message should not include directory path to recipe: conf:=
 machine: am62-lp: Package ECAP Capture overlay.
              conf (COMMIT-MESSAGE-3)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887



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
- Patch Series: [meta-arago][master][PATCH 0/2] Some overlay updates
- Submitter: From: Judith Mendez <jm@ti.com>
- Date: Date: Mon, 16 Mar 2026 17:18:13 -0500
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: b6a35ab6cddc2426c6abc5c9f5c595c71=
af8eac2

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: Add falcon support natively
- Commit SHA: 00d3d9ec970580d296870c0886bd6836c3caca0d

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




