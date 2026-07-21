Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF5C5C4451C
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 07:56:29 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17579.1784620586092119822
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 21 Jul 2026 00:56:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=XjNbXifN;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=r3BIeEwq;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66L2fb5V3857445;
	Tue, 21 Jul 2026 02:56:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=24T4VYgkwj3uQ7zr4MqK+esEDumcPtEMwsCkWvGlN
	18=; b=XjNbXifN5YyzJHRWPdHkBmPAt0MjUdJyZezryiPJqKNt3Qu1t6Ii80gMx
	+ndmQxYY6P2kiip4rIpfQqegEKOCtojEbQNEWPZ03hr+GwYtqr8h0Rgl5N1p5RT2
	5VlO0U2ciCmWiFEPJTYnaqY4KV1RqZFGNDRuwVr39RtQkGnt1r94nGrbABAMcmzt
	3trL/Ky9cjp1Sb1NpAOcUYHelXpCfdcNU0qfAh7ycIQMZ67jQtToZ2XbI3Iyxq5M
	IElS7790IvHT3YxQ2lWmMiAJK1HWlvQRXtWdy0/tTRN4pzWdbA3mjcAkZOFhsrQB
	2TPejr61U427HINr5MxA1OtzpK2pg==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012041.outbound.protection.outlook.com [40.93.195.41])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fj077haxr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 21 Jul 2026 02:56:20 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bvScC+oLgRMEV5pXGV42EV0mKVk8fWhQfE5T3alrGFLTUHSYULSi6fPz3VBpSg2ABEZHQ8Bji5/4daiLUljTZ99h+Npwgz2Ng+DnpC9x0AYxljw1VuALmIGvdlU916tQMjzJmMudu8k1cz/7MlUFiey7q2QLwGTwhJIWX6bkhGhSqDSfiR7Cutu6jh1yqoLGrdehdIRYAeJLbQSnymU4NeYbuGSE7GZRpvVEmq0b5Z9uJbpMLSZh6Daydcnu8lHVksGO9mUxjQKkBHpdz7/48dJPryNFvuaY17LoOQkIUxQ+HfXYHILG/6oN1HwDpsjvzBb7zG+lf0Hh4GzJsCZPTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=24T4VYgkwj3uQ7zr4MqK+esEDumcPtEMwsCkWvGlN18=;
 b=BOr4F+/dN7USpJ469/WXikDknjLMfNnEE9wI70LTxJMpJddq3/QN3raPUxNdYA443FXAVlMek6xuJQPDAPs9OpdUuJ0Nr3NSOgTjzQhdjFGo1eRLYMbAr+xoM2bRYrQIwJFj+A6aceYTUKxWkDGdnkltP+FyuLXmmWwuB2WwIb3KgS+PtaRK5kz7KOH47hwClmn0XM1Ikq1ymCV+sxb+5z/9eEZHeIq6ycry0JVida43IQqWSsnnvMgQqbfVTDYFy4BIpYI47hrQ0oQ2rabvoHalxbGGgqTMIgoFSvZq07qZ3pCzdnnlqDz4QAHhql7aRnLI0mjy9F9ISTzOvNVhMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=24T4VYgkwj3uQ7zr4MqK+esEDumcPtEMwsCkWvGlN18=;
 b=r3BIeEwqiegsVovz3N1QMNYc/P1uWWCvgGiKb1lfqIJ5vIJesiiZAv7K19787ts0ca1FfNyWXjs+kikDVXK8J9mk0aywacbnC4g+XGy9JTJv04P2lPByfM1dAy5HvKCp5qPGBRdz69GCHm4NWroDyo8W35vQ+skr6+D0/OfJ/MgxFIjvSI8fSi7KsX2SU/eRPkDqcnVOYMNbR/0pZq9AKpPT0VZ8ZbfW/HlufBxOUJxeEIa9iWAmnN8jlTMtP+lYCUybBHfIxa9RrHPyQw0GJ9UjuzHEuLjHT4T87DL3FQyqBnr2WiVNJjphGWvw2WyDOrZB+lPN6uNEUfW2RNM5Kg==
Received: from SN7P220CA0020.NAMP220.PROD.OUTLOOK.COM (2603:10b6:806:123::25)
 by CY5PR10MB6240.namprd10.prod.outlook.com (2603:10b6:930:40::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 07:56:17 +0000
Received: from SN1PEPF0002636B.namprd02.prod.outlook.com
 (2603:10b6:806:123:cafe::34) by SN7P220CA0020.outlook.office365.com
 (2603:10b6:806:123::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Tue,
 21 Jul 2026 07:56:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF0002636B.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Tue, 21 Jul 2026 07:56:16 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 21 Jul
 2026 02:55:59 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 21 Jul
 2026 02:55:59 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 21 Jul 2026 02:55:59 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66L7twsT842700;
	Tue, 21 Jul 2026 02:55:58 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id E2B5C2A53; Tue, 21 Jul 2026 02:55:58 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Antoine <antoine.gouby@gmail.com>
CC: <meta-ti@lists.yoctoproject.org>, <francesco@dolcini.it>
Subject: Re: [meta-ti][master] build issue on mesa-pvr
Date: Tue, 21 Jul 2026 02:55:58 -0500
Message-ID: <20260721075558.1620929-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <CAL2HtgxQHThnmV=HfXAFAC0_52BHw73sPsym_AebCXM5Z_tvZA@mail.gmail.com>
References: <CAL2HtgxQHThnmV=HfXAFAC0_52BHw73sPsym_AebCXM5Z_tvZA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636B:EE_|CY5PR10MB6240:EE_
X-MS-Office365-Filtering-Correlation-Id: 70b02331-a18b-4cb0-5b31-08dee6fd8b2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|36860700016|82310400026|1800799024|10067099003|56012099006|13003099007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	pkBHfHf1kYPmoOpJpxzuHW9YQGbJjIc0Jy3Yp8S7eTS+rEKOvT+/THdfJjlzxFubhNkSlBySuR4BpMz+nnwcMm4gKO83qF+sgpvjsknodmP21nIcZUjZiVK9O0ME3vj3T4GjkIA8jji4DMwYiFD/Ks7j8GoAuadpLFDLfi+Iddx4JvjzFYXEI4quPSjJl3/PGeFMQ03wMOpupO+jTFhxmG0BV79VzHmQBAcblVa8QZCi3W2N5POtFFVpvCGSa2JaoNk6wb/rE/poaxba67JNbNhtvqH9EeGHh3ECQoMfQqThLiK3ipcgjrkCVTl+oSvKrNJP6xjvtzTKmxxOG08+KOm9TKF40YOcLpJJ9LOaZGGUGgU0cKVPL3K3OtBgtBy6LLzdjwS5RJGf54pg626fUXRc2sm7TXFDGx+gL3Z3CsdO36YoOJKY4VeJlHrMWV54HVaJjekAIijpXNaVqjg2185UyNpjt/BXJSTyqPag3JkcEcQUGqP+xXYESw8aeHPmLqdERiiiNfDWtFUn0YP5ksDm5hH/PhfCFtQCizzQY0vagO/Vwd2WtV2oUmQR8oSGap5T73l8cRZWo0EbZV70xm8Guk0MCyhi3QQMmqlehTdXq/tvFnLyvOjsahaazSqtvjaLk9e5PgQAZ07HnUBuI+QDeWZINExgT3w8QiyARUZWkFPaU/YL1hVNYCTbwoDabZrHmTPS5JXL0co2ykSqgg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(82310400026)(1800799024)(10067099003)(56012099006)(13003099007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Ief0yU46uCwUG/8Hg1Q0tEF4bfOJ+APqm43394hvkti/cnoLU5S6JaMOj4VmULwp7fJFLMWQTE5aiPGwJ7UFo8aKmln5c8L/oCGwyanc9o45dRQxECgyqe6ffIf7YPl5z+oB+yJlM3g41UetXQpdolhKYf/v6JZb6zsWO7TO6ogFZCrqmKs5Sq5bUfsMDcCCgk60KSGmGdtq10bmUs1UKhTEfxk1wCN+Dtr71UgJ/yOZ5q3Hm7ktfKXa16PLOMoDAGUpUBoK/xFDLT3k5RWvMaY0DqWutxZd2nMokakxtGxIk1yIp8C+5KRYtCy8O+dH9EBNkEz1y6jRddc6vPLH2fT1Fei7aRlyqfIRIA7d6e+7yLax81/8NJHBnHjWyAGCBzAoGX3uw7/QYlbvm7kz2ffQptgBDuHT0tXSrMlg5ghOpCjXvc6o+awCgFchlj3n
X-Exchange-RoutingPolicyChecked: 
	X+/U0ZGTxyUQeFRu4P7N0UkpAAuutAEG14Fi35badmFsceD+6EkSa6hzPc/O4+4O7i4VpBOOoXiaoKtsD1ncIWIXG42e/DGF8cC58tJdsW2Wi44/cOFW0QEGGwbDlJExk6DBeaVykiqsVWHA4AAImz3vRJRYsOTh62RVBq6nUl6Yb0AkyVCQ4/4zfIgTDaSZgUsuPmdNi2O6vh/E0kGnFKfTYXkp/FX9b7PJoTSPA2MpPXdxTD6m3+JLHJlO7G63pg/JllTAjZvh5p6OUmckiZLoPDMuz9z/oouGUoN1F5ocYDE3zIEnV5Rx7flF4pGoKO4pA1Cy7jUrhL7yZ5T+XA==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 07:56:16.8678
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70b02331-a18b-4cb0-5b31-08dee6fd8b2a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002636B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6240
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA4MiBTYWx0ZWRfX+GYnVw1xpWw6
 X/EIsOd8ejeStW8GAopoMsSv6gr78hnR++NnvzyJiluOKdTIGLvQmE8qpCQd3L3OqFPZsx8zKwM
 iK75m6V4pexu+ypw3qYRsiQJxJn1BwvEyiM+8w6n6Ra08UzBXnBa8nN2MCmMs+ZOjck1mda7tZb
 JEkya3nW3Np1U/BC6DcUiexUeK6ig6x3VWXc8Gmx7mluut5/F9irMnkEZ0sCHaMQ85bW3XB3A7/
 Qe2TsI9dMeuz4sbn0s0dYKjOUc++ds4eCjXsj1DebDAcjhWw/rFZpOxpSFgA9Dd8jsz/4+lqQrd
 fu+BMa7AcPEC61Vq9GHMiot8By8K75YNySSZ7CQxbApxmmrPX0wgRa+tpOXrRa8Fr/Sd3cbh81h
 rwkUqPIqR7aEu0p9wdPOD1g8HmeCi46GKglSQGsp0vnsuw6Hbx9iDH7UtjcXNeRo57nGh6MNng2
 h7m1hM2Pmxmgo7ek/aw==
X-Proofpoint-ORIG-GUID: akfYxspA46hoUhmj9BVmL34GxfMKDy2D
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA4MiBTYWx0ZWRfXwMoH6MgLBLL0
 phnmfTj+MhYis3sL9x9iDZzMget87RJsegR8nDgIn0jSp0bZUgeX+mu2aNwGDjbULmjXJyLGZBk
 vQWMoPXAWCWZagUIS9WxGgD4OSFGrHY=
X-Authority-Analysis: v=2.4 cv=KabidwYD c=1 sm=1 tr=0 ts=6a5f2624 cx=c_pps
 a=9jlK8eo7xmF8zH0m+f/LEA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=iGHA9ds3AAAA:8 a=FYHpdWyXgJDbbDMHDTIA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: akfYxspA46hoUhmj9BVmL34GxfMKDy2D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1011 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210082
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 21 Jul 2026 07:56:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20172

meta-ti / na / CAL2HtgxQHThnmV=HfXAFAC0_52BHw73sPsym_AebCXM5Z_tvZA

PRC Results: FAIL

=========================================================
  check-yocto-patches: FAIL
=========================================================
Patches
----------------------------------------
FAIL - [meta-ti][master] build issue on mesa-pvr
    WARN: Commit message does not include file/recipe name: build issue on mesa-pvr. (COMMIT-MESSAGE-2)
        patch
    
    ERROR: Missing Signed-off-by in commit message. (SIGNED-OFF-BY-1)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887




