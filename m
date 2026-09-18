Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB001C982DA
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 13:12:21 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10807.1789737133109793899
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 18 Sep 2026 06:12:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=dsGefini;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=RkdULAju;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9dLol033431;
	Fri, 18 Sep 2026 08:12:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=d+JGU/JjhzEChpBwfahsqsaRjVxIH4SeDCLcbCoA9
	kg=; b=dsGefini0UX6hbI3/8on2dPEYZ+13Prutc70e6xxNK8nr63YjRo0B8QQ8
	Sjnzu1kWDYNTjUxNuGV0eQKWSErpQxXeDoqb4l5MQu1WtKmcD9t2sI0EljTVMWeF
	K8ya/VgAc+cU66egwGbdK8IeKavQ4eFq05Bi6bgWB23W7W8BCA7g7gdJhd9jaEdo
	GGvVZJI085NNsteUScosCkM3VXdKqQjZFHhMmJgShxpTglrFTOvHkYNLeQIGuBD0
	hkEdfVXVszg4j1VNEF9Kdo7Ki92cH043TNdjqz33x9s6JraJQlFGUVL12hULrDj2
	yW6o97lrJ/xvTrVPB7yXk+yrteD7A==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012039.outbound.protection.outlook.com [40.107.209.39])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gs0k39vjy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 18 Sep 2026 08:12:11 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cBITvAOg/FzfGQISD3p1FWFGAwSNJjOTJFSHDyC/xQEPx5iWMu+vi4633+ySi6Hkqw0IQM7rFpuXxfb8QXHsYkTx6mGRtfSYatRni+9eZzlRREI9DhezGSyTZX39rumckb1iGMxkthfyyW3WsMZM4zLIWqJL7M6EI5co6Gm9rSor4CQcpVSAWk0DUg1dpLks5DGFr92GQsF1mtpIhimyKXCKVTKZocogdtdmxrFGxPr20KYrX9xIzsGK6aOYFwID5+NEamav86pvcH5mX4wahtFMgTchqb6fH21+NLODZ4sc60YPVTgMXvOJhcic4X2lYEDOn0uHO6NS7E5heljVNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d+JGU/JjhzEChpBwfahsqsaRjVxIH4SeDCLcbCoA9kg=;
 b=yXIc1WytGmnGKlr1InoxNF5rH7S3umCzqMRvrCQmwxUS3vYWuPwXZTMLJkpRiJtMbG4Jdhr8d6yg0ISgbVbhobh2CJNVXjcHI3lIlo/Gx2LB9tpWqBFCuViQ9xafOauYgt2tEU4GDCDB5eB1lbvLnJaU9c/6+GNZSYxyeoTV2HirkIiqJhh11VFdMqt43VJeXzVLqNKiu6luY2nemSfU8fxiADRFSCdjJUc2dJmA71F+l/xNnWZlNg+lRzDNSFUM431qWFfZBpnS3m7/PH8wK2ugBvWyYdvSru/FEeHAmJ64ijvkK7YsAdqzFvRi+ahZvSrtNe/bJrD+cOARQ7SJuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+JGU/JjhzEChpBwfahsqsaRjVxIH4SeDCLcbCoA9kg=;
 b=RkdULAjuOXddndjah1N+wIBhj5sUG780rCY2MqKlSNaTAoEoqxAzsr+FbQ6ZUFUbT0B39sruohRcnPXUq21v908gXSA2HiYFOgECSpWq8apQn2moSX7Lkmz6FUIMvhYDuMZWWdYVzQJweIFolek6its9R34tvsNVVUVwE+hECNSJ8GRcQwiF/HGxKygIDkhdVq0s+rOn0GhCy5HHjNvkDXAas4o1c4tVBWQ1f5tuIlFrHjwrb7enNxg+dFhVoo0aoO49KE8MHpx1M5OrHrvmi9NynlI4UYO5tTD6CHcR7vyhrJyWwkrRE/ULEPxg3C6diVsvu/CvJDV0OJBL4UOGEw==
Received: from BY3PR03CA0015.namprd03.prod.outlook.com (2603:10b6:a03:39a::20)
 by CH0PR10MB4876.namprd10.prod.outlook.com (2603:10b6:610:c9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 13:12:07 +0000
Received: from SJ1PEPF00002322.namprd03.prod.outlook.com
 (2603:10b6:a03:39a:cafe::8a) by BY3PR03CA0015.outlook.office365.com
 (2603:10b6:a03:39a::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.13 via Frontend Transport; Fri,
 18 Sep 2026 13:12:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF00002322.mail.protection.outlook.com (10.167.242.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Fri, 18 Sep 2026 13:12:04 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 18 Sep
 2026 08:11:24 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 18 Sep
 2026 08:11:24 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 18 Sep 2026 08:11:24 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68IDBOpI1151824;
	Fri, 18 Sep 2026 08:11:24 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id A4BBA9A9C3; Fri, 18 Sep 2026 08:11:23 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][wrynose][PATCH] CI/CD Auto-Merger: cicd.wrynose.202609172130
Date: Fri, 18 Sep 2026 08:11:23 -0500
Message-ID: <20260918131123.904947-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260918130510.2979809-1-lcpdbld@list.ti.com>
References: <20260918130510.2979809-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002322:EE_|CH0PR10MB4876:EE_
X-MS-Office365-Filtering-Correlation-Id: e56d95c3-39bc-4254-8b89-08df15866f36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|82310400026|376014|36860700016|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	21uhF3OG1CGQxXwD7BddI6WgbM3kgP1I1b6EHFAco1xu6yVxUzs2DP0wEng6JNwM+A9mXDm/J48qKRnxqm7tAl+ssBquApQmRCemZk/PPg+FbBzth6+ZPX2mhuq9THRP/6thUTW/Lcn7izYqoVnapc3C1du0/jxnp3VmCXDFn+Fnifkk28kh+xOn8pl7oo1Dg1f6/2FD9B4B5PONMUQKmTiit6T6nN7qjdJ7qDeu2Knd07CdsYzySo+tF1Tk1VQ788EQCULdV623cevefWN7z9iCh2FODKT/+c0yNIfp6eft6ylXthChjWZkSli8Q4p05VYUk0N+XBUXjLBlpCy2BVsMAJwf7w/o0KihUS87Ha/0JGIZeQnWvsyJI99r3FacHV08HTJBDNSEBmOdaYNYRSoFiLdjNEYxOmzWuhkX0Fq2OHfF2QtnmURK33P3PsRy+u5m2ljXsKZsNWL0ImUAUCl0g/P8vW1cScjHKeajaFTFb5XD/jQt/lWz5U97UC+yP9anBIlF+ilaGZGMYTM1+McXqIkOTIpLHaJpNfDGL0gbeTkyRnD+SI4I/LjMiOJ16WaKaVc8o6MBraY5sN1/DTMPwPqVAS2wDUciBeTZAuFFhi4iWzmOFY+xxA8U8kXnwN6b7POXDDzD6jephv0cMU5FrdUclKdbNbb0q17EKtHOHeFiGiNGHtc/WvJWMw/esXdMRRTSA7t3uBQxTZHE5w==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(376014)(36860700016)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	UCr3tDCGXBK0n9YGIe/OfKrGzoXyVjSo2Ab40CKkDD2xH4jwphCfbLQ1grczFlIyp+SDcgQwuDIi9km28KUjCGJ52MXmoXY7v+Uvwv3+LNGYD0ykGuQw8Ro6OVKh5kdrzmwl4+ivChyCX9lG8HH6p9tlI7Ssk0Cf5NfxoZgErg8Hkt/7aDWosj7Ej7U5jCMmPy0tqLfpaiYttY/PRJToKEGyJRU7G2SrdphQvJ8QGCP++zM+0NMXzdRWjLJ+UQ1oO0iyxDFjoU67EWrmK4k3FBsoEnckb/w40BegJo1XCXf/0GAcAI+fwViXXWGnBJZIp+BmZcLZmK8gxUA4B3lt3qdR5VI12HysslSFUHEiu1sCcMk7tcmlGPyY/N3z5USX9c+c7opQnpbthNyx0vrVTPaWrMWMlh6iWuSjJcaa7IXYzK0mek9Nek7ak78eCxl7
X-Exchange-RoutingPolicyChecked: 
	1JD8qzSOhI+cJ8bSw+bXkLw6VX5IZZ/SHPJSSJlog40Ukitfoq+6Tte70l2rXSCxC/nsemty/34J22tA3GHHoyup7gOHe5WEAm9jkI+Q5GFzwxcmWuWWvRROwYVRBIJlvnFzsubDdzCSg1vJgy2FlRq1rMC1WrsVMYIxSLzGakzU6hEB1xe/8lji+bWRaoEI760N8oNeoDbxP10ygIQKb8Ox8ds/W5I4f2hbhxxW+lFyQnDionEFjwcgmvITNkae1rx8LH5V6z4BSAb/cjl5Ux/pvXOrxajq3fEU/CoaU8pN9ZT4+tvcikCvPHWmXO97Vyf9EcLEqvtv5tJv2NUUog==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 13:12:04.4223
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e56d95c3-39bc-4254-8b89-08df15866f36
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002322.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4876
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE4NiBTYWx0ZWRfX00/YBHrFBg3b
 z9oFpMZ8Bmk34jIsG7XWktOYKLV7TLD7g0KFw5oZdRqbfUG182pCok1boP0roti5Bt+DKx6QXd8
 erkxlZuqWOPZGjYnNjXd+LTDI1h1n8k=
X-Authority-Analysis: v=2.4 cv=K6S3jCWI c=1 sm=1 tr=0 ts=6aad38ab cx=c_pps
 a=c8ROGaHEYT5V2SXoku0acA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=VWJKhpLGtqGzGOnxQVMA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE4NiBTYWx0ZWRfX88bxDvf0lYDC
 NfM+ZU7wzE+83Ta/+h5hlmfrQeD6VfurN5WR16MYelfqGprvyyi10KfUfgDZzI9w2irshEzzxmw
 lcUXrHqqCPIqZnTmgxmr0fO9gaZ6o6VoX6kI7fgQK05z9fUaUmQqEBuq33nsG+B65/1zH7+DOc5
 cm3WI5mQD3hUaxRJGi5gaXjDUgoYd/QFi2aoGRo3+181mCz6WLGZsTd8cqhHI75bavPaEzC4dv1
 CXRoTaahbKq8ASTBBf9h5YNldWRxEkuVziS/ajFqnsG7ZP3AOAwM8mdld+c2H45y+D1aFyelO9L
 sFbKOQnWiJMBA1YLddYBvSudgJIc8H5XXH7Qvv2ur615a/QX5nOp84ka21M291tGKvKj/jpqdmL
 rzISEFLCdwGwJlN6IxDDB0gIgmfU2zApM8yt5xm/Fkq2OAUSKp4vdBRJ7Zd3OW9c6czopy5sfVd
 sTOt94/UTe5VWIfz3hg==
X-Proofpoint-GUID: YrrQQ-hHhy32XO1KwbvNPzr3VRpHvYrY
X-Proofpoint-ORIG-GUID: YrrQQ-hHhy32XO1KwbvNPzr3VRpHvYrY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180186
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:12:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20387

meta-ti / na / 20260918130510.2979809-1-lcpdbld

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
- Patch Series: [meta-ti][wrynose][PATCH] CI/CD Auto-Merger: cicd.wrynose.202609172130
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Fri, 18 Sep 2026 08:05:10 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 6947052ab015c039495be4c5bd1e54b8e0106399

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.wrynose.202608280716
- Commit SHA: 018a5e2bc1da78e198ea57900b993ea91795a5d0

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




