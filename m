Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 637A9C79F99
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 15:07:50 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37551.1788793660695209820
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 07 Sep 2026 08:07:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=UQ5eHMuT;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=jTbdwtL2;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 687DeHKk3388120;
	Mon, 7 Sep 2026 10:07:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=6bQrqetzeWvp7/th1wkBhrtZTT+R+EFZ78pFbFuYK
	/A=; b=UQ5eHMuTIgRVnFoYudYr9XN/L20igbzIvaBlsy0IYdt/Y15pVru8kGZiu
	Yf0euzqfhfskugYOT/WjcKVTEMqfvj5VTIF3HDP+q59lFArm5w3/TzN67gGcfKtA
	9+ZFNsM7uGIFVkQSlnywwmJH4vfQP7lJp2nTJSNe9n3JWq4XnEnS/2kLCHRTNfG7
	5acH0tO7euM+b/0On9T7PYe0240XPaRTrK8TznG5nfpQrBJ8iHuxPTEAtkXfDDNc
	UwWcwSYNPCanD/DbzAuVBeoJMsRHz21gVjQcqqywrAEbRDvPm+STm2A4KaauhdVb
	O419uSZxPrO0H3FP/LLcynZUJn1dA==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010002.outbound.protection.outlook.com [40.93.198.2])
	by m0380145.ppops.net (PPS) with ESMTPS id 4ghth39njc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 07 Sep 2026 10:07:34 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rQIceStJviMso9QK3BZ+0JbW0ldbQ1W4x4QS2BWJG3OhPWOmiofdMQBJqiyjRY0MsUMr27Xt8sG4ILCeBIvjIX2oD64MpKBpi7YGO4Ek04mLTf88vCsJ/w8nZeJ79SI3NDw7p6UpxKfMqj19VO0CkxFu6+Om9KGVWV036ep3Q56iFbYEfi0NfwaGXuC5sVvEUzhtCdSKtufqzvPil9mv8jxAfDOjoHuGbYZjwWe81Dslw9rGQWiXyEWCmE21n3vPc1doagYJuwoOrv0ZizxUIWwRzRd53+5eXiGMtNBw3sj9MTUgAzbAUD8AhGGIJ4WbqsYI76GrELI4DgirQ2GAPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6bQrqetzeWvp7/th1wkBhrtZTT+R+EFZ78pFbFuYK/A=;
 b=woKvcEqnYefYb0fC65G5d1pqVhM433qH80YgNo/FwmJXFQpC1wNYapcQzqNQXNwbW7zzCHSWXQHzg5Jsy2hmid0LdHmLjIpUEjnOtqz2mlQyLz3g44W0AR5p6V1euUDH9MtWswxjRX+3pJndgdzjOUelNZXi9I7/h5yhiKJSeM2fWTRz9tOQ9qcfTY2+hgrokwXp5p0TO703MujEpbs3DYt/g998GVKnqz53v4ymV1u8c+nhmuIAsmeaG7FnbNom8l7A+Efu04vuH13+HxoPbkuo8aicUbZ4BmZ3Jy3CcBELFvNc80UPTzFjjhewwq0srr9ofVZnRKd6jfYM06xZQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=toradex.com smtp.mailfrom=list.ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=list.ti.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6bQrqetzeWvp7/th1wkBhrtZTT+R+EFZ78pFbFuYK/A=;
 b=jTbdwtL2ElvHhD22sPTg2heCwH4L7s4qsE7y6f2s02jjKrhLOmAQUyzQn50B7Spk0PZDy+k9GO64kof9DWwUjeZP13UNjh1BVz4SxjQ+vsQdkAVEWxtrHEcQf8dM1S/IBNm52g4deRzYn+d6PGGFB+VI1JN+c5cAkSSh4XjkzvVUUWEYLoRrHB2q8FfYTQC6JuAMYposddkCYqEkuo/THbqgrim0OsTVSovja2zFxqrQ/SWIQZ/cYfd7Yz4hKLkSkEGL1eePUgPcH79K8BkXw7HBZfhb2iFx0acNOCIKpzouaYq85WyNs82IjvS5OSoYeS/owVorrkX6aqvsNUlNCg==
Received: from CH2PR03CA0024.namprd03.prod.outlook.com (2603:10b6:610:59::34)
 by CC6PR10MB079336.namprd10.prod.outlook.com (2603:10b6:170:207::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Mon, 7 Sep 2026
 15:07:30 +0000
Received: from BL02EPF0002992D.namprd02.prod.outlook.com
 (2603:10b6:610:59:cafe::72) by CH2PR03CA0024.outlook.office365.com
 (2603:10b6:610:59::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Mon, 7
 Sep 2026 15:07:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL02EPF0002992D.mail.protection.outlook.com (10.167.249.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Mon, 7 Sep 2026 15:07:29 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 7 Sep
 2026 10:06:37 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 7 Sep
 2026 10:06:37 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 7 Sep 2026 10:06:37 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 687F6bRL139733;
	Mon, 7 Sep 2026 10:06:37 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 6038B9A9C2; Mon,  7 Sep 2026 10:06:36 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Franz Schnyder <fra.schnyder@gmail.com>
CC: <meta-ti@lists.yoctoproject.org>,
        Franz Schnyder
	<franz.schnyder@toradex.com>,
        Ryan Eatmon <reatmon@ti.com>,
        Francesco Dolcini
	<francesco@dolcini.it>
Subject: Re: [meta-ti][master][PATCH v1] mesa-pvr: Remove makedepend dependency
Date: Mon, 7 Sep 2026 10:06:36 -0500
Message-ID: <20260907150636.2949891-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260907144642.3994088-1-fra.schnyder@gmail.com>
References: <20260907144642.3994088-1-fra.schnyder@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992D:EE_|CC6PR10MB079336:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ee847a4-5e70-4312-df2c-08df0cf1bc0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|23010399003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	oFPVw7PJEVh+SOOxZahGy1eGeJ5s4Bvf3rPGjRagfjZgyHNe4xhG1Hu8U8I3kC4c0ilQOj1zzFzst3Uc4SdE69Yb7F0DylkQaXJWzIHTNg0iGnhHnOadfW1PDg37Blv+uyzFc6l+MEcihffK1f/XZT4WWPu4JY2hSHi6TYNv4qIsJeIdwj/4rDz+6A0ZiaCRqVlrVY25Timema2Sm+407otjvdo0p87tH6Xd5I6Oom7W1XUCSEaPrGBnxB6qwGb//wmqQOP4cxcaw/rQQnUt+kkaDYHrgtXYl/1KpPkftbwa+2zUuuJGdiKfkcoMNDuqlJBGTz9tyHGkJtZM02MskmDnkQkDaGAl/n9tcx6/1aqmj2tPGyZmHtWZGdUIR2OugkR998oXXdPfMOLX1bkM79Vajm8g5u8ymDsuBQPBdlk+Rkqh7fsjmZB8DKfUPE5ay7CGztMCcSQdV9rQksri3DhSIdIQul2dNY/Ruos/OCD2aUMKDxN445rSIWw2n41oJgqctZ4nY/e/uqKjeAbLsm6I/xhp2TdA9o/P9HSilsDVEMZ6BtnIr7+5mC38k3wj7M5/mA3qI7MRZjHfkqxhMIHUeNWO8acEfADNettwsSd4Z8VJru/DQHMLt0M/eKWjekdNPWneypPyOEwybrIxRw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(23010399003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	KN6rdP5Kt+wVsrX6rzsOS/g7pXQc8Pp/O6u58H2Syg+VM0CRDIvGgjn7UckAVvltDi9pWmBNLqzq9E8dUPUVO2tsaFmPm6Poi8Bt+tj73y/fS8+cRhecDBRIzRP0OpPjQeZJLdDRqnh6bOCkcjEUEZgw4s++WMWyc0zRqoF+MjHSYJeWVyU2yoTAzglReUApEHeJn8SWrp2Mt0J2EoD07LkN15eK3e0zK4+XG4m/b8M4ZcimIplE9iW185raGFbQdQjVxPM4NaM16p5cua8xV8NWnvfjTUK7XRZ9Sg6UD5hgKT2wzclBFFvEaep07j3mX/c5kAUVc8B71Rihevx/+Iy9+Wg0HJZ8YGhWvKWcNelFBScBDFRjb4h3S7YXiJztR93NRnMmLec47NABOkLMuw+wl/gR0+pn2ZtrLn2bNUn97rQdaxRLKuwHhMRGhZII
X-Exchange-RoutingPolicyChecked: 
	vz8vgxoFvx9A4iuVSH0sJyhPE9sJMRrLAP5qBxXSyaHQDOMxYzaYGzTPeSk8ZGMVRr42POhgi/Yud+5PzkSUG783Dm8JEDOsGsEh2umWOxpjOJc2ExLQbe0KasMeyYGOTGBi8dwyQBdsxVtZL0k1rBHiKVK+TFDwHnW4xTL4ksyLb7eZBaDwVv0BW3CQmLw5Epr6VZKT5WxpTlnqG6GozsX5mUdlWmycrZEjeopK1sZaYX8cN1JkoqbNng8mHevjDX29l5DaTiWiMyhMrCfyKYxt/dPOnWqUJFnqnbK6rFJdE6ZWEn1tLkkXxfsDLaGu6KpOOVlg+Yal/ZrmI7oQjQ==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 15:07:29.0287
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ee847a4-5e70-4312-df2c-08df0cf1bc0b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0002992D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CC6PR10MB079336
X-Proofpoint-ORIG-GUID: gA2slFLhR8n5PwJucr6fFIhKshvMcDT4
X-Proofpoint-GUID: gA2slFLhR8n5PwJucr6fFIhKshvMcDT4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE2NyBTYWx0ZWRfX+IWKfl83kIGR
 ubEE5yaL06PJIfFPuCjD7bN9Hh+FYv1vmXh9VRrPiNQEFsyToAOYT65XiAkFjwF/JpSQ5qLhAGQ
 LTl4EA9pl7NShJcs2a7iGF4f0wZbp/kzhvmtUO9MmfDOA7ZR8EowOPrVbjq3cso+D8pVoktjRnh
 45Ww0coiYLHW9S7kb9EShRy6K/vpuXxWyFIjEbPNpGrlehGWtZT6D8UtaVmOywCg9+qYVPlpAaO
 bK+HZHU2KKp9PzxEEb4mrfVsdbrbDg7IKozeI2c1/usdpV9wqgl1rqGJ08qRpE+XirAAYsiyEZH
 3EF/LXXheLLVJXh4M1fE1SxqLG8y1B3hiVDlKG6M1tgboJCGYEwhCdT2WJJYIs7AFifpGuF0814
 Ss4Vk9LN7k7FFM1aMcAp1+BwXPlYZbnSjW7RMp1aF0H67s0wDUYiF3x1SlcLq/THmN3ozjbxrX8
 WSvau5ZQspOPbH/Bq0g==
X-Authority-Analysis: v=2.4 cv=Jd+Ma0KV c=1 sm=1 tr=0 ts=6a9ed336 cx=c_pps
 a=t0Zw/5SeqBOX6e/tpleWjg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=iGHA9ds3AAAA:8 a=pGLkceISAAAA:8 a=m8ToADvmAAAA:8 a=sozttTNsAAAA:8
 a=ef_xxL1EtnS6UrlDfdMA:9 a=nM-MV4yxpKKO9kiQg6Ot:22 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE2NyBTYWx0ZWRfXyOxBfhKntg4+
 6P3pnvuZks/5KFfT3SXAKwjgE3ANqdYmVPfyLEFaolG/adc0tTb9IEZizBriMm/4PeyeGiQ+G0l
 rCAuonN9vO14iB1RlcbQvJRLYjdy3s4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_04,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1011 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070167
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 07 Sep 2026 15:07:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20340

meta-ti / na / 20260907144642.3994088-1-fra.schnyder

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-ti][master][PATCH v1] mesa-pvr: Remove makedepend dependency
    WARN: Commit message does not include file/recipe name: mesa-pvr: Remove makedepend dependency. (COMMIT-MESSAGE-2)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [meta-ti][master][PATCH v1] mesa-pvr: Remove makedepend dependency
- Submitter: From: Franz Schnyder <fra.schnyder@gmail.com>
From: Franz Schnyder <franz.schnyder@toradex.com>
- Date: Date: Mon,  7 Sep 2026 16:46:41 +0200
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 592fd6d5e215364cada708754f0570ebf145f5eb

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: TEST: linux-ti-staging: Add testing dtbo and build command
- Commit SHA: d28ff6dab6662f5c34afca7dbbdc1a83d1f6d54c

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




