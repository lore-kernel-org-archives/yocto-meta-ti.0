Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03024C44501
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 14:36:37 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7236.1784126186745773496
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Jul 2026 07:36:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=BJasfyNu;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=ETCnUh7F;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66FE2jRH1141637;
	Wed, 15 Jul 2026 09:36:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=dyJfM2Ja6mqkAiUBy/viGuJ7uzZUBleOWXNggauNK
	7w=; b=BJasfyNu0cPMUvp2+8AiULoor0ZLpLtBPrDud+TvK2KyhIcRFBKQziSiV
	6ZMSKcfunnJ+pYeMgDvJwDvqHjIXHgpUwqgy9HLMftsGGwpHcIpGg2EYvqkizkCl
	x6PKDHESBzYnCMdWNCAM+SkcCBOvCrujiytudmZCzRQ4X8JWjbpQMFEY+PKzh7ko
	U7Ae6TSl0dqmkCCreTau13Lp10PQvAssJIBc4mgD8VRO1jM0mEtEPgODnjxdIUQ7
	Ujhj8jWM7DD/3a6fIOKbQ1gqtfb/WGu/dOgjHpinHHB9V8KJ4Fc3bLWQ6ZcsXSXi
	dAfeUGnmO4XVjeNQXh97ckuUcTkiA==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010010.outbound.protection.outlook.com [52.101.193.10])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fe96hhan7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 15 Jul 2026 09:36:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=utZLgw1FLGqD3XO2t3Ls8U5Zg/1vb8kEHpEKAKOxoYqw28nuOZpxtDb/zoILQqV3d5DCexuGlZTX5rnaNWqPinIfKsxc32etZtDPHSCzUtO/xGi9exd/Yyisgqd2q2wzQoXkMBOmyPIhhhNCTFIntSHglnT6hS/Z5JTqPw3zAbxDteiX44YHZedMOhxSEpfr0hEE7zANl+EODhLVXzBfoJL50D0cWhV08SBjGObVuxsxPhAiSR/rgjdzVx5BhaCeEGGVS1Td6XhnF4F+rTuRceoYNYP5GRQfMHBVf6tSJdJyT4Mt7INAMIF+uV4z1YtVVhZ8UIkGmsImooNXYsMzVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dyJfM2Ja6mqkAiUBy/viGuJ7uzZUBleOWXNggauNK7w=;
 b=MqwxxWkIBSNAQGW5puZHGhqDPRoEv0+c1QFcvsB09HhZdhBi9wwUbVXJsiw4vOM6/lL7jHGYNTxr84115ZEzorB2SvIAepqVv0eMVFkIHPOz/+d3RbvCVEysOcTounaMZ1LUy+Ovza3fsC3/NIYxaGcqCoYYR0+Xupm3WziHjjRGFzWQ0BZTONdJgckFjdEO4+gsjtfCec5gh4W3WUDMo42KpLm9FTcajpUntGc3LMzCXRi8LtSEjh7rBAbpcfqhzYRW3ZAELGWirYSuLmk8hd9IcvSH9rf2E5WQpryrcs5rf3UD70obeGkdGjY8qKCNV0No7vkZEfL5d5bMJOWwIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dyJfM2Ja6mqkAiUBy/viGuJ7uzZUBleOWXNggauNK7w=;
 b=ETCnUh7F823xzlqJdKQNNdoek7G1VKcUP3w/c2Iyw//F2unkS4rxOfJ4FpSRfYOtHmbUTi+f7ZL/kfR9ifeKK+q+JQhujuUz3AZnQZr+sepeyp+DpSEez1O41k/RGV4AzdqIegxDWYpuX3BxacVVBA/iJiug+l2c+zf4pvrQtTHC8fIMAx9f/W9a2He3onLJiUnD2Ras996L3/TSO+BXzYxqDhFXD0xDOB4m022R6M1ePdyQkIfuZThHQmhVfnxz+juoCj5V3acK2QBhHTCBS7iMqwN/45oAthFmwYxD2+q4dQ5WiRkoUJGNyoqfLSDAv7aIJY6w6Wj1UQMlBbTFJA==
Received: from BN9PR03CA0204.namprd03.prod.outlook.com (2603:10b6:408:f9::29)
 by PH0PR10MB5683.namprd10.prod.outlook.com (2603:10b6:510:148::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.18; Wed, 15 Jul
 2026 14:36:21 +0000
Received: from BN2PEPF00004FBC.namprd04.prod.outlook.com
 (2603:10b6:408:f9:cafe::a) by BN9PR03CA0204.outlook.office365.com
 (2603:10b6:408:f9::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.11 via Frontend Transport; Wed,
 15 Jul 2026 14:36:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF00004FBC.mail.protection.outlook.com (10.167.243.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Wed, 15 Jul 2026 14:36:20 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 15 Jul
 2026 09:36:19 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 15 Jul
 2026 09:36:19 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 15 Jul 2026 09:36:19 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66FEaJIP2685232;
	Wed, 15 Jul 2026 09:36:19 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 07A3961C; Wed, 15 Jul 2026 09:36:19 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202607150653
Date: Wed, 15 Jul 2026 09:36:19 -0500
Message-ID: <20260715143619.2309538-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260715142817.1560417-1-lcpdbld@list.ti.com>
References: <20260715142817.1560417-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBC:EE_|PH0PR10MB5683:EE_
X-MS-Office365-Filtering-Correlation-Id: f8b1896d-8e5b-4bd9-3437-08dee27e6fe9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|23010399003|10067099003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	jp517hjnQ++bwX56aItdzcZ5O7d0NaxWygp2hKjwZAIwwNyKwcMTnsytTa3qmHA/LrTpOuMR2Quslus39FaPrR+CFpHwUQm14FGzMoT5O3uZf7vZU9YAcr74yUped/sBxwhN7ELB+DmRr2mukGKvsGxYYiZEcWbGb9sjxNKtCLGHnB84j+XQHiMAFWYXMunpU8ZOJeynJuqqh6z9Mv2W7PJLz00Oi+SygZ4xCxst0kZBZc5F7mgPxsoGPsr9oZ2ypElg6PkCWShiDZkZjMsnwleP/6sLTPWHgucQ8fDfw5fJM3mLIKxLvEbhgNzTvjRxk7VerS4QhFNvSWE/wGFP7/TTWHnIZ+0JX67sxU8IRT1o1WEFpqI34UIR4PjgpO3BJcYpnNqzu+I6Vp+Mtl4Mvwh9TLMydB6dn4h8Q20/ZNBxP9Fy+IZrsMQeT5eRAYdOHpHXxZk/9U398C8bDes4DiUzCmuOjXUQjeYdDRut2oea5uopCzqVJAojJH9xR9MOjuYz1G6z11Rarr5EZt3VahRig1xVIJm1v+oR0zMoG7SXuFOliT0chRv+sUg4k+M24Pn1vgNb4hytUnQlWm1ajJnIrkwZHvnja3K+pm1FUWV8IZABY1xsbiV8noSrz+dozfSSlAxth6h0V/0d/UZHP+2sMrZ6S6ovSv+/GahcltthT0CJU4XLk5hTOuigNRgADadGDooL/WRfb8unC5jvBA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(23010399003)(10067099003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Fpz2720Idu08LHsNgWXE1geWrynfGRyJOpBDVSTzTRGc8DWZ3xjShwrEpuctpaeEi9T9tdDKVa8xc2GWsNaG4BhGt4+eg6XZV+YH4FfDmdt3ZjXgiMzFicJeWPFnexlBkkU1Y+eFejhSwdQp2MRB61pI3kpi1nYYdMMp2eylwJ5al0VRzPs8uFrd2hVEZRNEKueZiUpAjIQ6F2115/EPE200GlyWiUIkL4A6MQFeswIvTKiVnKdUsCH8Pc6vA8ZMEKoLGbeOh4Ub/d658pJRu/9Ld7ed6q+TPIM9ewVZ47bYJfFF191/3TMwbY2GPf6cSsDmnfs/Q4sHoazKYjhgv7BHTaernsb8FVNUhPZ6ZQGgq2irg8h/vKF0ED2Kaonf53xLzZr72GdmKBelnSLnBzObQXTJ9F2mhqKCjFW8OGlJu10vVxQFC8TjBr3BR4BT
X-Exchange-RoutingPolicyChecked: 
	aCuv0iqujQX24V0bj7FM2G9F6Gvstmf4pscEK/S9Cy29ld1fZ6UCR36pQrvENeIwGnLJ+zm7pslJK2BPYZ2gRvuNAzMXZpul/WkQdEDHs3CCQRCOp0fCzJK6IFvhiQmVkBlB++294B6W0YJkDjg+fCAOoLU1tF7APaJe9CsoWZHSqU6UX0uOZ8mA4wxpocKHEAPdHZNQSnwoY8z1I9SXkbo9tnd2wHeteWx0W7GX2O9k0iAti4EgK1i7rLXeS16zkVDYcAW4d+uFHZTlOqdK8hKrR1VwePiZVgEMDOJa8WkGcCoTC0PrL+xnK4GV/xuCg7cQaNZWt35561uC7AUnBw==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 14:36:20.3390
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8b1896d-8e5b-4bd9-3437-08dee27e6fe9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF00004FBC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5683
X-Proofpoint-ORIG-GUID: wN4VRS8bt-Va8Ak9YrargLN7slKOytOn
X-Authority-Analysis: v=2.4 cv=Zfwt8MVA c=1 sm=1 tr=0 ts=6a579ae9 cx=c_pps
 a=UIgYboCJ6PpLVfK8zyfvEw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=k-42gJp3AAAA:8 a=cN9th1_XAAAA:8
 a=IFOPPRYpaNhS0-o2ufEA:9 a=uCSXFHLys93vLW5PjgO_:22 a=5HybKBhn8h5UT_hmDMpx:22
X-Proofpoint-GUID: wN4VRS8bt-Va8Ak9YrargLN7slKOytOn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDE0NSBTYWx0ZWRfX8a6p+eiaCEBO
 oAgJH5aHv1IT4lRzAyZE7xyZ0vP2zAM7zleRgTclQGW2DeKgNEO/OE50wbcXq4dbkQk2oWwbGfu
 qGJkRl8Z/HxUPw1W+fIIOQ9IrV3b5YKfADJ1jRyXO8t/Q4I8lNnFENl90MykhVM8p7WIIawLjki
 6P4QxlnGddaGNdQn36ogboeYZXIcs7GjTjEy3ev7DB2xTxOB4IJ++EAC71Z5XjCwkn4uuht3hD8
 Z86088dREyzJhM/ECSMDk9+SF6Ya4Eui4NvrsLOhrAoJTzl4ekWl/8rNO06pJn1SIT1wcUq4tTF
 59n9mXDT1x+o5veEqTrmXAXr9knjj9SW3yivilxURMxl07ewgRVn5padJLsx6PaveU5Z5FNk2dk
 IRxb/VCG0TPDKDaCfUZVldJpJD2OJU2dCBijO2TCJAYahal3Ehg025CqpuZi0HCGq+q3ZDBWw9d
 fr2Sda52NLcHzmn4/Xg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDE0NSBTYWx0ZWRfX1jpX3AtrQFgE
 u5ghL59jIVYyVG59wk4lJZnyMkzjIAqEh5mMOwHyt6XvuMb5Ux9c2wHaZH71+rXMlvibybrTTdh
 f5Tlvid+WmZSEBu8YAiBSe7UgJwY7gg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150145
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Jul 2026 14:36:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20143

meta-ti / na / 20260715142817.1560417-1-lcpdbld

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
scarthgap
=====================
Summary:
- Patch Series: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202607150653
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Wed, 15 Jul 2026 09:28:17 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 74512d1d244173b110acef13561c5d64ad110e45

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: Denys Dmytriyenko (TI) <denys@konsulko.com>
- Commit Subject: meta-beagle: linux-bb.org: upgrade 6.12.43 -> 6.12.57
- Commit SHA: 7ff810824442c56ef59fa2d705d64a03ade5f5f7

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
scarthgap
=====================
PASS



=========================================================
  yocto-check-layers: PASS
=========================================================
scarthgap - PASS
=====================
All checks passed




