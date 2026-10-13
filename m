Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CDACCC6B12
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 19:07:49 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5691.1791918460302834995
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 13 Oct 2026 12:07:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=mzMnKHIZ;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=PfZNKonG;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DHKa0t1412953
	for <meta-ti@lists.yoctoproject.org>; Tue, 13 Oct 2026 14:07:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=CqymN8/2/NI+keLuG6dqmZ0VpEFIeL8iOzGlZydii
	nc=; b=mzMnKHIZevN6+iJttlSTDm1LMd5vddvUDy/hyw7BgZ8DQuLc4R3PKXUi2
	6LX7+dYdKB1dRil2fK+iINF5RwumNWuN5fBRaRLpvVBshRaeA6UCFz+YqRHsU6St
	DLgA9Vu6P3RcY9QodPz/SSAi5Z7yEeopIlgpQ793YR/qlPD4TWNESrtxDMP4SnRz
	q2yUOoaN89Jvms7w4pluH5an49N0Q191203sF2S+FdmcW9sPdeOlxhEqgizSraZK
	ADjLFhzhUzq8PSYB6FKbNiiOLOxzSlG/Pq/MIYBuhSzpCdZRfN3yQeUodR/WCx7f
	ussUQgxHDOPBIZlvzQenYOIBoe81g==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012002.outbound.protection.outlook.com [52.101.53.2])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h9j87bmkv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Tue, 13 Oct 2026 14:07:38 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DwTg4AOlS5rUHthIEIm9f8PNx+ZXqsk6F+bc15f/BCDHxJ8SuBafVlsugYhH87v2zsySdGH2Z8qRVi0aAFpqPGJSZZtnJYsllwb8X2xeWFESROgDfWtuTH0cLE24QN3mej4RNnWIDA3lqTCj8RZu/hzmW6eztjmAROzDwQCILATKl/cV5AqmSrm1aKzzt1xs6NL6OjIBiNqdW7YbRep/fZUF/Q5qCPUo1RRgpxlVoG3KImpbUbpHLJHsKfixXvUl7GhmdUa5hfj8zT4AP3azp11yLnw4XkU53VDtNHHTtazcSYMlbpPgHKghVO4bQ81eJdOyehBHQ3xdW6+9PHwUXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CqymN8/2/NI+keLuG6dqmZ0VpEFIeL8iOzGlZydiinc=;
 b=MFEHB8DgdBJ5AhQ3c5zBpgGvE8Z07XWJ4rcTR6BVcmI9zGzYNWy7cBKntRM5h9i/nVoShe6+CMvjvzmZpbUHyoVK65zDXuXyQH20ZqBFqNQEyFPTWkS4ybjAjBrqbycmlZxzsYnZD9NYkREp67CPkmeCx+4E2gD47x27ecrjm+Hz5VFR+Halr/WJ7S48BHvio0GJZbFHt+mvlDqhLYGsgnAjvgJVNB17hi7/KICvRXFpkZAbgm+PaBvZ9sUiBBqriEdWrYGMbhBOotA5eZD6tQLECPeZLPV14aGWF6uwoNUfOD+JOw6jmwEet+qdxMxmQ4Nn8htJfHrl5a3WMKJ7nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CqymN8/2/NI+keLuG6dqmZ0VpEFIeL8iOzGlZydiinc=;
 b=PfZNKonGAhZCC3vaHVxr7Yc3KtHWGVF9vmb8m1VdWhkcHp/k3iT3caJkQ9JeGU2uYmdEVEDmVMcroi9OBiLxiYVjwpcJAODOMR0BfhiMxsQfyiKXejNSofI3Z2DNUpCtQYeAsUE3uo9tt1zzT6Xxw4HQ3J6OZG0l/qjeZb6m4b7G8mEJIGl4+EDiGfw2/qZCKdhzVAftX8gxs57i7bxdzRceO/fAwcPY6BEXO6n1GIHZZSQEF7PDUimUVUJ291I+OOUXsg/TflO3wO79vy+YRsh3LkLZJYCaK/WZXq0vOoX+JUnVlk1FAXqoVrcKxB4buSmWMJyDZlt/00nETYH90A==
Received: from CH0PR03CA0043.namprd03.prod.outlook.com (2603:10b6:610:b3::18)
 by IA0PR10MB6819.namprd10.prod.outlook.com (2603:10b6:208:438::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Tue, 13 Oct
 2026 19:07:34 +0000
Received: from BL2PEPF000352D4.namprd02.prod.outlook.com
 (2603:10b6:610:b3:cafe::1c) by CH0PR03CA0043.outlook.office365.com
 (2603:10b6:610:b3::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Tue, 13
 Oct 2026 19:07:33 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL2PEPF000352D4.mail.protection.outlook.com (10.167.254.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 13 Oct 2026 19:07:32 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 13 Oct
 2026 14:06:50 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 13 Oct
 2026 14:06:50 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 13 Oct 2026 14:06:50 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69DJ6o4q4082737;
	Tue, 13 Oct 2026 14:06:50 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 7F5FC9A9C3; Tue, 13 Oct 2026 14:06:49 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Thorsten Lannynd <t-lannynd@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <rs@ti.com>,
        <detheridge@ti.com>, <b-brnich@ti.com>
Subject: Re: [meta-ti][master/wrynose][PATCH] flutter-wayland-client: remove unnecessary include cstdint header file
Date: Tue, 13 Oct 2026 14:06:49 -0500
Message-ID: <20261013190649.3201094-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261013183908.2244183-1-t-lannynd@ti.com>
References: <20261013183908.2244183-1-t-lannynd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL2PEPF000352D4:EE_|IA0PR10MB6819:EE_
X-MS-Office365-Filtering-Correlation-Id: 577d7177-3942-400c-5aff-08df295d3bfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|23010399003|261009223027099003|18002099003|22082099003|13003099007|10067099003|260925021311599003|260925021911599003|260925022911599003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	tEkiUp0hxz3eu/5sXBpRG57QuY6hRUQ9hsaN5PzD76y2bDrHH7FIs0aDW+BtHsRuwghwoNLh770RP09VdtNNKmnY1flJE3CfeKbimc+ZKnMmIJJWna5IwXY1T32v4hLePnM6i85mRYu3NNUNnBJC0XucA4uVZICx73lyt0Z/vAnuof50A0cizauOKbAR9BfHUExsOO3gabR3PTNquvzPQEh4plJuhjDjl4lIswHCdCaRydOHnxx5zdEAeL5BhH32ABY/1E3dk3vzq/O5rWupVhJhCAFmAJmTjhaWDnUqwi2bXtGLRtOJifJVJmrL9RomDrI5qehcjNbpQnhYmXhYSAQESAEqqBuOcWEIhzco8RvjvZ+ofDpueGuvdDirX5dcGctccpLq9X6AAAX5xRIIFZGp0JoM74lbrX5ZI6YUyAP7NfWECDANhj0ICimg8CF7NUV8E2dU6tLiRvlfgsB98hrV5oklJnsFXwouedPCPd7Q/c/EhLTFG/cpia/YXkeoVxVI+jsOOBfI078Ugg8DXfPbC0658xOhB0v0dnE58yj3CzLETepqwVq/+Ei6bb0P0qOX+bmQrdp2Sxo3cIzT3NkfWBHdwWTerB6kZuayYKjMPvWUwqRJ3+sVclF2eG4uIQfxszDLfyOoTiyzjPFexA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(261009223027099003)(18002099003)(22082099003)(13003099007)(10067099003)(260925021311599003)(260925021911599003)(260925022911599003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	QOFfwflDqd8LAFaeGGTlhycBqq7c35Ev6kw1goWXu+7yToCSEAYnKAj7ZcQtpIY4Dk+VQKG8IZxgaxGiptaYW/xTpMfTya1OjTp4Xr+ssS7+uhPBtzorB87J9CgI5UlQB2zi0lciBE805lM03BkKXtTjwdJvQ3zJ3gTsYBviSaLkxCpfwNje4tSA14CjxX/tvc3seWWu6xQ7IrKZOkZFd43kxESCL2ijgkujMDYNs0plcA3pSsRjozOdsoE09OgtBq5xy5vlpwRb6oBE43ipIWC9fcqSViEjY1Dr1VToHYR0PQJx6XdTxieb4tuz7nsQM+iCjqFq1n+qBeoi9wf5RolhJy0QzRiRqmk4Igv9WnmdlUGVhcUfj2KaCpFY54ir4Jdx25+e7lNhxlQPb2Xu4B8iCB5kc5P/Y6ui4Ysxpnwm2Sx/+KEnILi+w5+3Pljm
X-Exchange-RoutingPolicyChecked: 
	gstiAL1oc5uVwaDxL+npXLqOZXyfAz35zc7ustgNoteUz7Agp+SxV3ti8rfJuz3QQKFJ+wIGGVo6r2tnLYaO94m81Q9oiufATgccrtwzTVVM1fB+iG1MYf0B65qCUJApGYOh5RFXO7Pw4tywe8euHaCFluemLImC6W6bj5Z/tseL3PtWPdxWoNTdHBUuVFVJvburk7uqqOqh9gMcKiAWh061G5a4+xSRR8tUn+MhsUhg12jdUNDtQ1XmwyzOcQ70Eq5nkwUn9EZugNN1QLn1ETxWEIllqBObyAbM0I7GLZq85VsauIProyEuw7J98YcshDib5mlpOlanfQOiDV7nSQ==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 19:07:32.3020
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 577d7177-3942-400c-5aff-08df295d3bfd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL2PEPF000352D4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6819
X-Proofpoint-GUID: oZrVGldewsvANfEREtGgDu1qte8JKBnb
X-Proofpoint-ORIG-GUID: oZrVGldewsvANfEREtGgDu1qte8JKBnb
X-Authority-Analysis: v=2.4 cv=ALoljHRn c=1 sm=1 tr=0 ts=6ace817a cx=c_pps
 a=boTDQTO5XcRoDQ12XycLVw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=XqkhubpdwhjLBTUKGnkA:9
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA3NiBTYWx0ZWRfX/fQsZJ+D+guv
 VtkhXFUPrTDOsXPfYaBUSVs5uau07F+gcanQqDr4tDMJA8Che8QjbQ6fobLujBBxZ7uF4f0JVCp
 htJX6MI1nds8DXazPIdym9wPUajbRu8oYEmxLUGbxL32CemIdXwH9PrV1UW6hisJrD495LBnrV4
 lbNo+Enn4uvK73YTMYub2Dqj5MNffWMhFQAwWNU6+nMysWDY6/p0//5Er8uKHBa9v3d7jRkEO4o
 Htk8bWa8H+cz+6K6pmcUNbWOaquX2IF8N3hf2Zdj80OGj2DQxVcpoeUowoHsAf80vXElorjyzaV
 QnghjptzZbgzzczzRI3nHFu4spx4guSv41KsDLLAt5wh9bUBX7ffo42stQ1IHq8rLEy6bWiAjTF
 qOG2m90007au4WxHabBvQFzvs0XIzcj7AOtYIsO2/iGc0XBZ6WVy5CbcujDI/KvcRkuLJyHS1Sh
 jJs8GqIrjHPxuD/sr0A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA3NiBTYWx0ZWRfX2QfsGLlCSv7R
 qOuViVklk1nXGkbbZP0etZPZKFb6giOvNZv2/f0nonPk/2W+pa0mkxq+adAMmBLM7Zk9QzTeJkp
 jYloJlnZqkRuMzFM9uFCo9H9eyJevAM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130076
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 13 Oct 2026 19:07:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20454

meta-ti / na / 20261013183908.2244183-1-t-lannynd

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-ti][master/wrynose][PATCH] flutter-wayland-client: remove unnecessary include cstdint header file
    WARN: Commit message does not include file/recipe name: flutter-wayland-client: remove unnecessary include cstdint header file. (COMMIT-MESSAGE-2)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [meta-ti][master/wrynose][PATCH] flutter-wayland-client: remove unnecessary include cstdint header file
- Submitter: From: Thorsten Lannynd <t-lannynd@ti.com>
- Date: Date: Tue, 13 Oct 2026 13:39:08 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 236f678bd4f64a8fc5f7b4095503290cf2df81f9

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: u-boot: Fix uboot_config for am62lxx
- Commit SHA: 2bd07c4cbfc422684c9842c1fb3a89d1c2785eec

Patches
----------------------------------------
All patches applied

wrynose
=====================
Summary:
- Patch Series: [meta-ti][master/wrynose][PATCH] flutter-wayland-client: remove unnecessary include cstdint header file
- Submitter: From: Thorsten Lannynd <t-lannynd@ti.com>
- Date: Date: Tue, 13 Oct 2026 13:39:08 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 236f678bd4f64a8fc5f7b4095503290cf2df81f9

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.wrynose.202610081110
- Commit SHA: e05eebd04959c4ef69666727e1ea593d267391d1

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




