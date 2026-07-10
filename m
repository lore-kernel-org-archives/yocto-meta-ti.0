Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15BA9C43458
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 16:25:53 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1680.1783700748987292001
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 10 Jul 2026 09:25:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=lFT1HWGI;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=Z2e9oDw3;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66AEajfK3030815;
	Fri, 10 Jul 2026 11:25:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=yd33FRU9dY9uAGIO+eK7x8u7GRaJQzMpP1IRfFiAT
	Uw=; b=lFT1HWGI9WOs9s7d0EoFQF38YihHk1PT2eKXIDwO/tlssBvCSBIggVbgH
	pQ/LUY9TYLtbAuI+q5NY8PJvI1vjwSxwaOaiXQMWd9tIS3HFTc3AYmDdNOrrUQsn
	L+g5IRXvgc7eOm5gK+tYM6xAPqCZus/caW00GFh2t7m0xRE941grPdGktE28CBgT
	Ye+SyrZMvKz32mE1FVm6ikoMM6oT/4ykJE/mDsMI9FMqvqDYLqgm4gfNDc1T8Kah
	IOLXos2dYJiw5S3cqOo70JicuSoCEg2anPVsNhKl43mxZSsgAsq3ZwXBFq4TWgXT
	6bJxM5mib3M76f7CuIMGVpxIjE1YA==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012056.outbound.protection.outlook.com [40.107.209.56])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fb0pj9gkj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 10 Jul 2026 11:25:47 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uMXkG9L01biYxqGlpJtfS/XelbszC4vzGkggFUICAAshe0KMxu4/E/ixSESbRAw8/f+hCYIGyX7uOEKrksp691JBBJA2TRLtSwWxh3u+i6ZhYLkVbUDUH2VCputhk3Q5a9F1ib9hZ3GCTMFDumhXPsdQmVEPFbcfLn5uuJ7mJV0PJDrnkQW4hPiRsM22jYuiiQP4d0sFxVmv3iKI1I/FJsJWNRr3HmsFx3ftPB5Vs2+r+2w21XXVyQKl/CiCP0B2IxexV8mcysMkYXFWEEVTNraIyRaM+tQz8x9dPBeAhBvCpZgP29v1Yppnt7KyqbtXBzgpj33UIyaAxE0CeLFjaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yd33FRU9dY9uAGIO+eK7x8u7GRaJQzMpP1IRfFiATUw=;
 b=VMVWC44L7BWV2WYyltX70zNihqkbFNVfzt0Twt40WlTX/NVgxUVIph+GHJqjM0IKPHnmdoefp6rkxkwI60BJZnJzbpO/wT30HBFxE6rSP1829wXSJY+r/u0roMtB/+wbvaqXzZMOWkMGG1MsDfaYnGPOQWEyboJXOHMMTbfFjwIFuLPpZY0CjPqWCSaraez61Mf+pqgiMYk10mCGbyrUA0/+Q4Or8o3SDFFeh7P7FhF+clxDn5cS3jRTrKPBZ94V6kwK0cwLAddamhFDVyFAaw5Ll7cgCFt7n1aCYGINJfgp1liX3IYHRUHKQoQuwTel/qLaHoZK3wJr+k3X3jfEzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yd33FRU9dY9uAGIO+eK7x8u7GRaJQzMpP1IRfFiATUw=;
 b=Z2e9oDw3kaFAPsatXGY4OslE96nK0EILa+8VAlb/ZyL9pcX61zt08RJdpEJKZrzLSLIqCrMBihizvBVvFE0C/89Tackr3yIsnsr3Lz9u1e8lpAs/z7qQUtgdXeIf+OB++oUCeqpZnAQ7J3TDTponr7Qsd8ygySpI4gwJKoX5FAutz3rRKZY3J/zWJMBy+j8+ekYQkO8T0P0YKcPHkgl5ImduTy7tuuNLxHZc+P4uEP0z4uFbw1ec44dK5slPqhdt+Ilt+BOvRmk92QGlgAijMaUq+iRM5pO86vNxiaVP5u+8CsyPaE8iimp4jYPY5bSBhWF7RsnSYY3wQc55u3xQCg==
Received: from DS7PR06CA0043.namprd06.prod.outlook.com (2603:10b6:8:54::25) by
 IA3PR10MB8681.namprd10.prod.outlook.com (2603:10b6:208:577::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.17; Fri, 10 Jul 2026 16:25:43 +0000
Received: from CY4PEPF0000E9DB.namprd05.prod.outlook.com
 (2603:10b6:8:54:cafe::d) by DS7PR06CA0043.outlook.office365.com
 (2603:10b6:8:54::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.13 via Frontend Transport; Fri,
 10 Jul 2026 16:25:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000E9DB.mail.protection.outlook.com (10.167.241.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 10 Jul 2026 16:25:41 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 10 Jul
 2026 11:25:41 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 10 Jul
 2026 11:25:41 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 10 Jul 2026 11:25:41 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66AGPfnD1071002;
	Fri, 10 Jul 2026 11:25:41 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 59D61138B5B; Fri, 10 Jul 2026 11:25:41 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][wrynose][PATCH] CI/CD Auto-Merger: cicd.wrynose.202607100005
Date: Fri, 10 Jul 2026 11:25:41 -0500
Message-ID: <20260710162541.2905248-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260710162153.844293-1-lcpdbld@list.ti.com>
References: <20260710162153.844293-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DB:EE_|IA3PR10MB8681:EE_
X-MS-Office365-Filtering-Correlation-Id: f4a65047-97de-4a42-e5e5-08dede9fe2d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|23010399003|36860700016|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	vhejeP83NdP24oKJaV6qcYitrWsWcjJIdt4hEbOn2mEveZ5kS3Tfwl940+ekH33BDUTMxE3WMOA9hDiaQxD4CYuDr6vFy+wAWXCbfIQlVac7+QxhEQMqPq2WDkG7U3w3VXHXqjD2jNs7NwZn8mQv0RxQP4Cqma2pDWv020B9lfv6X3aXJbg30XRGhXbmUPcjtZ1uM57eV0C2vOY3tNGk0lrD9X/swjlkWa/nCW5jTxeIP4WlULGbo6tkzlmT1T8rWJ4K3vpqp9nWEuDbdihhvji0FdZZmtJ7Z+VgtSd2ntx1lR13GwFLUxrj5XEoxZIjk+zf8Ry/u2JozaBucwCLiK2XdmzHiEEPYoRVWMOZ1T2/+jGMUG3LkU7nXUdwdF2IJNBfa1oKUczMJvH1X6DoQ41qiO1si4MnFJjP91G7kG6p4QRSF3Lx3P0RwrCTimBPTKxYzNSBzpvgLkhe//5cnZkT2S3EIyOt3YL1ynSipPH81HGLKuA6Lks/q7b56wU6f5rkIOlq/An/TqfK3P/GXWZ8vMqLicZuCxPTZ+nk2CBeT+zoTLSlX369LAHAZUyqQXnUmNLQcpt8vsv4gYvef58rptHvlAO/2o4m3+iFNCL/HGsIOPFvCCm9JRv1lXVCVBJ17e4/oXpfVZMk0Yd0aaxNCGMXWL9qe2TG6+/ewwsB9sKv+Wkj/+nYRxQ1qlgib+ojm9T8seqhGF71SxyI3g==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(23010399003)(36860700016)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	xNgMVmPpxxjbJXbJAxIOuNRHMNzEHRp3wZPgzV0JIRWDsy633Pw7djJfenEQGRSIG7aPWCKzT2wuTZxyPpyERoyqBINPcrU/ZxgQBSs8uUue/Dw9iazVkB32PORluafgYPlOxGaLMOKDzWnkWcik2ObbW7Dice/OecMHTzTVil9GbE2HKb9v97KKvwwIjQLD40Rl58txENdHeiXOcXxLHcH8VVJxoC1xHoRkzOBrEZatrTvLszE7qUebdBfhlvDJGutcXFyIdMirXF+fj6kFp6qGdsHLbRBKiCDM3SH6dYWfbadm1MSJSOSYGQByUx7in+RRr34HstsrpKLnyylgmT9IPx8zPvfWQBZJ+q/6Rt2DymHFyZo/O0VtmOIhxgusbbi5TXI8HlaRdcmyaztQfYSocgDwjAqU/JI9s+kKCJzy5oRG/Ee844AIBBKxTTcK
X-Exchange-RoutingPolicyChecked: 
	ZwptErUVS2x+MKGiTsgtGqWIiO9iQVPNVlO1cwCsDGMLwFigY4Uo7hSn+p+EuUODxUDgcWDlVFvL+MIxU2mfwGOjlSBhHHkZuMTD5raDB9jDPzkvzdu1nsbpiH/pWCJcAnyGFcQ2l8SF3suuB9SOKsPJw6sDuwepIDorX7AWJAFAsZc/QI4amIYDYWODHebd1y9ebxi5tXilr2UxJWA+BCNrSQJzdSuv758doQhakReIF5moHOOv7tsvPF2FH92hdTxHkK/UUPLwyUPUm6SlzR3oME8q366K87/NRlUKwu9lh05GH52ZZrNyFem/BJnRPysAxEr+Nn8HbYduy216LA==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 16:25:41.9347
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4a65047-97de-4a42-e5e5-08dede9fe2d7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9DB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8681
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDE2NCBTYWx0ZWRfX5SpwpAwjYmrg
 PO03oEQJi4illKK90mIFc6TUUOJracsY8cagKKhNPAhUubqVbLZSBY58bEk0fWmEgXlsH//cv9o
 3GKdhgKV3eukRNZ25CKopGIB+lIveMk=
X-Proofpoint-ORIG-GUID: ccxh92jfhVlmdBuIFIdKuFhX7vHCbhCi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDE2NCBTYWx0ZWRfX7SXAvNFW3F3y
 kx/CnxFtBXBGBgtfHBB3l4VECgxxOta+TbkAodPF9a5mLO5yzy+2nW8mfhI/s3JRtHZai6X+bSr
 WZCxFDA6CmS3txKqZv+X96DKdL1OVUKwcWo4rlpPf8xkod4kSLHM9Ang2XmXPkOTFnbts3j1UYa
 JExIg6WAdP1Of2LoFBLoVhakwmlPmypnmxo20ApMUGORBrdCycGq8yMOsaYOIdnz6eQL/3RVNby
 StKlCSLVaajTb13t22idUHAugP8PPtw3XPEgnynWI4oi0rxsCtLQtAqGx9HIEyBNnO+cAREJJ2r
 HJbbYrTv0rouvcsIhqWqE13t3F66iodzJCBVbB80yFHJe1zzJn8vPBlBCv7C6NOnxnc7w3fIz26
 HM0NgRk8Bn4pChK6QlTmsFhN5NMdMOHYRKal6yCaem55qCZGpExjAF3osmJjtB/26nhJsC0gsLz
 CjWsYS2ZLt9jne+x0zg==
X-Authority-Analysis: v=2.4 cv=APvaEmnn c=1 sm=1 tr=0 ts=6a511d0b cx=c_pps
 a=jAY+Yiv4fe/m5iF0AiXt4Q==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=bhFvGhF3xvoJ8gZflcMA:9
X-Proofpoint-GUID: ccxh92jfhVlmdBuIFIdKuFhX7vHCbhCi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 clxscore=1015 spamscore=0
 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100164
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 10 Jul 2026 16:25:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20137

meta-ti / na / 20260710162153.844293-1-lcpdbld

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
- Patch Series: [meta-ti][wrynose][PATCH] CI/CD Auto-Merger: cicd.wrynose.202607100005
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Fri, 10 Jul 2026 11:21:53 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: c1062a97383d0c8a1207a47984d662ded965633b

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.wrynose.202607100005
- Commit SHA: 42b887f0b110eecb91744625bd4db09b1ea59770

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




