Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2112.1795134742062021665
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Nov 2026 16:32:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=bUFcvXso;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=aGhd4avm;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6AK0F91p3172024;
	Thu, 19 Nov 2026 18:32:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=DPbScEdMXU6ZW1iTtI6DaxvON3SQ2L8XcFAL33E+l
	V4=; b=bUFcvXsobQtzGPQT4Bkf4h77O0dIoEgz7lvAA754ObbUB1CuLqAk/Ei0d
	BeVbAEVU7I4V9F50QGemR3+LF8hu3XA07u6IqmLOpsZJbW48rV8U+6pwDVLpswOb
	w/vdy0zNB6SGOXBKwPQrZt4o/k0p1KbdS1JNN3chpirWM6C8HkcuCWGhEF+p4cJV
	rLNnXZ0lkAq9aV/CuTgI2aMwb4BjypGDr2plbKutRgXdIKCZZEwRU8Od1unuvNMc
	Xg5canKikMc4222mlzj62sF255STJxWSCi8QQOoPmx77GNF+U3yrzDADznXP3aWR
	cuIdG+woGAntw8AlBzfB5cU1230Pw==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010008.outbound.protection.outlook.com [52.101.61.8])
	by m0384305.ppops.net (PPS) with ESMTPS id 4j1wrgwd3h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 18:32:20 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rng3yG7ksKlGqoqaNrGnkdzdJQhhgZAkfjDgE0/+E6wdCy6AwEhmV7Y3xePyQeaRuTCzeFKzjgFGwRTsFHhA6WDUS5QS6rSvGqs7mFF4kussFTj7RtFD1Gmy/eV6c1E//wamvvGH6sXsa28mrHRNK/QLb5B+ujkxwBg6eLDGcGXhEhQItrfEALBqetbcnqy91LstUqO5nBeyePvDkJK8dIYFPeQalcsh2upPzqYejXBNNnLXkwa65G2fod6UVSxPBiq47LkPB/nH2yqom/VB9m1ay07OHdcpPLjJU2D0cKV0KAA4xa5SVMC4hGp9RK53f7s+DJppROqTZ98y4fJQaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DPbScEdMXU6ZW1iTtI6DaxvON3SQ2L8XcFAL33E+lV4=;
 b=tT5khHSIejh8YiJ7OfLeUEtZfYz4XjBhLD18AtjYnnj1MWwBtICl54M1wjvp8WGfy5R+So+YHExHiV9x8y1THrrS/9p4fYtMy5tfwptHIk5nhG3iOeuhhqUhg2ZSFZ+8lyF35Qqx28OUvjT+cwyKvx3sxdiPI64TThn/P641Ys2NcEuXz/SOGL2+5+izyJG09paT+YiAWPLnelM7mLnSfEtisud+7OCdQUSg/IoG7Bh9i8LweAu8Tgd/B7A1H1UYVubJFhOVjbeWcxLSA+SD5yK9EP5r8P7AJrjSuJOQzSDPsvMWSigl8KmvFzsaYVwrSK0zjEPwPJvBQ1oov3pflw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DPbScEdMXU6ZW1iTtI6DaxvON3SQ2L8XcFAL33E+lV4=;
 b=aGhd4avmYAaj+N9AIUw4RT6DJZFARAAfd3svWEt30G162QmD1YsMwK0pn0WxJmZNTcQSa3gznVWG62Rqy2SAh5S/CsagZokJd2B7ofQhLg6D6iZytxwT7phsJkMmIT0H+JJWfHcIL2ga6q9UXMmh0rMPUJSkGCSHQvSjkqJuOJV/2jQgLPdAAEbfJ0d1AsoWSdA9W/fsKIjno6o0YS8kASEoJD9rY8DHoUIl6D5t/hTJtY/nsmX+5ZpBvckgHAgBqIihW7XvKlX+x8GjrFGmuw+butVH3Jiwcu8fbzff9yqblwCgew0za4sqozUJ8UCuWlbp8nbNzw+Ktf8XLUuw3Q==
Received: from MN2PR16CA0048.namprd16.prod.outlook.com (2603:10b6:208:234::17)
 by DS7PR10MB7251.namprd10.prod.outlook.com (2603:10b6:8:da::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 00:31:15 +0000
Received: from IA0PEPF00000039.namprd03.prod.outlook.com
 (2603:10b6:208:234:cafe::4a) by MN2PR16CA0048.outlook.office365.com
 (2603:10b6:208:234::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Fri,
 20 Nov 2026 00:31:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 IA0PEPF00000039.mail.protection.outlook.com (10.167.249.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 00:31:15 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 19 Nov
 2026 18:30:55 -0600
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 19 Nov
 2026 18:30:55 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 19 Nov 2026 18:30:55 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AK0Utig1874791;
	Thu, 19 Nov 2026 18:30:55 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id CD8289A9C4; Thu, 19 Nov 2026 18:30:54 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][wrynose][PATCH] CI/CD Auto-Merger: cicd.wrynose.202611191800
Date: Thu, 19 Nov 2026 18:30:54 -0600
Message-ID: <20261120003054.4125038-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261120002509.3502611-1-lcpdbld@list.ti.com>
References: <20261120002509.3502611-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PEPF00000039:EE_|DS7PR10MB7251:EE_
X-MS-Office365-Filtering-Correlation-Id: 628eb3ac-1e51-4304-af92-08df469d9650
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|23010399003|376014|36860700016|1800799024|22082099003|18002099003|56012099006|261028144727099003|10067099003|261026121527099003|261022105027099003|261009223027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: 5vN7ibMuPajpUgcllLm+JIRStDYZzk+ltBG0qgezlF39bI04Qe/HG5vfPfXlYuwnBgwjManXNxM7vHQgLAQxKPRiYk2IAJk+nWoCTVzA8A9gBXku37/nBTnKHMZRXcAwV2ap7Gavr87B7IZlmAiO2nyrq3hAwYv9s46h378MvSvf5YCectnKpq40oXfYaHkAUknieJSv6d6TccI1HMp3JTlN2NCqC7aisZjFWeJt65h61jsg2cKvw/CxZ4XzNfZjOGxt0BS4IOM0MMAEHZaa21soD9n5tFk9TOzuVRpysr2lmaq91AS+8oaslerylVZ7rVCTEzAKKqrmRR4XdXLnfpCU6OJguYMcDIwPsCpg4vEjBqO8n3lxl75NNocbgwf5gD4PrZ2FLzLZRNdrTCVxY/cbMTSoifjb8BYfUS9Z9zShOna5U3P5KkkCo4ts5AB/ttRXjLn/ecI8kPwz738zum0EXFdLvhp1Lhjb41DRPynlS90v0S9umG7Pq9qB/UWUQzLdWIJTELyzTI4Q50GHFFJUzoXSwRiyEaHy+ZJ0W8JRqIeXx7NoI9UJkmD2/pkN59WsmVr190v980LIZ5YI7nmtT/01mHeav33ubWAcqJffEFaaiAxg3XBF5dIYiDItkaa5jk5Mx61l6ObCKALb4gUJxLRQJx+ZAKskKRy9qstepLi4qvcUa1H8vviyteH3b1yqzlUVGxBea19O9IGY3w==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(36860700016)(1800799024)(22082099003)(18002099003)(56012099006)(261028144727099003)(10067099003)(261026121527099003)(261022105027099003)(261009223027099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: OCZPgDFRewLJBYx4jDaKCNGwCcvpEm3Y7bzo59bxl6KHvQqrfOHuDUApY4qiFSPHk8dyGkmxjfrfO7FVH13cf6ZPtndvjuINrEouIeM8yiyaj5XyMz+Cj3YwivLd7Chs5m5Dhsu4aSqQUtd5+YMOnMXIkjerwCzlyEHVzVNngTMjE4z/8JXiom2ppZYSCl9zLr42NtCN4vu1Xca5KFBLBgeO8XwGXteI4A2q+SUsEpoxEB5O70DKkz0sv2Sxq2GBPFqIs50m9TJq9l1xPqiDfkySxlSw6Hf904JbMDUk+vxso3JkyxgZ1jSfJrbGE4RfR9ksoH313nC8xCRQT5tWYIy3m2CJEdJzILchzTxETfPZdXeuu4EXsM0sjXts6M/A1VrXjvyK4xxbm6LVQJwpI7LeRH7K7FBXwjXzFOseVjZn3PpHHUXf95ypm4xnDpkz
X-Exchange-RoutingPolicyChecked: E9aLosYg5ej+QoCaYIShJ01kQDRNSyQS85S6nce+Y6iWfiIIYSNv5t96Y97qhdtiJPcCaj5brmYhQezPvwNGfHNB4QOXCYj45KPJZNAwt3HIgUBQNq/NLMmUT2GoC3HcCDpQQyPqyhOurVuACjpkIEL9o7cIjZ6FhCSHgj38qAduAf9HNTbCUbg55+O1X3t+ZbjAkGFfTssi3XEQAk+Bil5600F1KCOI731NrwdJneHh92z3NC4c8FoiZD90Vqj3nUrbPSVMLatMgtt8pEMabyNQ+e1N5dtAu4lojUrIf0MqpYgXFVUty6vbPhAfB2ihz3CeL5XJbht93chzHTkYVg==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 00:31:15.4432
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 628eb3ac-1e51-4304-af92-08df469d9650
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: IA0PEPF00000039.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7251
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAwMSBTYWx0ZWRfX67g8aoAhqNS2
 BacauynDt3i7VmCehPjHHweP2I42cwNEdtrEtgovaX4ra0uk3TF/e/PHL81bt6JZ1+HNGmtaRPD
 whTVjFxNB9MzTRDcx7+ZR6O1c5QwP4Q=
X-Authority-Analysis: v=2.4 cv=DqnDa2/+ c=1 sm=1 tr=0 ts=6aff9514 cx=c_pps
 a=E1AkXC+xFF28g4y6WI75Xg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=3d2ZXF7_hmKM3oNFNlMA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAwMSBTYWx0ZWRfX3ojQXo267+KS
 FtMeWvuFLyViVXA5M0Bdwr/4aAztxj4x+9S9nwPj5i5/aZ2pfnSHuJ+a7mFzkSiJvlcVXw/PZ9L
 VGHr1sW5Fw+aDtVJk+ybwwT/Q1eJz7CUxzEE4AkK/s+9Hnxnt1NB9rB94zf/92RHKlmpGFbG35v
 5zkXDq2BzP495azcU2PvcBbnGZfpN7qeKil+PmKpuDhZ1Ha5H7QpKfeMCeUUkkikOv4IlfRfWHJ
 ZFXP3Jy4J7PPyrFIba8FkiBIgL+XeiJoIFmm9s4oxQDxRRu/TNUfAoJSGVwPxtbbI+vry4ig0HM
 oT/A3I53PY5dFW9ZhqrVzf44O7Ad7JRzhaU5QNdae6JCONbiZivCFd9iN6T0sCdAD4wcNzZvJHj
 NW1fE78rzegRrXNgcsze/P73phe0FDoCHxXWQK55oIbSHDco7BLLQWV55wBpJL93UMPmpV4+iDy
 m2sJjN5N2zHt7HJNFxA==
X-Proofpoint-GUID: YcaToTrmQXen8NMAzp9tnyATno3aeFx5
X-Proofpoint-ORIG-GUID: YcaToTrmQXen8NMAzp9tnyATno3aeFx5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_01,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200001
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Fri, 20 Nov 2026 00:32:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20560
Content-Type: text/plain; charset="utf-8"

meta-ti / na / 20261120002509.3502611-1-lcpdbld

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
- Patch Series: [meta-ti][wrynose][PATCH] CI/CD Auto-Merger: cicd.wrynose.202611191800
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Thu, 19 Nov 2026 18:25:09 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 1f6296c6f070a2f602a4538d9592c7e0ad7f3b92

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: Randolph Sapp <rs@ti.com>
- Commit Subject: ti-sgx-ddk-um: re-enable multisampling
- Commit SHA: 0364fb9d5914dba1a72f1f4a18d8727326bda35d

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



