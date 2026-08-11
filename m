Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0888DC5B56A
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 20:43:21 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.64586.1786480993674211100
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Aug 2026 13:43:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=BxBteV1z;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=XsSBvHDX;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BJKKeb2523994;
	Tue, 11 Aug 2026 15:43:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=T7NCDHB/Cyy8W1FeiacCtrg39nblTIH1vpZAdz2ky
	v0=; b=BxBteV1zF6cNmSK0lxUGaN5xugOcQkBTrcpHPGxBVkgmIyk+3mdErn31m
	EXYZJtmFBpmueEZ36wWc7ERj/WCYcQa3griZ5PsygskAt/9RnMPaPSG+qwdR+RH8
	7XJLpfCbhAWKBG3MsEtj0Coh7dqVtC6l1+zYcGrWugP1UU42lN2Ww2ap3CmEpQoN
	0VqqlmPs3mjiyVshQ8p7Zqp+0coSPGUP6IkKgpkvaDydLhxSaqq/aXlIS+wvf0Q6
	0VuPhNiyaYTcEZD4t2fjhjN7+3787uxyD5pnUwKqMCZcm0nILuZgxnq9/1yX9bMr
	b14GHe6xFvN9z6lMWYFt9wAzVrqlw==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012068.outbound.protection.outlook.com [52.101.48.68])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4g00w4vba0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 11 Aug 2026 15:43:10 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LOu9VwY3QvS5Sc//qag2OIUfohluvYFvybPcDjKvCZkkug+qrB6/fEur9l0nmz5CfkHERF3EhZxcTR22c3J3Dz/7HO4yihz0qDzuwXPa/m8ms5qW7SoFaOwE0kecKBtVa2tJxQcAZUws/cttbeZpSQzuv+xB+7bX8TRn6ptpMCKSRi2oAZLrbyAKOkS3q4nPciqFEJJBFc+Q/pAvZkuiQtHvysrp7RYVKkO7VjBu0jcl4r0vb/be0ovecTUGF10d4cPF4FEC4YAFUh6MKrcC8vMtKN29p0e5cXBY/Bn1zz6Na4pefV3oGvVM4mkzKJ2SLiosB17ixMJaYepXEmEOhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T7NCDHB/Cyy8W1FeiacCtrg39nblTIH1vpZAdz2kyv0=;
 b=GqJ9nC6HqfmJhtK/MoFiDi4xkMT9twaT6pl2zECyYaVyZq8uvNUxD80Lk4gX2U60NynP6nIYo4Cqns1N2naPqogJABJXgtAStrBIwbSq2G8Mtsh4cDSofGGc4IJvgXSCHuHsoAoINaypvq4KAKNnsLh3JqPzOnTsqbaduH6Ima5maFPF7ehYLzzoo9Rq4GXJzCuEE1H49magH3B/dZLMO6P9pJct/3qIHKXn4LcAj0zuFLo2gWYdtwCxK8xGdrRQw/X1rUERZOHxOraoV8MqUez3+ENeIS3mZykovS5teK4ONzQxfVZ6RMMMqAC5g9sXxxWIYCPxEr9Vie2nBpEvjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T7NCDHB/Cyy8W1FeiacCtrg39nblTIH1vpZAdz2kyv0=;
 b=XsSBvHDXJH8DAUfI8wXMLpbuWjSHNb9G2+FEpaZhJyZQ1Edz0oJupJOLXAtnSuAaYa8OqnTFGRcZv3xl6QZPvgenGH0SsF7xL1vQsZuXb+UAu6B48M1PbS7ZcbNszOMFtnd2khTpQ1JkKruh/+jRJquVEDg3vK1i9C223w96lE15TcOf53MxRfnZ/z6IOdKvPltj7MPwb6he0enjlae48Nbf1CnMHmlCI+14qxIzX/xf6Sae+qbf4KIIuUsK2mYcc2hZHsIDP3sCINI/9QSoOhv2e9ziKMn4/DJjbiz7Gk5LFbvZTC4Uv6tjBu4bzYy5cHhCZjtztXyQNAaQBTI3kg==
Received: from BN9PR03CA0405.namprd03.prod.outlook.com (2603:10b6:408:111::20)
 by MN6PR10MB8165.namprd10.prod.outlook.com (2603:10b6:208:4fc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 20:43:03 +0000
Received: from BN3PEPF0000B072.namprd04.prod.outlook.com
 (2603:10b6:408:111:cafe::75) by BN9PR03CA0405.outlook.office365.com
 (2603:10b6:408:111::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.12 via Frontend Transport; Tue,
 11 Aug 2026 20:43:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN3PEPF0000B072.mail.protection.outlook.com (10.167.243.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Tue, 11 Aug 2026 20:43:02 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 11 Aug
 2026 15:42:45 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 11 Aug
 2026 15:42:45 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 11 Aug 2026 15:42:45 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67BKgjA72233128;
	Tue, 11 Aug 2026 15:42:45 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 926869ACF4; Tue, 11 Aug 2026 15:42:45 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>,
        "Denys Dmytriyenko (TI)"
	<denys@konsulko.com>
Subject: Re: [master][PATCH v2] weston: update bbappend for version 16.0.x
Date: Tue, 11 Aug 2026 15:42:45 -0500
Message-ID: <20260811204245.3013800-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260811202239.40060-1-denis@denix.org>
References: <20260811202239.40060-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B072:EE_|MN6PR10MB8165:EE_
X-MS-Office365-Filtering-Correlation-Id: e747e079-e77f-4e97-5a57-08def7e92371
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|23010399003|36860700016|18002099003|22082099003|56012099006|13003099007|10067099003;
X-Microsoft-Antispam-Message-Info: 
	WgZJzDlfuWb6uNHne01FnESLrPX2zLwOLwozTZCcy4YuS05wn5m43Tt8nZtpnQTK0+U+xOY4jpqSCDJeZ4BCNmEbuqeqVVoBUFXXfCXn6m+rakDquH8p6/3aaAai05C++thMYmF7UzWwo6ea7AE2hx4GpnRnA7eCAMcQrRKQeyVhmYHza0AuGDPkTXoqThxnq34Bcl8euyL1ZGArL5k+2EAY/mAd5AjCvi93tyFntMubTUFLxdj6Sadc8B6xr7Cl5WkjHJb9X0bmTnlrdcJnY/bUTnlTk+sPJDyhGjCVKwfR+QDgi6/7s7ILVly6VmKG5oq6Fpabt/PEoW3kcnttZDC+OfwV3PeYqpcUuAoBHK9KOkFFauEKci36yUtce6maBp98OgrgJVgzIwvParJY+Ow2jUzoVfiFno9c0xmPpBGgrgbhrkycgyH2kH6D60HfuKHywb8VuhFZTEQf88/YvdBHlEgrPbe8UdKi6Rvbe0V8I4KXO58cP7u2iRZd3OUCr0WDO9WFMBLmqzxcgr7UX04QM0T6LoY55ig/Py/M+0MycWSVK0Dcs6ZTHn7yjy+4MfXmGBgWNPHaS82mwAq2xvUyvrj3ZC9pcjYd0RDJaLKAc4JeFJNjBtc95XKcnNYkXAloTHEvTYYlx2QUOPGvvt/sUu4OiExpNG/ZGbJdRNa++ESANkEmp8yzQgCHSdQX3wyuGHwJQKghaHRjiPjGYA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(18002099003)(22082099003)(56012099006)(13003099007)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	qUffeScBdXDZ9UcypVvZBsJ5h2InUdN2t2oJ4uMLvs0auEf1e/WEuE7xaq8zJuM0FEVmZhyF8VW83AuCbYaHH3h0tyFWlGMUKcMQvuSPaJgAf21bfJAuZYHECRWsFD0FA3v1cbyhKBorrtL3Y9gGZkTMem2YaJfVjdmvWL72hJeFkG1Y/+EQE/db+VUhWQFEtnd3lPXojYEpydegOki9QBswDcnYzJGq9jNCXIlbox73HS6ERYSTzB4NpbOlEIVEQj+6JR+H9VGYf/04fEIIQpxzuuH86l7k3lIDGlZXA2sTl4XfSXOTInUGbP0m0ZiC5UWV32vNikqUhah0jIk/iYCSM/etkvZymxQIXd62JHMYLiJ8HIYs6c8F5LwgxRCQdNrupRq3h7ehHOYETK34AtNlB/AeUxDdU4JoqmZYdKjBZanaa94yB3EsxmipicQz
X-Exchange-RoutingPolicyChecked: 
	ZA8XVixsY47Q2ciLRLeJwC2gs/oxPAG385SFAVZkicyl4u6Vohs7r6Z/E04CJBjMhj5w0QcgwtUmkPyr+UWKcWy0f7MtdhpM7J62XBkjhKQn5r/40rsqToU8lRmylS828azdaTraZai8LuKhxEfvjaM9C4BhPq1/d6K7jNLMQwDDJtOelFy+lB3VyDKTbb8oubPeYIoX2lDkZyadB9W3EbrEgYYNjcIG+8a42eqELpd+aYMx1XGRL1G2jZBT7dG9TzYkNuxBj6c14jeiwVhFoMbWUnGlKUbp/EoNvLMJ4MOPsxXwj+JthPmZC9jOQ7ideNnMP/hvz+PCbTwQ8ElViw==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 20:43:02.6115
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e747e079-e77f-4e97-5a57-08def7e92371
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B072.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8165
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDE3NCBTYWx0ZWRfX/L3ecCpFEZMt
 sXU4Kk62xjvyBpL9G6IGhyI1a6eSBdd7HiCiNDLXi8r1M0w6H7+5OtTvOiRza0th9jnk2ZYkNb7
 VguikJx/jz7U5HTyayPPteKOAWl57vx+WPQsM+Gq8x2zyFYyUuPS3B9pm58JOCOBB8wdBXJJS0S
 of520GXgNaybxQCdzxVJDq8YB39tmP1VJw6Ir1llZNKDYVZI13eD5jMlA8/hJOWZwPb2THdHxtP
 iHgpDLi18Rj+2Ai8rrmPzVplt/AaWxYtNVWq6pawQeJeg7GZWZqf6gPO8Bgy4F6jkjlrk0gGdnE
 z5XDPbnEmqRZTxFZqzgEujH1U3kcx7v4IViXIbkiYwkBZwUA5/XAimuBgRbhO2DMrnxSUfcCxgl
 Nu8BDQYAK7dgy/ow7kgjMG1NZ78H6m6KEqQVjXv+4rHFExiNbxAujMyPNqY71nYekStovqZ46uW
 JcY/PzLkGeN3LQ+aITQ==
X-Proofpoint-ORIG-GUID: Wz6zWE4x_aDr30K8jJELTdaDL7Xh2SIO
X-Authority-Analysis: v=2.4 cv=KZ/idwYD c=1 sm=1 tr=0 ts=6a7b895e cx=c_pps
 a=+ZJ6xWA4Xs4q+gTfm6sIbw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=iGHA9ds3AAAA:8 a=0gcC27t9AAAA:8 a=k-42gJp3AAAA:8 a=sozttTNsAAAA:8
 a=QX4gbG5DAAAA:8 a=GQFkmZzEIkWNBXhqoMwA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=f5sM90hAhNS9OGT-JDKn:22 a=uCSXFHLys93vLW5PjgO_:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: Wz6zWE4x_aDr30K8jJELTdaDL7Xh2SIO
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDE3NCBTYWx0ZWRfXxpsGTLQLeP4b
 ryhpbV9wLgkbupzNdW6JLghO5lJySFruUaAJZo991AH6Mnrsf8kJexhD4rm0YOHDBOCVnl/2TGU
 xhVItc0DWjeiXvf17WWae18MGN1BWPU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_05,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110174
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 11 Aug 2026 20:43:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20254

meta-ti / na / 20260811202239.40060-1-denis

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [master][PATCH v2] weston: update bbappend for version 16.0.x
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
    
    WARN: Missing Signed-off-by by sender in commit message. (SIGNED-OFF-BY-2)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [master][PATCH v2] weston: update bbappend for version 16.0.x
- Submitter: From: Denys Dmytriyenko <denis@denix.org>
From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
 From: Ryan Eatmon <reatmon@ti.com>
-From: Derek Foreman <derek.foreman@collabora.com>
- Date: Date: Tue, 11 Aug 2026 16:22:39 -0400
 Date: Tue, 24 Mar 2026 10:52:59 -0500
-Date: Wed, 27 May 2026 14:12:36 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 6ce9ec084ed69f510a9a20bd87038890329ddfaa

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202608102200
- Commit SHA: 840fd81c7bfa09e4aa2031594ab27b1765877f68

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




