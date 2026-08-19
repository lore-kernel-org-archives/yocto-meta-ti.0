Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8D8CC5DF7D
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 02:46:42 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24508.1787107593932449747
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 18 Aug 2026 19:46:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=ouh6Nz8+;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=OR8bQIud;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67J2ir94972106;
	Tue, 18 Aug 2026 21:46:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=xThLpFWKRlW0E/apo+hCx5yN30GH8hLYx9FeAYYli
	IQ=; b=ouh6Nz8+4p6E/RsJrG7RHf4A1TCaYwbgajoMMfg50sHS67cYN72uSsfW8
	HZqy8JStRDkZkYKSI0jxMOmLvh6mxKZu4Sh0XUSyK2Dg3gzi9aApxBEJfnX/Vct9
	dDWsR+zB9MzLEWAqCqLUGnpp8yDaQlMv3C77+FXL24M//kpPiDCcwJtQIKkWFVIO
	xF1GbA26s2RguTPW//jKs7Rd2a6XlXO2f5xEYjTs9FdaB+2uhpxSX3xZleqLNbRS
	ECWwR3ujvcChS6L+hpPgeuBeX3gdcwM9hN8yHPU+CGKLKhEuroG5rqCvM8C0BAr4
	rvAuvl/NZEI7T+s+9sQGQLFsruGbQ==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011066.outbound.protection.outlook.com [40.107.208.66])
	by m0384305.ppops.net (PPS) with ESMTPS id 4g4yemhj06-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2026 21:46:32 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LoXLFMxirH6Zdk+9bk6E3vX/j/h06ttfI6lpfLzzBb3Az//spDX4zjksx347JF8HTca3KQYL1jWwl6SYG1l8Yn28CJqpVjitBWaCZ9JQU5tUfYKpYLXFmYKQI7y3+Uz4TBcXhHU43PmN9T53qiNQm8PLL+XzT8yeAxQH28AnO+zBNwteui+4gIkXjY2s3q79vSKASO9407ZZLNtrgXEUoP+MgOtU5NfXt1aE8PxZ6ViGSNcmneZAft3mdFk9krgDskaprB/yEHbHVIptcf/y6hYjM3647AAAHS7u4PiPMAApzmyWmDszPMqMdN+Zsz7Dee19IB2Ssy+MrojiGWEpMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xThLpFWKRlW0E/apo+hCx5yN30GH8hLYx9FeAYYliIQ=;
 b=OlQ0XS2VBMJs/oJWw4A6jcVs/AGENLMRy4OLxaNH399jO+HAzZgQtBTz6Zer2GOFcruL2mpWbhpgVYR+QhAiMWTmJyjWHOvGTbnA8cvDtVDoXa6bXSK/idw7Miw5qUAsu+g32xily/4KnX2bHVDAojmyCFnwA4BIDto2gb40PBQJIKvtgDUpyR9FmZlfVR6PHkDBu2tluj+OkNmfZsthYtsGevQtwWDqdvwiHX7+LcMgrCJALvFxfVP8lfhrQsf99xo7bmWLSbgV778d/gpAWSsEiaxdNBy9uXUaXvDmrJoP3bQ832n+tqCTNWLz6aNCex3y3xTmOuAwH1WLmbcnMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xThLpFWKRlW0E/apo+hCx5yN30GH8hLYx9FeAYYliIQ=;
 b=OR8bQIud+XGpuqrVB/CvzuS1qYn4qcMdpFdfQcdSclz4Uoo4RN6hamAaCjlwQ08JcvONQQz/4ti7VjvWSAe0O+p9uvVsBXZZXlMUl/DFVgVnFLQcOgzqnKDrFnPX5gaEAjbcUWWiw24UkEnhCNYy4UIMmWY8F3ddf3OCwTm9TjGLkUZrzL4shth3EnEeMR2SLtOfN16xGicFmJ6fF2D+0YNkh9/ciXEmnIfeSqK8D4VA5+BwA05dUt7RLwuB9PofE62TRHY8de6kaTJUoGRhk7kNeqzWewimYwOP3Nb+2/I+CyNGxDiTlcd7GwpEPV7L4bYvMrWWfLsmTffY2kOLDg==
Received: from PH7PR03CA0018.namprd03.prod.outlook.com (2603:10b6:510:339::15)
 by IA1PR10MB6123.namprd10.prod.outlook.com (2603:10b6:208:3a9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 02:46:29 +0000
Received: from SA2PEPF00003F68.namprd04.prod.outlook.com
 (2603:10b6:510:339:cafe::3c) by PH7PR03CA0018.outlook.office365.com
 (2603:10b6:510:339::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Wed, 19
 Aug 2026 02:46:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SA2PEPF00003F68.mail.protection.outlook.com (10.167.248.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Wed, 19 Aug 2026 02:46:28 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 18 Aug
 2026 21:46:04 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 18 Aug
 2026 21:46:03 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 18 Aug 2026 21:46:03 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67J2k3J12300907;
	Tue, 18 Aug 2026 21:46:03 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id CB5C79ACF4; Tue, 18 Aug 2026 21:46:03 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][wrynose][PATCH] CI/CD Auto-Merger: cicd.wrynose.202608180935
Date: Tue, 18 Aug 2026 21:46:03 -0500
Message-ID: <20260819024603.4092697-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260819024227.3526160-1-lcpdbld@list.ti.com>
References: <20260819024227.3526160-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F68:EE_|IA1PR10MB6123:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e4e56f0-a1fa-4e89-53f8-08defd9c1156
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|82310400026|36860700016|376014|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	1wD/CyEw0GyPSGsWvMb9FK/6Mylx7RVzRKwf/Qf7CvSBWkms6kemvSwR0hASJWWuA+U3uWz5VmKBNJfa71Qiegt/5gUtdAVmlLBLqw55WjXkxiU2xaE1rg9iarQ/wwJQGW+yQH0/jR6ir5UA3yN/DlKZqkkAnBcvym+uSOosi7D+3yomBs6gto/llFy0Dsy2UjrR1YV6sO+xmCda7kjXmTQ+usXzRKDJnzApIwvDMaWQwvyxcJpIHTyPnUbQ3yxnje0dBOYOnT7gLiCknyfDSA8LeYP+50PuIDBdiWFxUvcETiQGicP2eRmcjtLSfHQ03V0nPl84yJWWT/CxUSVG9/R+BlIcisFX69CyYe4fJXws8WQ16iQf/a3Up8r6OXxo8QAazFRG3HuknrsE9iRKO2i+O/KhrVsJyLbzg+6bAbsw5bbK54fBiqM3DedO8xjjT1AOMrfmee4X7hSBbqnpu/G/i7DWBpEtOvnLQVA1cBEOsTNcdJiyFf1W4tsUA7UlaX0Wmr6CF1vx4ewHwVEwHvN/Th6RPXqiRAeFnIXMxOrlO/IRGmnrzIPNLKFNBgpc3o7Cb7JXrhxhke0BvUaHRTJoyJNeIenaIeZNKIOFV76MKW0YoN51/oDI8U7jSr9EUax1Z/XR0j8zaDjw22M8C4mXzqk3q3VQzgrhB+jFMy7AxtL1t6vwU35LiOxZqhC0
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(36860700016)(376014)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	SWuIHnw2jMYW4wV5J9yvmNdkZLVZ0pwj1rXts1kagd5aPat6P6qNC5V4A1NWpORi6P72vBErJBLQcevTY+qfvELAJQ28Rv3jcbY6pMp4gtdnT5l34qAnWH5Q8RKbPk/SQBLhEvL9xOVXFhhnvmoMze77YUXU5frZqAi5RjI9xEgk4i7Zavv9D5DTDtIUn0jhvPlVKIp543+0EweF6h9kQXNWxYA3LrakheM5kF1y4CMObv4B6rnHry0PKKPXpoo6F1l6eyryn/krpo+uXAY7wLZPDMfyfXFQtXhGjEtfCvVzXqrkhc0rngao2MzjqVKOQk76ZTg8QyMNHh0ZOzMOkhF1DFhRQG+j/gW8ZHFOsBagdPtvNyCld6Bwo1zo+QLI1Aw3aeR7lrC3DzX4dVFunC8Det2VQ0aC9HqRO/+cudgy6lz4CGBNW5NnumQKDdOU
X-Exchange-RoutingPolicyChecked: 
	IPmHuqByTkY1Oef8dCuIETFgFWf7WB0LN7dtbej3X0k+b+K0YAnG0bKbS9tIxRI+iOhA+AGGzJCYw5FmBt7orRq8BsgiWwF8V0TyL9nsJYd5aIfYNYz6P4Q9Mhlblt8yMXwKdYOGWTTUvLDTt+PkTz7vbt9hMI8u9siswsRYGBpFDsI9JEv6klGT8F3U9QSgdjpSgZ13CLHHZ5Vs0Cyfnp7CoBiUr3InAbEaQu9uh6rxfu3EV9VrDjVaLhwiIog+jUCVwPxwB9J0Tv5KtuQft7AGBxv4LFPBImHGFV+TbECxgVpBApaapEoNucRR0Y54Zr3cSM9g4V7u7MeYQ87sMg==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 02:46:28.0392
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e4e56f0-a1fa-4e89-53f8-08defd9c1156
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003F68.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6123
X-Proofpoint-GUID: UByo4jcmhJQLwWCjJwW0WB9YqD6FH-I0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDAxOCBTYWx0ZWRfX5JIZ2JPfu6g8
 MJhXwHJxC6oO0oyHYVXw9k8E04ZOfValNINWXkhvzXTZhi8WvVjEZhXDAHSXhA2wGC+7m878jzE
 IhEy1eRf9x12ou/79Rr3JZmTojNBRPQ=
X-Proofpoint-ORIG-GUID: UByo4jcmhJQLwWCjJwW0WB9YqD6FH-I0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDAxOCBTYWx0ZWRfX5KA/APi54k9e
 cKH63gzz2cABUby9ElwrU4QJ4URL0jZ74LTJ1Hueeca9RMwy0hq895jsNrepoirJldVOwmncWlm
 /fOvJIAbx7TCEDpaLwnSIuNn2sG724cgBFt+7yI8GfcPZO871dnSMyUyvxWlFJYJl/Z2MZb4T0P
 x4YoLfklV60JAVkNKVKyFhGhp2M8ogTqdLBKEIXebVHtbJk4wv+jkHvsK+9VmtD/yjzh2nKlsRw
 3S7J8JkV2Tijp5K8ZqZka/AjlIY+W5luHRUdVs3e8KpGCz+Phke/ONzi4PvtL7w6pJQGqVxpaIO
 XdxyasLGvXWtYUmndBNNIwKiCuzGGKvlaM8uJMx4TDjw7Tm5cTZ/iUl8QNmV/Uvwzq4xFuM/kfH
 CV8cIhEwH1tFDvBGVSmn9B61AC2edN4QotOP1XmSjJNUHvnYBz9it0A29aPq+bb8ueC/QlqdkL8
 VUsIvdXtvO3zcSqqVhw==
X-Authority-Analysis: v=2.4 cv=S9LpBosP c=1 sm=1 tr=0 ts=6a851908 cx=c_pps
 a=+lVouGy4Ef+S63FV+3Relw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=4C2I2nHoNkmNE2BiRYAA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_01,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190018
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 19 Aug 2026 02:46:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20278

meta-ti / na / 20260819024227.3526160-1-lcpdbld

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
All patches passed



=========================================================
  apply-yocto-patch: PASS
=========================================================
wrynose
=====================
Summary:
- Patch Series: [meta-ti][wrynose][PATCH] CI/CD Auto-Merger: cicd.wrynose.202608180935
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Tue, 18 Aug 2026 21:42:27 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 266a39a0befcf30524e809161e8e3af9558fd12e

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: ti-kernel-fitimage: Fix for FIT_CONF_DEFAULT_DTB changes
- Commit SHA: 04d7c5ea453758fc3c0e764817de89549f936655

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
wrynose
=====================
PASS



=========================================================
  yocto-check-layers: PASS
=========================================================
wrynose - PASS
=====================
All checks passed




