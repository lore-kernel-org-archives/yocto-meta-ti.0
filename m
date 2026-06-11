Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3788DCD98CE
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 15:37:23 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49069.1781192235587239523
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 Jun 2026 08:37:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=r4IMBFv+;
 spf=pass (domain: list.ti.com, ip: 40.93.201.56, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nhd0MFjknFBxwmBg/0ZCYYKLQqtNh5IHTYFH50ll94a2WMC81LliXj65VjLgmN98vPn5A0alN1MaIrlxmetvdyfcbXh67gU+PBWEhE616hD3CwxW7uc7HmFRgHHFngj1kJE+TAFCyYhl4xlOL98PMQuQKFV7Jtt8DFVxzVndp1nfsE9/psUXOZt/YAmzAy2IiFyT+eutlqGxeCMFy62BPqrx8giMtDevtuHrLxpsGEqtsCsEuq0c+acTYNVXrCwZzCICVTZ46P4LM9M8xR6EeR7QxTQIV+NUONwF/fAXCJMbQEFb8YxOeFmsBnOcLI4b+pdV+cMeH86bz23y6NlwKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NwFbHcw9G1PjOpmGjejaBt1iX7Opw3B1nHuEwhCT5Wg=;
 b=UT49rIY5PjLUhIQ64N5/unv/WjcMPVS2nRhd7OJ6QLqw03VswFrB/eIQSxbb5xy3p+y8RlI1fs54skiFxCABb3HTDLkeyg64prhckTRctJqSXSdj6b05jVarDlqevId3hjAVoqDUkhwVBykHNZVn3laPJMOFQ406q+qP2PTKW1zAVaokLKNSj57eYJupDQKDJwXtSHl+EJjdlRgnjlgfjkRCUlsom81k49SNcdUUJoYebN0i05ppNIeZ+GKqtVtX8io80KOxzT0UEcqhuj5KFHSECkbQItrkUiDjMve3ClJmsIUeBF/Sxspf+m1lQFZVuPNmfBvgncRFY3ZsT4IX7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NwFbHcw9G1PjOpmGjejaBt1iX7Opw3B1nHuEwhCT5Wg=;
 b=r4IMBFv+e2tIXN86fIne9HNRGunOwD5wjPsZ2wvTgBvD/rH21AbZoUazypbmLE+d+MbS3U9gJsG2dqRsdGYEhVn902FiwgQpoiVA9DrbQ0Y0XXSSLsoWAai0m4z+XfiGPAqFmTEuqsooHY1MS3t3CfmtGfZLrsAi2G1Qxh5XZlbKUSt10rfPFZLJRdkmKQOICCgAeN/nerL4USFsWwG4D0pW4g1h02au2ucyXQvbxWf32r6iSRasUr76erq4ATp8MmHDFJUj4WHEXPCxyCAFksfzhknZj3Hmgj4pACkL4dPO53wq8Jz/Ub20E3heVLqjyL3ftcF6DL1445Ot4HLMeA==
Received: from SJ0PR13CA0044.namprd13.prod.outlook.com (2603:10b6:a03:2c2::19)
 by SA2PR10MB4411.namprd10.prod.outlook.com (2603:10b6:806:116::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.18; Thu, 11 Jun
 2026 15:37:13 +0000
Received: from CO1PEPF00012E63.namprd05.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::2d) by SJ0PR13CA0044.outlook.office365.com
 (2603:10b6:a03:2c2::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.5 via Frontend Transport; Thu, 11
 Jun 2026 15:37:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF00012E63.mail.protection.outlook.com (10.167.249.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Thu, 11 Jun 2026 15:37:11 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 11 Jun
 2026 10:36:33 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 11 Jun
 2026 10:36:32 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 11 Jun 2026 10:36:32 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65BFaW7U438376;
	Thu, 11 Jun 2026 10:36:32 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id E3F039ACF4; Thu, 11 Jun 2026 10:36:32 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Shiva Tripathi <s-tripathi1@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <praneeth@ti.com>,
	<vishalm@ti.com>, <k-malarvizhi@ti.com>, <francesco@dolcini.it>
Subject: Re: [meta-ti][master][PATCH] optee-ftpm: Update commit to include TA panic fix
Date: Thu, 11 Jun 2026 10:36:32 -0500
Message-ID: <20260611153632.3938910-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260611152123.2494690-1-s-tripathi1@ti.com>
References: <20260611152123.2494690-1-s-tripathi1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E63:EE_|SA2PR10MB4411:EE_
X-MS-Office365-Filtering-Correlation-Id: 93bc98fe-de0d-4e45-85ed-08dec7cf4e2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|82310400026|36860700016|1800799024|56012099006|18002099003|6133799003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	iwPs6DIQNZPgaajuYHNKbAyxIvkDAuhyAVMKTrAFvmMQdgXpSKSh3klbYjxXOYYB6cbfnTswdodz6sA0U2FyA5DLJRny0wePw5TgCQ573A7maPZpxKv+yWRXaGpt/49dumD2/yk1Glr7a20Uff6u+0cBc7FMfHsgTDq6+3U713jS0ItBxHoPAJio8xEb2ODEFtkBVqCGCuiPITbuRGni2BmshfVzJBNOm93P3UzsNR/0qtCjHWNQvf2CJ4eMBJZ5jcMT19Ht+INOUb0uWhd/4oG7/TwuGX1/AYwV+gntBRLHlom3fOlUCxzpRnmqAXcWg/+pTzJ/cYuYksUIPQAuVdAnXKuqNKy1raMfdcqTAh+LUmseOgIsaWRXXsoBIFBmosTRIgqdGDQVSADY+zp93qSpR7mtXQo/+Cdul2fw3sM2prkXk6G2W2t1tPUr2P6VfRVBnyta5LPAYLAHqvGLurAtWeuwnhXDBH/cRUaw1Ta0vvfa9ieWWZk9e0i0PFBd3v0KQcoNZ8rQgEmG4KBLmRwmCBok8gwUox8NTrW3sca/bQAa6U4vnBzudeQrdlbJerXbZha6T2Xk73IEbagrfbubtkw2p9hOpxWfHL6Y38lYO048qNr5OInU+DmiLmBzoSLJp20ZDYcz46i0yysqMFuA6j+8bsDbFYLmOJ3ssqcVnTvJwGeHyomegamtSW3usXXwg9gmhukiOho5558hCQjEeM7qvaFU/0lIRmfcEuU=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(36860700016)(1800799024)(56012099006)(18002099003)(6133799003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	zOU1dpU+k402PPzXh8HzQYTqKbE3Dz/l4nYIUiutJuePapsDaDAuX6N24BfZeem/2DxE7jNcQSI2AEuAmLLlCRsoDyqgNevyGGKbP1XqQCiwWet4RpsbAiUGCOjYZpoIduvfnAXNqw2CMz3D3xHBUmmohg0Y9TJtEyMAKiY2S8oQPsLaYPkHPdOT/THWOQU/G0pOgVRegR3fj5pPP6E3iaAqmqtgoQUGZjw/p7gUo1EF4ng5Jpmf23n2y+HQenPh1QLkHxhX1ROCh8BC+71gBvmejk6h6YMwciSAyiffuTHDEzzGIRYms9J6PwnQwX0GF9oruUMp/hRN2Mfyrl8iqc4kCYbNTDk2SuoAhQ8U5+Fw20FungFaADB1oPrTWjKXusWVdXCiyDWztqLAdnJN8udIWWo0zvyEJPOoffXyGjtHsJZPf8PJ3sQxmwHns+8B
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 15:37:11.5458
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93bc98fe-de0d-4e45-85ed-08dec7cf4e2a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF00012E63.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4411
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 11 Jun 2026 15:37:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20028

meta-ti / na / 20260611152123.2494690-1-s-tripathi1

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
- Patch Series: [meta-ti][master][PATCH] optee-ftpm: Update commit to inclu=
de TA panic fix
- Submitter: From: Shiva Tripathi <s-tripathi1@ti.com>
- Date: Date: Thu, 11 Jun 2026 20:51:23 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 1946e9b5ac35fce5a07853763b0a17b58=
1b57e2b

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: Add falcon support natively
- Commit SHA: d678d85961ddee81d4b25ffdacb5ac46b3d066a7

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
  yocto-check-layers: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master - FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
ERROR: ExpansionError during parsing <build-dir>/sources/meta-openembedded/=
meta-networking/recipes-devtools/python/python3-scapy_2.6.1.bb




