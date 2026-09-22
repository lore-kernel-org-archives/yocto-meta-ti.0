Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F38AAC982FA
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 10:51:34 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7352.1790074291243565800
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 22 Sep 2026 03:51:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=hv4i9dlY;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=DHhrY85X;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68MANenf932459;
	Tue, 22 Sep 2026 05:51:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=+7hixNwBWh9kZo32xmR2LJXMmKyGADYQ5aqcAI83f
	+c=; b=hv4i9dlYCEsSSgy7NBqbxIUcBXyO+JTb1BZWHJwc92SGAGOUlKu1N48iY
	3yWBtJpSJ6PVgQvuCQFBxRbmtKAUgq4njBQ4wHKVzDqm3T/7DZjA9IA5zNfjF1Cb
	Ip7YyqtT0/IQ1xwc3x588Gwbt5fdIlGO2jad0syqv/SihVIlyN78mC9mVm2pSuRE
	GtEFqdKF57wAr7soAJ6gQQJdSZ5AS9YAMYysaAQvQucf74LYv7kWuEF9o1tFTqRJ
	vkHMP1+I5KQltvYBMCfilmMH8xc9Od+/n5C3qLUnYvD8xU5VPEC+GZ1ohaWKWV0f
	Njh8WndIzMzBhBtt+01TPbC4NFcDg==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012017.outbound.protection.outlook.com [40.107.200.17])
	by m0380145.ppops.net (PPS) with ESMTPS id 4guf4x3129-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 05:51:23 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L72MCYjd+rdGHChF+w7VnCRkg7rkuRn9LJtIuqQXuzochNKt2eEifRTlx+BZ0pu8oIuWC0GEKITxoqbxczsiC/H2vI2FKt81JGtUruyCU7M300Vmre0OK3X1OButSXRe3F03wThik8Wc2JsC6dZY91Lq2snygGQBBIeUNWhZcMDBa5ctkb1X2Hq+OaAj8d7DgWwMVTk6mooqr5OMK06w2SJnB6mCV7VYvdamrMfpHvDWJ4+1EphgSoQ4UskAMsKYuh9m0UWEY+A8KjXHQd6slntPps0AjVuOWiZrcvsbZEi/hqoNdDviFe7ttPSINBI6isHy7KGrswvE+hm4FZBugA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+7hixNwBWh9kZo32xmR2LJXMmKyGADYQ5aqcAI83f+c=;
 b=Ky+/DQmFq5sySplPZado5b+iXJ49AICtlDIB9C7Axin7FxuzxFpxaS/wKCGs4+Q2M+6Z+Om4XrGf3ceZ+2wdUL55jsoCFr+wlFfEpCi3C+mNI2Zs8cTox2fVWf2yu9+bAjZ9frRep2+lieGZOu4jTeZXoynZkbZKVkZ9Nw2JSyAgmR3Ud3hLPMCMnUXSU7i+ftiCVKI2do8BroanmsjbabNhYg/YIuF+vrIz3eaRe8P3tzSgkAvblSeLyna8YeKqRBrEoIrkaoA2Y92ykPpSA9ilr1s9AEN+8nHZgXKvP7l3t6ph7ZTBzBiwXtNhQb5BP4USrI6PD0mCYDsluooMsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+7hixNwBWh9kZo32xmR2LJXMmKyGADYQ5aqcAI83f+c=;
 b=DHhrY85XZBsySwxJTHj1tBonyr9QQPzQFuE5ghURUC2V5W1jjfsGSRO9AcH2TUHdXpj32WRH3LUTT8iuG0rY5HLIaOusvl/Fq4ffT3I3CXxRIcE6CcC244DxIfg2UQ3eblgfXml4YPTWRMH8BvBfdTvSkBW/FR+3VqgE8g+royVCsmMU/NOqftGm0TNb3ZsZs+OFdNWPqAdjL2GMKCqJE/dUMMQIbueG3/MSJNItWprdtMzxwY8CfyVpncarYopRh5Ms9WmlsP+TM47PqXeTozoMBcVf+RYcKDciuiQyasuZlDsZCWibcHZoizSsyG4fbJA+MI1jASFBRLAVNBr28Q==
Received: from CH5PR05CA0004.namprd05.prod.outlook.com (2603:10b6:610:1f0::9)
 by CH3PR10MB7495.namprd10.prod.outlook.com (2603:10b6:610:15f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 10:51:19 +0000
Received: from SJ1PEPF000037A8.namprd03.prod.outlook.com
 (2603:10b6:610:1f0:cafe::42) by CH5PR05CA0004.outlook.office365.com
 (2603:10b6:610:1f0::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Tue,
 22 Sep 2026 10:51:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF000037A8.mail.protection.outlook.com (10.167.244.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 10:51:18 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 05:51:05 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 05:51:05 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 22 Sep 2026 05:51:05 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68MAp5xt3998031;
	Tue, 22 Sep 2026 05:51:05 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 8CDF59A9C4; Tue, 22 Sep 2026 05:51:04 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Paresh Bhagat <p-bhagat@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <v-singh1@ti.com>,
        <afd@ti.com>, <denis@denix.org>, <j-sahu@ti.com>, <p-gupta5@ti.com>,
        <r-soni@ti.com>, <reatmon@ti.com>, <s-kapoor@ti.com>, <s-sinha@ti.com>,
        <sen@ti.com>, <y-hegde@ti.com>
Subject: Re: [master/wrynose][PATCH] recipes-multimedia: Add PipeWire bbappend for config files
Date: Tue, 22 Sep 2026 05:51:04 -0500
Message-ID: <20260922105104.2157929-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260922103002.3723697-1-p-bhagat@ti.com>
References: <20260922103002.3723697-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A8:EE_|CH3PR10MB7495:EE_
X-MS-Office365-Filtering-Correlation-Id: ad771121-246c-499f-f6fd-08df18976e8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|23010399003|36860700016|13003099007|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	m1bSO5B5Pk4uZFnYMw1moznwttRse1aMNsu3HFsyj4zHQpjTpYypPtek91SEiG6usrcj6yBFCnvbq4j9sh0ycLO34+mAmvsVWTqyWIUvC3saji9rvGdZIhM+msvdd8yN47Z7sX78rpE8hFxmzPfRUgHBFcgPa7SDa18MGjhDRK9UH5qoWPJFV8pyBVjCvwz1BWSjkh8L1aRYU1t0lpaRLV+CNLr9aKKNja72fthYLp9Fywh6H+lQKQ3X7Ny1iuquuNYSh8wyjEXTDcqMLz4+lpgLn46KxvLw3weV7INO0xImWGtyh+VNAQQ3t+1U8wcSuYo7KVj6qBxXtFx3XbQBDdeO4aBVLmHwe9OEu5FWOSkt41LUuqjYz+PYS11yX6P6zhRWHiFpTs2S8OsBC4hAN4K0uN8h8TLcmsVYQ5ooQsW329YxfTh5DdLg2b3gRLe0VYIFwNLKzIXSxOa6VoVdE45rx5o5l1jmmcOdKGsKJVylhqXlPEw5imHhVgKqxFctjySVlTDd8mYK09/Pvw7mwSNdndSdqhIVNPI/3Oz6aQ44Cytxn7+Q7capS6cUjcBoreXWWDgxrxn72F6pDrvIXRWhFWct4O/F91+P/ZPWKp/m4ST+ME3VodqeZAF0qIc0TVCXUrEA5iUUi/UoWdhf+A==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(13003099007)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	C6GT93UPNL4+2Z8yJo4HGHVb/tx42hZqGQMdy9p98UINTsgg0YJx2wWHaAVe8ADEDTBxgwJWx2t0jehhhmsnqhYe0ya0W4/Yo43vN19YU4LZG9tPWtVRv02kBfeYt0CCXaCdDNY0JJS39FCzYKSZJRxrKi09HMr+/2zmklclxICVaKMAApjMwcDMj7ufQ4sXmlNpo6jtnba0/9wVwkSunxFKKDyQ/f8fD5NmIWa2l1g6QrY73skPJKjcLH72Iitd2M/7GWiVXUR5/C1hF9SwAZH43ZNZiq1bEmfTGgv56/KT4KIvbVpcPTfVnVxa6D5Wl6YnIoPv27ht5W+rAORRDtWs/kbQPlsgsoPD4veTUv0XTJQD1nOocYDLkeyUUQbpA8WoYbDQMjEp2uUHqUL5MPwck++8dSdwoAzEMt7Lzg4wgDVvc0IbVHeH3cQNAgUI
X-Exchange-RoutingPolicyChecked: 
	qOfCjDQ/kFDiqfRea+jyY0JED5D2uTztJg8lYWFYeLncJA7oLuR4WzxlwLZc/0KHNgEM7Tv5MfI9YXtCXjm+RkOCxY+D1/zuXLpJhOJrSOyDz03fLtdx7EXuQfBIaiedGXj35aAwOgJquy0dqLMTcs0xVZ0+66gge0bbIZN90m8ASJYAIFcsh6oDaZpnPMSXduoKt9KVNSLS84l9icbv1I7fyHOXEA6nom0cH8JGfzJc5UfJ7IbDviUSsRvAUgG6raAq8QepQa8++HpRnAF9IrZ0QEshjik6zPwwDpgq7RG/+MULR1tTuwMRslGcPRU57y26fw2GLiyT5tqynfNitg==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 10:51:18.2585
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad771121-246c-499f-f6fd-08df18976e8e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000037A8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7495
X-Proofpoint-ORIG-GUID: oEcm1RaD8HRfopxlAXwlfubCADvSORs5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE1NiBTYWx0ZWRfXzozXJ4y7C+om
 D9KdMBtgoKZ5lyHduAQSlh/CF+tjiCWbWnn9ETRGHjQCRphoD6Bi+BpmHYA/FRG2vfYczcnM0wR
 jkdFIv/ME4KR4UH+z3ikCe0DS8RADE2WyE0odx9Q9/vaUhtVu/5eorfHlP65loa5/YhO46UtpYw
 O0riSIUReh5rZ7AeMia/jIbKQK+tXDEMnQfBuVpyScn+S2VhJjg/jDgCAPmw+iR2BmxC1+8LgNw
 seEE7JlO0dN8GNnIbgL5/sFc3WefwWeEsl3ZFYSNRHUdpOs5fhJgxE8K7fTzCjbBJHyrDaZnbiq
 kQBxxCq9xJuZr9J+Itx1mPwoOPgQXbCPSvUyEaBm5kC2usGUNkylkV2yOeM+f+QJAXWDlIuEBkv
 AvU2jqEYGxnijGIaLDqH8Ev1jvc1TQS96dbGdUUvau6x6WkcMj/Ajn6ae/Ci0a2NMtBTx4iwjAP
 WU5mt8fMNaU/A1ZwmVw==
X-Proofpoint-GUID: oEcm1RaD8HRfopxlAXwlfubCADvSORs5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE1NiBTYWx0ZWRfX3hjV4bqxzH0o
 qIlDzAdk57XGpTZP8jkgg0+LWRX3Ku6rnh79M90UXVvhsJaHTe0l11e7il58y5TUh+cFuA8r/GY
 KH3Ktam3hKkeglovyODpl9FQcgrR9k4=
X-Authority-Analysis: v=2.4 cv=XYYcX455 c=1 sm=1 tr=0 ts=6ab25dab cx=c_pps
 a=Pcpo/nSjxNMkuCW/QO6CAA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=9pI38o7R0jLtmgNN6QMA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220156
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 22 Sep 2026 10:51:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20390

meta-ti / na / 20260922103002.3723697-1-p-bhagat

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [master/wrynose][PATCH] recipes-multimedia: Add PipeWire bbappend for config files
    WARN: Commit message does not include file/recipe name: recipes-multimedia: Add PipeWire bbappend for config files. (COMMIT-MESSAGE-2)
        patch
    
    WARN: Commit message should not include directory path to recipe: recipes-multimedia: Add PipeWire bbappend for config files.
              recipes-multimedia (COMMIT-MESSAGE-3)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [master/wrynose][PATCH] recipes-multimedia: Add PipeWire bbappend for config files
- Submitter: From: Paresh Bhagat <p-bhagat@ti.com>
- Date: Date: Tue, 22 Sep 2026 16:00:02 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 254d4c0ecff52e2122d8463f39f56740e856c422

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Paresh Bhagat <p-bhagat@ti.com>
- Commit Subject: ti-rtos-fw: Set EdgeAI DSP firmware as default for am62dxx
- Commit SHA: 05fc514db3c998bcf77e5fbabc580d939915aed2

Patches
----------------------------------------
All patches applied

wrynose
=====================
Summary:
- Patch Series: [master/wrynose][PATCH] recipes-multimedia: Add PipeWire bbappend for config files
- Submitter: From: Paresh Bhagat <p-bhagat@ti.com>
- Date: Date: Tue, 22 Sep 2026 16:00:02 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 254d4c0ecff52e2122d8463f39f56740e856c422

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: Paresh Bhagat <p-bhagat@ti.com>
- Commit Subject: ti-rtos-fw: Set EdgeAI DSP firmware as default for am62dxx
- Commit SHA: 023eaee44f5d5a45ee428c6c49079bf1a3e3c72e

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
  yocto-check-layers: FAIL
=========================================================
master - FAIL
=====================
ERROR: No recipes in default available for:

wrynose - PASS
=====================
All checks passed




