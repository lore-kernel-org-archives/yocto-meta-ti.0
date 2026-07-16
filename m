Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97185C44515
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 17:24:40 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.422.1784222676500363168
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 16 Jul 2026 10:24:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=qVwY2xHQ;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=i13CcPi8;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GGWtVI111527;
	Thu, 16 Jul 2026 12:24:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=+f29YQlQrawA729zyvf46SuNYdVTM1x2+3mR8k3a8
	Fg=; b=qVwY2xHQ+s6jMyv7edudlnMmWz2UyVVlIXHc3nxyXFcdniu1SDw+rpYcP
	+lkatPw/JndVztcZMlbUh7KCqe3aPkNPhUYRJe110aYtZoMLXKcoy1RF/HuwQeQv
	c5xRU48lTbZmolYGBaA8Xu0wBMwlTggSGxZ9Vlc4fpreSjn6ixWK9hwr0QajiX0v
	IBE7cxQz8bD+7D//lcGwDHKIN6IhcOlQAKweebxEEdCgYWnj6L9UMUpif6fOjBbw
	Su4Q/e7s8QcjTIsro4tWAesig5ciuwUizBxLoJgA50Wkf/vQ5FHSqR/dOEQz+iF4
	fBw60IGm3F+ZjRyBm26PuPBDsm+6Q==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012003.outbound.protection.outlook.com [52.101.43.3])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4ff2ccrg3p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 16 Jul 2026 12:24:33 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P/d+xCVeO1w8AxHG/YSR9keXhy7Zsiy9Ou4VmthyGmmGK09/gro+NTfrMqWOyvoQZJVz0bnhKYREbgQZ5qMEeFTvVkTPSqA1vzIJ9GVM6oX1KdwYCiN6patlfNAjKbPzyTIqBdsAVdIHVvuvh439ZBDvIvMYAWvZ9RRD8HMMo5UDOOaspNPySRx/nGA5zkx8S2DX4lmhgOlFUVtQDWcTTTFUtoLnwE4wOeD9CTmx7uNFGT8jcNe9leSlJwqksFU5u15XmKQfVXyOwpDPNjP6tDzFwwkkhPkNOY3gppOTRtr4kuSut/xIAZzJLbcapNTtspPKvCFFhR4bspg5WDtiMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+f29YQlQrawA729zyvf46SuNYdVTM1x2+3mR8k3a8Fg=;
 b=RRSUZy+tc92G4r+QLIBhrKczuC1RCHvWOYqL+qhlaiqwuJ4bRTHGJlmnTh5COOhTMRTils6G25UAhFw6RkWG7Zz/CET/TdaA1suVz1iNvccTQnr92juIm97ZawjnmYXEw5vWEVwmy7wLSCFrMTnjucNxv6TaTOEw/ZDIvZx8RSGBxWeVJ7rJEGPvJvPOCv+RjV01GqL0lJ+/N0MGHdKdT1MW8U/xJTjkHEIrMO4KCHLJAMPpdqP0FwXgrXESTOShqRFH6EiXSALu7UeAYcXLSSVESF4OSMONWc8dUmJrnGXhuamWnw8uKYCU5JnhUNFzuAjAlKGsKouC0v65814O8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+f29YQlQrawA729zyvf46SuNYdVTM1x2+3mR8k3a8Fg=;
 b=i13CcPi8h4YwZxb88sjEtlTZqg8vJrTePRDiQ7ENZVbIaKdowP1B3xkVE24hdvEamU6JEj33PHKEd1yKLU2PUk2eHKr7saZrYxzhdt04lQox849Yec94ndqu42oq6gyOiC+tIZSyzSvOOYwo5s5yAPGQ5Y3rU2hj+q5uoJLlmo6YmTW2RVUcdL7i++dr1AFDwWpRSVwJ/13F/Mfsos/89G+CIWGdtOhcN4pJkTN0G9UAzuU9DXi0Zhyb051yMVNP7crG8TlCPdMEbCri1EX7UIPL3DleCvF10Uw1PQ15JRXEaDLVJE9VWRgUlqE3ZwfKzWMCqcmtqdGFRrBbvQOknw==
Received: from DM6PR06CA0073.namprd06.prod.outlook.com (2603:10b6:5:336::6) by
 CO6PR10MB5602.namprd10.prod.outlook.com (2603:10b6:303:149::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Thu, 16 Jul
 2026 17:24:30 +0000
Received: from CY4PEPF0000FCBE.namprd03.prod.outlook.com
 (2603:10b6:5:336:cafe::83) by DM6PR06CA0073.outlook.office365.com
 (2603:10b6:5:336::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.12 via Frontend Transport; Thu,
 16 Jul 2026 17:24:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000FCBE.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Thu, 16 Jul 2026 17:24:28 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 16 Jul
 2026 12:24:25 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 16 Jul
 2026 12:24:25 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 16 Jul 2026 12:24:24 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66GHOOq81850285;
	Thu, 16 Jul 2026 12:24:24 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id E00749ACF4; Thu, 16 Jul 2026 12:24:24 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: <rs@ti.com>
CC: <reatmon@ti.com>, <denis@denix.org>, <a-christidis@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master/wrynose][PATCH] ti-img-rogue-umlibs: rprovide virtual-opencl-icd
Date: Thu, 16 Jul 2026 12:24:24 -0500
Message-ID: <20260716172424.2993289-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260716170119.396983-1-rs@ti.com>
References: <20260716170119.396983-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBE:EE_|CO6PR10MB5602:EE_
X-MS-Office365-Filtering-Correlation-Id: f537fa50-0091-401d-072f-08dee35f1768
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|23010399003|56012099006|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	YqV7XwzTDmQiqBtsNCn/yAoEptV7cCjNKWc/3KShOk5BTjrfqpcWnBnli3m3vNnyM/H6xIbpDXj88jO2ZprSbdiJVVxvDiEEfne9Oj/HQxbLPh1qjee8Lkzf1nrzEpB1CivYQbzfzRbFXkv/Rf0zMB9dYKZQ5scgpd6k/HA66ZllWanPqpl4ybr+ybiXtsTXbSCo4oaC9BldrrdvifkOyWUgZEZJyorQPFDDhD/Dp8SUp1YS2fITiCxmtCJV5D5Y9cTXQ+MRna1MR6kqleOyPMXD59Z5deX3MrZddfriD4uIUh3Yz691LYhXapRTi2BDNcB44I7r/45m7cFJ75KEirtW2obOHnevolAMRlzpsubWiWwGygXJpj6YKGOPNK7TnZVq7dxJGHtGpMuamiaxjjOIxVHBbzQEJ5fRUorNvJo55P64IbHFVtyHUM/9o8NFlfyzNVYa0JuepgxnoYMW0yIp1q3LMDKvnuKXAtJ+ghUHSev5AmCo2PJeDAUtQdBhuNFUzDuxtomgXweF5pbaXq7TTvvqUFEHIhz1wVuoHYA+o5b2GdetAxmFuG0ocda0MPakaleE1aFLtqXQdWS75r43sQs0lYD+dLuw7U8PmWGrSb6Vte7YnwdZJwYm5aynFG43acQwzlSE16PNKUJ4A3ixnWKraKqh/ubpkgKADta7oL4YrgjWBX1m9emaqwpbHcaPxm1tMhGhiM/wWhh2Uw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(56012099006)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	9NaSSJK3WnirxVy7zwxZ5DHEwJnH7JAMMmEYG4XXEZzAwluJWxFc9w5CNT0jdEAihvAfn4C9mJbhufOYZmEWAMIq6awqdKjXtxHwF168tVBCIcbAstyRiTgBEQOcv/cleKyyaj+naMe3mkFB8s65Zt6SUCBptZY4MwcTWELR3MPV+5HR9s9VDkecGre1JPgfoHHUptv/EPw/G1HtHe+w5s2+WLmicWIMScByVQqOPdg7RxxrdfKUx6PCjuEwXLrshStdXvlAo0Ds7iZAXJim3LH6R3SqsBSsl3AZDgZxRNURlunijyljBLJjVqKeuQRuCNqqjEYNrBmLmRF5rTguxtmv7BoD71H8RLp/Cdug4tjWXbin4kHDifLLpN5RiFhEnf2l+s5H/yuNZPT3o1JCjIM2fgCSBRoJSN+yHLfILW4994PEDVQTgRQ4Ql40fzV/
X-Exchange-RoutingPolicyChecked: 
	N5lf/oOMj9CJQ/8BPj622WJpERAZdwtAxWH7a/EeUj3V8gtG5tf7PawnpMaiNMjReFsvwL3DWfcZfPiy0du3GBGf1hjzdKID/tb5PLhQQe9ag53EJDHDRyEcLPxwnidIdwgMSXXbb7aa3GYLIdYLa80X8Ivp5kgk9Y+uFyUf00SZQcGurEDD3W2jacvJhvTro9xQC4SWWw+vOxApVmylp6GXzNLswh7DPxhpDP2ANp8BozHXCsi8BBt1x6o2lV/DkRkn84SCc8Fo7Vsrcnd8k8/5R8nbAkX9YFr34zI+Vdvth7UxeGfyvozCFnj70mAaYCDdzHplHLW3VPaUinrzaQ==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 17:24:28.6467
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f537fa50-0091-401d-072f-08dee35f1768
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000FCBE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5602
X-Authority-Analysis: v=2.4 cv=NtvhtcdJ c=1 sm=1 tr=0 ts=6a5913d1 cx=c_pps
 a=ayBBURk7jZ4GzqZFlR2IhQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=VpmcS5KrAYW2R5US4LQA:9
X-Proofpoint-ORIG-GUID: u1em-91mL5aK8Wd4qONYmPvD9kf8047R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE3OCBTYWx0ZWRfX4WSTfHO2+dj0
 NX5u9EyYjmqqJChhI8MfNTxHSseZceiat/UpNl/8Dcx+0y1P6+83NkNNBzC7/FCejNSIN981UyA
 MEqL13ESzokIHZw7OboSAHgItu15PX4IWzqg8ho8lla2FKDPFek0M7i0OoRxnOCZvozbnePu5lK
 uBev3VDAFwmw91ljHMSxNooU9i9rAQUExV0kqID9Kdnubb/6RrdPtdvvtQVHy43vqpzXGV1fc0N
 HRwOiuztz/Ev5qEaBSzTyrVydmntfbfhJmrDhHf1Gvy7DthYuwKwSy9Y8p//ATHuYRZEHnbv7Mv
 LvBa0w0AWp9kPvG0/7ZvF7sHYy4qcPR1g7BnB5gdv2UYs4An80DgnNh69USqOOEfgVzNmNx0fLJ
 wvxCxia1BhVTUZFjUrA+u/TVxo/p0Z+6aKyhNdqVqkasKhXvxkPzkvuztCcLuFGxhaDf6FwZx9P
 6agYcBjBIw+JmUDVN+Q==
X-Proofpoint-GUID: u1em-91mL5aK8Wd4qONYmPvD9kf8047R
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE3OCBTYWx0ZWRfX6FEKc6eljfa9
 Z8oB0LfrMotGsYEzDS8n4A8OHXXG5kXkEtSkvCRwaaEkr58ev4gkgzDiZzN/xkVgMCD0hYImOwS
 TPJ+oy+qcdAlKihT8OUjxD9P7sJM9cY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_06,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1011 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160178
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 16 Jul 2026 17:24:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20152

meta-ti / na / 20260716170119.396983-1-rs

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
master
=====================
Summary:
- Patch Series: [meta-ti][master/wrynose][PATCH] ti-img-rogue-umlibs: rprovide virtual-opencl-icd
- Submitter: From: <rs@ti.com>
From: Randolph Sapp <rs@ti.com>
- Date: Date: Thu, 16 Jul 2026 12:01:19 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 239ccccd13574be83ba3b78bc863fecce42964ec

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202607152200
- Commit SHA: c426c4421047859468f325947bec9220ca5bc53f

Patches
----------------------------------------
All patches applied

wrynose
=====================
Summary:
- Patch Series: [meta-ti][master/wrynose][PATCH] ti-img-rogue-umlibs: rprovide virtual-opencl-icd
- Submitter: From: <rs@ti.com>
From: Randolph Sapp <rs@ti.com>
- Date: Date: Thu, 16 Jul 2026 12:01:19 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 239ccccd13574be83ba3b78bc863fecce42964ec

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.wrynose.202607151800
- Commit SHA: 67736cb30d441a4cc41a6306b0061e227e09903c

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
master
=====================
PASS

wrynose
=====================
PASS



=========================================================
  yocto-check-layers: PASS
=========================================================
master - PASS
=====================
All checks passed

wrynose - PASS
=====================
All checks passed




