Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E68BCD8CAD
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 18:50:57 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3124.1781031051536931055
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 11:50:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=HxtDZKv/;
 spf=pass (domain: list.ti.com, ip: 40.107.201.33, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WbnRuEMNI+2O7+W2XQ7jhedZmtiSpcU4anBvBSi69CVDphyAcMBh4X0Ha+u/mAboIZvpt+W546WN6kZxhg1qi71lFzNcVkE/nLX631fsJ5ntRV2bpVVPVv9jdd2DCALFFnjhzfsqR7pyy9PFevBjBJTSEiioLuCIR9hxm349b7M3ds+iMikF8/sMT+EhSjqs2qs0q/dBOpj27dQsZjWIOJeD41LJI11XeTrC5lS+LLzfXRsQjgvV+BI+aI2dHycbpSqKeQpaLHqDMvx2Lnx+fQf8m7YS6BdcGZdLz9XyLrkuKXBjLCwt1H07S8FdqyTA1mlX7SKqyK8jmZaYJ9Hcdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xNJt4QbCztySV8huzW14UdXuSkAb1SRJHJh2+wGMPVI=;
 b=KlaONLrIB3wvOdc1ion8cdZNdp3nDKAEvXlb4x+bSSN4RLK6leiAD7UIzN/jr1XQMNqf4SDYgMg0CRbLPVXYTrsA2Yk09MtwnOes6SfDlkmetMICcoqPnq8CYru28L/VINeAAOcp+wxJnUuaZvhR+mPCUnsOmM4gBappPERSmO733Ww3ms6wF0V9N8AkEmgbpLDCSdwvbYFWNMjZZpFwljO5TJie0Fg0mx/FS4ZvQUSvHBzzaigcySMrcM3gGvBM1PzEU6TMmiQ0NTtsr6weKFCnA/3JrJTxv7RI2Exu81tKceZRs6tj4ToqO3/Xf87/ysDdog/JCfuHUXpLTeW/yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xNJt4QbCztySV8huzW14UdXuSkAb1SRJHJh2+wGMPVI=;
 b=HxtDZKv/Riv/YFJUzEyEn/I3u/MDPvujGn3G3mgBnfJGNm+mAvA0nibkw8BWKGGJW8B5OGvtpfZXufl11g3qxj8gd79iGdUZe5ZW/z7EFO5pDJBepWFl6xqz6op0Emdb4MjXwoM/HuyMeB5WQVv+4L50pp4T+CSH0ayu3+TksnAioi7V72sQ5UXuNZwln2FWu5gOdnR8KfwdA6OvVYUzfSXN5xYbDDB32UgMU1QIIvVO4ZZhhuX/zNwYrabKFQvJEDCdWzXDs73FR2EgNnxW+xxsELqO/C8TRS/YdasaqcAeNYAoYG7ZKPkEs+InuXej/vQxF5sj07ZS9x/qg9rv2g==
Received: from BY5PR03CA0029.namprd03.prod.outlook.com (2603:10b6:a03:1e0::39)
 by DM4PR10MB6720.namprd10.prod.outlook.com (2603:10b6:8:110::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 18:50:48 +0000
Received: from CO1PEPF000075F1.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::78) by BY5PR03CA0029.outlook.office365.com
 (2603:10b6:a03:1e0::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.11 via Frontend Transport; Tue, 9
 Jun 2026 18:50:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF000075F1.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Tue, 9 Jun 2026 18:50:47 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 9 Jun
 2026 13:50:44 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 9 Jun
 2026 13:50:44 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 9 Jun 2026 13:50:44 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 659Ioi931672687;
	Tue, 9 Jun 2026 13:50:44 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 8EB689ACF4; Tue,  9 Jun 2026 13:50:44 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, "Denys Dmytriyenko (TI)"
	<denys@konsulko.com>
Subject: Re: [wrynose][PATCH] README: update and clean up
Date: Tue, 9 Jun 2026 13:50:44 -0500
Message-ID: <20260609185044.2953928-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260609184800.2659058-1-denis@denix.org>
References: <20260609184800.2659058-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F1:EE_|DM4PR10MB6720:EE_
X-MS-Office365-Filtering-Correlation-Id: e01fc4dd-afb6-47b9-cd4e-08dec65804da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	NafOQOzaWsPadplLuai/Eo2HbY0W/ORWGWsIj1h85DXA2rVEe3JBhg8NfG/ZzGwuFQZAq/8NKo7taBBjE4BsEIvHJRdoOi1hRZCc6noamKcbP535fTQCzryX8c75WH0UJBiXmVJktFY8CJHpOEdLfuinN+YEmf4pi+RgOYA6pZBhglTRnF1BOfuw8ROU8g6IzlURtbMMgL+VJEyddAJySHctSkg2dOGXAB0KMg6LtBeo0Aqkdo/o9CPs7htkI9Dajx4dWliArlDHh6iBgVG+ZAyEjz6inpo7cMw+YTG7OlTEdZBkJUk8B9KgTb+rLPYbkGSnPRbui/XuNjOo+fPBm2LjFXfQRKEcCrGgFGnRq5SYPu6qas3N8PrjXn6rlKe8s0gsh+26/99yKDtoXuQHOz7q8F/oNe5ZTvdH7UuyH9FWBGjVKxJ/qgRMZDuPn0nJXJH86doVr/RfWR0DQLJuasumUMiqu1i+37SPvcg6sGJU+GTe8T57sN/9XYGntu1Y1T2BTWUvRLIrJVSiFkto2LKhMv/U5JxkF+dZopxjxM5r97vqihIPmNbKPyIUt3KqKpb7G09P/1uIbL9repde++hLNgeT0bh2esifubsMLPUwPH7HS+M4QGUrL4Uj4EO+GiPIiaafz6PFCLVEPI63wq5Rdj+CbcwcQWIy9Kx/gRshq7jP62BuObfafCK/6ihgO88Qdqg9oCJbmUeyBUooa5ZXF4tZvekzLKKRaloVWrA=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	STVkqDUyFPuvzIZtboNf3ix1gH8e77n5R/PebAnpMN1nnlK3qXgFajV194Lv4dC4CC6WnOg2Y6pISbHFVyt5lyXcsclqfmYPcjOUYErqaWoFoAYyHvef4/efgQy5WajFQo4X7Gtl8HEO5HgYIn7hh95owOZ56QtK680iFtJuCD5QTyNdYehuPEMG2CIIrgH24QSda/ou1Vt5vQxmP2hepsbFRNGYDUvWLIS1TEmrQzwYRtP92wDjqpo94qy5+9XmG3bByZBRtu3ZZUo3nvS0wT+VAnElj1u1ZNFWfzY5loZT3MUFqp/Dbfnik37Uc66dHeMT/bcNNsPptKk/7nGE3IzJDatE50nuDL7zJbK/Kl8Xe1DtXUgqs5ietIWFUs/y2lfi5mGKejJAwerHjpFEZAR093e78bMJLOD90AzgNXv7IZ51EkTqb2GpHqyKKqYI
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 18:50:47.2716
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e01fc4dd-afb6-47b9-cd4e-08dec65804da
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000075F1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6720
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 09 Jun 2026 18:50:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19991

meta-ti / na / 20260609184800.2659058-1-denis

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
WARN - [wrynose][PATCH] README: update and clean up
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
wrynose
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [wrynose][PATCH] README: update and clean up
- Submitter: From: Denys Dmytriyenko <denis@denix.org>
From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
- Date: Date: Tue,  9 Jun 2026 14:48:00 -0400
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: dfd9405606fe2f40a0f4ae739f7fcc78b=
4fb5b63

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: Moteen Shah <m-shah@ti.com>
- Commit Subject: initramfs: Add initramfs-module-netsetup recipe for NFS b=
oot
- Commit SHA: d9bf0bd70c624384196352c64101b109dedb6d51

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
wrynose
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  yocto-check-layers: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
wrynose - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




