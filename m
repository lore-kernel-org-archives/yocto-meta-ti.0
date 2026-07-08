Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6965C43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 18:56:03 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15724.1783536960592360593
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Jul 2026 11:56:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=Crzo7lZl;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=Q2kyzobV;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 668GHC7Z1827220;
	Wed, 8 Jul 2026 13:55:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=PKHIRTZFNq3m8CUQYpOGcp/Bys83NxX2oL37xP1Vn
	KA=; b=Crzo7lZlHdTqnDz4BzB8qDWehNPTKnNSzEC16YCTR8fZtEn2tkHVzwXuB
	RIt184a55ZzlU8T8qSHXkY65E935Od6NrVchpf0PcMUEncBROX7m76p28iQglv4a
	vZuVLQ1dcWn+iX2Jvl/LFbiZvizA/34yIIuD6m41+lxqiipK00lDfS0HrvI4UvUO
	bV4HwPJKofISpJ2pBPZj3E2UMm4ljtb7rRbWDtDrKjChXdkYI4p/wDXm7pPwDUza
	LN3KP6zzwi9EhqCnVSgfONixp9V4bb9wY6qZqVskLecgoLYT2DbPLLkyJ+N1ZJWY
	RWlF20Iw8ChEKmihmOnYC0Jke7rZw==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012025.outbound.protection.outlook.com [52.101.43.25])
	by m0384305.ppops.net (PPS) with ESMTPS id 4f9nft36hu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 13:55:58 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RVKuvHySnvv4hgw9nMKB7aba1kSdrt6pknTSAhQ9GMGKU0i1dIHtWCEh1o+A9Wi0txlgui+jJrZP/1SX2tayzm8JvE4mruMWzLI3E1xTxegIG8m/U0OiQ7EIyogRpm9PFgETscD4+3C2Z5UILOySByNZkHm9ZYFkq7t49MnUckBJCJ+pNeC/OqsewJ2gWTKwNlqc4/GfmH1cyF+x+ZxZ7jeo/SBrAa59M56NKdyj3xYoyfighYQRZXaBw6nvvEoTdzB/m2bscMnDv+gZiQbBknEv7RtLEDuwXnO9DEehmIO5BhNUyvmvIWVab3aoqxD5hVnIHPYIV2vLK4omPfbQEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PKHIRTZFNq3m8CUQYpOGcp/Bys83NxX2oL37xP1VnKA=;
 b=F0PxvNRlz+FrGizH3VFiypa/9Ybx7xogMDM7jAXh3rkcSGlr2+Ep0LRcv3Wbd4oB4ELitb1E862q/w8bybKQD1tytRs5kmd2XYAGpxPN2Um8Q/xZM00Bpu3dFjKO3RcOXX//DrlCmBLQr3GYEmWoePi6dzX8PFtGGVEznfKeB6V7xqNfhYzbayr5FTvQuzuFzJqFvY7az02YANAg8frhfp7SpiONmNWwwI5s+dEhn3rwFttJ4orQf9do4a174BQFOIg18bXIapwLVESSTHG7JUUVSbB2mv8jvzNeUQHJIOaB/4gV7jHIJkteu0VxIHBhnYEIg5/hQNE2IhaENlqxWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKHIRTZFNq3m8CUQYpOGcp/Bys83NxX2oL37xP1VnKA=;
 b=Q2kyzobV12kDDzaNgWPkRpymnYQFiND6JGUQC7blrf5FlJt4hS/nJN2GDuGxy+F8hyl7sJbDO8sqn6M5O8LfDTA0myXgB0OVuvha8q3lq+91WXF+NRoEi5PibCnYqs8hMCyeqpWWnforbzjUJAr+Wxt00pxljs5xhS8NUeRbR8P2BdqLpfgYG2yGS8fwun6gSKr1c2YqDiiZoJwDEp2qt4M7kohik8F9sc2kBm5RRRqlUn/0CNVydKwx04u9J33daiUuac1/zjI/bgB9UZ5Cjb/HKWgArSfK3kVlMQd7Pw49EzZihGLMV90wJmftnUktkf40K+gal23v2NuV+1o+Iw==
Received: from SJ0PR05CA0172.namprd05.prod.outlook.com (2603:10b6:a03:339::27)
 by MW5PR10MB5826.namprd10.prod.outlook.com (2603:10b6:303:19b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 8 Jul 2026
 18:55:54 +0000
Received: from MWH0EPF000C6195.namprd02.prod.outlook.com
 (2603:10b6:a03:339:cafe::74) by SJ0PR05CA0172.outlook.office365.com
 (2603:10b6:a03:339::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.3 via Frontend Transport; Wed, 8
 Jul 2026 18:55:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MWH0EPF000C6195.mail.protection.outlook.com (10.167.249.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 18:55:53 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 8 Jul
 2026 13:55:40 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 8 Jul
 2026 13:55:39 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 8 Jul 2026 13:55:39 -0500
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 668ItdEr2157181;
	Wed, 8 Jul 2026 13:55:39 -0500
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id AF347142E25; Wed,  8 Jul 2026 13:55:39 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][wrynose][PATCH] check_yocto_rules: Add new linux-firmware bbappend to skip list
Date: Wed, 8 Jul 2026 13:55:39 -0500
Message-ID: <20260708185539.1511478-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260708185200.1394574-1-reatmon@ti.com>
References: <20260708185200.1394574-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6195:EE_|MW5PR10MB5826:EE_
X-MS-Office365-Filtering-Correlation-Id: a3706c7c-7a33-495b-5ba5-08dedd228926
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|23010399003|376014|1800799024|36860700016|18002099003|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info: 
	vFOy0GUvxrWyFJkMTILi5oWXeQXhqmrq6c6wFOEi7qbk3rzAGvE2IIDYzgLEDf6yFdFrbC/1uRgY+joE1d7iWhprQ+fi+oWGSvMpJsiLgiDP8IJqOLo0D4NTuX6KI0hWR/exIABAPsy+1PgeHnZRNj/zqpVdfD9mZWTTTixj799jt8I2GP9wP7D5FVw8B9dczt0ZR2jYwUzQx6sAys7Y70i4oEtzbMo3rjF4TSSeCv5oPNE1xp3XWvegJJLyESPSCZ8C8sdidd5UFdWn3j8e03RYSnOyGehxK7ih1+92njJyV1Fmdp7x6nV0uXVsFfMdmqA7KROkbZx8pCLCOB/fuWLe8NRj30q7jRlgLdNtB2K/qGfkYxvwXNRPlaub2DjmNBYMPfPF1uGL7DVeuErbjqHhC1gvNXXUDWinR2OlG0lNwri9779XpFgdRMC8rquKD7kCwb1owYps92+pV8Sy6YdNz0bDEpPZgFTUQw5Ls3kglzNx8vHdy5pX8yYZdTqgsdUqsS86bjlDiU+KRsQx4VE6yyGWUKAPfvB7sngt063nTRBNteAAQj+UKdEIeZGtxF3YOm9oIu/U7XhT0DauGSAL9Z2JMq0Ob8ERm9+He76GE/KChUlq9XyUIgO3YJttMPfkKyiv0N2oKC16RNqjDsGfGKgUXUpZxRD+hB/kxO5Lcnw+oFUw9FF9cS0IEH0iXT1ccxlTMU1gsOvu19PDpg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(1800799024)(36860700016)(18002099003)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	C278mZYwaeYxjnlsPudOWK+TOwz6zeQlgcRfSGw1geSrhGnSQh14XK3oIbWLTn8H+cEjQuCLWyzAsHog2+DXjyQ3hGbPD0TSAw5J4FY1PnJVER2/i37Vr/xLz6GirgX9LUXh0ceYoQO7KsPkKBAQi94iPzSKAmpv5K27BSx4T6jdc03CfglDe9RFABuS2FgCx9awjoL8LcX4+aY1ccui1Z1hPTxijV1taeJuFZShsywtESGi2Byg6/MAb3noXd8D8oxZ7YZg/vHU9ulbqKH8H1AOr9at3QV2muQpVyHsRfyZNj29zMlhpfXb4AF+PNCSmcadQ6spXIc7BSCRizrN+E5PYz5h7ZonsIdPRW+7udqnyNP8UytT3WYfptHwlAqTc4/wm3TU0GGx05/RNRGdSLPN/vROBc0/rNk1i5gPnWj5qUCZu5wL7UQ2o0TUmVPX
X-Exchange-RoutingPolicyChecked: 
	PFUNX+T6JDfTeDGHqnCWzCQPnvSmXNLJF8fL1rJygU98u55cCv0HtH0pKBvN8mi77+MmxYnWFpj0H2OoHtOGXnBTWVEvPr7/awAjpy3Zc5qWHcOubNFR4wlBeSWil4vkZkEaprYfprzrquOiCOn9cjJmWKZUdKq42nr+KVgRu0pAzBPn6S/UsCBRn/gBXnJPFqlAJLpLLakadmk6Ic4dNMSuwT5WkjfWR5snMk2SFnGE0wNZqHc2WPs1mRGepGTMKFSdYwMMFRl64YgXTsGBU2DQmdvSI+2XNwcMFiaAArzx/fJNASvguPrmGqyNgoWRqSH0vszx+Ec2oZzaSQj9jA==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 18:55:53.1445
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3706c7c-7a33-495b-5ba5-08dedd228926
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000C6195.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5826
X-Authority-Analysis: v=2.4 cv=AaOB2XXG c=1 sm=1 tr=0 ts=6a4e9d3e cx=c_pps
 a=U89Fr+s++Oy0xugnv2TZpA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=Q6h-4QgVxi0keSBLJ0QA:9
X-Proofpoint-GUID: 9y23xl9m2XckNcMXDVHTK1sHQWNrmatY
X-Proofpoint-ORIG-GUID: 9y23xl9m2XckNcMXDVHTK1sHQWNrmatY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE4NSBTYWx0ZWRfX/f0H8WW+JQLo
 D18rh/02/OQcXuCLkDCjT+8eWSj5ZDMLkWrLztf1/EqpeMxiSe8+zgadraX20LuCoizjfNDQj1o
 ei5eeaPnMlDHiU0pQ37Lddui2m1Rz3w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE4NSBTYWx0ZWRfX++lMlQJrn+ho
 l0iqntVlDppYgY4+8oLiuvZhUtreUatZo1xZkkphEomKl+OeAWlCkEW+mmGMPkS8jrd2uDKFAZe
 WTEwASDwwgQxThIHvcubBhVycZAe0DQ9SSVIZj+YaUMeZE+CxTmnrYLktsW/rGHAFjIktJ55Xo1
 7Fx5AEWtxAA4ZHLzppPqmcPfSBWDotjHW+7qljf5C1euc+AIicAOCuRkYgjFW7F9NOVWRDu5KtP
 lgo/V5vwkE1eWx1NnpV+gDVNPv8uvIqhwKWR/41SAOq3bbS4ILkLhttsxTzOkYH6sO+QAOkblwG
 S8fTvOha2afkD9Gyt3+y/Hq1Ejr606r5+4O9QCgPsHm9XaWMaeQiVLkzDvv1PeueYHDdoPlGrCx
 3AmIQXVvpqrGbqy1xalj49jfTkr8JwhAf9kp0tc96Mr1j2HLQqTtmTqec5TLEyUxRqAV2MOIgnY
 O6ILX/E2xjPmjV8lgcQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_03,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080185
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Jul 2026 18:56:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20133

meta-ti / na / 20260708185200.1394574-1-reatmon

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
- Patch Series: [meta-ti][wrynose][PATCH] check_yocto_rules: Add new linux-firmware bbappend to skip list
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Wed, 8 Jul 2026 13:52:00 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 5a989291e5dad6ccf48b30da51400e21848acabc

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: check_yocto_rules: Add new linux-firmware bbappend to skip list
- Commit SHA: 12801297563d5616b1fa80a943331ccd56fd0e6d

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




