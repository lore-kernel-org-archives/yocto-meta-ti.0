Return-Path: <hnagalla@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6809FCD6E5D
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 13:51:09 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24196.1763041863169174235
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 13 Nov 2025 05:51:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=a48kj0MF;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.201.17, mailfrom: hnagalla@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OXhOkLgnsf+ymWid5eE+jCqHyFrE+Gbem+JZF4E8+YIgYXOQZy/QXU4AAoLsd9H2MNnvrGlS9wq7v6NM8XXBvn+QfVnxwxylu0dCqlszF7cDktUJpgYx+B+rkkYi/hevYye2nDjrtQ7oMr4q0NfZ5y56aXyZvbr29EXwN6q9SZbtWK8rTrYbH1l0x12LUWBaZAxTNeHpYeu+bJLpPAcOHxr+CLwaEWPTFgiw1h/CH6T7lSjMZyydUzz4BSY4oi2EXjEw3j/3AnppfSreRHs0jfHW2cwpXxDFiFG3t+fuBIP+yU2k3gCEJDXbaW285R+4ViIllE73EHYvM/NOSI1YBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IH10MXg+NUvKfrSR9PCGOMYGQ0ZAoVJOL2k3DvC7zRs=;
 b=iU3f7FIoa6tOtfjVllNBAwlfbtih2+ACV8Q+o/42rJ6VbzVdGNzkYEuzWMjQXHqCoijihqfaPp3H+5LXbQwOrR+ffhHQ6xYumJk88skxU7MR1MIVnG6BtWE/DFxFGAvNIVQLDu0JaXkfUpy1XpMw2qrd/CvRd43wiwkRkeOaCRlNPSZBKY66QUCi7WTxiWWigw7oV4L2BBGpYwxNBGb9x50iwToJ30096ZXoFvKZtwizK8KUkwPKZ50s3IPcGnOq+8OIX+YVWFwYo982LsL/Mdn8q5UyiROqd5/rUdcUH2XAtT87txYQ4Y1nUnDqWUlaUuOpWaHyv6PzUUyULu5dvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IH10MXg+NUvKfrSR9PCGOMYGQ0ZAoVJOL2k3DvC7zRs=;
 b=a48kj0MF4g5PLU6XMjjQHaHw3fOGjzUEuV7/fOtEZZGUKX15hq14l3FMmVyI4IH/61KYKQv7C3ifRvos38mP7wDYlkxqzprpxtSxsWGQz7OzJ0BqQTt8XsngmzxnGTQVknASZ6eCqUbh8qR1bQ1T3pj6duQ1/mIgy8e/AaJDpMk=
Received: from CH0PR07CA0012.namprd07.prod.outlook.com (2603:10b6:610:32::17)
 by DS7PR10MB4829.namprd10.prod.outlook.com (2603:10b6:5:38c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 13:51:00 +0000
Received: from CH1PEPF0000AD76.namprd04.prod.outlook.com
 (2603:10b6:610:32:cafe::1a) by CH0PR07CA0012.outlook.office365.com
 (2603:10b6:610:32::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Thu,
 13 Nov 2025 13:50:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH1PEPF0000AD76.mail.protection.outlook.com (10.167.244.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 13:50:59 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 13 Nov
 2025 07:40:46 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 13 Nov
 2025 07:40:46 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 13 Nov 2025 07:40:46 -0600
Received: from localhost ([10.249.48.175])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ADDejxl351560;
	Thu, 13 Nov 2025 07:40:45 -0600
From: Hari Nagalla <hnagalla@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <praneeth@ti.com>, <nsaulnier@ti.com>, <b-padhi@ti.com>, Hari Nagalla
	<hnagalla@ti.com>
Subject: [master/scarthgap v2] ipc: ti-rpmsg-char: Update library to 0.6.10
Date: Thu, 13 Nov 2025 07:40:37 -0600
Message-ID: <20251113134037.18115-1-hnagalla@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD76:EE_|DS7PR10MB4829:EE_
X-MS-Office365-Filtering-Correlation-Id: 82abb92a-bfad-4707-63dd-08de22bbad0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?qgduXJ987sj/EFMhN1FereDlWF2Sobi/2O2nKn4iuIYi5hV12Jvj4ka+d6G+?=
 =?us-ascii?Q?rW9Wbq3a5ejUpq9rAot7ufG3H5QlgSXM8gzw4KsneBjd+rVZsNl5UuxW3cF8?=
 =?us-ascii?Q?XtGsVGtxtpp/WBX3+ait7E/VafNxZwm8zrLS5VJ8ULrOmPSvbmSlTb6YbvbA?=
 =?us-ascii?Q?dPyJ54HB91gPyFZwHyGbep3iFZFdZoz9GUhIjcXxfw1uPtbFLBOyyKDtOSS8?=
 =?us-ascii?Q?yRMzJGDIsTMes1TIJZGOR724h4wiGvU2dwwmRKhBjmka5oh+pZ5WIIRK6772?=
 =?us-ascii?Q?pcVVQ5sJ6OPluN6sIDQTGxGZW3l+zAdxTa481CFMlZqeFP6ZgXxU9eDIWWv4?=
 =?us-ascii?Q?XgE4w9trtupWbLIMSMOxBQ4Yf9fvC8UGeDPM+3zGT20+Es6mK6q1PPIBTJqI?=
 =?us-ascii?Q?y7I0yc2yjpol8uy/nfXg6dqofvdvPiw12vYlxvsmxFUplX1OjlbI/x5TfQET?=
 =?us-ascii?Q?jTPnWecTIIAXeffogQGOFFeIlZAWjr7dmgy9cboS3w7U72dFbhEbAMmdKb4p?=
 =?us-ascii?Q?lpHh1dEoIyAFe5r+bsDFQH7jvT3YEzEbEqRAlJhRcLyXDKnBUhTg8nhLSb8m?=
 =?us-ascii?Q?tyTgR9Rt8RvfjPw82trLm+7AA0NqtJ2v4j0EJffcIhMVlczRu1WExdqNTgYR?=
 =?us-ascii?Q?gATQVfZwO8QjILzGEPc600TQk1VL95xPATJw2J6nvDZ5N3wmRWmK1Te10g1i?=
 =?us-ascii?Q?6TBL2vtxsvb9cA2vkpgtUig0yuG65My7kWh4PDYotqOJmmxui3wy2N7Jr++Z?=
 =?us-ascii?Q?iW+lNoDoR5R3nCE6yC2ZqO3QzRIEl4Wj7fL/lyruvE2OdO+7peVhrFo6yHtm?=
 =?us-ascii?Q?cVV1paxIiGqRYLjtip17yEHqJWS0F0RFXRG7wT8fZfY4hDqcQAQPpkA5Ba5j?=
 =?us-ascii?Q?dFl15ms4+Ntad6tUepfLHWMvRbo3FxQcQzan677t2Ovfa4qvv21dJAZsOn2N?=
 =?us-ascii?Q?f6Ew5ihtdRrGnYj8fhLOBgFYhyycIQvoG1eP2WRXXV6iXCCGjYmuOxyZx2pi?=
 =?us-ascii?Q?7PGwGzUxmFyJZh3qnigWWF+jxS/f1XUNabvbuOtDeLfV9FyjUS0Fn7CrJm+c?=
 =?us-ascii?Q?2T9QAKYbyTZoTZmUjULrK8/K9aB8+5NOEniaLWh99mhRJO3Y+nbe4CRCXoNM?=
 =?us-ascii?Q?9vlWgP5T/mGOQcK52Xi5N6GkPN8ker+K8BvdBm0V6NPdV+BFc4n/02ZD4I0F?=
 =?us-ascii?Q?4hntdjgyaZ51P3WuL3cZg4wUNSFxaftG1T0JQNZXO7JdVRXAVkmzNHpJvtpg?=
 =?us-ascii?Q?YRKEoG1BABknP1rGN7fL03af7QfAdr1/s3ju5w/LHg9zmQp1dT6tIPjZgoDw?=
 =?us-ascii?Q?RqMrGDd71VmOWldNeL+PKFiJCVE8hhdEzQ/EV+jjnl0hYOlMVjBz1FyGe7+H?=
 =?us-ascii?Q?tvxIJ9ZCyY41V1Ng1PhVPT9UYbTTCSkz1WfqneI1841CdN6GQDNA8XepMgMT?=
 =?us-ascii?Q?w3VCl9f3FFyaR4KcIGLIxTYreh4s4V34Id8vchcCz288eTFr4gPiI6HgUDjd?=
 =?us-ascii?Q?JLGIkXAuZCnqKPsfuOss2strfWWhL+SSV9Sz1yRtp+3izO+MMT10zGqknDIz?=
 =?us-ascii?Q?AeGJKzZ85G9CWSNbffI=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 13:50:59.0037
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82abb92a-bfad-4707-63dd-08de22bbad0d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD76.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4829
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 13 Nov 2025 13:51:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19268

update rpmsg library tp 0.6.10
It brings the following fixes from ti-rpmsg-char repo:

d4cf638 src: fix bug in file_read_string()
3e72722 src: add api to fetch kernel allocated remote proc id
5061690 benchmark: update max runs = 1 trillion, max latency = 9sec
4aa2a84 examples: clean up tabs, delay metering
07660dd example: add rpmsg_char_benchmark
b40845f Replace read bytes from 256 --> 496
b2e9e2f Update max message size to 496

Signed-off-by: Hari Nagalla <hnagalla@ti.com>
---
changes in v2:
 - fixed typos in commit message

 meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc b/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
index 0350152d..e8f0f8ba 100644
--- a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
@@ -7,9 +7,9 @@ PROTOCOL = "https"
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/git/rpmsg/ti-rpmsg-char.git;protocol=${PROTOCOL};branch=${BRANCH};"
 
-# 0.6.9 release
-SRCREV = "09b064c6663ed46e4a402291dd87c8fe96135bd7"
+# 0.6.10 release
+SRCREV = "057b1a249261e26d00c501b59646957160ec815b"
 
-PV = "0.6.9+git"
+PV = "0.6.10+git"
 
 COMPATIBLE_MACHINE = "^(k3)$"
-- 
2.34.1


