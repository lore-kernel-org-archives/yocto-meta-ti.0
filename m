Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9145DC9830E
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 10:26:38 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4571.1790245593727135706
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 24 Sep 2026 03:26:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=QiJzUZxU;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=ANGeTMhf;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68O9HZFA222030
	for <meta-ti@lists.yoctoproject.org>; Thu, 24 Sep 2026 05:26:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=6gLChk1MA6eMLrvioPG9m6UqNpMaQnL3K7CBDdG18
	A4=; b=QiJzUZxUN/Mj61u5Dq/5j8b1NX2/j/rQxblnA52U6XrEImjTgGU71Rdof
	0AqzmKQFdkc5RrbJNFXGgvyHc/YFpb3lb/oGrYYQXu45dcFB+FVHQqqKgI3Ys+Fe
	GpZQmmh7k+oYB/xwlR60GqEeAjTSW7GaeyaiCgqRoJk51jpN6dCG2SgNHYg4zahF
	EcBAQOOYX8/iSWrsXXg99re1rcJfXHC7wxRL144/t43w4Sg3Ok2Pl6jKKyH8oAso
	WF4Eegroanmiepz9AYmvZvT7uBflz93beQ7hFb+apKDSMhgOSSjDSXsi7sBy12yY
	9wHNYR636nnpMs61LSPhzvOcYEPiQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012001.outbound.protection.outlook.com [40.93.195.1])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gw13tgbdc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Thu, 24 Sep 2026 05:26:33 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XFQWHDyslTL0sq4lCC7ltzBF57j3agF7EPAuLRN648k00pcSZKsDcspy3oivH2hKMtgoaBXsqpvta7CuIGT3jHXB5nbF+4i1KZ5Vk7a6nRzTVjyVhDoPEj9cGhdfvlML+Di2/QDrKolGiMX5H230Y49sWTWsUwgO5ipbA6iZJVtcUa7pEx1Xl/jzzfI/ZdfZe7PHLtW3KDS8vZDEgiikRwYQw5yStdUgQmesTk1fPuXPHUKK1u4+ZNQKQi5HuN6FHLU2woQGSrAZRKchT0hrkssI9uifUJSBj7DeCvVMwfIFK93aKV2wYrbR5ZDc6TsvidzFRn/T5g+pE2zTeSQiWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6gLChk1MA6eMLrvioPG9m6UqNpMaQnL3K7CBDdG18A4=;
 b=Eme9ADib7GXIAjIr9Pbt/YdkLG0esrPMH31Ro80dsMdP3+tOr+YT6CTloZC95y6VuUt+CkIRS229JuZDZf1tJopfxZh7To9dmksQZ7QjBQSzYaLTa73WRnXODxsVto/ii0PRYIP6Ls08ei1NBvnrxf/yai9XPEnIHzwhwprff8eVzykeioszBLRkv2Qv8IvwyowEzE+bD0VrttPXCuVqSYW6EVdJHF6AR7g+3uqxilWVZW5WeFmdxEyFcH9h5GQ0PBVX35rV0zHhTTVQ/utziaYmch/b0I5gxANeZMSnhN7xE+65zeyh1pjAN8CwxqHyw0kjjOk8rDND6QJeStPC4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6gLChk1MA6eMLrvioPG9m6UqNpMaQnL3K7CBDdG18A4=;
 b=ANGeTMhfneh5NR61O7SrlT/14K0wISzoVCO482+Fnwhyv/Na6YJoSTBFiXv5WTA23HkMpD8EWN+WtBylXvdc1nGwonO1N2ACV4WBd3NQ+3xslkd3qUI9TFrCQPejzwzvUaUyg7u4ceRRMgvB7kD2ilsV1GcXYgkiKzAmdJlw55q3yrR05lAJlxyyFMQcPXYcuMYLpHS54A08NI99S6U/6CXM+40TvVdfFXu5DaQ8MJY2Wpecx2xzDnk641bFO09xoxK3houV5da9/pzs0tezNKJ+m6XDFw1uQ/JWx8YRKyzLXPMYK9/MCv0bxvYl1H/i4szB0+0I6EIUztPWN//dCQ==
Received: from CH2PR19CA0007.namprd19.prod.outlook.com (2603:10b6:610:4d::17)
 by MN2PR10MB4400.namprd10.prod.outlook.com (2603:10b6:208:198::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Thu, 24 Sep
 2026 10:26:31 +0000
Received: from CH1PEPF0000AD76.namprd04.prod.outlook.com
 (2603:10b6:610:4d:cafe::4b) by CH2PR19CA0007.outlook.office365.com
 (2603:10b6:610:4d::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.18 via Frontend Transport; Thu,
 24 Sep 2026 10:26:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH1PEPF0000AD76.mail.protection.outlook.com (10.167.244.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 24 Sep 2026 10:26:29 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 24 Sep
 2026 05:25:59 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 24 Sep
 2026 05:25:59 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 24 Sep 2026 05:25:59 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68OAPxlA3920732;
	Thu, 24 Sep 2026 05:25:59 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 1C4659A9C4; Thu, 24 Sep 2026 05:25:59 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Mahammed Sadik Shaik <s-sadik@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Ryan eatmon <reatmon@ti.com>
Subject: Re: [PATCH v2][wrynose] conf: am335x-evm : Bump up max_leb_cnt
Date: Thu, 24 Sep 2026 05:25:59 -0500
Message-ID: <20260924102559.1448117-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260924102001.820922-1-s-sadik@ti.com>
References: <20260924102001.820922-1-s-sadik@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD76:EE_|MN2PR10MB4400:EE_
X-MS-Office365-Filtering-Correlation-Id: c8b27a35-6ed7-4542-2230-08df1a264be8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|23010399003|10067099003|22082099003|18002099003|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info: 
	oUDwv7M069Tm9Jdw2gfo1EhhmqVmFlCKmzP4X5z27NxcQjmJq2I9SGMP5WzYszrLBAm4bZfLjCu3001O4+fHcVAwB78fGew+9sDjAPhOeYiGccjsBCa924anXLxirtDzUaCbcXcwVnHCoSxwsbuDw56U1iZjlHzr4wHWkK3Ayfyka03BTdnT0N1k2ySiI9j11dtXbMwldggRC7rlywmgys8isEW+jNxzeBhLzvk2RyR3cwO9RI8/Z1mXJvgPy1lZHxS1T+CBi2REwqu/BF0CJWF3xPFz9flJSID5hcDyczcGx/MuE9zOIKfu6wkvYwfGWbzwHJZB331wjo3IFrROW/gyAxmpGGCi72WpoACiAM93zpLNTcis+gERAMZB0c9jxy9r2LNQuvvwAd8erGSAapKVtmV5iAJx/1oAMw+P3zry+kk8dEN6im5l3FmGwFIJhjZsq+vBBa9OsgAv9eRX7nr+cq/wpEQ/6h0i8+SAG8kMpfEBojM2CCrL1iHxWoSfFllBHKqjraA6990ev1MoDAtxzv4vmMSkuXGzqCwloY+5lbKKhaPN+SEbfb19lUQ2KvTkR2hFr8HV1eN6HBx0IsTh1sP6FWOs4U6oBo37rWXAle6bo+4CW0zJZr8kwkv72OHJMrecOM07URrcXmhe8A==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(23010399003)(10067099003)(22082099003)(18002099003)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Qo0wnHC2ZdV5Y/dhhK0WBSS8+oJTBl9b/+PvA3i5d2XULtxdkJ0ZxVQJZiBkjuniZQkGsGUguG4vuma+6HxCovx7FoRcQj+xiOp9Skz019uvh1oDdchZE7q/tEjqE5Nd2NRno+POSjYFlt2ENtgWxHY0sLa7WQHNgXMv9AYwiwy7hPjA4EgiCJ4OZmcVcR9HXa87xb5WeiI19ny6a7Con8K8M+WZSwoQCDy5fuYnv81E8b2slB1DFxGAyjNNYuMKMcPi7cT+hZB8m3P7XDE14TJn7BrsGRpKw5Lkci0oCgp/irF707sBX8A41geLzwOzKH148QXcEATX3eglpY730t2MWgqqmuD/c947IUiIuXnFZeMRximZ4+/xaOQWLyptDFSGqzjXi9CH/tmGdyDTiaSdrB0QEzSY40J7zyhlcgpafHXG8EjkuUAgXl35zvzI
X-Exchange-RoutingPolicyChecked: 
	pVNu7LzGY3eCsabkSrqt7xMbddSth1Z+tn8YhFsdQOugd3GwyUMJQXVHeLdwEt1JEi8n4SgZUBJdF3tRLpwfMHU1qDLBHxD9UzmdPgQG5wwraz1nRPoqvJ6+t/aoIcFCiq+2XfI1oU/ivmG5PwWoCi05/FuzYu+zugSqcb3C99FnmXKq6L0LW6aAQKZvWHOo2crAfQnvkhADu6qc6rsCzp+QhE+1UpwknE/dI++mpUTi7aOxC30vYuCu48znkaMvprCBer1bnD1l3k3qg9wOYwAe+mxukSUwFix6VgppZ2o2mIL5O3bwxLcnraPTKGuckfthAieRta8HJeCD/xSGRg==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 10:26:29.3568
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8b27a35-6ed7-4542-2230-08df1a264be8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD76.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4400
X-Proofpoint-GUID: iuT3RgTh_xsOVrzHLyYzeK06KT3BodYp
X-Authority-Analysis: v=2.4 cv=YKUKWhGx c=1 sm=1 tr=0 ts=6ab4fad9 cx=c_pps
 a=Zn3nEQaGnpTLJDFXYNee2g==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=slEeQRWu9bLXCbPdomMA:9
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0MyBTYWx0ZWRfXyKgrGfjf1ueC
 doxxGVVuCyKoL3SM4pTwqqJak6RiXHQ1cV8YJ9Hfo6kxWNOrXEN3nWBlBEIx5vcQLwcWGNlkKdv
 EffSBu064YqYFyg30pmlLkJVWauqD74=
X-Proofpoint-ORIG-GUID: iuT3RgTh_xsOVrzHLyYzeK06KT3BodYp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0MyBTYWx0ZWRfX6oqiPif+7TYv
 D6W8s3qjwa4izbrxKZsZ2VXDniPlLva+on2MlwhUO4Fupd7x0pEo3nHCDpN7AgbQcccTT9WgsrE
 rP5zfi5cK7FQ1lyBex51aZayIwKwrnsQhgKNI/5IL7bfCBEByeFkCst3/AxpiTJx4B2ugU427gD
 V7MZQe7hp3wxC3TCLe1GQT9AxrK4ZY+5KChrhrrdwRoWpbTUJHtCVOT+sU1cgUzTdqc9q/v2+rK
 lgh0PEQbaodltJJ3Dwhy5MVwf12XZZ6KjakPWp+M3yLHM67YJS2oVs2YRfUfXBXgJZwVBHggf4p
 kxmSezgAQt6LEb6NxTC7jmUUULXMap1XpltTUuC4eX4HAWs6lT2yPv1hNSUfE0ZWjABv4Ci8U2B
 Q/Lq2bL0HCROCdpC0sBQdF4laj/bNHYUlmt8briDhdiq9wMm30zuIriKBRozFz2pthCFPAIcJEB
 zoB1KfIFJv54W6vFcVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0 spamscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240043
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 24 Sep 2026 10:26:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20412

meta-ti / na / 20260924102001.820922-1-s-sadik

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [PATCH v2][wrynose] conf: am335x-evm : Bump up max_leb_cnt
    WARN: Commit message does not include file/recipe name: conf: am335x-evm : Bump up max_leb_cnt. (COMMIT-MESSAGE-2)
        patch
    
    WARN: Commit message should not include directory path to recipe: conf: am335x-evm : Bump up max_leb_cnt.
              conf (COMMIT-MESSAGE-3)
        patch
    
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
wrynose
=====================
Summary:
- Patch Series: [PATCH v2][wrynose] conf: am335x-evm : Bump up max_leb_cnt
- Submitter: From: Mahammed Sadik Shaik <s-sadik@ti.com>
- Date: Date: Thu, 24 Sep 2026 15:50:01 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: bb750f1d110b7c16ea4b562a040bf458c7824a93

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: Paresh Bhagat <p-bhagat@ti.com>
- Commit Subject: layer.conf: Add multimedia-layer support
- Commit SHA: 0485f09e0152891edbe1d553376260ca687a44d1

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




