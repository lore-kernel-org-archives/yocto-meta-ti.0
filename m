Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42D66C55822
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 15:55:28 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19817.1785858924786206349
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 04 Aug 2026 08:55:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=pcMG5ATo;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=qEGEGmqt;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 674FepeO4038258;
	Tue, 4 Aug 2026 10:55:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=eWsdXO032jhtn9fOxeVZdFnIavZHi28DlSDeGaK9q
	ME=; b=pcMG5ATo9UMzSs2ViF1nkkMEZH4ypdljetlYrWV/K+iLWgkC5WjErZMfg
	wPcUkWacF9/JBKbNIAyA5BBNt8ghEoT60xlAX05c9biyZVyi4iwr3/H7ZjeIw9P0
	iTDV7IYDpW1LcH5baSSnpP1F9MypFPdo8XN/PBxEf0h/NjNUremWb7FXPuq6ijXZ
	remlaU+UmnKyaz7Wt4EH1RrEqqpfr86pPq81UlmoT40z56HmIGCsGyP7/WGLtrHm
	mHCkzT9aJ8fWIjl+f13nkXmk0Ujtrt0FX02rcpTlKnonYUi7SPIIop4Ux+ctJR19
	rcjbwBziTswOsSQC4ZjTcQWYtN4gQ==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011028.outbound.protection.outlook.com [40.93.194.28])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fubus387t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 10:55:23 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V+Xh+tXajVRiEj4hB93WTxXoTv2w2pFsNFrD0kAwbSvfGFAL4CkY17r0ylnGRGD/c3SzSPpPnwrhSY7RBhQgdhFEghqiL48H5GlIRwg3lSDEBKh7aEK25YbMcbYssTHKoqbloaBr5Qy8NBTeKjuNvdRBQ11K5zZzJmYh+9JwbN1Rn7cOe9c0OFK/PFruzevZzlz3zSwt0ahyLKPdK333ilqQ9xPTdPnsymZ5Mjs0Oh54BH5D7t2yD5xPS9AeFGKWOhETIU1ZGu0qsepa4QXJgRig1zRcfpx/sFzKp8gGUroUJtt/dD2gHLczb21vmS1BcdhwtPJORRwypsIrvmp7MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eWsdXO032jhtn9fOxeVZdFnIavZHi28DlSDeGaK9qME=;
 b=qZu61K3DDoHI1Byi7vzE1QEMG/7WUB4zGlE9m0IoHf524xP5O0MyTgmyA9/c/xNX3EMxw2L4p3pI5cpT/kSRc1JGBYacGXzZhcykVQfydvMMJIMhq+IfLfuzLaPS7qgcsjaeT7MOwZ3wE0bhPSRaBTgeP8eP81Fj8juFn+YrcSBJMKEzWpj97wIP6EyyaUL2moHHcXpQINeNFbqYGoSzVzgCJ8RN/h9RfwNPo+xGItQgh9uxzJAwK2wGKNMPYxvy+WwT+Vf8sA8/+rCnCtFNTCAM0FmySAljUJ80CRoyV2hSUduH1ylJIpALF9Itav8Ru3/FwFzNCjX0iRGQjxzIcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eWsdXO032jhtn9fOxeVZdFnIavZHi28DlSDeGaK9qME=;
 b=qEGEGmqtsxojzg3y262eRxUhbIXZWxPmZEuotnRXPo9oa17mCmFTsi163c8r39qY0p63rY2xNq5gSbVbcrADm00rvpN6R3Ze+q0AU2yw3JLfXmBo5r6UNQpI+fnyH2EfWsKc/nST3pLu8PD8CyDQ/Tdx8KUzHkHlQr54Kx6foWOdVr4+jfYubNgblYqqsxGWA33qqDxGB6GyZ9TDqlAzv77NCXNuVieEH/4ISreaMlp/TuGvgnLDwo5IdrAS0OZOhWdNXsrm2nd5oa1qt1C6E+xXEdb3Buk/pGOJMm/IpozA9bgtLWEMf6kGM8S0BpvgCE1XJ78K5c37KE1Kps2Qvg==
Received: from BY3PR10CA0007.namprd10.prod.outlook.com (2603:10b6:a03:255::12)
 by DSWPR10MB997884.namprd10.prod.outlook.com (2603:10b6:8:39f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 15:55:18 +0000
Received: from CO1PEPF000075F2.namprd03.prod.outlook.com
 (2603:10b6:a03:255:cafe::51) by BY3PR10CA0007.outlook.office365.com
 (2603:10b6:a03:255::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.16 via Frontend Transport; Tue, 4
 Aug 2026 15:55:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF000075F2.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Tue, 4 Aug 2026 15:55:17 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 4 Aug
 2026 10:55:04 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 4 Aug
 2026 10:55:04 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 4 Aug 2026 10:55:04 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 674Ft4Fl1940892;
	Tue, 4 Aug 2026 10:55:04 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 4642F2A5A; Tue,  4 Aug 2026 10:55:04 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] kernel_legacyhs: Adapt to recent changes in oe-core
Date: Tue, 4 Aug 2026 10:55:04 -0500
Message-ID: <20260804155504.3965341-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260804152956.2000577-1-reatmon@ti.com>
References: <20260804152956.2000577-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F2:EE_|DSWPR10MB997884:EE_
X-MS-Office365-Filtering-Correlation-Id: ffedaca9-23ed-45dc-641a-08def240c7ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|23010399003|36860700016|22082099003|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	0naInSyKaOqcrQyNX/iUqAIwYA87lVvi+vv6MPgYdEj11iYSq1pVrw0brggt1NSJGlviyFCiYTuaoE/dlgCPtOjg/X7SYRzg5clfOEVumA2phFw/TP7wdr6rmXgxY/hq8On1xzeG00ceaLX8eleiUTMgNI1ZveF2Yr4rMk75KcMTB+jDbswcCMTUtqcoVcDfuQkH9QzgD+FWvI59F+eHMzSALCrB1Yfo1+lFgXuoyCQyiBgIFulXZua1W1bXptPFFnK6TyTj1wfBPvZiXxgCOurAGs1lkERuIrr7X8ScbH5E83YzqXXGcKU1Eb5fOLAYvt4q4in4aUaGhSWDuDNTY2sslIxoq3K/aYpWeWdKORcO0kagMgioKoUngJNo/hmgO75OIsghBQJGaf47CNPsq2/ooFKZvr9WqfWX2hKY+qTCgfjzzxPdqER6VFVGK25WZz0P+iuKu4P2vCIIDq13bN2p82n2FclduFzwnexOEvwA3MqSzNShcQneJrcTfbKtHlmD2+3eaqj/1TBDxKlSNl50VMxwgVdtCcMO+3mKinCv6gE84TUMN/bV/a228Ci/sbgrn3wx1Rz0rOrTf5rwjQrtN88w/3izZe0/GvAPBNLJ5myqJyYEvs0ZoP1iLkExPGdDYYvVahcrDyoztJxSrd5XYkemkKzI4vegLFZ28/OUK/5/OfqllJaiuV/dEDXmDIfbkx+YVa6V4/Mx9PUB2Q==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(23010399003)(36860700016)(22082099003)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	xMlwoTqE/GDmF1Y+9FkeQFs3vubULzrCGDCxutdrxuKlGfmLnRe68sWP6z1bW6r8a8kU49goxxBEsIfUwziep9PTs+k3UsVn6cf4PArx4JLsppoXpBjWHaPTjLta5HpS2USVthOD9eO+U4pVmMNsbnWTe5HVB/FqlD+GeVasCohc/K7iJjP1vullEZ4ckPKA7glcYl+00+B8wNVff5yUBYjobbVgrhTjT6mdPeFTh3t1ZS2dwMujfvwj/bMGVWN+YG73czWpfBXd1yysXnXoV+Z18t4z9XW9kQ7j8kNeNTK+wJKFV4dFBf+z+Ie+xA85iqxbLq1ETv3/qjowp918jMKXgI8q9eQZkTeOHhj3Yh1VJ9hGTH9rg92i5Q0NdQfOhhyczyjdkJ5gXXTMi8RO7w9N3lTEpHhI7/xP9QHtznMwJx9/hKVGPKMVcbTjoXC0
X-Exchange-RoutingPolicyChecked: 
	Mli0X5SQWfit2y9hsAVecVTcs0fJyTrcA35vkf0gnViVif0VSG3b3L7u/CLKGRCPM0teNG8PQ7anCi9M8mifCTd5k1gCQqpu2o2pTUCRNZQuEIBgdWZGupmmJimk6m1RfNk3JnRha50YVOqDz5XZdqVBUzyCC0cGC0X+805zQiGdr4Ln29Ceza+1q9MYM9D2N+qbcrLXCsXj2uQPuJgSE4XoQnvhIf0U1lWUSpjPsKrPgSRne1LKWMnHhXpPxV+HeMjwG5NxMsA/osxinFxX8R8mrF6PH9vXZuD/3XRLKNgG1/eysOLLrWglvPerZ8TlG8Vr27ZqBtGbm8HU8Y/JLw==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 15:55:17.7911
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ffedaca9-23ed-45dc-641a-08def240c7ed
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000075F2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR10MB997884
X-Authority-Analysis: v=2.4 cv=RaagzVtv c=1 sm=1 tr=0 ts=6a720b6b cx=c_pps
 a=auv0RDqIM0MEGdyBMEg3Kw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=XVdIdRHowt_0-NtXpSoA:9
X-Proofpoint-ORIG-GUID: jATOGG0WCKARoSJMvPES75oO-oJeNlFf
X-Proofpoint-GUID: jATOGG0WCKARoSJMvPES75oO-oJeNlFf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDEyOCBTYWx0ZWRfX6JRvUlpfqrV8
 MlMzyHAipH4T1wNnAB/xFIknEGS1aWb7Omo8uljhkdc8jnedoyKqldrgStS4QvO1vwMKkvgCh55
 yqjGAfOmzwd7MvwotXCcGz1SYiLscgiXOC/B11zB5in9H+frNj19XB6ZVC3rkCytPTrEbA/zIDI
 NbGGaAOE8zuegvTisfvC1k/qjxN8MISuT1GoLcbpbT/dJ7H22dSE5SChWVOyfR037liG5m9dYAM
 yk5GjFkmJtAfE+FlZ2PDJZGzbS/1IoMtrJRjImG5GIlkUYeBZEw3MipazSrkxjLiyiQU9p+2YAP
 Qly1HWiSYHFsD9BT22jqXAMjKSN5X8ntgOkQjk0l4EKH34f8Lq/h+nW/mUkmNKduNU5HhdFWoQq
 /+uR3FV5Wz8Mud0YphoezvzPZtwLpc0/BzMs7kNFz03wsvY8vGUwsu9TEJQeRSYSIjZy87UTLZh
 NPXfA3PowGIFBcL4ybQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDEyOCBTYWx0ZWRfX5226NosPJcW7
 T6yq0jgjcdmHWp2HYSiCjK7PM3syJrtp36inyLxc9fVXr88FecoNGsmUwZ8QL7+NX2lYKlelsUA
 AFPHd9yc936wFGYxZ70Q4VLxnLEdoJE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040128
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 04 Aug 2026 15:55:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20215

meta-ti / na / 20260804152956.2000577-1-reatmon

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
- Patch Series: [meta-ti][master][PATCH] kernel_legacyhs: Adapt to recent changes in oe-core
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Tue, 4 Aug 2026 10:29:56 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 770a97112753f8a90000be44f7ee4cdad964efa5

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: kernel_legacyhs: Adapt to recent changes in oe-core
- Commit SHA: 9ca3daf67c15935323bd6611fa5a8b76552df85e

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
master
=====================
PASS



=========================================================
  yocto-check-layers: PASS
=========================================================
master - PASS
=====================
All checks passed




