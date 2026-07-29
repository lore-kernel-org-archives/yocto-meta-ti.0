Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DB64C54FCD
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 22:04:43 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22887.1785362679913578994
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Jul 2026 15:04:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=YK+bPJli;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=EolgD08v;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: lcpdbld@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TLVplN3821578;
	Wed, 29 Jul 2026 17:04:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=9sUoDp8bdrZw4
	cS5g5tZ3Rb2bJj25ht0VnbWpYxxCD8=; b=YK+bPJlikZOSr4WSRFC8ERbo5yJ6V
	elntXnm1MpfxAmyXP/nZyIPV6SY0bWm5HXwKZiIyGOE69pYhjpJPe2Fts2OcxrK6
	SNK0dCxRMk+ghM8pfG1VrHSqrXg2GHK2sRHj0JqFcoOofixIpfAolL9STfOa0RZA
	gjLZwlWywMX+ctrb2jVB+BpEk5Siz8FK0DkeN3FsjHFkKF9bUs8WSPyv+q5AnR6U
	auVoIVb/B2yDksjQdO8MURI1tnD0dzWAhg3EKyOESZs+ohtMBZxnynFHFWEA42fs
	zXhLlDVvUbX20B+lZUNhKHxWEyMOvtkDo7ZugwCKi6pAUP7eUWWZhVl2A==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010053.outbound.protection.outlook.com [52.101.85.53])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fqsh0g4js-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 29 Jul 2026 17:04:38 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I58B4m7/FUL3vSFIiz9DEIYA3GznlCNWZ0BWJed0GIs4Grt/c9szawXmSS30q1BLAmw3WNxNyP7qKWte2kIir175D+5nhKv0NFSM2Mt92BoO3B8J1WqCbN34BymMRB0thSeN2mNkrLsav7SxdpG0bs4H3ASZWmnOsQ8PNR7yofZbMl1RqDr70EvIiUZ/Y1ltIS52AuRZhbtv8YLRs/KMZKbESTsJrCES19ORtpclVilLl5B10RLKv9B8eGH+Bk//vuv2SYuz1PmNOYpaGaGllQDoql3rl456Z9VzWLN/grNKfr/jLdWpJ1svbPByGs+7lpyvZAj5dL91CNYR5QwplA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9sUoDp8bdrZw4cS5g5tZ3Rb2bJj25ht0VnbWpYxxCD8=;
 b=MAuvI41rLuAX3GHBfqqRBzGU+//4ZM6TYQ7ze57ougL04JcjrS5pu5UUAiuvMrYKpoylIbjYKqYK3vuxwzTM3D7FiGxcQXKdw8iS5Pzc8urfXchkx9OK6j4SczfQs1p4m6QfvU6bhbkqhVxEdNwNExxGdZbdo5TNhg5byNx1nPaUsNaeZJCsa8nmSWhsWDguR115yctENv+9QtR7UBZ+M9YVaAcuX6U8Za6iPQnrAqf8FCr1iqf1CeM20Gz8s5lyouZSHV6H7GyFFWxCzCeBqoN/24tNS+2JKfZVEtFBPKntAWYFNwrXEGEpZL6LIUNQRXdlXigsOeTkaYJC3YB8cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9sUoDp8bdrZw4cS5g5tZ3Rb2bJj25ht0VnbWpYxxCD8=;
 b=EolgD08vb+jTK7t3XcRlPVZGEsJso7N0+RjRTvCGBNZiYYpJoo1M26q574GUEa8EsjoBxCmfSbgnVWeLrrD9krnxm2TijBow8r1DmtT0nl8kU1uaX09YkIg4erN59FA5BJJEMa4Tn0PT/swCnOCghGi+8w5MjxgkYp3Co400qfHBK3oUG1sF1uLYR2nlg/kZ1Iv2++NWianvoJ99yy7r3XKaf8Bob/LPGaBsk1AO2I1dQhqz76D/Rgs479rOQa6W1g3dHUFeohVoYWR0AtAoIxw3fhezofjGEutCRQwp5SXa1O9nR0GYqTci4vkCz0d8fJ8vPeSFpzQ5NcwtF4Q3hA==
Received: from SJ0PR05CA0055.namprd05.prod.outlook.com (2603:10b6:a03:33f::30)
 by DS7PR10MB7252.namprd10.prod.outlook.com (2603:10b6:8:ee::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.13; Wed, 29 Jul
 2026 22:04:31 +0000
Received: from CO1PEPF000066EC.namprd05.prod.outlook.com
 (2603:10b6:a03:33f:cafe::3c) by SJ0PR05CA0055.outlook.office365.com
 (2603:10b6:a03:33f::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Wed,
 29 Jul 2026 22:04:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF000066EC.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Wed, 29 Jul 2026 22:04:30 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 29 Jul
 2026 17:04:29 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 29 Jul
 2026 17:04:29 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 29 Jul 2026 17:04:29 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66TM4TKG309731;
	Wed, 29 Jul 2026 17:04:29 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 4C2FD2A65; Wed, 29 Jul 2026 17:04:29 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][wrynose][PATCH] CI/CD Auto-Merger: cicd.wrynose.202607290400
Date: Wed, 29 Jul 2026 17:04:29 -0500
Message-ID: <20260729220429.2588187-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EC:EE_|DS7PR10MB7252:EE_
X-MS-Office365-Filtering-Correlation-Id: e35b2cbb-cb03-4acf-b7d3-08deedbd5d40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|23010399003|36860700016|1800799024|3023799007|10067099003|56012099006|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: 
	p+Lsa45XDfQdS0oRVGtFbGLV4r2OHeJ7SXcWMoEzWPafBwchY6dSm5ibyHcof4S/LbKcMjqEUrgdkUzkuo/8xDJWAYFlFk0LRp9VRvha10kq/eSDU3m+1fyiAZgpziDbPuQ9SsJWLk15WoMRrpGAQvlqufDqJ8XL039n6iNDXGmNwDkdJ508KvDOXbH/L/bOLgIjzb2DgR1LW1iIAi0L8XKle2TPWiK65bPvNldvM6qdWmrgmZxCU2cHziURTVb6Mchq8I040QqP3qRD6zamozequd+AjrIwTJLOM8izq5T5TxqAIHanwljWvt80EnL86YaIoLI7MYlowKOhOeuUolBUSfzY+os8bUJHTvM7uQPfc9pXsQUFe9odJLjgiWj6rGaRMwBHVGTHSc0hn8Oic6jayndSZSoqeaLOQ2p9PrSFFecFFy9Bn+kM1WdPnAh6Jsl2Z7szUabeboWm9eQyZnKcCv2Mj5IboW9cY/IzI9rXNvWPF7P/+lPp42ElIYlr89pf5JpTA8IMyeg1tcypAooVpZjmiugZ5Udxswrx8gB79Mm15PextfguHhnY26WpnaF2MDGZO/lxk8oH4ZECh8qhePKi1yoRo22DhXvH4gNvvrLX2aicmaaMUaTV+vlCFZtrAAJebKgM4l/tus/00U4IEttXwcCIV0UXIMRe1Qe++nHDg+VCrzfUKkPRF8BCRYUsbP20SLavG9CM/MdVdw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(23010399003)(36860700016)(1800799024)(3023799007)(10067099003)(56012099006)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	1AzjSaeOlpMGGHnG76ryTtZ+e80DPzOfBMR5afZWdmyInJszrhR9+DO0fr+mIzEO20Y0KstrTN9XHVMh5NQ76e1EyzaOmDmI3LAubscUWy/qAjlya3aHGmCpMFyyEBqGD9611xmE5Cnhd+/R2vWnwdF+4QbtuToBzFrvLk1l5tzb0R9ZzS62e7IVtQPfcrtQaFc1/w8/e/51y1sHzWCHDuJTP0At5SNIX0GDeJha7yH8mbiPF7MwpGHPp4P5shlk5WbapLZb5mMXZhwQqZ3o7YUo2Hv5FHX+Hb50bYI6E6K07gLY72y6zZnh3uZKM2UjE/hxRJo2FKJPzBlNUWA/n4ypK9yaWV5Kkx7yJN0CRXY/qr9rP8mlcSNaOEx5kOM+oLSTUaRsLENbOtAAmMBB1/WXpdy0CTditzknWGvsseFzLwgFJo+LxTwN024tVdD+
X-Exchange-RoutingPolicyChecked: 
	LsfYetgmG5obInrLTEZFUBrA/J51Z5on+jtvYNmgCJ0PJZtZhr4VSsaS0Wuuf3xf25sINcl+/rzUmywQflfeDpIDvgasAZQmFYCmwZBaT2DYYsmZofZGuyjvi8vXxlMHjSyOYSe8Hg8X0gmMCunbiKzIyjMvGK/nxcJSKUueDscNQLkzxZcF8AM2eejc2OmFtZYF9YU2Mq6E9I6CveOf3xEtmUryEaGYwltyhJ98W6SSeMkfng5gP4VEwwY61hohjYV6U7wNGXwUBm5NjuToxg8VuWjv14kb1qaZgXpWDpQB593cISxpja7UBkoPemeEEKc2xTqUS1ClLJp9qeSdpA==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 22:04:30.0996
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e35b2cbb-cb03-4acf-b7d3-08deedbd5d40
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000066EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7252
X-Proofpoint-ORIG-GUID: x1f13NHBVl_JaLOsMs2mL0jdxbx3Mpjo
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDE2NyBTYWx0ZWRfX3k23Hh8mFie5
 Pg0iE/XvJkkA2Dj+ZFdteZuPXtpYZzG1CcJxMw56yTqyNUfMrAE3a2hw3dGeMsEz56/XS6SNRLb
 5BgGOsjQTdZHBbdzTfF307KCml0RNNc=
X-Proofpoint-GUID: x1f13NHBVl_JaLOsMs2mL0jdxbx3Mpjo
X-Authority-Analysis: v=2.4 cv=BtitB4X5 c=1 sm=1 tr=0 ts=6a6a78f6 cx=c_pps
 a=m6tRWrYHdetyOVyhMCHtWA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=f7IdgyKtn90A:10 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8
 a=NEAV23lmAAAA:8 a=pFhdvD0aA1vN495fsPgA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDE2NyBTYWx0ZWRfX7kTkQsnpayWk
 J/gjxNtJ7Mvgf6UMJbyTWoNuAKCWaNecC98D3NinICb+MZiUKTnfuhQ/M0pBOveNBANGssU36Zu
 6RrSs5kGGLKenojVDwd3d2cYcQz2XwE97BdAypJ8Utl52KGss3jDwhQ2ml+4td0ieyU/xdg3Ymk
 Rz0ARazJD1BjT37zsZ5GrCsbU8dzLFqsrP7flr3jWNVFk6/cQxPGxpj4wIe/FFElCLLU/LiD3CM
 IFGQKYaGo70ESUEMAZG6TQ+cOaBxJmw8IionOUyfdprZbRtc61bDQOjmy7PwqcprQWJB6mx9JrU
 CCSoqsLbTMObrUMXDqAWN5vo2CW6HMlk2sB5dw+var+LO1QBt+xuKxX8MHW/F15RewcNi+WKYbI
 J60I+KcJAV4wwp5CAJDXQ12DB3P4yil6rVGxy3FiipJGPg61TjVNDaCBg4UJwJBRciqEqCqgQ4z
 rOdLBndqQrfIIUSVArA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_08,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290167
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Jul 2026 22:04:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20207

Updated the value(s) for:
  linux-ti-staging_6.18: SRCREV
  ltp-ddt: SRCREV

Changelogs:
  linux-ti-staging_6.18: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=1510cd916429bb025e2d0fdbad7ceae652820d82..9098671a2d2ce1876543f6d6fd576285a184f5a4
  ltp-ddt: https://git.ti.com/cgit/test-automation/ltp-ddt/log/?qt=range&q=26fc7b1db82d7852bdb804a21cda9e1c997702e5..7b143203fef1c7b774a49b459c092eaf0b2718e9

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb | 2 +-
 meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
index 0001f465..57589c01 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
@@ -22,7 +22,7 @@ S = "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
 
 BRANCH ?= "ti-linux-6.18.y"
 
-SRCREV ?= "1510cd916429bb025e2d0fdbad7ceae652820d82"
+SRCREV ?= "9098671a2d2ce1876543f6d6fd576285a184f5a4"
 PV = "6.18.38+git"
 
 KERNEL_REPRODUCIBILITY_PATCHES = " \
diff --git a/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb b/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
index e455267b..cdfc185e 100644
--- a/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
+++ b/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
@@ -11,7 +11,7 @@ PE = "1"
 PR = "r1"
 PV:append = "+git"
 
-SRCREV = "26fc7b1db82d7852bdb804a21cda9e1c997702e5"
+SRCREV = "7b143203fef1c7b774a49b459c092eaf0b2718e9"
 BRANCH ?= "master"
 
 SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
-- 
2.43.5


