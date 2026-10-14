Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C99E8CC6B2C
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 20:52:12 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24896.1792011124764840593
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 14 Oct 2026 13:52:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=aUnFNTpf;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=QrmsR1OW;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69EJ53h93508895
	for <meta-ti@lists.yoctoproject.org>; Wed, 14 Oct 2026 15:52:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=onftqJXCnUKnjJ/XYa4SWWNvxc8cksyPGik5x0PKl
	Cg=; b=aUnFNTpfiJUO+mKF/+gUQjrHSZ+p7DE0HUhCiMnmmXed7rqu/o/OpLVbg
	iHA1jtiAU1LxO9JLXeetOJgWpZRlNKKJeuo/Se7D7vgprS3WcMn1wo0blhb21wJs
	r2lnXbyCNqWp3yfn0lU5vHp4Hz6NofIYhLnc6/IbtKPmSjWBLqq8KbcZAdfBpIM8
	Z/k5caIE5VyNi+QVjY4IbV8/sEK9Cp1yCSLFNXe1XZ3gKjTE6lhN/HxbKToXtko+
	bcdjyY34cnNY38xUqndmAVJtCQBSN00XUxYwxV0CpScyuHuVcKpqIUMzyvLXiWuO
	o1iL6FgMONZs1f/K0cBKKjAu/hcrQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012054.outbound.protection.outlook.com [40.93.195.54])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hafk70h6g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Wed, 14 Oct 2026 15:52:04 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HB7rHS8v9yY/y7CopmfWl8XUoV9oZJF3ftFWDjsr0W80IIQqxLEdkk4n1sxoMfnfjluQKTI8n7rrIm5UdSdIKikbwtLHlUAKasmlWQS2yPkEQQ5QGr/2JizrM3uBJ+b5v7v5444LS/wi1607SYrIzOxOmTTC6pAr8shttLmGcAPL47hKefAd08O8ffgWPNmcgZE415INa9xJXOJTl5brM+TY09v2D8DcbY3PmUkjzCNgSbwYhRIrfYrhkT3lfzESVr5In7IXlpnYQeHT7U5AjiMAwUX18dK/+Qq9I4wak02nxYj4MAkRbyk6JaXk5G4x3rxFp37QiICvVttPJRgF5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=onftqJXCnUKnjJ/XYa4SWWNvxc8cksyPGik5x0PKlCg=;
 b=V10LEBnqKeVMQsMLfrWRgSpUJkOhjkf3ZjG7lB00H0AGWvaZj6mpXaXeuQNuSoJht3z8yiJFlb2qivI3lQUffJ/HjQmHdbrpcy9cvk4sB7v5XAhwxmawpl9a0Udf0FMb+ABBYa3IwBpaYlHVuXlMpJyR6PwOM/OzecLj4JUGWeKCpeElrUwjsrQ4wQNieLenOoWWUBpnZYqxC+XgPDWe4jj7Pw17GMuBAjD4597l3jfy8Y6IKiwLjSsePuMSqOSBzAyuRImLihzZenH/vwEjO1L8cThJlez26ohGRQNVIblCZS7h9k4nuEMFmsiNBmHLWizrZOI5KF7YPTMnlesIjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=onftqJXCnUKnjJ/XYa4SWWNvxc8cksyPGik5x0PKlCg=;
 b=QrmsR1OWKE8kTERMJE1i59qm9ctkMCAIQizTfPhKu+P2utKaqowXK7h0Tn5TqD512r7h7vWVUVrIxCenM7WlnDGnHK8s1q2My183la9drqucqtxdFNSbt2khLYNFp1/3+vSTKxHsLir/eZyWWKEn9qXkMelm9Yibd9jJ6S6bXRWSgC8zBIXMnInA0hn+pXn4X4pDcSeMfg0OzqJ10W53ExK7B5tj7E+Wo1Unsy6/BRGWIq6Jyz9Y7653T6DApWCM105zN01Djz8350irckoGpG/sGlBmIu5meIrqaV3phaqbpZhqWIZPCEj72pp+gDkSuV4P/GRNM9SEIlZBK2kwoQ==
Received: from BN0PR04CA0101.namprd04.prod.outlook.com (2603:10b6:408:ec::16)
 by MN7PR10MB862668.namprd10.prod.outlook.com (2603:10b6:208:5f7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.7; Wed, 14 Oct
 2026 20:52:00 +0000
Received: from IA0PEPF00000041.namprd04.prod.outlook.com
 (2603:10b6:408:ec:cafe::19) by BN0PR04CA0101.outlook.office365.com
 (2603:10b6:408:ec::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Wed, 14
 Oct 2026 20:52:00 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 IA0PEPF00000041.mail.protection.outlook.com (10.167.249.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Wed, 14 Oct 2026 20:51:59 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 14 Oct
 2026 15:51:23 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 14 Oct
 2026 15:51:23 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 14 Oct 2026 15:51:23 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69EKpNGe2494748;
	Wed, 14 Oct 2026 15:51:23 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id BFB179A9C3; Wed, 14 Oct 2026 15:51:22 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Thorsten Lannynd <t-lannynd@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <rs@ti.com>,
        <detheridge@ti.com>, <b-brnich@ti.com>
Subject: Re: [meta-ti][scarthgap][PATCH] meta-ti-bsp: flutter: fix nativesdk-flutter-engine-sdk build failures
Date: Wed, 14 Oct 2026 15:51:22 -0500
Message-ID: <20261014205122.3794310-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261014204330.2837679-1-t-lannynd@ti.com>
References: <20261014204330.2837679-1-t-lannynd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PEPF00000041:EE_|MN7PR10MB862668:EE_
X-MS-Office365-Filtering-Correlation-Id: 65c8fa4a-2bd8-4da3-625c-08df2a34fdc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|376014|1800799024|22082099003|18002099003|10067099003|13003099007|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	sV3oZQcygbbGHRAu3eJzV1IVIe7ahjfcl10C6a7npY0jMZeRGnMQrFwwYzcFFSPP7GeeTQZz3dR8ZZmcQruw0c6kpxk8Bf/14QWXkMIV7v2Yy8BI9QWv2cUNXQhuuv/Tn2hrv4t/joR0yFY2Wg1wwHd/svnTuRXjS9jWBuUmQYGPQk6yaW+He+t1R4GOQp9KCPVSj3l6sy0YpNeFFIPFT0KwYEAk0TGoGcIPJ/w7Zv8noDzrRYbbYeRURPNVZfK2wWdVrB/BqAjMZ1Mrib5XyHfp5sGYxC9cPSmSjPmvs9eqxsMZ+6RuZxN38BGExhmOvXxu1QwD47DXyg81Hn1nXfTAmFdl6v0AQM0xtnMm55biJjhUnYKxo+yc8PqQ1Z0esAgrXblNnQEqCn1un3pRTTjQIK3ca+unwFlF8vCkxv9Va65nM5LP9/kNb1Qm7Xepv03+/tDqHvASlOxm9gzqvXzs2eEshbZSYawy5TeKmq5Bo2DGVztVeMBQySTPBRxQrfQxporUYiLbGJoo46b43S2yaKZqQFtadns8c5TNq+hsd7AGtoIu2p0LHvK5b4Fz1kW0uPKn8q5Zidnze5+OrOCGvciuVz6GSP9X3AokiqXhJ4WliWyVIIry0wNqkmv/Z6S/16T5s9yMS2Jnt+qjyg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(376014)(1800799024)(22082099003)(18002099003)(10067099003)(13003099007)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	9YX4VTrc28vIid77V5Sj8QGcWILO4aOO5KWiLXcgG8Lv/ywfcyDxz8RSFaWrYu8gXCXlAwItqKlYlqb0rGMl2ZxUMl/a8EIceBW/smE44YHvZLRavm1IPT3idpIvjTk+1rjlE93pl2yOskBR/6bGxMFm5Vtu+6aVWkPuhxTMImBexeF1p1cN2lt1Jo6/ufG1NG3uzAG9ozNDhRaFuMSNGLOYTvhgebbWBEpBW6zW6VY7+7J3UD3LATEBZSNGmfbGWfun17XKa0n7DvN5U4DM9rwYYZTduVTUsxpXfYwOKHTn6NmK3xwm+cDD9l2Pg+w+u/SV129Bj8Bu1nTYYtIC2s1YeSNDMsNCPNfsRzyNFBjcvh01NVrmGN228/8PTfKEEIwaYeSLLRfYp26SW2kO+lqx8rzb/ezX1g8S+QebD67Hkx2rv7gnhfMQcuYXTyeI
X-Exchange-RoutingPolicyChecked: 
	K8CIw/WTyda8In+c89b7K4oz+IjvuLtmlH/5fZOMgF9ANWlC71Kvrdumhkse7G3Lb8yjyBCFlfhNl/uiNMeWVBJ9u8pDCd6RATlGyz8dhgTvTA4Q36eSxQba47Z0BRQPZUTyluxhQzC2IR+EMBh+bk6IQI/Encct3Cw/DTNRE6bLRNYupWJ6/NWx0Da2G5C0Hzap4Z67MrgaVIc5Bj+0t4iEI5Iao2Hh6XB8doLkdOqKDhHobLGKaDbeq0vfS8VHDRpAHrI95f/tHQZUYHAMQBAqT8Ruh6/InBPuPPRHSvyD9qbussM7v7sNYWR+eZ2WLZjKILQh9k8jjQhyOmQ0Ng==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 20:51:59.3137
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65c8fa4a-2bd8-4da3-625c-08df2a34fdc9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	IA0PEPF00000041.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN7PR10MB862668
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA4MiBTYWx0ZWRfXxzViyve1XHf3
 tz5GBf/g+acait0jS59XKcw75rQiwlDbWIyv25hRfWKQvd5cM6stTe2T3eHsHLrAH0cIOdjv2lK
 84b5DCx776tpZCWk+HwtFIqL+gJvLkw=
X-Proofpoint-GUID: RYGbxuRHn3ZgSEn2iUrh0oMY3pHmafsS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA4MiBTYWx0ZWRfX0R+HdYf3hND3
 7ipR9LBE4cYqrFFHx7wE+e4D/gUQdt20hzzdwF9FANtU3VsqUP6OtvnQFJ7R2+qWJyrwznU0Bpx
 QDNNSEx401JfQyyAoHj72SxmUdgTwjt1BtwmXFE4s7blngQ5ZLbofAaLJk5dQRXUCu7pGkYbwjy
 2HMkLo+HhncEK3J/cYz0azy4hFLkiFEtgTWMeV2qWj5uOGoRAdZ2Glk4pOHrYoEM1vV/L2fwOlh
 wAafQMOzSde9xwf7J1qGktK7Oz5iLhh4ifUCdvu/ptO7qBMC7hsSKr85PtgYnBmmZdd8xz/Sj9z
 q58o1BezTko9uxdwQrvE9VIs1iW2EoWfg5LTmc36Z4dZOtsQl6sPwaWCmHC9T5vxpKY+EjZmRvI
 qLBCmhcypjC8S3vMM1Il12mLcbzFskCjLdEC1vXF+V+qeJNe8UmwSa3p2JG54hjPJ5fmdlFk5h0
 jTfpGdzRr0j6v7bu7dQ==
X-Proofpoint-ORIG-GUID: RYGbxuRHn3ZgSEn2iUrh0oMY3pHmafsS
X-Authority-Analysis: v=2.4 cv=A6r5rKWG c=1 sm=1 tr=0 ts=6acfeb74 cx=c_pps
 a=vzv6YJZFwQv9rWyERtU3yg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=v2BhqJmS_gO9_GPXN-4A:9
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 suspectscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140082
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 14 Oct 2026 20:52:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20458

meta-ti / na / 20261014204330.2837679-1-t-lannynd

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-ti][scarthgap][PATCH] meta-ti-bsp: flutter: fix nativesdk-flutter-engine-sdk build failures
    WARN: Commit message does not include file/recipe name: meta-ti-bsp: flutter: fix nativesdk-flutter-engine-sdk build failures. (COMMIT-MESSAGE-2)
        patch
    
    WARN: Commit message should not include directory path to recipe: meta-ti-bsp: flutter: fix nativesdk-flutter-engine-sdk build failures.
              meta-ti-bsp (COMMIT-MESSAGE-3)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
scarthgap
=====================
Summary:
- Patch Series: [meta-ti][scarthgap][PATCH] meta-ti-bsp: flutter: fix nativesdk-flutter-engine-sdk build failures
- Submitter: From: Thorsten Lannynd <t-lannynd@ti.com>
- Date: Date: Wed, 14 Oct 2026 15:43:30 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: e982506005ed161ad0ba14ada3fc825f30e66a39

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202608190946
- Commit SHA: ef43a90c91d5a9754b2f28f09debd553fbc6a2d5

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: FAIL
=========================================================
scarthgap
=====================
FAIL
    WARN: .bbappend files might need a guard to make them check-layer compliant. (GUARD-1)
        meta-ti-bsp/dynamic-layers/flutter-layer/recipes-graphics/flutter-engine/flutter-engine-sdk_git.bbappend
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887




