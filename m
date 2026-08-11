Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05195C5CFC1
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 22:00:56 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.875.1786485653891341601
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Aug 2026 15:00:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=JnSufxVD;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=l497PKnZ;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67BLZH8L2624389;
	Tue, 11 Aug 2026 17:00:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=m22NHH5RMbHDRf9zI42KZB8GF+WN9svzcbE5mkOHI
	0c=; b=JnSufxVDR/j8vztLS3up3UJTAT595Ami/IL6EBWSgjhVcbE0MtWYtvCPt
	BzWQwpHeyzoVo1KZ+D0Y+yKz0DCKamhUvJMj34SNCyD1hpEBmtFBo9dPjqsqEEHe
	Ta4Kb1einzcVBe0eEAp30TyNKv78lJBjdyDNkxrVRJhL2ZKl04jg5CYC7JoQDcul
	a4qXfBJ7+p/ujyipcpbTcS52YcRCHRkocjmPwu88TaijRJ8y+Mx4SPa55O+w+1vt
	iZlo3QYccOtiXdaRt3fWU5lTpt6l0KGl4+zmgWYJxLK5d8kHc1FI0Bl+erDshDd9
	dzxIsWlzSdnV9aDvoNHy1jE58YRoA==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012020.outbound.protection.outlook.com [52.101.53.20])
	by m0380145.ppops.net (PPS) with ESMTPS id 4g02pbc7wf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 11 Aug 2026 17:00:49 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d3LUmGONhzDtVgeY/fYaFY/aSwJqDY+qMviU8CyP/cviKzdlkXD7Nt40aTavsP+58ENDzmZfvmnoLyVTyJE7Dg1fkIoLZwFVqzG5ZDBnFI2CefRDonsmkkFGcQ/q03IY6PZGG2kx5uscgoGxNTnJ/fhvk+8WYOHk0Gcz63LqdQeMlnC2GpZaabxw8JvHNAGuh4snv1t/FyiKyD1D4n3wVs6g4TGG1glzXHOudMtB9yYa8i5MmN5q49p2DvWEvRRPFguISVFEHiPzc4WVg7SjMAdmGRs2ow6eJd/KsabmBXW06wCSsOMu7zAAptn6323Rhw+tmpXdSSWc94kwSmHfng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m22NHH5RMbHDRf9zI42KZB8GF+WN9svzcbE5mkOHI0c=;
 b=qlIz+a8t+kKeVFldmH7n5mTD9HNPkPYrL/XuRSQxRxLGsgqMeIy06qB0VNnac07XKjVZb6e37fXBxAITYYiIYA6CWkIZc9TfEciSVcJ2rgsSFLlLsitbOHXfdWMKMDoSmCgSHQ5xbuxTaNhCjn6XWWqdLTk6Gt0i2FB9LXSlPacA9PMuxxXoA7hZWuJ+obcGqaZXgQS3X5ZiFLGYLf9k61QnZvr+Lt2mCWI2aGrU4Cqsnm9MPmTIGaX+Y7klmuoAnnyCswRP5B3ozzbH2N2NUC7ZETZmqdmZrC2io8XnPaxJ1aCm2b1O1sTqsUUedmfCeHWKyN96nLwuHs3sIh5PrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m22NHH5RMbHDRf9zI42KZB8GF+WN9svzcbE5mkOHI0c=;
 b=l497PKnZqyIHfniU0eNUDCRVkgrzI7aaEsatLh6NnqoUkcA5BZ6IWePVt1bpsVPSsTPp8hwnxprDAcGo/H1xSgxqsmKb9FNVRG76YbyL9zkL7SxfQuehVZnjEQLSN0pJiPqkj9oYzebBGRNW8GrIc8Ve6VWhOM9+Gk1mrs3+TO9Wan8lQu6wLGfWETGhI0n0zE8hI98P4/5aW6Z67ScLDUQdtXgUOuIauUXOYg+u9N59lNt0kaD9wyskjUKriIbNWg3Z7GINTgLFnSCE935KicixidiX2jgPoK3tuoG1IdumzdNX8P29TAT/snsUxVw9Gzp4SB0c3kR4N5vEsO+83g==
Received: from DS7P221CA0012.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:25b::12) by
 SA1PR10MB6445.namprd10.prod.outlook.com (2603:10b6:806:29d::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.25; Tue, 11 Aug 2026 22:00:43 +0000
Received: from CY4PEPF0000E9CE.namprd03.prod.outlook.com
 (2603:10b6:8:25b:cafe::4e) by DS7P221CA0012.outlook.office365.com
 (2603:10b6:8:25b::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.12 via Frontend Transport; Tue,
 11 Aug 2026 22:00:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000E9CE.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Tue, 11 Aug 2026 22:00:41 +0000
Received: from DFLE20.ent.ti.com (10.64.6.57) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 11 Aug
 2026 17:00:20 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE20.ent.ti.com
 (10.64.6.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 11 Aug
 2026 17:00:20 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 11 Aug 2026 17:00:20 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67BM0K2r3172853;
	Tue, 11 Aug 2026 17:00:20 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 095429ACF4; Tue, 11 Aug 2026 17:00:20 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>,
        "Denys Dmytriyenko (TI)"
	<denys@konsulko.com>
Subject: Re: [master][PATCH] kernel_legacyhs: fix building/installing DTBs
Date: Tue, 11 Aug 2026 17:00:20 -0500
Message-ID: <20260811220020.3024752-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260811215723.45269-1-denis@denix.org>
References: <20260811215723.45269-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CE:EE_|SA1PR10MB6445:EE_
X-MS-Office365-Filtering-Correlation-Id: 63f34374-d943-49ab-4af8-08def7f3fc0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|23010399003|376014|56012099006|10067099003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	4uQQdn7YH+14xhAw6Wzcn6gDbNi/WoYnHNUtR+2DoWc8sXdeQvhCRu6kRXz94z6s1ZgDm4bbtNw5O7iL6QtwbbPoSuLhj4z7qRA1UjHr3DtYzmL1fwFK7vEw+yL/OgCkhlB/UiQe/5Zf79IzG1+otdaJr37LsEwCGJuCXaSfh6OnOpfj2e9dtteytpZoJ0fZ5GBLxl0wS5hPDr+NKTzAzPr84hL1n0upkycMf0nCIICsf/rgBfK9yR7vvla8iuzKUbSNLTLjK7vBxrJIvh+fjHhYUNVtlQLjH4w5uRhY55appXCsOZlzcmKLIjVTaw0f/rD+RL1qsosw5ixFpZGMxcy/cSvFflBhtj/VqiiTfyQaDY34vS/PH1owgezJTLhaToxbk4zo/m0BVNdydv1XxkWQ4riRIK0jqD4jlkiQ510PQaRJ8KQG6Ma/jRSjby2Wb6f92fW848/eYj1/lkFAIpLDHwR0LkyZMUKR6Y5AJINwORymJmlPfP8MzyvH2whm3XA3/a74cbxX7VFBGvLJUkaiRnGNaRig9pcyTztzg5lN8LP8YYDRxbQmA8Row0AhQLGd0GBg2AdY8k+sE3CLmXteP3paOQpW+HH72r4LPCIOBZUqtGXrzf641YyBeeVO83LjjHPh+ku3FJy9JQEh/Q7/VlV06tSJyVF56ENTFykop2Ecmj9d/DsEr0viRKWl48g4TbhCel/iKxneW/mnUQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(23010399003)(376014)(56012099006)(10067099003)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	eJTht7yqM5pihPZtB6PAsJXYXwV1JZ6B/E+IBcqe2kLn/RwVV5olazrWZPPrr2sf/j7TcNHh3nKfevUKxUpGM5eJ4B/jhWvRuIUItWL71NItXxOQhl0aFJDSZFffaKMAVj52fbK8HaI2Pi4L3PCI7LystIE+5P/dpP9bGfPCmBTffQFH5ozqQ1gUL+t9zzsXD48TPZp9E5JaBbl7C5Kca3qnXnunHg+0PgpdnQnGtefTlcb1Nlnuz2LWZLG5RcEemFXeEtJ+Z+L8aUEGXjQaOwehxYu4DnrxZ6wt0ZkzDTYMxeSIk9DwQv92Q/Y9XpRuZ+lY5sjb6MOIqstDxh56ko346HgB8+5XXr4imU37KVuUyXaILhuxoNj8SyCE7/BHWKiqTc6663RVIXoA7rCzjBo3JX2WrsBr8epZ6z+A/QhBOZGzrqEdf4h0OJKHk59C
X-Exchange-RoutingPolicyChecked: 
	edAIHDQwB36AhQKyozx8OTH1mxXqH2iWbkAT7D2ppnMOO0DWcCRNQxDXwQb0+h/cNYfSdYCH7YvaRWP/7E3VwxEUeBvIB19ZsRIYIupIRKmwsQUeqvvwgN58vkHf2N3AbH/U2E5THSeu7MOz/NV1DywX/R5jn3hmwOpp2HDnjeFyT9I78TRq3qhCLBNMGXUbQ8/rGBF8onMKolPBZkNR4sO35VgYeU597frzDrg2dH9w6r8FMd6CrfiJU26Opf5ksVUnQe6zo8WTXcDbkMFExNJutNp3VC6bnEEu5N59hQ1/LRODWyfDMWLEXpVkFtcAu0awNWhrtsQegN4TkCCbUQ==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 22:00:41.0122
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63f34374-d943-49ab-4af8-08def7f3fc0c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9CE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6445
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDE4NiBTYWx0ZWRfXyp8s5YP+PYOR
 i5SeUDtCp6a3/ZOodk/oX3OpM568MzlstNQm8yQ7Mx80w/NbgwqdYeA1qdwUsEdpmDPPZj4tc5h
 c4ncCf8KrJYH89XL1KGWIIwJk545uvI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDE4NiBTYWx0ZWRfX++2oYUA5KAe/
 JeBOHlmuTJpkLnKm9LfTh71KkaZf1zP8XYMQUgYbYkx0UczGC53PGJYDBcTUQiXkZPaEbe3eBGs
 D+bFrddyixuxMo8m1FxXDFt+juSxSDkJH2ASgum41ysiwO4lEo6RUIaMk2AB0vw01QVD5N0ucy8
 eDp0rTwkiaSX7Sc29LHpeyPJJnGdD6ynLpN+wCBiG5pnCooys5RKtaoVjs+n33WGXr4DbRwQORF
 cuvcsQ0W/xb12MPJpqRp/DifkhAUh2mOzUpqNgJMsnYiia3E+qKv1pgazN0OXXNQQQPe90JpccT
 llwNWhsNIyhbByHq1FSJfcIvntHGXksHbed1GBU5W9oTo2lLcVJDiC9L+gGgmX3rtS56OcQ5PBK
 egI1SD80JsdY9eKJq0lnt6v+Ov0XswXoYfkzD0g8n2ZrrCfH/pJiv06hEhlHUCv9kPecX0FyT/g
 luiagdbOYbG1MeJBVaw==
X-Proofpoint-ORIG-GUID: VFlhXCENHHmfShiNME6n2kfg2FU2ysi8
X-Proofpoint-GUID: VFlhXCENHHmfShiNME6n2kfg2FU2ysi8
X-Authority-Analysis: v=2.4 cv=Ic+3n2qa c=1 sm=1 tr=0 ts=6a7b9b91 cx=c_pps
 a=3tfckwpITFtzIurveUQz+Q==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=iGHA9ds3AAAA:8 a=0gcC27t9AAAA:8 a=k-42gJp3AAAA:8 a=sozttTNsAAAA:8
 a=SeSCFqwmse8RVVeWQWEA:9 a=nM-MV4yxpKKO9kiQg6Ot:22 a=f5sM90hAhNS9OGT-JDKn:22
 a=uCSXFHLys93vLW5PjgO_:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_05,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110186
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 11 Aug 2026 22:00:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20256

meta-ti / na / 20260811215723.45269-1-denis

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [master][PATCH] kernel_legacyhs: fix building/installing DTBs
    WARN: Missing Signed-off-by by sender in commit message. (SIGNED-OFF-BY-2)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: FAIL
=========================================================
master
=====================
Summary:
- Patch Series: [master][PATCH] kernel_legacyhs: fix building/installing DTBs
- Submitter: From: Denys Dmytriyenko <denis@denix.org>
From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
- Date: Date: Tue, 11 Aug 2026 17:57:23 -0400
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 388180a081b20453ce6e18b0a31e997a0d385649

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: ti-core-initramfs: Decrease IMAGE_OVERHEAD_FACTOR
- Commit SHA: 9a5228e56c20f4b3ae65cec904010ba208e635d2

Patches
----------------------------------------
FAIL - [master][PATCH] kernel_legacyhs: fix building/installing DTBs
    error: patch failed: meta-ti-bsp/classes/kernel_legacyhs.bbclass:665
    error: meta-ti-bsp/classes/kernel_legacyhs.bbclass: patch does not apply
    Applying: kernel_legacyhs: fix building/installing DTBs
    Patch failed at 0001 kernel_legacyhs: fix building/installing DTBs




