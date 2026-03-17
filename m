Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 922ECFD8777
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 13:49:30 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.76386.1773755369146814354
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 06:49:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=ratTEIPL;
 spf=pass (domain: list.ti.com, ip: 40.107.209.52, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xRzIhteHfiIDCMJDrsaCyaD9gxYk5wC2KtwLdFu6/ZMmxjR9TT3iKxVzgltRfdbrdZmU0kCCS9j2hlziuOuTtQY0EUlmFN+cjTsMjPAJVAABf26SVQLy3RbwYlJrrQAqtOZuZ5K44ukR3NjV6iL/Sl/Pixoa69meCr/FKvg36gRt3x4ToE+lsiENsgynoUbH1KerRtuZ39kwdt+3sPJ2FQ1vVeITayBPtgc5ZjWBGcSSeIpumHg7QjfsOxI1XmV8pJbS3zq4m3gmhcQSauccX/H+swcJ5Kr952R6e5zySnP2hOfATyvt9dd02nTROhtzy9tml7yD8yzbaqqwi1yX8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p4jPHUIUMJh8S8WnYdZWxKCT9EWO1qN7PnMaxxIt3e0=;
 b=APkUMN2OmFrAyVGKR4pyeSa3XwmCUpAriyi3JaiMnMpqssVY6CH/SAvrKnG+WvN/l1ghlA8k1iZcqacgsesHTfEudkVlsnk6vXBJ4Tkcg/ylLwG9nYrDFIF8J0pEs7Yab7dADN10XErCQZWyNRxRDvvkWCB9DZaHXZ9FBU9saDjgf+UBs2ms/plPO/vpYcSTDrxQBKj1URk131o3D0V9s0nqvP9KWKS5QgsbRX79TOX5SpOxaozv0SoiODHHnfmNQzsGNtONhFs1wUFn+9saJocouhOjIS7bs4DLODQ6JKo/JY/7QfVTX3vZxdzVrZmIwpSX2Uzm9eDq/bJjHWUfAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p4jPHUIUMJh8S8WnYdZWxKCT9EWO1qN7PnMaxxIt3e0=;
 b=ratTEIPL9qg/c3Hiw/YpJUf/tW1xYHeKgjI5yDcyIqCmhtdNfv2figD18nYwJsOAfuzIYq5bOf8NVz2bQmS7E2E8NOki27Ei75oci8vDWANAF/B4hCuczWm/TAgZfGx5ReDZ6kpLqRV49ht/mCIcpCqdxgEp8SqUgNYM7ozGXGQ9jhm5tRfAd5+BnJDhOQP7EsEiYnzoBLgIw/PlMI+D27WGlcSotYIupcly6He1OKdW6I3E621VfFDBI5bi8eT/JnAxnGSn+xGKrlEnjIAMBVoL8Ur3+M8jyZkOPWzaiGbdoI7lq2XiolY6p3oH87EIz34fvfiMjRErIA8/HC4mQw==
Received: from BN0PR04CA0189.namprd04.prod.outlook.com (2603:10b6:408:e9::14)
 by SJ5PPF912A858AF.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7b9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.21; Tue, 17 Mar
 2026 13:49:25 +0000
Received: from BN2PEPF000055DE.namprd21.prod.outlook.com
 (2603:10b6:408:e9:cafe::31) by BN0PR04CA0189.outlook.office365.com
 (2603:10b6:408:e9::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Tue,
 17 Mar 2026 13:49:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF000055DE.mail.protection.outlook.com (10.167.245.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.0 via Frontend Transport; Tue, 17 Mar 2026 13:49:23 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 08:49:23 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 08:49:22 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Mar 2026 08:49:22 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62HDnMhJ2540872;
	Tue, 17 Mar 2026 08:49:22 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id D0AEF9ACF4; Tue, 17 Mar 2026 08:49:22 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Leon Anavi <leon.anavi@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-beagle][PATCHv3] u-boot-bb.org: Add a tick-timer for PocketBeagle
Date: Tue, 17 Mar 2026 08:49:22 -0500
Message-ID: <20260317134922.2005909-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260317133743.419092-1-leon.anavi@konsulko.com>
References: <20260317133743.419092-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DE:EE_|SJ5PPF912A858AF:EE_
X-MS-Office365-Filtering-Correlation-Id: 16900bda-9d70-41c9-1f06-08de842bff7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	FsB00+15p37IouZvy6wCIRgaL40pzVE/hxyhPXt2g0f+K3S29GrnXkTN0xxAmHMy29FQauLTpzTksoUv8knC5KH4ADu/nMN9Hwt5ejeH2mkx8fqQ8iu1LAq+j4AEmLeZhaTLzYBroJqjAzEnGPtrXTFhpWOuVkjSs+gDoQxIeSalX9X6ktVa6zH7+q0D3Dc2ExytK9EGTdJvSAPfO7a6PZU0hys2iqtuvYXimgITDU30M558UPMUAofx9csICJo+xEzn+nYzRQcqnPFTq8ypTNGAyd7fX3ze5OWk/a+4I6ThVIAI+6v+ORoO/j0jwtedofpT2fw2oa29+gfdLHed7yhESfc4azikiPE76yKtAqP6R+SYYOfoqEKch5mLW42SnfYXfnjzkdgqITNDnq/MVgkTWRgPZKj17JT5qpeiX0tU+O4yw8E3UXfQKoxRLqD5EtQHAfLXOHez8EvrMkF4eRmOODTnDZRGsiMSirzqh4f3XKeAoz9SCj/qz+wGWkJilQZnF1+qwaAIVPlckC8RsxyQCKR2dGPT2I74NDt8PiFlhoSVfl+8YvYV4lk2XHw/BtFDJNyVbuRxzAiMDhV+eBb/+qvzz7SROXvkMwx+Tz6Krkh3bd8qi2PzFxG+gok0Nuzi7QpXeDjrNlSt7rALsNjOt1HIxHCVe7/i4bHdGZPJwmL6biXNHycKBQX/PcIiXoEPGyAVhPK/W87/ALdgWZaRU1OobB0sdRgdscDh1+JxbB7m6JQ0zsm4i/cAlcEKW0iHwbOEPZuE+wG8HkceuA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	rEI5uk6VIHnIM4YTrLVQ8pAaGrjl3bpl8elE9D3q1pUwwBomJGIURff6rpR6nCx5mDIpJ+fBsuvtQE+CTce9SECsOwz7Nri/jXPfaJfygNJO1SzhxPFXQ/t6I5XtbZvaFYi9zIPIGeL2xuQr9AEFlMJd8469NJ2VgmXLYUt536D82ULzg+Trap8Am0OmygEd5UsWyCYwZzEM5Iu5TDdN5RWuKK4AGapWeEn+kM/P9+aP9H4s+YJ+w3t6/x+6TPyppFK6PqGgBYVt1R/pi6Id6K8knbLYaClK+gWh5mSuiP8n/JICVQlXU6lviAOTcf2ajU/1TQrpgwk73UPaKP5nw21bgaQDpVMfsUexceZ7p7hfd2243qAMAfgu9wiVTMEg+a1bDFOMsHjjIQztwFTU0w8d/WV07K3vZiS5sVmjUEGnl3Ge0/PLxR2AWQG/8muc
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 13:49:23.6789
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16900bda-9d70-41c9-1f06-08de842bff7b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000055DE.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF912A858AF
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Mar 2026 13:49:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19738

meta-ti / na / 20260317133743.419092-1-leon.anavi

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
WARN - [meta-beagle][PATCHv3] u-boot-bb.org: Add a tick-timer for PocketBea=
gle
    WARN: Missing branches specifier [master/scarthgap/XXXXX]. (META-2)
        patch:55
            Subject: [meta-beagle][PATCHv3] u-boot-bb.org: Add a tick-timer=
 for PocketBeagle
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
- Patch Series: [meta-beagle][PATCHv3] u-boot-bb.org: Add a tick-timer for =
PocketBeagle
- Submitter: From: Leon Anavi <leon.anavi@konsulko.com>
+From: Leon Anavi <leon.anavi@konsulko.com>
- Date: Date: Tue, 17 Mar 2026 15:37:43 +0200
+Date: Mon, 16 Mar 2026 18:34:58 +0000
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 71e8f789538d90002d139646f6f52e448=
579c834

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: Add falcon support natively
- Commit SHA: 4671eeab3c8146761f3d36ed79797136c0f3ca68

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




