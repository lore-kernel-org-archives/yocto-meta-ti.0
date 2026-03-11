Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 121651125878
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 19:19:53 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.39])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4564.1773256783285793330
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Mar 2026 12:19:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=CfXijSjk;
 spf=pass (domain: list.ti.com, ip: 52.101.62.39, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sjd75ou5jTzE1Xhnbi1/PbbtvnlYQ6eDxByPUzwQZKRzLKZv7whh+lzXuWSPEWSgksVmLwrtzNa5eS+8rGnHi6+Dn22qG2+9c/mXW9lqfsKuL5ERaYDQDiARCFHYHBo1gnWQHjRRcJs3AawqbEpe8LItqREQXlubM59+63YdkiKY3ZHVrWSMsirfNBTITBwAAv2mFFtgx0P8lIDw8YGLSvuH2o+7E9ChUPwu0lX5G503646qpw70QM0D9IiEZd1rcCLS5aRCn+9BNT8ISHS32R6zmnh2Y/jGTgz1ms5eYGs6xI/lNA4unCqvfkpF/O3v/Z1ijEGS/CFiBBJveYKm1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZysfhMcOLkWtZurzeazGuYGLpdCNIVrPZ/CtcGgBVpc=;
 b=xuue8Ta9D/BU8KvzxswwYc5oAwPkaPyDX3gRG8cT9O2Mi+ToNJx0gfCIEaYsLLf79qAWp3UQeO5qLalmz6HwbWWmrHN1Wcb9YrpoSmUdfgrMsBiLYrspcfPihw4xXpcdmnoeqsGbhOHCp62xdRBfljB+NFKJ/jfYZ69xbpvkjnSR1gaxUOQ6yvyOJlBx/sgjwhoMbCEnRc5h55DOiNDVGp0qzR6RFisyiH1/odSnxMj11ud+SHEa8+6DGf1WPRBefUqGZMnUI1mM2oO/D2EtYeCGL4HaIKWfATmepWq9gajJ/S7tFraN5RKC5uc5NsYho5RHIhDM+JE7lwmTdCjZLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZysfhMcOLkWtZurzeazGuYGLpdCNIVrPZ/CtcGgBVpc=;
 b=CfXijSjkHQZDaI9qYGJdgf56x7KftfaHfmV+VBAN9zlDoOUvj29KUFwyq7KNoBQD0D+3E0nWpjcqCQIE6/LXyI0fttRxxFm1NF5A0L8yJc6Kgl4MXhmsp0BTnc/xsVIv2gj0YQ1vS9roNQwnIHfjozZIeQiZfjhwvNjiy0X7oSmKzhHtnadEmVn9KdaZeROLFVvlkRCcsLtR86qtYtKgxR3acvGZkQHGnpe2/ezzYwhDicuP9Pi/HwvD33Y/vSw5bWRo7VqmAe3d5rRayXObfCl4NsYUIFO7LDG8kmhte9ll0G16h6okBP7WTlIFsccsyH+WsupDxr/iSAXJykyYfQ==
Received: from SJ0PR13CA0179.namprd13.prod.outlook.com (2603:10b6:a03:2c7::34)
 by CH2PR10MB4376.namprd10.prod.outlook.com (2603:10b6:610:a7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 19:19:40 +0000
Received: from MWH0EPF000A672E.namprd04.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::9e) by SJ0PR13CA0179.outlook.office365.com
 (2603:10b6:a03:2c7::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Wed,
 11 Mar 2026 19:19:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MWH0EPF000A672E.mail.protection.outlook.com (10.167.249.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 11 Mar 2026 19:19:38 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Mar
 2026 14:19:37 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Mar
 2026 14:19:37 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 11 Mar 2026 14:19:37 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62BJJbfA639626;
	Wed, 11 Mar 2026 14:19:37 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id A9BA2138B64; Wed, 11 Mar 2026 14:19:37 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Mahammed Sadik Shaik <s-sadik@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>, "Prudhvi
 Veeramachaneni" <prudhvi@ti.com>
Subject: Re: [master][PATCH v4 0/3] jailhouse: Fix build issues and QA warnings
Date: Wed, 11 Mar 2026 14:19:37 -0500
Message-ID: <20260311191937.395567-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260311190537.3340422-1-s-sadik@ti.com>
References: <20260311190537.3340422-1-s-sadik@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672E:EE_|CH2PR10MB4376:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c9d87c1-54ff-4c1d-03ef-08de7fa32385
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|13003099007|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	tqYbTSQFA2DLOnmxiKRHpG10+eLir6J/MY/CYmvQonvzB7SpXfBkQXyv+WzRRf1iVJt1kkChnL4/eAp08yMMvKLMT5akKssSVCy2UUFTfXNUn3tp8uShhtQT9qUoxK9ATqQnwZPiTX2zXlRID/R4yEjoC1yYIEN2qnWcr3JUQ/26P6lLU7UdAeK0j9s8kQ8qYy6uFQSmuXsHyFaHzQkzo8/djsxkIF/fIbEEh6Q4Qr/jrAQswr6bIxIgb27ZPskHWZqoOYIXCrPKz+kP8Tea4sNYQUkPV32UiVApu7AnW9R+6fkcgiHiV9drUsyrlGKCWRORwqdrxuEFisjrsfAogS1sNJ2rwoquPUT+wMVWjlQStkkP7s8MViDmULJ2AHcPZ+11yuVjcuCnwTs/jgqvvxi4Lh/gfcPMH0mPYNpnV370wKivudO6PnpL6W+iOxmXynqZxAjvBSWJBMffjMkwEbFubwj2EfZ1ebMix6FlwpZDoOwendmjmfl8DcL66KjmmK/Fq+Tlaz/B4A2w0cR5oK87yeYDcMq0oyxOggLwf9Us3zxhT3BcJum+aARhW2KGr/bWtFgEx6Bi9iOulC4TRxcj72fmySb0xQymmexoGA0KMijPbLxYzy/8wM6iWnWzkJRoPOARI3Kuyf37cw/ZYLxAzAe8kMr85CPOujzKKiKKmMdD1Xl7mN8dQDunO2BG78+GjyrFIIXsVx2NQICuGPkxw0m1nTW1O8e7t0F6ckSHHZDkU3We/MuYFECWaKKkj67bzGP0cERhhHHr8MNt3g==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(13003099007)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	2LGeQKEed/uBYuO6O79o+/iaV1jahLKPdpbj8NgTWApVLDMStbG+TtELQlh0T4aWHYRwUHcCb45sKjOsTWF1290ibyyuPt7kTddwUXS1H25U4qBDGLMw9wp51WlyO52QuVnCAQZogSpn+ts/z5peW+Dh7JgzuWDdKWeo+6tqIj+3xr5rOGO5zkg5U5Jf1PHGwu4al+Dum4wOSomlZQ37FJ0phnHUKpsRTaKA2yNcE4rkx8vM9Sr6BYwFSDsWGdo7wnXar+H8fBbHg4vlE81f+yqQb3wM0igprVqcE2gp5vZrUCNINZvM722IXeFqWdifhphMBmJiu6ukaReb2KQDE3MTgV28zXzrIHWsKU6FYBp/KjY2G0YIqC6E+lXOA1T2LWigwrbBHueWHmjm7P9XsTlY2xVBDfIGnrDWAfgH6q52fwljqyHHE7JkuHpt2NGF
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 19:19:38.4183
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c9d87c1-54ff-4c1d-03ef-08de7fa32385
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000A672E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4376
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 11 Mar 2026 19:19:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19708

meta-ti / na / 20260311190537.3340422-1-s-sadik

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
WARN - [master][PATCH v4 1/3] jailhouse: Fix JH_RAMFS image path
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [master][PATCH v4 2/3] jailhouse-inmate: Inhibit debug package split
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [master][PATCH v4 3/3] ti-jailhouse: Fix buildpaths QA warning and c=
leanup
    WARN: Revised patch missing a comment. (REVISION-1)
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
- Patch Series: [master][PATCH v4 0/3] jailhouse: Fix build issues and QA w=
arnings
- Submitter: From: Mahammed Sadik Shaik <s-sadik@ti.com>
- Date: Date: Thu, 12 Mar 2026 00:35:34 +0530
- Num Patches: 3
- Mailing List (public inbox) Commit SHA: 64e82420e6f9ab1890df7679aa20d92ae=
8d44fce

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: Add falcon support natively
- Commit SHA: 2976bdb6413a80438ce1fe7d4056105f6385f019

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




