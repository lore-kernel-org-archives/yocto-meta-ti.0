Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FDA910F995A
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 15:51:03 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.39])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.109831.1775663456532784175
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Apr 2026 08:50:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=YHpeeM1G;
 spf=pass (domain: list.ti.com, ip: 52.101.52.39, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VNKb8GErKKND+n7y9RBZDt7XDIxy6y0EwphDJG8OnfzT7ZjvC2/vMTUvtq6HxqvMNOAkXoAcOdD+TE/t9qLGNB13FAdH6vW0smXrGTPyZY8bY5P0aOjKKZIfRJn+6Kbb3KAnrE2OpCw99HZPhoSxdU6GKBpo1hyoSl1RdFK2vQdomtgiXkTcgs4vxcRIGIP3VYiMAOmatdv1q8SZypcXzYW0gf9j66h4nYhj2Qiw5RnOgfctpHAOmV945blOt3q26s2xs0+kbqxcj7pGIsnBj6OwXaeIP/LXqKlG99pAobtSUiAuh9DtLFPMBwqkC5AmQhLSjPtG5BQvZlRbr7YoXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A7zIslnJ6Zzd0LfLaV2Rs2LQE0y4HfZKKFbgNTqDi00=;
 b=mfCQmycux2TnOq5HcOM3ufFoiiMGoP+U7nBhp/ufYmMGm0WJ6O+4B2PORV+dSG6oQVAWf3XYRh2UCFKml87a1jHnoBnRBtpUZzXv0eLDe8sgSh8gNh3q4NhhDyUcv1cAP//xGHgOMX2klvH5TJqj8nkP99Uq3ZiFCpdZ4Mr4ukDtsi5Kbw8/JMhlIXFN8krqODH/srTLmpoapFa6pAZGfdyPWnhyroSr2V18VEDj4kL7Pei83sm/MTulUiAzWmOJCir/VnPE95O6U1KOju8064pE+FG2BBldh0MLi/OFYXBOeXbzSCJyCsP1uoWOoHfxu6XxSdgH/X1Q3+HIK5mf9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A7zIslnJ6Zzd0LfLaV2Rs2LQE0y4HfZKKFbgNTqDi00=;
 b=YHpeeM1GIbmudQ/H3wu5h7WafXxLRGDBtZYTqHArvv5xwOfHWIwjQ7S/uJCBMu6zUJL/liag9kAbyPX+7Oycep1ViCgIxeVWaKZpO2m1k/iH8e4yPJZ/DGTSWys4si4tnyyLZYECWrJBRA9sEmRXZl36U6yqo8FvjmPS9f5eCWB0QLMk2zIiNFm/GTQviB/0aoatp5u8P89wMrtG3D8u0bdxJopR6/CZN55cyx9b7vd7TkuJBi9XECN7NihatxDpTMnmLUZ6/8saH8MV2zBGfnp2mtGbwXmEmN6q1I9PWbKIAy95q5TqETDl28AhMkMhg7gfxT7jGGzkQ0/YtCCgsQ==
Received: from BL1P222CA0030.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:2c7::35)
 by PH7PR10MB6227.namprd10.prod.outlook.com (2603:10b6:510:1f0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 8 Apr
 2026 15:50:52 +0000
Received: from BL6PEPF00020E61.namprd04.prod.outlook.com
 (2603:10b6:208:2c7:cafe::fe) by BL1P222CA0030.outlook.office365.com
 (2603:10b6:208:2c7::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.37 via Frontend Transport; Wed,
 8 Apr 2026 15:50:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL6PEPF00020E61.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 8 Apr 2026 15:50:51 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 8 Apr
 2026 10:50:50 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 8 Apr
 2026 10:50:50 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 8 Apr 2026 10:50:50 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 638FooJt1227851;
	Wed, 8 Apr 2026 10:50:50 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 99D2E9ACF4; Wed,  8 Apr 2026 10:50:50 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, "Denys Dmytriyenko (TI)"
	<denys@konsulko.com>
Subject: Re: [master][PATCH] wic: move wks files into files/wic/
Date: Wed, 8 Apr 2026 10:50:50 -0500
Message-ID: <20260408155050.2747195-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260408154433.3479958-1-denis@denix.org>
References: <20260408154433.3479958-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E61:EE_|PH7PR10MB6227:EE_
X-MS-Office365-Filtering-Correlation-Id: e179bed7-370f-4537-ee3a-08de95869c55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|13003099007|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	4Ypzx86WTRiMkdbrEUnTnQ564hK1Bd93v9IGGsBTTm5JT8IIG4KYrSZcAQYWnP9DK2+QeAgEuFLMb2TLs7fIyuMJch9WJja28pqiOgQ320y4BrIWaf6wThQGm/QZwEAI4hxqwdAVCUd9EN2VdtqiMjsxT0io2u1Rx2aAmjyT8Tl+hihaKOvvbpn84EcSUoCGt1/kTaoloj14+hYI/FS17+2rTpFNZCBFuMrgr/Mw5HXIrxs2ZK5g7pjplNcJ7FuoV/YDEwkiiy4panmHIOphX9a98ICTeTWaL769z102ubUHf44owyNIQgTCkpDH+h/KTOiC5qQo6qNZowI5Q12mGAokx88eYje2WcVpjePFb9so6P1nVORex41F7hjv091SzqFbeQn6Jv6M5yxb6SK7NP+vN8P1fHJQFoVAq4RdBNA35gMeZgWZYtZXvYDTpRaQ/G2yXf90AMaNl4xx9vxV1KVlvQOZ7GtERirFWAT0IyO4wihNyXmrYCRRoMCKs72WUn0waZweETV70UBEdiuRhgDgEpj/QzVO40+BKAhCgkVo9lu35GoXq9QlnsIYIPP7W94OAJl0bVXoCgfWvOoFfL9QG351FD5RT/Q3LzQ87HuDz4BmGLRUZJxUqYz6bjJkCR+5wf27LrX3Qzdln4l5MhUMnUTcNQkZDFLiS0cTtDz8SMx9kGiYcbZw2YRQ/ExtMjkKsad8QUihFtfLr088ncxtiOlbMGROC2qwe1lt4Eg=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(13003099007)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	V/j/F/EquQlhuKyJ1c0DrwvrWr4+VVAu/buah1T7XfiwzN0ePdMpbCG5EepT+zvBon/4nOB0DAPrwv+QAi6DTeRsedlzGXEi15DsQROKqsmbYGD0Ux3DbnA0G6jjmH8t8XgDmhN8JMeH9kYrz0s/F3Hr5HSct+z94zOyIgkhza9o+HYH4JdyGPo6mIa828E6H/XmFs98nKqrHa5v6zZVi7Vulcvy4ZE/1Kfuk2Vh3EkzNR2u8V69hTKVXru6qxNUEw/G5g/ekDnIvszxfr6gx+CpIKDUJDVnq/GPSl5Ed7ok4HEo7Un8gMmaTei7zGJzFM0EDjDc9crE6Ku7aP2ma+2IyAXfeaQLsx+aw+Ya85GCsTtYa/7KFEZdBoJSG7aQ01AQA5OEbsHLqbVWRsyPcQpKM7HO/wZhHrmqu+meLQNMpRGyen40XQCvXD6zoJ0T
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 15:50:51.2967
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e179bed7-370f-4537-ee3a-08de95869c55
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF00020E61.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6227
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Apr 2026 15:51:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19835

meta-ti / na / 20260408154433.3479958-1-denis

PRC Results: FAIL

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
WARN - [master][PATCH] wic: move wks files into files/wic/
    WARN: Commit message does not include file/recipe name: wic: move wks f=
iles into files/wic/. (COMMIT-MESSAGE-2)
        patch
   =20
    WARN: Missing Signed-off-by by sender in commit message. (SIGNED-OFF-BY=
-2)
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
- Patch Series: [master][PATCH] wic: move wks files into files/wic/
- Submitter: From: Denys Dmytriyenko <denis@denix.org>
From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
- Date: Date: Wed,  8 Apr 2026 11:44:33 -0400
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: ef2dcbc50180cd70cbefd0c7b8af002e7=
0ff0603

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: Add falcon support natively
- Commit SHA: a5b6752fa181248acc46c4411cf76259e4a07e63

Patches
----------------------------------------
All patches applied



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-repo: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
FAIL
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-ti-bsp/dynamic-layers/tpm-layer/recipes-ti/initramfs/ti-core-i=
nitramfs.bbappend
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887




