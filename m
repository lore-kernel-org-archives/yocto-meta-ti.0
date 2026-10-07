Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 205B4CA5FFC
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 16:26:12 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1412.1791390370148383264
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 07 Oct 2026 09:26:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=F9BVvDJY;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=FOqH3ar5;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 697F2SW81306276;
	Wed, 7 Oct 2026 11:26:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=GII7mYxoW+jqiMWxhnJIuavuGxh3qE0fhn8kIlF9O
	1A=; b=F9BVvDJYL5luujWuSXTnuBvOu3Df8N1bQW5qlBdJGbSSQCZbnwI/1Mdp3
	DX97YabdWeE3n7ZG9LPs3aoq8A1ebmBOImPvENL13dWS68gJ8nNnSSH997SedM8p
	GZC3Hg/+x8xBH3M2aO5WkuXhXrXrs8HQSdMCyfoTaljRJHGQgFDREK7yeIMioA+P
	Q0UmAbzvoSFOw5HxF4ZGHuUg+QrP+bmgNU1GDw1lrbQWiprEz6U+DYU1TtImPoiT
	eKSGUcypanHVqObX/4QRABnTcXj/BQZIO+hlrkBVM7nNqGPrb7H0VeicF1FJAa/M
	Jkg1C5bw5RnMxrjZP0yUCHwB9uOxQ==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010023.outbound.protection.outlook.com [52.101.193.23])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h5dk4uw0b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 07 Oct 2026 11:26:07 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QA0oa/ssOrnK7XocOPfrdIcFOmDesgWVbwT6p904Jj/dDjj6wjZIvzMw30tS1TLdyB30q6x42CKhN8CXYRYMq+kqQvuD8Hbpooh1DlWoVKz/uPI90vDwgG6GUUHHfc47b6+6d67LM1sLPxlaHAWjC1no9hnhaCMIh3TxOlTitItMep2lX9cowTK8gc8gXr5Rd/ODlBRqPw29OozMPkT7QoIv2xCFHRs+I+NvGUCgwWLDvtkI3bj88WKZ5eu+f5ZxjxUeF9esWvQk8zRlfPX5/o763uzitoGtfN2IbXTsk0vYpNWeFvgNXADdAnmpF/dCRRMEVEcneKRtz/xsz0YGAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GII7mYxoW+jqiMWxhnJIuavuGxh3qE0fhn8kIlF9O1A=;
 b=wM1Bjv1r+POir9HGbFIgHy5cLRh9hwOInwe9J2IgS2udao5C3hGt9u+IhRzBsgxnuoxT6hYahqmEjifU+haOhOhefAmf9NK+fPekhHc0bKwr2CwvOr0E3KGS/tQI2xqfln5AyOFMFIHTlcmV4GGCeL+Mo6CoYk9+Jqn2BCEEbwqFyQIdB8UHlOCFN3j5SzO9dLzTJP1YphP5lDROh2Tx09DNCDiCKLUJ7e0ZP/IfYT9fk9Nfdhn6X8ggP+tGJV/pOiOxMXjvjHEb4UocpqP7SFCDAvRMKvn01sd3QyU481Zb3QjzVml8804/keKOMX+eqRdFmyTy8MQxMVkwrheOAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GII7mYxoW+jqiMWxhnJIuavuGxh3qE0fhn8kIlF9O1A=;
 b=FOqH3ar5eeUBhIy5pyaqZ1qqpXhGYiRT2GaCc6DEg2Ox305cEyBfIfhpCwQNu+T4dxSOWu5AB3Y/kuZJgACjvRayzTuIjSPjVIFNpaFdG4aQDY76ChYf+NEuHuckvKXmhGvHBsZYsdUy0cJ8lGzHh0m0fq8wvfJ5eVn6Ca38GZf3eYIsa/WqRExLnEjegtAaDgWVlZVHhUgUBT8Cq3Tfu/JpSXLq4qa6bwxrRyqOpzS0QRgABrtu33ddJftlqtpXeQD1QYSYEhUZHce1W6RQ2qPw7KgyEhNqV3Hm+56rIIgtyp/ZAd1b+0Mv9QdHRdtaMGVyo7K8JoVapL5X3y9q7w==
Received: from SJ0PR03CA0046.namprd03.prod.outlook.com (2603:10b6:a03:33e::21)
 by CH9PR10MB997858.namprd10.prod.outlook.com (2603:10b6:610:342::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.5; Wed, 7 Oct 2026
 16:26:05 +0000
Received: from CY8PEPF0000005A.namprd21.prod.outlook.com
 (2603:10b6:a03:33e:cafe::18) by SJ0PR03CA0046.outlook.office365.com
 (2603:10b6:a03:33e::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Wed, 7
 Oct 2026 16:26:05 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY8PEPF0000005A.mail.protection.outlook.com (10.167.247.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.3 via Frontend Transport; Wed, 7 Oct 2026 16:26:04 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 7 Oct
 2026 11:25:41 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 7 Oct
 2026 11:25:41 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 7 Oct 2026 11:25:41 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 697GPfOM546129;
	Wed, 7 Oct 2026 11:25:41 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 673569A9C2; Wed,  7 Oct 2026 11:25:40 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] u-boot-ti-mainline: Update to version: v2026.10
Date: Wed, 7 Oct 2026 11:25:40 -0500
Message-ID: <20261007162540.2513050-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261007161205.1402227-1-lcpdbld@list.ti.com>
References: <20261007161205.1402227-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PEPF0000005A:EE_|CH9PR10MB997858:EE_
X-MS-Office365-Filtering-Correlation-Id: 78a0544b-c6a9-4637-afd8-08df248faf46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|376014|23010399003|1800799024|6133799003|22082099003|18002099003|10067099003|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info: 
	7iuC0Aqk3x8cCUqMMP72vc97/iOByUCuzdQ6gmPpfRer/WFxeXr4hQ9i3i+QwUOrGAz7czF3LLAY0P0e7ygQL/m5pKvdStGlb9zh6FrF8Jl7C6iyqzaVjH2yla+/esbCJsL9nl2FhdmQEMS8HL4w/Bu9OsLDw7lNTPQqKIGmqBf4QhujvPdP6cJxnHjh3Ao7nEJ09S7Sp2/OR70u4v1BHKVOdTATOSEMLjU3y0mwtXAuQO5OBB26cOTDsjZTU6r4LEyIOZMKxM/K/p8cQLsiTDLNwVQXel9cW1+VCuYj89361cpU0u5/y4hZqYrD0Rijvt4hS2SPdSmnPN+gUCji9/UjQ3JYzlp9R1bZ1PzIMPX59pbXXYTr3ENd5OtWxI49pC59eWsm1lAmKoHsg4752+Nujf5tmSjqgeCXDk2wIRyE1sukSsU/DJcKJ1P67YE4MdWFw/eKEaNjxgH/X7UR2rVYmS+UZuQCcTrh8td7pEJ/Qm8W3FnUH/+8O3419Z5ckYE36aGExMgywmwOavnc7l8weRw4PlMxdkYdjrbY/z/rvhAR0qdIMz7A6YEBPHzjZtMu4a3+zPNspfinZH6NrdJrYcXs5o0MKahXBOxWcgSMu/uIM5VUiKmhre+OAxct5SbXsp467+DZiaxklW27cF1geiZjE4kiDNjhcjWP2eWLWK0vu+6B/WUrr4Kz1+6dxb9GoPaac7UMJ6ICl777ag==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(1800799024)(6133799003)(22082099003)(18002099003)(10067099003)(5023799004)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	3cO5w6VzS1aZG6r5+0/VF3CyIU8uGQhalzdWXEXAHdtOPGfxAqvcgejW2pAvliu0XTrM1HGKkERG/d7zXE8Eub9e/Y/mQJhbkDysjUJMtrXpJrQoVJ7+gLbIHM1aQXz4llwhAi1rL1MLOcOh6c88p4pUg4MyFvsQ2tNcwDEIblq2y2jPuoOhYBlmm00zByuHOMumRuVqDGwAz/v+XMd6rI1AeG4Qbb0S69O1y3lt3IvGplm9cNjqCFbR9sbyqN+45iRCLsO/7gjDGb9Z95XQgfUO7NnXcVkdtCGxvSFT9tUoGV+mk19vXopBm8EMeHoakrboKrACmwHj5HOUVVI2i1B5WHXFSeBKjhvDb4QUYo/SX7iW/ePFKVr2tFxQQFQ9snKuXBtvpk8i2II2dGB/uzxf0iT7Sr4uBRU70ZJsyb2Y5EqoLwKPOctXDvADxBgR
X-Exchange-RoutingPolicyChecked: 
	SHKJmuHxnaQSOk5Gp7ioTmoMfYOQWoSWfUDeTnWROfMMDnPPz0+FDSuuWZBUMNC033U1eyMyONh/I5a44YfMJqdU6a6D+865mn105zuq90XmumHMq/vv+IF5QsQCBl33E50f5IEZhFWMIQ21FAbhrez3eeLFxhkuw9tmLkykxgnL/NdnudffI8+hSEEV3vQ2YkMovSm4Pl0ge+HfJ7GFekYJOwlHJOqq7SJA388h5Hnh0ue/q1FDAu6JYuG/ml6KOWe3r5K4z3ZXrIPa6PexjipcEvnbXm0ajIuPvIQu7cLYrMh9g+YVfrJYEElB3YMCDI+hjKTNKUPs96GQWsYCgQ==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 16:26:04.8687
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78a0544b-c6a9-4637-afd8-08df248faf46
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY8PEPF0000005A.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH9PR10MB997858
X-Authority-Analysis: v=2.4 cv=TaYDJhQh c=1 sm=1 tr=0 ts=6ac6729f cx=c_pps
 a=ubRrNrA1i3DLWGMHTGxaeQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=GyV-Zatm1NBZ49CiBggA:9
X-Proofpoint-GUID: -j93Jyh08V8uZpItXltqfmwK5P_ZG2Dw
X-Proofpoint-ORIG-GUID: -j93Jyh08V8uZpItXltqfmwK5P_ZG2Dw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA2NSBTYWx0ZWRfX+Bcipt6EzfnD
 dQBhv5ckmjS8POWaJCoMiJaZo/sNNo8Pxdpb2jGYHpG5ICWO4EecCgnDYcCWO8Ic6RH1z/iYlgr
 FnT81Og4moWmUu60BGeZqLAQ6cHB2tw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA2NSBTYWx0ZWRfX/2vyI9kykP/Q
 qHNMVEfZFRdj37dT3p3yHl3QKLUiv3VQWhZv/yygws/AsT8aW21v3ljaaQhh4asrd8ubBjNP/H6
 W8rVNov7BWwqhmmYayd84Mvg4HbvMt0yNnnLMh716q1SWoaaTsDvkTqBPRw4PM+7G25Eh0D8vBl
 Mrw+DRbaO6QcJvahfGZPG3gr9821/NcaNl7r9ODXOvZsbdMRdsaq79B42OJzz09x6m+kpzhn9mn
 cFSI2b6WCS9tN2gq9E76lRPCTm29AU43gvjMbLapG6HeBCYvv1vru2l8zhBLcPzPX+rKvaiahcX
 jPD7MVFP594KE1RIuuZBHopY2/zWNolew08cRaNY+Od8rF8CwcP0SCYrQ4A/G+ESUov2e4ni5iP
 5DUfeLFpapMCtcLjDBpprUFlcQcoTmcKC94sH3EHwaLwjsLjZvPnZgb6ktFsgvErFv4OrtWtmqx
 E5BVIYwPH1e9IB2BpDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070065
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 07 Oct 2026 16:26:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20441

meta-ti / na / 20261007161205.1402227-1-lcpdbld

PRC Results: FAIL

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
- Patch Series: [meta-ti][master][PATCH] u-boot-ti-mainline: Update to version: v2026.10
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Wed, 7 Oct 2026 11:12:05 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 94dfe4ef2f7fb333ca555f82efe98e6dfbca2d9e

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: u-boot: Fix uboot_config for am62lxx
- Commit SHA: 2bd07c4cbfc422684c9842c1fb3a89d1c2785eec

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
  yocto-check-layers: FAIL
=========================================================
master - FAIL
=====================
ERROR: Nothing PROVIDES 'python3-pytz-native' (but <build-dir>/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-python-xmp-toolkit_2.1.0.bb DEPENDS on or otherwise requires it). Close matches:
ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.




