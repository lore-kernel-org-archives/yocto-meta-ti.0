Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 900CFC55173
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 22:32:19 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2900.1785537133916020186
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 31 Jul 2026 15:32:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=WdXn69Ch;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=aGvI55eX;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66VLxn6r2400153;
	Fri, 31 Jul 2026 17:32:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=WE8nsWx2sNxCGgTP9Enc/xTBkh5fc+JKcLuUAroMQ
	9o=; b=WdXn69ChdrXI4PkF3DJjMZrfwWsCKG2ClvE/CydPfaMFwkgXsz8T3TsBq
	YlA+VFM8XZzihrzAYGwf372bgFapujc2I6mcOcYkKVTSfAT7pOt1TV5PwELf4nzE
	66CLvVw4ryuL7aONHbfwICZtDsw9LjXNNhARl33rcgxl3BbHXqyxOnZV6MScwcxL
	lAmlvRowlc9Jk+Rrx+CPWY13K6QUzm9EkV874o/yOn5beymgb2eRfCnCk5fQEyzg
	yRWumHgsjaKbORWtJXSEQi+hqzQ/27e+obBhfVF2ERMNgj9ym92gD+ph8dzHY3g5
	F/NanANhhvt69FxmgEW88wE3MSCrw==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012059.outbound.protection.outlook.com [52.101.43.59])
	by m0384305.ppops.net (PPS) with ESMTPS id 4frur8kjda-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 31 Jul 2026 17:32:12 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hazJUh6NRC5/FA417piUUsHz9UYBZ04Mwv1W6+A5wzcIMf0iJ5pOMITfgKoS/8paRKla0PFM/sy9ZeoXFWJPTw9qdcf72miqBSHcnFGWtyrF82PBqx2yys/0G38Nlg0FFJSAa9Pd1t9DN4itT8ThfO9mhy+ZCAVuVYfev/o0n9mwwF002bSA8NRfSlIM2vAms3Bang9vpiOIuENOxIqQqB+gaeRw0rGh9hdc86HQR3C7Y6AVojV3xFg093dMJRqyv9fxo8CjhQbAw9q8Y9v9jeZ13OA5DTxEmqHTkjMS6CsYp8Tgq2hjwenJLuhfjogQwKmYk2ovS71+HZSOHhAtbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WE8nsWx2sNxCGgTP9Enc/xTBkh5fc+JKcLuUAroMQ9o=;
 b=SWmXEAbuBoB1d9Oj9OzNdS1o8ILsZqoXH2OFxTJcq0q9GBSrOq29WXa81OSNIgtmSTmCaDdGMmVR2sxLyrg4kZAhCZnILYMfxttKLI8ciHpGjMlnGEWIyY+e7R54PbCk11TWoGYNOcKmPItcbtR6DvONfoL2bA5ibC5/43Fae9eI6tOvcxiCqEMsOR82Z0YRm3sUi/8dO2T61QIW11UKC42dF/Fuff3FHFxcHbwup8QCKV3lxkG/ewN5EqXe5smq5KYYUk324wugBCmxTo0k1hQFq6AvWcEOWeS7gcuyMsOnj0GD4hbXutCgwAlXVibD4RbQOYAqtNcDsimWxwLksg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WE8nsWx2sNxCGgTP9Enc/xTBkh5fc+JKcLuUAroMQ9o=;
 b=aGvI55eXdYzLqJ/9pACD8APnGguXVdEaBY9NLqHOYtGpo00MDQFcPaHlctIN0v0Zx5bRZidZKgRoL7gGz5W71dnpYbUHG1d8Ypr6M0+COn2V7gb2g5WnfC74qDrGvDidUwefk9XIhC+GFyGAPfGzpHSqUnU170wwsKhYomEQSKm+BRFowGmg9tTKK72D3GCxiKbNZVlGT0R4/tBfeH+ahwvzKpC9uXegveIEghUnExXzzeDLpDZdh610DE5b0dzDfroy5/ySNNXRpJVozoxiugK9Yxoo6MulAUlZGxkZY83ntYrSKaJCzLHfASBSzp3v1rNkUbWTGfqPvtKlmIs2JQ==
Received: from PH2PEPF00003851.namprd17.prod.outlook.com (2603:10b6:518:1::76)
 by DS0PR10MB6872.namprd10.prod.outlook.com (2603:10b6:8:131::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 22:32:09 +0000
Received: from SJ1PEPF000023D8.namprd21.prod.outlook.com
 (2a01:111:f403:c902::13) by PH2PEPF00003851.outlook.office365.com
 (2603:1036:903:48::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.15 via Frontend Transport; Fri,
 31 Jul 2026 22:32:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF000023D8.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.0 via Frontend Transport; Fri, 31 Jul 2026 22:32:05 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 31 Jul
 2026 17:32:05 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 31 Jul
 2026 17:32:05 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 31 Jul 2026 17:32:05 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66VMW5tR1792834;
	Fri, 31 Jul 2026 17:32:05 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 086BF2A53; Fri, 31 Jul 2026 17:32:05 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202607311122
Date: Fri, 31 Jul 2026 17:32:05 -0500
Message-ID: <20260731223205.2222432-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260731222221.424604-1-lcpdbld@list.ti.com>
References: <20260731222221.424604-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D8:EE_|DS0PR10MB6872:EE_
X-MS-Office365-Filtering-Correlation-Id: b7d1b25d-899c-46d0-ebd6-08deef538cfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|23010399003|18002099003|22082099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	vAMCbZujXz4k3oeb7w/HzQktY1gGbJETXiH9EjS2uh3E+f8GT8LIEPTdSoST7qO1i1dA5OOyNknt1TBxde4idvgLI+cwc6a96LFF0TRJ7795vcfZ0YD+0NWWSDEPCjic+p1ZJ/rcZi4emB9wnWaxUge8szD4GF3+wlNoadgfDuGQKjmxzqU6w81u5Z92IN7Wve/07FpbGL5OsWGjnRHnMgYT7RlzwOo5ZOup2hNgQ7gPdP/FfPZFDbnYxFvpNNA2yXoczAFafY3W7eXIAQH2wgzVckVAm6iUPNkT2tC2MVlI6wLBTqD73QdeAk3WQM/PeV4hV59oZSFNnRaR8OiBj+dm+oecj8Db4x0oWhCHTjwuVePcS/mhLUXOJ0I7QZ+ndrfr/WaEXYV1gxCDKLHgaToob1LAT4wGYr8d7Gws+AWSSO0erDUYK/Hm+N4JRQWvjsLGmPr3RrA3lzngYTzrhpvJZqVLG0xgMPH9DMvImOnhcuBhguw2qYAZkVAJKHfBex3NiahAe9K0GKBzxs7SSDCyxHaTqprgJOFmsy/+7ei0J/VBItydLd+GRTw+Z5WJ436psYCjDGzO/dyRQ375lydX+MgSFkyatyzzr+d+L+7O7Hn9INkLGK9yyy3xcdtZy48LzFlPHOl7WAf/HwmB1UAdsPfcosGjCaLgrG/w6qk=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	hFsGG+jljk4S7T/VUtNOzxK93TFU598DZuRSKD0V+qqshWyWv6BFE94/2znRCSZCTrU+Blcel9pPhFp9HdpfqusA8DQSOTDwc4p+B1W5oD9ReNGfkyt4N+xpzEPL9nEs0d3z03r19OslUgR5fMRyfcmsBjXH5eT4fijdbqTVp2MW5J4iTg58wJX5NnFnxOoCPRX3OrVX7uvr6Pixlq3qcSuzsv2grdFh/tKguAnyiwF6IJrx7Lbm+oSL6PT2fgGmrgNb6WpEmk1Ayw6XW6GComkGPxlhVNFlc91QD/OoXpbIrOlQKVuPRukxqLYFmbrPOS+7tkPCbN4e9ZmNq5UyboGvdA2qV0RvdRICBnIUDkfojs4g80v7ortT5p3qKIhaPJ8gVln5QNYJyHhUqMr2u7ET9WAvePjXR03iTB0taMiDHwJO9MTY9w8fzQpK5AJA
X-Exchange-RoutingPolicyChecked: 
	SIVZgfROFKwyrRPT+4svUwT808eby+tpw8JHbwCfe1XvUt4Q2WL73asAP1/6XdBIm34OyGbSEv3fhnYn2ldC/TMuwJ8qikA0MH407vLVZpSdF/dkPuSxXjnxHQFAEidjp6/aotGGq4nam1fRVa/WEP1nssPpetdVzP9vGggx3MU5zFZGo1bbbpgTneTW/yWh395kSQ/hSWeuPsp7GZZSCf/ymplypl94yLUhRyAg6ElJSTFUU0wka0dpSbYiuzndA+7ENUPOZle9qehv32qFx4nuOzrz0jpKSeDgUxhwNoePjK4y8AfsTPZ3PYsBzdZDuwqOcZTCgV8S9BGpsJ2eUg==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 22:32:05.8342
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7d1b25d-899c-46d0-ebd6-08deef538cfb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023D8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6872
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDE2OCBTYWx0ZWRfX9TAtO2IPuUUx
 EHfABx66T2LF57meTq1MEjwdz2D52D7OmaQ5Rv9WuZNkmfjxNSyN1/9sI825tAqaH29Xt2jS1K4
 /BdIbkAAjB0m+6msnKuQtfvMgaPGI6jhB7qbjmxUbHmwAfjA9vQfeYFQ8eBVjjT8CFMDS/hdPTY
 s2BmYzD+bW1udzQBNCyDrqUXnuTTg4Y8euqwApnEvDDMbjt35FaC1xFCWPsij+mj0v9vDmcX7Zk
 dX3Xmb/cL3vUlRB0nukmpGl4bDEYmi8h1aERQu6Gnz8hgX96UgJq0bdNeeGSgeQFh7tnYxRGAAt
 vy+tABS8yJQarV1oCFzotrJZcccLsNius+8Ic5KlulPmdHnJxkyvcp52/yBaTgT7T+sBDzuZwGF
 ZtVsbQeb982R81XH1nALLSo488CbmtDQkBU4nsHz50AxR7Q3u8fkfF6dX/rYLeQK0UOsOTgif6L
 7X8y1Wwd0IyYD/0trkA==
X-Proofpoint-GUID: iw3EO8auUZvswU_xmpI6e9jXVCYaf32O
X-Proofpoint-ORIG-GUID: iw3EO8auUZvswU_xmpI6e9jXVCYaf32O
X-Authority-Analysis: v=2.4 cv=Dr9mPm/+ c=1 sm=1 tr=0 ts=6a6d226c cx=c_pps
 a=tVU0SsWZS/EEg8/MReKahA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=dt3XdFhdFDlFuuIkZWAA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDE2OCBTYWx0ZWRfX/6vJmhA2mbIM
 5iqq4eAJqKe/ZFqRZKc/70YK2LId895tzBZ/EHQ5SZezbwRnX5AHDmiNyQRn7oCaJ/E3FFOAihY
 c0Umeq2KMmH5VH9AqeJCoVFJ1UC00/Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310168
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 31 Jul 2026 22:32:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20212

meta-ti / na / 20260731222221.424604-1-lcpdbld

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
scarthgap
=====================
Summary:
- Patch Series: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202607311122
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Fri, 31 Jul 2026 17:22:21 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 70c58418e548e08e7d8dd099aea6705bdc6f498e

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202607311122
- Commit SHA: 23566d6cf192e99dd3e929b7d1877b55678250c8

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
scarthgap
=====================
PASS



=========================================================
  yocto-check-layers: PASS
=========================================================
scarthgap - PASS
=====================
All checks passed




