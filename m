Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97BC0C88E73
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 14:32:16 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21749.1789396334776476161
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 14 Sep 2026 07:32:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=WK2D1N4m;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=MSZcNGUv;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68ED0uoL1487229;
	Mon, 14 Sep 2026 09:32:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Ty1ZVYKFwh2N+9oZ7IEAup9KcoH59eUz2Nhe8p/Li
	TE=; b=WK2D1N4mIXw61VUodngnkOQTEQEH1m0ykBCoMuHVXM9rT3NCIj8AWQnL4
	Tg5Y9BK/2dZv6yhVLaXx1JTvTnZhAXvZrX2NF4oAnN1hNl/6Rb/x33GgiSSkjtOB
	8zzmRevuRO0lzfLae4Z+vgEchhq2Wl5oDLo81AySgmvVuHFhgJwLnTQn10PNGt6V
	/Oedz363t6zREOX7rZqKdPXbOuJCAmwbBCrxVkenqG10PhQ+EYaUrtol+oFvBeyP
	U30cQtEd1und8ryNnw3tELCGb45fUOYSrb1Qblrg62K9PzQazJW8XUMds638MXgJ
	UA8TJlASOWTgSJ5tCl0+lHB9dCLLw==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010009.outbound.protection.outlook.com [52.101.193.9])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gnqrn797m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 14 Sep 2026 09:32:13 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UzLRu25v9LhzfsREqJwQSBn4KMGaVKY0hR+wknem/Fo9cbZSZaGOfEwl7r/lQZSkOdbcOgD68hA4Q85j8Eo2wF7Ssh1bv9FarIr36E/Myp2M3zlx2uMKKW0qzBqHOt53EslxS0BxzkOFZ5jups5D7d9V0g+bRjszUePHOVOJwqpnzfQXqqX7A2w8T72+k21CBf8quGNxLN2/fLWgFtgbUKcregIvxkYoNhRAA50f6xO6lEc32Y+Wj249r+kutbRb8TwXrum8uRqF8kGEZv4IhVZeBJ/UZAWLittXG+MPIl/eIGtRPcFtfzYzzpsgjb9q0lRJSqBmeUCcaa4KT1bqbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ty1ZVYKFwh2N+9oZ7IEAup9KcoH59eUz2Nhe8p/LiTE=;
 b=TwSZmEznf++LdUtkO0Alpg3SPPD7oxaQjQ9CCoKDLrLrNIsbOfuATQuCa6MZ9/q9Y0r6zVA5zGTlv33DjeOuLcEKugStcyV2tStdwJUkizdgIHYXZYN5Nt1r6lsG7E6gKP3puWI/gJGZGY3q9aNCTlC5C5XwACtzuQFMEvlYcBnG2qaTIUYkgiZ3LorJzn5/bcKJvci3WzDmqq1QGm3UwEObm8vC4WicdC4UDec7lZcJIFsrX66J0tJb7gJo/6H8BLAsfIKy+iRazL2MxvmiwftS5qwex39ZTzIxzbZ8RlZVIU9r3kY3SMNBBr9iI6hgROs8VVRMGQptLm7ax3/X9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ty1ZVYKFwh2N+9oZ7IEAup9KcoH59eUz2Nhe8p/LiTE=;
 b=MSZcNGUv/EMB7zDaob723HS61XHVDfxxaOKHnCnpYXWzzjxa9M83wA2RisfCs4cPu3CVhOAwzeTptlF758W8kV6SUqQB0a1yyTm+/1G3vnx3PQ+/acqyiWO5Y1uZ7h0QBMuGKIsO3bqQwd0xGQ8tsiTQbcnFdQt8mIqr7FzjZy5KlZhxLKoNpmMCQYbFyDUhDowEQcu21vn5qXaJLKXHdvAcuWt6OFHlyPYeMm/jsYuQ8yUd7I8k/zE6z0oyV5KHl8H/ynRlsvF2cgYRdLN9dRSF8xH4uT8KCn5ZS9Wt1wKvrdvpQZnrf4wJbUl0TyZY8HEjCV5S2ufRMsx265jjdQ==
Received: from MW4PR03CA0247.namprd03.prod.outlook.com (2603:10b6:303:b4::12)
 by LV8PR10MB7942.namprd10.prod.outlook.com (2603:10b6:408:209::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.8; Mon, 14 Sep
 2026 14:32:00 +0000
Received: from BY1PEPF00026959.namprd05.prod.outlook.com
 (2603:10b6:303:b4:cafe::57) by MW4PR03CA0247.outlook.office365.com
 (2603:10b6:303:b4::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.7 via Frontend Transport; Mon, 14
 Sep 2026 14:31:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BY1PEPF00026959.mail.protection.outlook.com (10.167.244.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 14:31:58 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 14 Sep
 2026 09:31:33 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 14 Sep
 2026 09:31:33 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 14 Sep 2026 09:31:33 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68EEVXGI716039;
	Mon, 14 Sep 2026 09:31:33 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 939719A9C3; Mon, 14 Sep 2026 09:31:32 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][][PATCH] TDA54 Presil CICD Auto-Merger: cicd.wrynose-tda54-presil.202609140706
Date: Mon, 14 Sep 2026 09:31:32 -0500
Message-ID: <20260914143132.260341-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260914142607.2817385-1-lcpdbld@list.ti.com>
References: <20260914142607.2817385-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF00026959:EE_|LV8PR10MB7942:EE_
X-MS-Office365-Filtering-Correlation-Id: 9558e264-a1d6-4e23-636c-08df126cef1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|23010399003|1800799024|82310400026|13003099007|6133799003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	f9GIDLhhF0lAkWrQd+fvDX8COkqMxvb5udLdYCCCQVkv5XPCPjjJhQYYHCceMIHJfKv681cOga802sgXYSc1DRigPNYY42QogRbfXu7cY/425tzWnkveQl7jY8YPwI8wl+RIX2FsMchSx6Fo3/9aQHThN8GWTFdGIfSUQnzXHriFUxHJ9q1DqrOesNpfMecbOu2nvQwi49iS6OJ8wFEqdR3QEsyb6b0w/h20FW0r2a9396ld6RF4rz9HaFm1Ajr8lXvrH7FYj8kg6UGDlK5NnNIJgCCDTsrNicw9PuiBtkHTN/Qf8hH9885hvvboDCFO3JZsrSe3ECrZwWiKlWaWLNBmVXPLu4s+HwdAvYlLk6YMCKOc0ijBeNWaFbto4CY0zB/GssgVxtR5jzI6MPULkepiftKLCftV/+50ti02JAXYA0K+TWdge0frPUreOu7fX8xkh2zqH4a1aIfOtcWeGgDKKEtd6azHKHNEA7NlEQmCVWLgrpfd4F5RWlvKvrsBBed5CDbL6VAfM+Ye+EFHIpSfFCEPDs420shMDQre+LWU7R5L05Y1ZjoZv8Ospyz2o1WyOK8e2PKOhMVe19GgGW+gzCEIDTaKFHfQNyDSnfyhRPdYLpJdzZt3rE79MZ7eEIUhj8IMA5aIbYK2jGa5qA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(1800799024)(82310400026)(13003099007)(6133799003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	prWS5HiQNnWuyEeiupvMexjphGQ2NLSz0RzqqwtLnuOPYh1fL2LDVut3gK52IwvNDP/vzzIpp6fJEnCWcVkos70eK0QOZprze47gS/0nzHWOWbPfRwF2duxt8ucEFXp18xqtQh/upDVY2KSXCZi0qHvXo2ZssLEU2d+9682R8NK2IDiUD9jDdsOslIwG6FgETRNPB9LeDkRIMR/7+iEMpj9RbMBIrYn56SOfasWiGNkulFeO9wn6EYTxi0ViuZWOHOaX+CT5TakGgdjM/xyWviwWV/Tz5BjSpxBK+9AvGuunvpmERQZ227CEr04uqiZQiZpSbaQQQhsmlOR721fS5c6vNsVBn7tm5bg2wYLHy1N3ide8ZAuvF6awna2lq4oGY7vFH+uZYQ5zdKdUUuJkc7ZmIu9qyWG/NFC1eJakCjRGcITw8WWj2xTGZ5IyjeF8
X-Exchange-RoutingPolicyChecked: 
	hUiWlu2dZ+OGckuW9wHQ2bxoLOmrXun8JJLQkgQLNIYgEHVEyjlB4I4V8HU3fHtBfaC2WEevQhO8D35XBXuqvGySaU1QIEAjDhWt99ov0LZPD3EZN5ez7bOi7TajgqMwFTvyZI6pfktvgUbBiSv6SdhWQgI5i38BfVyC+Vn0/tfZos5KSgnXxww6DluLL1X4i1E+Q9QudSzXgef3sQGlwkKPTHCOfoinnr9obPRfLWXXtSf13afv/g1MxaebSOGwKtbJZlN6V+Q/t4YV/X7pPGd7t0AlWLCElua0iAZ+rrugCyE58QrBYTgQPYYV2erA7OehMU38cPgK9tifREgZ2A==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 14:31:58.5969
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9558e264-a1d6-4e23-636c-08df126cef1b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BY1PEPF00026959.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7942
X-Proofpoint-GUID: Y7LvZ2TylnrARn7SCrHztEipVUfb_Jf0
X-Proofpoint-ORIG-GUID: Y7LvZ2TylnrARn7SCrHztEipVUfb_Jf0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIwOCBTYWx0ZWRfX4UQst2WPMJLK
 zkYxTnhgKt//rKaGB4VA5wJy+vhqb+yoXOzGss76IBMYhTWILov0gpNzXRcUhuYbrjR3hhhoY2g
 JCSgS5gGiTZ9e2HDTMYDuk3Evsv1isW7UzWH+5/WX12d9PmlWRLCybdp8hfCD7WYhA/ciBhfykO
 cDpIj2y89REjaI8xHFCTSzH5aINnJVtjapUQP2usCl2njw+Z5LYW65Yjug7hy0wQWU5fq/4PDBZ
 CZFMRbJha29UWw2/X/9p0Pdr0hyI60Gr0/S/TBf9OmQq0LJrkLfri15wgQAOBG2oq7ClCInr4c8
 ISbBLo1HiOIw2RJLYBUjxDczUB5eu+NgKf0r+BKgAzRy9EHgqN536CpQt6KpbQ7nsICcSE5+Dr/
 HNkBCh17pRmIS0NJduha64u38xrofe8AiPqw+mpe2ylJikb0UwFdbOGtZqH4HHFfd45alU3vVcA
 EV0UIeP7ZkdXWqEB0fg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIwOCBTYWx0ZWRfXzRlcsFP+6ABb
 ClSXqRPyPSDyI6rsMN5KUAU1i6KBR1GcoV8SOp8zv1PDQeYAoRjp8T+OgtmaACsVnggXsHEfGz9
 3IdHH6tsjcrDDDXvygbJeWUmjsI7+y0=
X-Authority-Analysis: v=2.4 cv=XcgcX455 c=1 sm=1 tr=0 ts=6aa8056d cx=c_pps
 a=/dw4gKU6pt/qT5+OabM4uA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=ea_ouIjygT3YNIM0GggA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140208
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 14 Sep 2026 14:32:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20373

meta-ti / na / 20260914142607.2817385-1-lcpdbld

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-ti][][PATCH] TDA54 Presil CICD Auto-Merger: cicd.wrynose-tda54-presil.202609140706
    WARN: Missing branches specifier [master/scarthgap/XXXXX]. (META-2)
        patch:90
            Subject: [meta-ti][][PATCH] TDA54 Presil CICD Auto-Merger: cicd.wrynose-tda54-presil.202609140706
    
    WARN: Commit message does not include file/recipe name: TDA54 Presil CICD Auto-Merger: cicd.wrynose-tda54-presil.202609140706. (COMMIT-MESSAGE-2)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: FAIL
=========================================================
master
=====================
Summary:
- Patch Series: [meta-ti][][PATCH] TDA54 Presil CICD Auto-Merger: cicd.wrynose-tda54-presil.202609140706
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Mon, 14 Sep 2026 09:26:07 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 734cc2703cc51ff324b2de5f3180d87086432d0f

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: linux-bb.org_6.6: Backport OpenSSL 4.0 patches
- Commit SHA: 1fe53d8a1a216169503d06804910d866a702c16a

Patches
----------------------------------------
FAIL - [meta-ti][][PATCH] TDA54 Presil CICD Auto-Merger: cicd.wrynose-tda54-presil.202609140706
    Applying: TDA54 Presil CICD Auto-Merger: cicd.wrynose-tda54-presil.202609140706
    Patch failed at 0001 TDA54 Presil CICD Auto-Merger: cicd.wrynose-tda54-presil.202609140706
    error: patch failed: meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc:5
    error: meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc: patch does not apply
    error: patch failed: meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb:4
    error: meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb: patch does not apply
    error: patch failed: meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb:22
    error: meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb: patch does not apply
    error: patch failed: meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb:11
    error: meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb: patch does not apply




