Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38075.1793175824736508641
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 28 Oct 2026 01:23:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=PwKxh4Ng;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=Fx29ATe9;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69S8Hl2W1625852;
	Wed, 28 Oct 2026 03:23:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=S7R3p9mU1omg4EUXAfA3gzf1daPLK9yyfVZr9SSL8
	+c=; b=PwKxh4NgKojW5q2+xWRSswB9vpNNIIiKwciPbD4H8NIOsw+0KUMEsHzan
	1na72KhrtJN2IoLJY0xv4VWsXSWJyTrsOpVy/Y7Xxb+T/onddfWrZaasESQT6LId
	G9gLYyiQKRf92tQNjBMj9e5MQnY9Q4+3J4eXKQNan/aIf9ZFPZNpNHDXkH2JWcnA
	F37JtUqYpYClkEPpkUmB+EWLVDpYNbbFrIGtacA3aQwnZ3wy8KBR00r1yJsJvarQ
	lTNI64416Iqt3T2mbAVR6czCZS0WXeFxWWOGh+tJYFcQiRZtEaLxU4rGLhp9u5Dg
	aS2WtFA/txP7U2msCFuQMTfGpVVDg==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013004.outbound.protection.outlook.com [40.107.201.4])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hk9ng9em4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 28 Oct 2026 03:23:43 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zRyKg18H3G8Pg2lFboS1ctvC+EZohSlThZiAt/Hmeoow7nf5k7auowL4gGGweMd/Pcr052ER45wxW/adPFZ8AVECaLhN62d3RgpcjrZORFMaq0ZsoyTdlu+h/SId85Ic/mCKLZh7vYtfR30dy7mpxsrgAHO47/isbfwiBXV8BV/QHrQhxM7dbtPy6wgW4RFpMpSkRRcxlUim3fJ51zMj35M10w6W58n89oiWzL86f40odzz+uavOKFv+TMaikenzL0Ezofufv9kpnMi7G1Ni4OXHFpODQ+BKc/vfPSDV03DwPhzDAEXHZVoQxux6VC59Nzi9ZXXy7tBV+jb+j6IGjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S7R3p9mU1omg4EUXAfA3gzf1daPLK9yyfVZr9SSL8+c=;
 b=W8CwDQnrl4tzWpPg7iyaOM5nDFAvID/12/kPGVojDLCAF4q6L9goSen41HgP756aiPIsv1zsnPnLv+De2nipKFzFBn02z/L5JJx4fwcdboHJCyeAFbjXmzIFjpf+YPlywjzIRuXMjsEc/8hh+ljV8h8pzNUbwb7ldhFfe774kmTJzPZSDHBrFwueC1YDDt7aE039libBOXiXWCoyChkBEiA265NpCtbgjsCsKP605H29DmW/79dsGzAhEdJa1YnIjJwjIVtI4yEiZpe/ozr++2FyeWj3GQI+mbmH+fU7RlhBlJBoPtnYvW9lfb55RJLWqA+DO9oJFp4xe6X3cwbfRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S7R3p9mU1omg4EUXAfA3gzf1daPLK9yyfVZr9SSL8+c=;
 b=Fx29ATe91qAVQOQea3+w4/8IrXpNS61BnZJ7n1uJgkKbIeDTMaY/UUWcA670Il7ppcsxf+WQ1u/MT/rbdpYEvxGHmozOK4HCw8cegA5yEAIHSofv7jRrnzXRT2KBZdZdJcoaanMeQv128Suqjggwv7XjiK2AL7AY7KtANKPtPWq39bED3e9B53OZv3jwBRfhEjX4R0PZqYuvl7xHx4b49z3yRCt1L9r0SAf2KrlO97hCA3nTbE66JaR9QWETMsmMi64zbgtpd/UgmNGcIDRUdrG2zs+aDr00ryLEsgAAQ72d6TSLwTyNCFBVWyE09S/4mAILLjFpYKD3pLciBPTFfw==
Received: from BN0PR08CA0006.namprd08.prod.outlook.com (2603:10b6:408:142::26)
 by SA1PR10MB997559.namprd10.prod.outlook.com (2603:10b6:806:4b8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 08:23:40 +0000
Received: from BN2PEPF000044A7.namprd04.prod.outlook.com
 (2603:10b6:408:142:cafe::5e) by BN0PR08CA0006.outlook.office365.com
 (2603:10b6:408:142::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Wed,
 28 Oct 2026 08:23:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF000044A7.mail.protection.outlook.com (10.167.243.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Wed, 28 Oct 2026 08:23:38 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 28 Oct
 2026 03:23:06 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 28 Oct
 2026 03:23:06 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 28 Oct 2026 03:23:06 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69S8N6pb379853;
	Wed, 28 Oct 2026 03:23:06 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id E89AB9A9C2; Wed, 28 Oct 2026 03:23:05 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202610262200
Date: Wed, 28 Oct 2026 03:23:05 -0500
Message-ID: <20261028082305.705418-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261028080138.1790936-1-lcpdbld@list.ti.com>
References: <20261028080138.1790936-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A7:EE_|SA1PR10MB997559:EE_
X-MS-Office365-Filtering-Correlation-Id: c19e99d1-75b0-4935-96ec-08df34ccc4e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|1800799024|22082099003|18002099003|261026140227099003|56012099006|10067099003|261022105027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: h/XrpjItxNs3y0lg0COGFk+QsJWnutSr1caubBgR4SxJDPMI+EdHKGAvl3mmIbLMsN3rIxQ/cGrXzjOtM0ka9Lclm0U3vt+HML/FGjQswFVKpeJyx98W9xaxQKwqt1w++GblLkXhA5Rgrxl92AcqztrCzHU6pDi1+rzTrz/9H20h4z/9ikYuooPmLUFN1BJGDFu5+l1cFQ2DuzrRmvMMc2msNAl+TX4W9AX1lwBd6+2hjDLHWN55DYWvliGK76e+PuzdMV2Ar/JXi0ko8mnaw38x9nl+I3xuhtd6GC0a2+lODPvrlvOeWAOR++AMseAP3YpnuKh+cMXaQDRVmSrzbggkhPUO5WoNiO1FaM104i9iT0fp5AI7/nepRlnNPagDQ0fokKm7j2yzxzgDIyWzk0eEU/7CBZwQV6p2K/10h709lEOxFwghpJ1T7hv1hrDVHlel0VxSy8Qbbos9xFDmXmzamfIZrCrbpqAgqyuIpvXgQ7ejjdybORm7fnXxf1R0ozE0bWrF0hyYNgLR6T+geutokNy+rqoGwiNYq4h8MwMPk44ZL2QWDYBkN5wbzmtXiw5vX/HWTV2QeMtEI9A24qFbKxEbXcXLtfRGPM5X2xu7Llf1aoezF7vsX/GObYK0nk50alZxFWGs1y2yky8xB+ssDxqzbHXXQASc7LGGkshKvPTUSfoKA9yTnSlyn+e5t8Ullu/KY2dEBHfe/JDJmw==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(261026140227099003)(56012099006)(10067099003)(261022105027099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: MX80A/6hKTJOxz8pcWbREafKA88A9yqwsi7T+Zrhpz48ON3wCsGTM55mevZ+yuoas5JlAxRX0wl0rBo0sPOH9I5kFc78SuTg7NWCUwYobr8KFPGV+Kf4BPj5nlmfz9o+ik8IpkUXxZkKXqfYst5smzqHfQVB+c47fzKl/zATedueGF9QT7e/zC4h4HuEjdLLSZzpGzTOc8RVNq2Oa22rJS4Kyevd6e+Wwe2Q0h+yGrnJs4PkiZ5L1vm/2kS8VYZcnTNP27qFhgMTqWmf0B6eEhYqtkBg0TPBtgdusjdz8n0wAesq5oUyrv9H4Gl3VX+CrLL8WxNT8GypnjoSpV82pG+pMqkjS9xiRo+VE50UKm3iwwQsOXdvJYwBLR7VxKeYejMmnWjo3DezchkgKq9A+OYWcB1N31QaQMeyD+ELQ+ZMyg6kmYRoQWT0phmc8Bi5
X-Exchange-RoutingPolicyChecked: c/xN2Vq82j402vrVtLPQEhjGQYzE8+oQpIdEDGg3jITZs16IUA7YMvT7LBNDxmskbo83jp+KZP3JWKlD+Ng2xtwXyWHtrT95njxEXNDlytiDzLgGndQ4TZbsRqmXZiaIkXY8XouVXLf44UaCE+qKN2p1L6BRQb8wLmvuFCyiPh5cBT2zmpDz3vLFwqRE/VXH3qqj5lXwNYvYDr0Bc7bfh8Epmx9//oQ3S3kdPBJj4i6bMnsWxgkVzoJIG0VRw5ciYXDFyoiI5rl7VR1HwJTFdb1spBBQLjha6Gnp/+7FP1BUFDdSxMoBGkI02Qi9kZbLvTS8BvM0lFiL5qHjJOvVow==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 08:23:38.9824
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c19e99d1-75b0-4935-96ec-08df34ccc4e1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB997559
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzMyBTYWx0ZWRfXzIuei1KKk6su
 nI49MWQjY2oTDuyIUFevEmgviZE17Afiw1ZmtZLC+2bbDc4g5aLfkmC8G5QgNS+a6YzmNPwqJQ5
 0OtDQAPVdNoHriDCEdrfez69fNFv1TE=
X-Authority-Analysis: v=2.4 cv=CJ+/zhrD c=1 sm=1 tr=0 ts=6ae1b10f cx=c_pps
 a=kUUFNZ5xtaGOIvhvlLDUWQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=khXFLvkMufsRtI9JafoA:9
X-Proofpoint-ORIG-GUID: gptxBEOxTgluXFfEGx9VkTvJGCCHvMER
X-Proofpoint-GUID: gptxBEOxTgluXFfEGx9VkTvJGCCHvMER
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzMyBTYWx0ZWRfX+d1GTfFQe9I5
 VRUbUpd17ujLdBfGKl+OlcfGyVQQgm0i2Kp/zoD4yqFhA+yxfOk82kp8+tOOe/kgOzQiWqoZ4ni
 jzchf45NDENauOMBPSnZZF9AL60hi0yB5GGbxMk1Gz6rvWyXuoGGxu3Mg/86QGsCUvaHswstcx6
 iKTJOhAr31tBV5JnhA90CQV1mbqYqyS6P9QC8qyHjgraE4rU/wXkgSnS3XHLtDYjshgJQcvmaGg
 hqJKZrvFqowOUB8BE2WcoGcNnFNojMhMqCANSC8AU7SvA4hPLnSRVnRTlrNjZ8lfcWDHK1bhdX2
 eBVPm4oJ19fM4AoTQXTtuUPyjEjyX2rMZmc6awKtgWgYHJkrT1F5LVgxApNFZudrL7ywKjiEDl3
 s6KnVxXk9uM8LVmeqaDQdVWG/rhxbQh3R9hYJvyLTQgzCbd1InrvX4ehUuHH8LEcVK8KxuiLl8H
 5rlzqqeUr+nPBKiuGsw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280033
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Wed, 28 Oct 2026 08:23:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20497
Content-Type: text/plain; charset="utf-8"

meta-ti / na / 20261028080138.1790936-1-lcpdbld

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
- Patch Series: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202610262200
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Wed, 28 Oct 2026 03:01:38 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: f1706fe114ba8708f398a71dda45688e8e23551b

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: u-boot: Fix uboot_config for am62lxx
- Commit SHA: fa4f19d3ce1bbbfdaa77b11ab7aab4c658f0aa28

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



