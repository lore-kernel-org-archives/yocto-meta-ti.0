Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7029CD8CAD
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 19:09:57 +0000 (UTC)
Received: from BN8PR05CU002.outbound.protection.outlook.com (BN8PR05CU002.outbound.protection.outlook.com [52.101.57.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3598.1781032187935877822
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 12:09:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=vu59Vb4d;
 spf=pass (domain: list.ti.com, ip: 52.101.57.31, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t0nDF6bjl5n8lHANMLCYEGgDovwuw/j8AFxF6rjDIVG7zY+qMW+BelBTuojlU/CaCQpZ92fPU50K/vM90Xhka9Fv9at686e4aGWdgENxSRBjZLES5Ob52r5iiybqT8jxQFp0Voe77Ehi+TMow6sebu2XKbvNglan8djLmi4va/LP4BYlEfV86jN8AUSUMJg3kDF42Y3w0tCgLHS+n4grX99UsTtrkzzA+/8/j8iLgaQWvJLUTH4voYrWk06XEWAxbW+mSFHD/+oYwS2RkFxX4n6iSQmWANhaZSjtb0hVHKuLUvzG7ahrMxnmgj+2j7f/AbpEmpobstxdTXHJlPfyKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Atiu9PcZMF8qjMN8P6etcHF/qdQPbCGoeE1jC4mCQk=;
 b=lTcCKajMHqo3rtggYM7VBFC4HC6IkpvHaMgYAls8DuI0GteYTBZhDTKWBYrYRZf9jNOcbL3F3wLV3LIRYodiByGv+CwnJTPagtTOpWgoUVUh7ZHcxZEOzk3YThL3w/Q05WwnyTJga60Lcr6HvHoXua96zw17RM+9Pcb2m75WA2vCjBxxGJcHcFXKnLJIGIvwDt0c04/3gH4fXrIA8yL24nzvQKvMgrMjmOQIh8KF8Kzli9UI9wtAR/a79D0HLAzRWNDXkwc1n2HHhMSwwfwTD29mlU57h4RZKZQjjR3ySA//xb5BKvlMQrgJZ1itIYT3P20sROvJ3XchthY7k5LunA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Atiu9PcZMF8qjMN8P6etcHF/qdQPbCGoeE1jC4mCQk=;
 b=vu59Vb4dihVzfSauCMBH2INk0vygIXixQWaqmLRXSKvOoohYl9BWqMe3o7jmcNpgE8UpaKcXppQa8/tw7Xqk7L0/b0xc1stnaq8Thv44xhJCLYtURlh9FTiaWeM+ncpexAPKs1KJWTlbyk/WGQ5VH0MKnsKcjrEJlgtaGxUjoBrEdxOvbfbQPrlE6X2WEABvDCAeRsj3Sukr8niU9vN0tNBq9gI03IkOMHEgcQyTxjC56DIepKESSYBsiysUuWC0ykO3uZGsKG6SGuTyqTzzYsf6WFSn01+JMiNPmsKbVEyHWUNMFEJ/Q1hRYW2rge1dNoHnrmZCVhARqEmsoIes/Q==
Received: from BN9PR03CA0590.namprd03.prod.outlook.com (2603:10b6:408:10d::25)
 by CH3PR10MB7120.namprd10.prod.outlook.com (2603:10b6:610:127::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Tue, 9 Jun
 2026 19:09:43 +0000
Received: from BN2PEPF00004FBA.namprd04.prod.outlook.com
 (2603:10b6:408:10d:cafe::63) by BN9PR03CA0590.outlook.office365.com
 (2603:10b6:408:10d::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.10 via Frontend Transport; Tue, 9
 Jun 2026 19:09:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF00004FBA.mail.protection.outlook.com (10.167.243.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Tue, 9 Jun 2026 19:09:42 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 9 Jun
 2026 14:09:42 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 9 Jun
 2026 14:09:42 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 9 Jun 2026 14:09:41 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 659J9fxo1844309;
	Tue, 9 Jun 2026 14:09:41 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id E54319ACF4; Tue,  9 Jun 2026 14:09:41 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, "Denys Dmytriyenko (TI)"
	<denys@konsulko.com>
Subject: Re: [master][PATCH] README: update and clean up
Date: Tue, 9 Jun 2026 14:09:41 -0500
Message-ID: <20260609190941.2973452-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260609184832.2659176-1-denis@denix.org>
References: <20260609184832.2659176-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBA:EE_|CH3PR10MB7120:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ac6bcf1-0d91-42bb-a8aa-08dec65aa99f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	U1Moo3zwFJjuYTZQu4HON053imGGFBOJ+WxsHMfGhiM75PZPVZ8PUBQ+coX0u/eOYOhZ2TU5KoZR7uk3Ftj8/v8q/WLlwp/dgltW+CcR1Amj9/agbBXAf/Dd3/spVPEUPCRVq4bLUJwDlr72EsKqh2ZQMkcikNDJBZwaYSBMYDVD8ROLufYtPlS+WBU1t0Sj8XWpcFFQdYzqN4cj3oL3QTCDwShFsTrlUwPdg5XnP4MWv5N5Oi7X33MzfKx3r2phPZeYpdYEK84wBqp5DYj0GnO31oaPqOWCukE56nxtXL2OnqSucHapfA80ubpw/lky0k2LRikdztYK4pDJZuZR0HhbugYTF36IfiLz5Q/sqoMz8voSI1x6P6zLAf4Gx/XSChFrsF+QfKyG6TstX/Yzw7qd4l+2oMixc3R0EXTs/zuvgthMfIRnEF3c41bIgZ62OAmKjRcLbbaYqhpo2QPHy9EzBqlrxzVgQj1YHP9v8E9MzGn110CjwJ4sbQAnlkWi9acYZy5I1+9nYVewDoiEps6+MXNL437Ck/TplFkNeYTNM3fjwGpyj62xl0Q1KwIrepq7kPYifsza9tAmSRomBsh7YGsYuTDVw2K26MDRa2kxih8yzRXEXBLnXnaY84VSvhTYdKaUIqCAn9nWwRZgYddkMUN9IFm0k6cLHNYUeeDpeOKSiQH3sdqiUbNS2JHqIdGZl6gwgeIY0p33YoP8q727AFuqsK3aaILEWKstuLM=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	cJH1E1IryRpF4Zi2wRId2VGooIPfaeGhyl0WJPLeAUo+79V0FD96yB7N7340rWeq04rk5oxBx1Ypg3m4VBWWoURUAglmXnfwAG+IqHdXjuUtrvHpkeF1JjE4L9XdblcfIZqJaw8Z9nbIe6XBnKVH2ckxsk3Y01epqkDEc5txftZ4Bp15kKydrufS1zwkgJb9DCL13r/aGvcaHL18xG66oExPvIv3MGgntotSb26ak68M+tuS3LBiwEWrfsyFq6n1d2hZVuq3kDDk2iZzr9DmEqwB9JDiVD+shU3Vr5YnfT0DbFRK1HVRc1jUiRMq3Gcn2eah+Jn3Ta13PvYopmwN8tVNpMiMU7GJ3NkXrZkBgS/BZvWhGR/OTSuiTvex9JRUPiQifYgkGhRuaV7WrfudILGI/s7/koAm7KjntAVt2ztMWLfsGH+3nBJU0I03M2v6
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 19:09:42.7152
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ac6bcf1-0d91-42bb-a8aa-08dec65aa99f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF00004FBA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7120
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 09 Jun 2026 19:09:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19992

meta-ti / na / 20260609184832.2659176-1-denis

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
WARN - [master][PATCH] README: update and clean up
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
- Patch Series: [master][PATCH] README: update and clean up
- Submitter: From: Denys Dmytriyenko <denis@denix.org>
From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
- Date: Date: Tue,  9 Jun 2026 14:48:32 -0400
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: ebb28ccece01d304ca7bb6bf5fb63057c=
cd82749

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: Add falcon support natively
- Commit SHA: 150bf0000d38253f329a31be598b749a130c0304

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




