Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0A62C44512
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 03:06:24 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5862.1784257581758639877
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 16 Jul 2026 20:06:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=nXTf68Ko;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=gfagvbxx;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66H30Ptq3919358;
	Thu, 16 Jul 2026 22:06:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=bBjdlaXO24pXDjFTMQJbJl2g0CXU3/OglhoQeyojD
	7s=; b=nXTf68KoTE7LnOWWUCg+sMUlbB/t4/iKTGTwRTk+/ib+LN2lD4hA/WxtN
	T02T2Io7GejuSONZyxnoqKN8TwFBdDt6MiXTpYUZygPzIRoy6pMOHiYwWtLgEEqL
	ELXYsle1NivazZOXFcDjT71T/4HFR9Neyd8pjsQprf9jjVdoTMXSQEXlSXzYNov3
	4+qbyQHLuadTCAe8pf62TgxWRiXJkiHELEKkxpDrFRFcM7J0qTQml4Oa/nC677Qq
	gsl6dOgEirzbaBZJ7b5VBN5HJCrtJ/r88wyxQkFekJuMd8yw1ejeY/sGbLv4IAPe
	S9bZEQYSgr5UASOWIvz9G9YXZg+2Q==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010069.outbound.protection.outlook.com [52.101.201.69])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fep5sf6gt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 16 Jul 2026 22:06:20 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hmO33a8pw7lCrc6UqmmhGTyu6peZXg58o9ydTqgvy0O/pd/MlsFnXflf/8Plb7vi/L1bmERnHLRu5FQcocRB1c6zb3FX24dCjYVJsDhsGCezrxakLBc8oBBkD9Mdhu1+Bn1gyjR39YaOpWeShME9IHa+HZ7me6ViawzOCuq/Cpr2jAKLeO/IKYZCwL/72aEMEbg7BewP6QV+6S46oYVU+WomSWuvEWFY5TVNUrDaK9KDcM9tYnhGcogo7Iokc/0mrduS31NqsRmSgsJj9mi8CqV7//yeSlSpaxwpiW7c6Plt4WkcAXmA493W67p4KIZuHsvByvTE7NVIFWanr4f5kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bBjdlaXO24pXDjFTMQJbJl2g0CXU3/OglhoQeyojD7s=;
 b=Ec1ZhDkWAYzi93xa1AsM2LpbkJBBe1+89HRijjjZS1DYSZtHnpV1UQoYK+c4lxE7mkeI59G0jkwCQ7BddX7JILFdWT5OYOcrnMdRIjYMiliRl33mAjr5EqP6lS72KzKpK29gUQEux1LXB9rHnh6XJmMDsgGmRWbIP6ZPIE103cAAMJv2N/Xy2J1LYyd+BmG/InWoZWMcNlL/dTH7IpyFln0IKuKIg5HymEURYsdFM4CT31GJAq1hPsPKkZ2uga7v5TnKA0oYvhx5mAE9gy261v1Z4AiE3MYDSBjQNNrKIZh7DcanjgDCe99Dmrr6Cf1LCHoXr506NY8gaPwGlODNZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bBjdlaXO24pXDjFTMQJbJl2g0CXU3/OglhoQeyojD7s=;
 b=gfagvbxxd//LxnY0V5o0S0n/azotrYAa3AtERzT4OcsKe4mKO3n5uXvMFZGGCrFFmkSFisYWQkaZT2FuYHmbyNi9gvhA3PaGpTBYI9e7UnblZqxzICwisIOg8m+jQva3qjT97bSKn90pdHZvKWin8k8FC8yR1BKnHYff/locHh2OITpQUQPdL2PWqFFumb+taS1KjZipohAukzMKLYvcrrVGXzE0KB77mbWp5nX80n37QmpU7m/CQBgigxVY3ilHGEJOJysL2ciFQxf2cpEuKe14enca1Xw5R8wip4y3rjAoA+k/ufnmFfYfqiM9tEWCWJnXWekI+EL1dBWQ25krWQ==
Received: from MW4PR03CA0314.namprd03.prod.outlook.com (2603:10b6:303:dd::19)
 by BL3PR10MB6187.namprd10.prod.outlook.com (2603:10b6:208:3be::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 03:06:17 +0000
Received: from SJ1PEPF000026C5.namprd04.prod.outlook.com
 (2603:10b6:303:dd:cafe::79) by MW4PR03CA0314.outlook.office365.com
 (2603:10b6:303:dd::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.12 via Frontend Transport; Fri,
 17 Jul 2026 03:06:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF000026C5.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Fri, 17 Jul 2026 03:06:14 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 16 Jul
 2026 22:06:07 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 16 Jul
 2026 22:06:07 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 16 Jul 2026 22:06:07 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66H367Ci2853316;
	Thu, 16 Jul 2026 22:06:07 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 7E5BB9ACF4; Thu, 16 Jul 2026 22:06:07 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] ti-kernel-fitimage: Fix for FIT_CONF_DEFAULT_DTB changes
Date: Thu, 16 Jul 2026 22:06:07 -0500
Message-ID: <20260717030607.3715248-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260717022540.117237-1-reatmon@ti.com>
References: <20260717022540.117237-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C5:EE_|BL3PR10MB6187:EE_
X-MS-Office365-Filtering-Correlation-Id: 00852d6d-27b7-4ee5-2edf-08dee3b05d3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|82310400026|376014|1800799024|36860700016|56012099006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	Mv7tVMlRRbhOt6D3ac8bPk7Cn7rchxGtHY5ggE3OKpsw6u9/m3v4DC8E7quZV0n3DEZxcPT8hP/rxbnPRLYdVglm2jDDOBA0uQLGcHjaZ3hYpwyufJ/uZZkx46owR/GQVTsVHtOUueqNR4wN6o/e9/n4CHO+IfPm+Hw3fUFVEVeip3J+tpLchklt5MqPhN9bZ60Sfp1JqquvgBXcLedIXNhnDvL/mP5RisRX3Y+6Rl6YJ8klxsSuoaZnCgXDet2IrJmwI9U2JJoV4WDpquHax4AOzUemJdMdQieGSQKfhRsHLt7ThNDZoW3Ye0+WkxfH2xk9ZCHQvnd0dmvvtqucekSTLK1C53XV58R7TYAjLTjAuET0JMJZtVwRJbBooaHhEMngz4WPNplvlKxTH78PE8AUKnVTuelf26JVxIYHlvg4T5CImyZIyTgt4UCU3cmC28irk5up4suxVbwdI7v4/bRKF/uXpLgEseOPM881iWWxHX7Hr/e21ErRFRSnU/1mDPXEj0uw3sKCXJW37NReYnd84AZjc+P99PPmsvPh3zV5aecBZpKKh5P9hiROs/MuSSmMa6bm3Iz2uNuhObKb1UEP5/+snz1cGswwyGEFt+ZP9+Nxux4dJ7WHWPQAHLyCuRUTMTN3As1TQh442rZYAkkcpUnv+h4/Vyu5vPR5ss3YhTpCnwDQ61443RtjQ2F90c1haVaQMukbnFg2Ur9+Og==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(376014)(1800799024)(36860700016)(56012099006)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	0bseDkuxwlMIthER7J7n5ARA78Squox/u63lVNOTytoPk7FoqKQC4AwHolaBsQQmxyjaaH0Eu7IvqM19RAsUHPbGwXVn116Rd0BV+SIDdycmtMzG4+btUTSsZw1xCp0GumS3afyZhkME3VCLUvBwGX2rh8YIVJI7m39nnjJ61kUo8NRU+kcuwWkcW76gf66CA0Uy5KOd/DUWfKk9YlqK9AjCEv6LX3qS8B5jdmr8JV0V4KvxVYOi4PTf0tecPNHrZLCslSJ8wMFG0xPu7NQPhct5IgDhSxwX41H61j+xtkYSVXPx4bCd9xVFnoKruXE1udZJfSqjrDV5711+9cGKmOJr9MbSQUS0qqcvMaMstKCt9jkXFTAyRjLZvbzzeBwR3dsF5Lyo4UuS5KOW8wnLxzLh+d4DwDOgMu9xFEp+dwWLT6YGbvCoc5Y5hICVephL
X-Exchange-RoutingPolicyChecked: 
	dHYexvbyVrfGBphwPPpFZTvdyx612jDAuwUdwnL2HmTPslVpXZAeXk+7nZHYk+9Pr1PsqdhQhI/t9xh2QjacUqxRMjVfKEGYoR8lbXN/hqnzvQJ3dSHuOXlWPnqtzaXY3ZRGn2Y+qsCWLxHFwVt3DaBEIEittI25JKKH9ebPWWQa3PB2IBw2WfZjS/whVmnIEz0B32nWB5ZpL9TvwfIQ7BUqfb5GJTDdveTAowammo5RggqI7xEorJw7KUZmIIwqW5MgcI6kcOnglCszML/qpxi9PTCDZ2C3SfVTiu6Rt9JVfjo7ePgvwJEOXplzPX8qGUpkuJewQx3Qg0RDdOyobQ==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 03:06:14.9860
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00852d6d-27b7-4ee5-2edf-08dee3b05d3d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000026C5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6187
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDAyNyBTYWx0ZWRfX1ppV8juoCtr4
 iuYXgFlQey7UMAUbkXQkoM18+G4HpkIucJwyWCUF86DIuT/bCxOn5B1R5qMhcgGeo3gxCOw+3Hr
 kII23PU8HHTBT6pvQoEAHGx7Ho9/rF4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDAyNyBTYWx0ZWRfX4Lah5T9CAgTK
 46rl5HD4kcm6B0/u/vur2BoZUZug8HFgg1Cy0kqT41SkBc3EFO4Dl3hmr8bJCPKp7BP+rYsf9yS
 +tLVaBd/ccHMlRHkMzMRuKF6UbvSKYZOyrlNPVhsl7Wx0NR67z5tdivKmLsmalRBCqkKVHhOG7J
 miAyPfthy3HBDHvE2MFi0HNzK/ZqaqZkiVOvo4Jv9STEwNGVhs7t5SHZzd0NnSTMwmX7aTqLbaB
 B9Er3ZgYBUvwRepjZolYRFytuxcUPmI1XCnQMFmW1O3NCg996FkqDRhYQ+XNzGHxbk/Y0c25kbL
 k9jBtqzumA+3MR8zVMmxKMf/APNjG5TkqzGAX2ZIOFh3/4+sBbEMXWXyDfUfAvPLIPkjrOSgNQz
 0LgbUOHnP3ADc52M/oDpUsGdo2Vm45AmlhlOTYedsGk6H9RKqhppwVAkSquqZbsv70Pwklgcu+5
 WSVDXXrD0PMy9iN8CkQ==
X-Authority-Analysis: v=2.4 cv=Zrjd7d7G c=1 sm=1 tr=0 ts=6a599c2c cx=c_pps
 a=Q5I7zFPfgszDbE/a6V3qwA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=KKAppmDicr6rT9AHj1wA:9
X-Proofpoint-GUID: 6c0tUXkEZIraLOsnzjUzr42jXSgmI-je
X-Proofpoint-ORIG-GUID: 6c0tUXkEZIraLOsnzjUzr42jXSgmI-je
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170027
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 17 Jul 2026 03:06:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20154

meta-ti / na / 20260717022540.117237-1-reatmon

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
- Patch Series: [meta-ti][master][PATCH] ti-kernel-fitimage: Fix for FIT_CONF_DEFAULT_DTB changes
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Thu, 16 Jul 2026 21:25:40 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 1bc6dd96782cb1b4d6c24b9eb6676774ed982541

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: XXX: Temp update to ti-linux-fw branch and SRCREV
- Commit SHA: ba3ac1c0a1753bfc6dcecc132bf7de38851673aa

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




