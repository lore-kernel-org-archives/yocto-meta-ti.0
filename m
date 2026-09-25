Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C20AEC9830E
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 12:21:34 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6821.1790338889871755328
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 25 Sep 2026 05:21:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=Za9RaG9m;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=teCBlZ3H;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68P927051889243
	for <meta-ti@lists.yoctoproject.org>; Fri, 25 Sep 2026 07:21:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=1rNsidR9fEA/luSfr/CyOPYfJ75jCz/UR+h3yh2i+
	s4=; b=Za9RaG9muK2P+1JdEVCZhNSsxiQgewaQwzf+LMX76fm/CXZWnOSuV8a09
	09p+UHUj61XuznrHtExCmxq6wgmOZgU+hFqAK5GXHvVZ5jBNY4ny7YHMJ2R2DMAF
	G01YGeh702i7rBzN0ogh7eaEpagZ4Gzg9NhTZUK0EJ3mh+MBwtyQ2tgXFMN6X5xN
	42OyorvLtl9WQJ9Akj+bSGyZhvt/aU9NnnIdpbobT5q315KymwM+CFjr9dQUThVF
	xKnNvrXAmwR5gazrbHiGwNMsGZFDtlOYvQwi8s3/bKTh8PNXc/trbEp39FDCVQX8
	wF18y8wX1I+77BS04vMjHhfOK9CTA==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010052.outbound.protection.outlook.com [52.101.85.52])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gwnyfrspx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Fri, 25 Sep 2026 07:21:29 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hAYcx9nC5bRCdRm1is4oTry6iZeHqHgb82kiWXa0jY0//VxKc+M1fnSNJyAfU1FTxeQHCxgWr1gPlT2NNged1g+xW3Bo+x4aE77eN+dmZLaCrIEAEnrlQUGxw9CiY2IgFBD/GveZkwbcVXSSqboCJFM5dNhMyeGXtmE+UXiSm8kfErLOxOdvaVRY9/IXvM/BQ3OhFafmHfPvwSzHSBcfkOy2EPih4+CbioKeHQY6Rqbkz1WlzOgSWCMHG3xDiMAUSPcl31tP9NRt6Kw3c3C+mjVnpupMb7N4V+Lt/f1xx5b7MYss2j+xnSOrX9FLSkExqIIaZm8lDwxPa787+tBdcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1rNsidR9fEA/luSfr/CyOPYfJ75jCz/UR+h3yh2i+s4=;
 b=CJR0cxIpxpwE0Tv05F7INA0UTZ9PpCHZGPZOdhqbyRnblK+Cl2vDkm/YbnNNVw38hK5WCUazLHEVP3X65cOa0cky2uABP2WByqtgq1y1j6DQWf4VZkCgIUHIaLcDKu6DqUTA6CIAk+FXytUgoXRBkgJNwglcRfCsu0JXbekiWmV9PdP2JVScLzDXLw0/NE1h0LVwcXYXEqEqc5xcA2lbQN55vGUT6Wv1Zj71A3m8dGTCYhuEdt+RRVQ6kgCt/MIOZdNSaQGCHW2T7cPvWKKAV3vO7u82iggHZa5OJ4qbDawRxZLqfa1LhhlmAABtguZSPB2AL3Qyz9OPp+NTVUqY6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1rNsidR9fEA/luSfr/CyOPYfJ75jCz/UR+h3yh2i+s4=;
 b=teCBlZ3Hl8pG+Kcftvpo/GSwUNoa/OjlYOOt6NHoTDj5ZOLC1N7YzPMfmI0pGfC67J9xO6ZZOLipRmNA8y2VQJybcae5BsjF5V8CBD8QRVfV5YuriQxUqXyDQ4Yr6WsVVirFPn8P2h7mstOddssqnhzZ6Y66aEoIVaNK0/ZpNH7GiG6s0oAeEqSVHg3fOrH6g52oUJefctxNeXLFQ8aDOX1fIxMCXk8RhuEzh74dFMtPn4sWCE9zy9nSa6ylRaneAlFcV2wbRi1K4daXZw2H1jC86PytGl3dxJWZJC4GjTgIRSvqttC3YvhuI4Ykdg3BEyMBzb61XT8Fhp1mcpyCvA==
Received: from CH0PR03CA0014.namprd03.prod.outlook.com (2603:10b6:610:b0::19)
 by CY8PR10MB7218.namprd10.prod.outlook.com (2603:10b6:930:76::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 12:21:22 +0000
Received: from BL02EPF00029927.namprd02.prod.outlook.com
 (2603:10b6:610:b0:cafe::46) by CH0PR03CA0014.outlook.office365.com
 (2603:10b6:610:b0::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Fri,
 25 Sep 2026 12:21:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL02EPF00029927.mail.protection.outlook.com (10.167.249.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Fri, 25 Sep 2026 12:21:21 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 25 Sep
 2026 07:20:51 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 25 Sep
 2026 07:20:51 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 25 Sep 2026 07:20:51 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68PCKpLo2740464;
	Fri, 25 Sep 2026 07:20:51 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 9312C9A9C3; Fri, 25 Sep 2026 07:20:50 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Mahammed Sadik Shaik <s-sadik@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Ryan eatmon <reatmon@ti.com>
Subject: Re: [PATCH v3][master/wrynose] conf: am335x-evm and am437-evm: Bump up max_leb_cnt
Date: Fri, 25 Sep 2026 07:20:50 -0500
Message-ID: <20260925122050.4034056-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260925121542.1008370-1-s-sadik@ti.com>
References: <20260925121542.1008370-1-s-sadik@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029927:EE_|CY8PR10MB7218:EE_
X-MS-Office365-Filtering-Correlation-Id: e2c0eb2d-17ed-490c-0873-08df1aff8263
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|10067099003|260925021311599003|56012099006|260925021911599003|18002099003|22082099003|13003099007|260925022911599003;
X-Microsoft-Antispam-Message-Info: 
	FbqJnZiNyXRWN5CUCX3gHWQCqEzzI2nZ+FG04/1LS1S4kPG+opCQ4zCj57rORF7N9ODBBtgelmel9Rb3Xk2emL3o2cJTU3XS80ynG+eDH9sXbkjPqgXR5gw1OJc5dN5/Qq+fe/z//pYhdKnGjz7NujUbnnDNTvBWV6iTFnQNyCI5Cw5ARDYNgbjR6n4VZWLhG9mzSEUAqA9imazdtkRg2/lABWOiGQZzoMulXCXh6kR0GGZglYRbBfx7IzOue6y+0CeKlRNAqJ4mynro8B95rOJ9BIxWlC12i5LWQNmrX37ckLTcXrHNqp/rWHZP8NrXjuK6Xsp+/o0FgPiTfdZyCPUQcA5K5xg+f9hwrb14TALVp0/gyYBHjpy2ZIx/TKESpM36cBRysW6zU02ETAU5flW2Ob6Ql7LmHXH4uCW3aDvT2iXaLICvDSCaIlldjwKCF5Nmz1RNtpNRITFqvlWi+DSJb4+rSZkauBiF5piHES5qDnXIQ/gegRlUq6LnO1p6LXcfSLr4st7+A16iAK+x5oQRg5q+03k3fvQGkyARQBMtJp6PdIFWfhruF3lwGc5iM4p0NuCdvPp2Zodj0nWHVNkMocNPx0s+yYbQa9p1oXbBVncpvXAUanSmzTb+spXs6dwTNPgFSMfXtkx+9NXLxg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(10067099003)(260925021311599003)(56012099006)(260925021911599003)(18002099003)(22082099003)(13003099007)(260925022911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Tw/mtols89vJUsYvdp/hjZ6lWaTg5APFIiPIia5hf4A9JMnD3+hpIKMmJzwMfnyO6jGQcU6lBnjxZGaDw02w/2Hh5nLYUbtN3VP/Pr8prx6OhEYiAdEGEMISmlMUVOOcKfmefII3MGrU1G8pNGp5WwjSXsqh48bDfY7g6rO1PFjOeIboFPQ+fmd0LMAM0t4ctBvSqqygn2SUeGY144WZ8F/uXQNVy+To2gdo8sdlOJKe7GAYPNhUiAfZcZP6RBR8PXg0AkqaZ4HUB31/5Syh8yRN0BVRL+8nwdDtrdizCev4oDPtBQIfRyr+PtlZbdjzyhhWjrfXC/Rm9htRsu2BDuzSq8VNvdj9dK8nbV4SLyLHt5il99m8cHC8utoupJD49j4HSz96/51XseQYVjJOHLTx18LpxCiE+JnC+pBMKsMV8pjZERwSt35dJT1DmgCs
X-Exchange-RoutingPolicyChecked: 
	mwP48YbwrbWZXDwl5jZ8wpAk4ulp4za8bDunjeqFSYggsfr4roSP9ooe+GnsHR1D1aIRIOuDr2cZyE623CF5e73ticAHsMPZ++QWDx97Nizj0UuCceUlM6Tsc1Cylk06F1fYuAINWsEK1atdgtZQZ8O9pLDy8RnCjmKl42jobV+NU5lOSZaijQSMsanAevB6Ok+uYCFcpCn2Refk78ekk8T8hq74GxI1uaajl2y4gI2NwUpprZFOw2962y5ZE4eE8lXjVvgrvHd7miEBYLc434yA8IjVwBt596WaP4uGxcdFrYS/yl2bpsqctcOqwOxWqLXtOK/0GFv5Yby7gUDs6w==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 12:21:21.5252
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2c0eb2d-17ed-490c-0873-08df1aff8263
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF00029927.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7218
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0OSBTYWx0ZWRfX/jVyoQW+N2vx
 /9CofNaby5/lRu/jGkimXNA6NDc0knMIMoW1nzOAtGHvuPYAlkKGr2FwvpZ61Zffizhg0ENd0l3
 10Hd+K0KciZRyFBNtD8aGtF7c+YlW3et1tlM6vHjg0smpLrDLejcrwdJsZwWAz6I7lQIttmVevJ
 V675XDJULuRQHtsYa/yNxqJ6kBWIN3zb8nkg0UXeLUtGqShq8drEV8CP2pTU1raaURnNMCOO5AN
 n9jN1mPelHq8STeWhxSRQ2DoBuoR5Tlw6ITd3UtBqK7B70sPc3g4AS2frXGydDUEy0C9OX32jcA
 qvUlpe+TV04K2H17U6xadbSsWIcX41rICFUaAQXY6waDArEreLbYG3TdMd4wRjE2pkhiNimFVCE
 DogSQr/MrfamfOmAayPTvvSymRUnlcL759v04jlE5WzbGBAsMfvuVt9PftfphYxkrRVa+6UT3RR
 jvr7mDQVgEd4P+sby4g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0OSBTYWx0ZWRfX/Ha60zMd9G6r
 MyoF3EYdtRaTP0iJlQ+d4t3SKpOnCVcDNLwGE8BJk3Z4eX9u6MtrKF/lXUJB6DmIzFXsNVI4BKP
 OshrKEXqfmpmNF/fUg/VDjcl4U5+JMY=
X-Authority-Analysis: v=2.4 cv=aeL0Dhot c=1 sm=1 tr=0 ts=6ab66749 cx=c_pps
 a=F2A7jaVQFOduNxX/8CKReg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=slO_zZtqbVZj-wm_tPAA:9
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: VHTUCrMAweMomnLX5ltWs89z9enTKrpD
X-Proofpoint-ORIG-GUID: VHTUCrMAweMomnLX5ltWs89z9enTKrpD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250049
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 25 Sep 2026 12:21:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20419

meta-ti / na / 20260925121542.1008370-1-s-sadik

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [PATCH v3][master/wrynose] conf: am335x-evm and am437-evm: Bump up max_leb_cnt
    WARN: Commit message does not include file/recipe name: conf: am335x-evm and am437-evm: Bump up max_leb_cnt. (COMMIT-MESSAGE-2)
        patch
    
    WARN: Commit message should not include directory path to recipe: conf: am335x-evm and am437-evm: Bump up max_leb_cnt.
              conf (COMMIT-MESSAGE-3)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [PATCH v3][master/wrynose] conf: am335x-evm and am437-evm: Bump up max_leb_cnt
- Submitter: From: Mahammed Sadik Shaik <s-sadik@ti.com>
- Date: Date: Fri, 25 Sep 2026 17:45:42 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 72c2fccca93b256f66e1d58d5a68801287b9da19

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202609142200
- Commit SHA: 7034712771a19a5dfa13a0356e28c9770c226eaf

Patches
----------------------------------------
All patches applied

wrynose
=====================
Summary:
- Patch Series: [PATCH v3][master/wrynose] conf: am335x-evm and am437-evm: Bump up max_leb_cnt
- Submitter: From: Mahammed Sadik Shaik <s-sadik@ti.com>
- Date: Date: Fri, 25 Sep 2026 17:45:42 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 72c2fccca93b256f66e1d58d5a68801287b9da19

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.wrynose.202609172130
- Commit SHA: f14ecb71de5c05d717fe0cecd47fea69f26d5306

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: FAIL
=========================================================
master
=====================
FAIL
    ERROR: SUMMARY cannot be longer than 72 characters. (SUMMARY-2)
        meta-ti-bsp/recipes-graphics/mesa/libclc_22.1.8.bb
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887

wrynose
=====================
PASS




