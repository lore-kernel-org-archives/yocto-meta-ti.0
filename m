Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC131C88E77
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 19:31:13 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5259.1789500667939002897
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 15 Sep 2026 12:31:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=OEoE412n;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=nUSDwG/i;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68FIto6b774798;
	Tue, 15 Sep 2026 14:31:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Up/1ItgOSdbOJ/628l5go0UlY88sotOWKRvWomZYK
	Fw=; b=OEoE412nYv/GcXKMg60JIs5AO+2Rxt38fO/zr/ABtnVpQrtCjs+TsKbbA
	ga+yFVgLs83CBcRspq74Wc7YyvvD6Lfla6DtXbbAGVLrwrRO3oEAXz5yPvKa6PRG
	nH7gDv9uBzcc7nbyXrzhd3qiyswazj7HaAwmphq0v77iCSZFGLXmNB/Iv/INkp0D
	wBwFQTXOZsAtN9w95J4iKme+OgWBqLsHfxfDeAt+62/yZymonRiUqQc27GoeED9q
	OewMNygmm4aOsm3RHmqUxT63X/z2nsezlsjkFa+xkpgp2D3FAvw8WCZVmSRCEyVI
	T+B8n1+3G5wkieBce77Gy/4UqR9Zg==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011040.outbound.protection.outlook.com [52.101.52.40])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gq58jkby4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 14:31:06 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R2zQnlLhlWpE364yxL92GzsuIaePbLfClY+jOixrBkA00EVXVjmCO6RJaVMx4eADq0vVMQszjylIQRfulyzYr2W3az2czxkt0qRapahk74Gwp4MvrfI16sdxTuQjAoJgrkI4odq4xCrQzUi9IsPfDSLBM8qYOquJXfIdo0o1d/dszxlTOhuia794JPuhU3i4UVoag/gbVP3dPKMP4YG222y3zU7LXuxVkv1na0srIOeYrK107+SnCdvjVV4rBuppuLfpTn0dLx2KPPiqWhdk15gifESHGyQoOp6vhNbqXR+8kl1R+VBXM+wp84UA/cF9hyPMNRasGvVOVaRqjEcHFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Up/1ItgOSdbOJ/628l5go0UlY88sotOWKRvWomZYKFw=;
 b=xGowRtx49yqUZYnztjWRcDIqVd885vK0atgYhy9xE42kHmSvjnVopFYYMNhYvh18TI+K0NgGAuTGWsWHQ3xmrwYzfseC2hpa2HWR2VfGDpERBQbR94pqZoSh35iWRExI+xKcbXZcu4UjsXPS+PFNazy9R6NHIYhdepCOTep6XxwSQbICiuAi5RiPTnXpzKpJbqOXtKR8SyAsZS5rMA6/GuL2V98r0IBDYB/oA1KhIVqY/2KQhXjYu/3mZPrSRXZhfei1eYTIHcTfMr+xQW3qMAimvHseDitxyMg+5Xnh7FcrlSomWJgncWe/2t9DVZjRL2I8pelGHsYsySVST38LjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Up/1ItgOSdbOJ/628l5go0UlY88sotOWKRvWomZYKFw=;
 b=nUSDwG/i3F6pnznsGo0rctvGjUBtOLeaVmxIamqA8eu1m/L5U5IDc0OBexo7F8TZhaUpxnGI6lzRnLanKbJYsfOtHWTqr216C3EE/b9NYti0QY2ZBmQxfeS9z5Dmrh3xv3r46Nxv1qrP6Gk/rv+zn1AMyujlhma/IRwIvLWIj4IAYz+Pa/dYH5sGfr43yWOIprKeWkQ5S01nMGaRT4HolK03/hSOxzqyWSEiqCPYvOLXQLI38ftuawzidgYxNMCBwd2cQ6D1l0/H+eAsAOFyOFi+MGLhFfa/0an3rUoxb0iOVMb/nBygYWs6c2DWpSr6zO8YfRaWm34PdcgfklT8UQ==
Received: from CH2PR07CA0044.namprd07.prod.outlook.com (2603:10b6:610:5b::18)
 by LV8PR10MB7798.namprd10.prod.outlook.com (2603:10b6:408:1f7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 19:31:02 +0000
Received: from CH2PEPF0000009F.namprd02.prod.outlook.com
 (2603:10b6:610:5b:cafe::1e) by CH2PR07CA0044.outlook.office365.com
 (2603:10b6:610:5b::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Tue,
 15 Sep 2026 19:31:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH2PEPF0000009F.mail.protection.outlook.com (10.167.244.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Tue, 15 Sep 2026 19:30:59 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 15 Sep
 2026 14:30:39 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 15 Sep
 2026 14:30:39 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 15 Sep 2026 14:30:39 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68FJUdPm1134851;
	Tue, 15 Sep 2026 14:30:39 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id E59649A9C3; Tue, 15 Sep 2026 14:30:38 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH 1/3] Revert "u-boot-ti-staging: Fixes for OpenSSL 4.0"
Date: Tue, 15 Sep 2026 14:30:38 -0500
Message-ID: <20260915193038.2510404-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260915192739.2369213-1-reatmon@ti.com>
References: <20260915192739.2369213-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009F:EE_|LV8PR10MB7798:EE_
X-MS-Office365-Filtering-Correlation-Id: dc0436de-4cec-4456-8f5f-08df135fdf39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|23010399003|1800799024|36860700016|22082099003|18002099003|13003099007|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	h0YldSO3KT06sXOWe3GNcWq0feC+vF2+K2VTlqvRIrMc8+bvlVtDbuHKeSr2CfesCYYPlCLRJCVDZatBLpIlm/rLN5wPnnpBPItW++pd3Z9Pv1/5YR7xv16Bv1/kV1UTLGsqLQClE+5qGYRcUiPdYV8XRId5Nsn9FB4gShiE7A+z0/2O2aLgv4flnErJB/62zh8D0T6pJD8f7ImFDQFaP3S62rYIBKDXzPcpH7RQodPoaW5agpzpXbgMKARrVmYzRm7SihzBjJEuFjDoZXsNYKOSTDkwdJwU4mBrR31+Yqa9NG3xkEJ7CMC10eN+Gb6I8UpBh9vV2KVeD8Hp5y7+zw0H8ZepZS60svsKzsknCNL5tFVmwUOlCuImLNTrIbAFUYOFYKXnNJl+1nQm512AmHnnj/npfNgCwttH00UdUQHZe5JNdqt8Hw+i2Aaq+9Kejj5s2XB5XoLspM50Ii5SEj8eeTcwGgpxU9j3P/3fy+wH688B8DXbvvEIxo3GTHVUMomS6InUHAVaCi52+MiYlwHAIJS3ovIzHTLN52yOkTNUjQhC6p3LILVEmdBkDtQbwkFt2GwP7NuB/phwegyZcYgeVzzu0mMf6AczPuYJb8cbEuvHcerNbaNupLBf/Pa6L3gzflkFKvisW+rygP/ahQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(23010399003)(1800799024)(36860700016)(22082099003)(18002099003)(13003099007)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	taDPF7uOlU5FrvPM5Cbo1Y52VELeaUuik+nrdRAenyEuY0O6O6wULbVlDkLaDQfE5ErVp3JgkSD2b7v1QeK+NtYC6jWx7bzrsmMBqzB40ak/DJzPqKUFoHz4PUxq6TmbXlCtRvAN41CF8VFBTLggP8BqNCc3KExtKFiQl14zfpSKM9RTLNThD8ObmauLmgo7XJ2gneqj5EWS+5Tvrrngw6FuB/LvJcp+IdrWdkaN2YmXlgZxXE3s6EaYjlS1Owfu8PvGsHPCZ5KKBqT+dv85kHdFBflNLfAPCfSTC8u+YHXMdp1lov8WqWLAkkCVeYaKG6OoLMPmPHB6yjZexgO7Nvt3/S9edxYXzB745X1C1p20M7mDa52XZr19cyArLOTXGbDyc1IcppaK24Z5tMlXR0siN2qvEFKDB8lqCFEFtWjxkheNN/N+a9XTrx/TYwY7
X-Exchange-RoutingPolicyChecked: 
	Xqu/qlubH/fB/jtJ4tLTBKqMssK1JwRp+kehd3Hvohk/nx0KJsVV9QtWDdMo7dFL0x1bprpxIzVPM13PgHftw6z6nx7HbvNWP39D32GstNiucQnRw/4Wy782xW786HulD/KQss0pEICacUsc+tWgBF55jBxuRZyevxJi9xyrNAANXWV06NXiglfqhciQa0Bfiv4Q3jFV74ONaLG8qcHTtkEGmJsbH4sx04lK9eyuCZEYTrgGRwJ5pdEff8AhoI8EJTuePCKKGWvjavm2vaMdDIYMgKyYqWh55eTjcrS5LWDxiMWI3bxWuRGetw3O4UCYkT7lpoVk33ViOHfVnbwmeg==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 19:30:59.6770
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc0436de-4cec-4456-8f5f-08df135fdf39
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF0000009F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7798
X-Authority-Analysis: v=2.4 cv=FMaOVOos c=1 sm=1 tr=0 ts=6aa99cfa cx=c_pps
 a=u7dnV0yUwpVRNDUrCOcuvQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=iGHA9ds3AAAA:8 a=DYtVRx_rAAAA:8
 a=gbo06EhghRZej5Pk6WAA:9 a=nM-MV4yxpKKO9kiQg6Ot:22 a=K1xa12UCscBrvhdHlanD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI4NSBTYWx0ZWRfX3B1zkFv523TH
 /jyT6ch6H55DIDwQIl41clEAWUKKMx0amz+jucdN60zXO10Ydo6hLZfWtWjJ+WmdBURqVruNbCL
 B44NfdbWl7B49DpKc/CH4ZkjzgM00P/5oEKgmdJOgwIpDw61l8HzYo5nn2fVDs40QYUJbmUhV4w
 gIq/e/T6E+06OaWz6eEb5gwu5CkQRqsDU3JQbCPlb4v9DE3T2p2nRNXRR6/7JJ23vV1Z9DZPsZK
 DcRvrhJp587aPI9m1Arza1YEHxk/RJWeGyzi0IIFoEC7RIRuv9NWECsW/inkD1+9/ToVbJ7FQOk
 vJM4mFneP7vBj622thUYe+sYWkBPCuLVJYjOpqYSL18GlsnCAMc56rdEU+4aY60I3KMHVe9l6sx
 +9yb0m0vo+intGg4wMvrBBjy32mltzaXtK5kf8MnabuQDQ3koOVvOQfhWv0m9+HH/5LBKcXiX5X
 wSHqiz1plvOizc8phig==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI4NSBTYWx0ZWRfX9cuNLpfdaap6
 edxavfHXB2hC0Mn0U5HNKU0EQHWbrTzHenJ2wLir5bsUVJX9vPfod6HkGCyuBVeAAUtTha2GLP5
 LLo4xx9YQ5YxgVbXSYXa1wV+HMjDc78=
X-Proofpoint-ORIG-GUID: 6L0aAALpwa3Oi3TaZnhoH5vNFr3DsECM
X-Proofpoint-GUID: 6L0aAALpwa3Oi3TaZnhoH5vNFr3DsECM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150285
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 15 Sep 2026 19:31:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20379

meta-ti / na / 20260915192739.2369213-1-reatmon

PRC Results: FAIL

=========================================================
  check-yocto-patches: FAIL
=========================================================
Patches
----------------------------------------
FAIL - [meta-ti][master][PATCH 1/3] Revert "u-boot-ti-staging: Fixes for OpenSSL 4.0"
    ERROR: Missing Signed-off-by in commit message. (SIGNED-OFF-BY-1)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887
FAIL - [meta-ti][master][PATCH 2/3] Revert "u-boot-bb.org: Fixes for OpenSSL 4.0"
    ERROR: Missing Signed-off-by in commit message. (SIGNED-OFF-BY-1)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887




