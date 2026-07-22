Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3A29C44536
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 22:58:51 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12366.1784761127932729536
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Jul 2026 15:58:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=qrH75Qh8;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=fJfg1iQm;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: lcpdbld@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MHnQ7G156726;
	Wed, 22 Jul 2026 17:58:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=bneQR0SBi+Y/F
	Ajv2uiwikXFBViJBtaUjnQ8J4QriNU=; b=qrH75Qh8gdOxjudYfM62SvIzNeuh4
	0wRJIY/Fsi2sSDD/o7F2XiXUx48AQAk1xciOTSwIAzSnrLI2bDUyUZin8Sf7CWJO
	aUt7VOn1XICVfvRq9supJlx0QLvc0E1p1wZR1xyFRPhqgGFG9S8pXgU/lW6yruDR
	8TTATNWtrYgOvST9tKMnWAXeBbVi8bagiSuPo5mLypAGV6hjzN8AmpRi4s7LzVX7
	BtOvZfVRkau8mtE3Qh+tvxAunu8WStOyLBZqucvy1Ubi1TvQp2KPwDYi239RVhC6
	Aaywm09/AJhdrEtDNcwskUHTr9Gkl1m7xLfPitHWRlQLpCl95pS9YYSTA==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012057.outbound.protection.outlook.com [40.107.200.57])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fjwjv3mu3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2026 17:58:45 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DVP6bAppzR+QIYcneI1Ygr0bQpXJkJCj5jy2mEeg0rD8xCLtqUPJXvmPgSNDffIF+Cfhe8Le3QVtZ6DW7k0uTJroHI4NsMdKFAB9JSt32ah82SOECfK9rCosenAG50CIGWdbmKSZGTvEWf2n5qMJynHlvD9uxFZ8NQ56P4eCFASibIBjLHJNkWZbSTrPsE8ephObvpXSMJ0kLhV0kgZ6xZGTKlFywL0B36/RcL8Pznj7hlHQA0a6/eYgjwW2RgcjLWSKfLTwbZcMnQR6WtjUtbV8Ye1n2Vb2bd/k5ZA6WV35X7V7YEqQdQKsQn/zcHaGXFlDtngJmGykNj+nTXrYRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bneQR0SBi+Y/FAjv2uiwikXFBViJBtaUjnQ8J4QriNU=;
 b=PJVUABmGVx1phs+ugYFIeQ3a6lZSVIAocNOY2TeC5uGkaNmEZaQQhYJUzLCDh1dIkROMT2Ep95QtyZboubvnPtVXUQj9srkWjlACHhu+snrRZO+ROnzBL2/QnwUH0nFq4uKMC7w04fkD7nOHKv6tJ0u1QIz5uBjZB6eJrRG/Yys/5Itym4AxvcZpo5nwz+j13o6r7kPW84Fbp4bO+o16bl2mFARel1qOtqKweMoPIwy5nnU3Lth84AJzucyKfnyEdvDFpE9RaKgRyy8izXU18N8h4ldXhK7SROroeU3XKKjN8NmK3yi29UFwR5XmxBSbfMqfPESiVVpWwqg40JhNGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bneQR0SBi+Y/FAjv2uiwikXFBViJBtaUjnQ8J4QriNU=;
 b=fJfg1iQmxOirMX3AyIiurccw/uGqYSdMJ8i+P/SqlYJM3r7okc+WOmEM93wn6keZHaKzqpzrjPNX7S36thx8F5TVvQJnKaIre9aSl+H4d/XtLnztcS9TdStzT6R4tKBl+tlIPo2XZrthlnvoaI0oHnCW8IcccIel9ah3IwePN4O7P9vY78RnEmXkoGnFqZnyKLtoaoGvMhUgS55tHiH1gNjOBoV9N1sIHkNd+Rt2ZGGLJUlayJVESdnNynEg7dhHsNtm9Nqy2pT8dHnSOqM6BEYJ+Okk9f+T/cQn2GucskziQnzx/rpHvsQCjMjdcyYHaf6rcL4lmbKHYQ7Jua8z5w==
Received: from SA0PR11CA0106.namprd11.prod.outlook.com (2603:10b6:806:d1::21)
 by CH0PR10MB5164.namprd10.prod.outlook.com (2603:10b6:610:da::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 22:58:43 +0000
Received: from SN1PEPF000397AF.namprd05.prod.outlook.com
 (2603:10b6:806:d1:cafe::4) by SA0PR11CA0106.outlook.office365.com
 (2603:10b6:806:d1::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Wed,
 22 Jul 2026 22:58:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SN1PEPF000397AF.mail.protection.outlook.com (10.167.248.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Wed, 22 Jul 2026 22:58:42 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 22 Jul
 2026 17:58:42 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 22 Jul
 2026 17:58:41 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 22 Jul 2026 17:58:42 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66MMwfdB4066053;
	Wed, 22 Jul 2026 17:58:41 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id DCD402A69; Wed, 22 Jul 2026 17:58:41 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202607220920
Date: Wed, 22 Jul 2026 17:58:41 -0500
Message-ID: <20260722225841.2359355-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AF:EE_|CH0PR10MB5164:EE_
X-MS-Office365-Filtering-Correlation-Id: 04c95ce9-1344-4062-bef5-08dee844c711
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|36860700016|376014|6133799003|56012099006|10067099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	nxskuMO8pnKs5v799rYVsMEmtzBEBCRxtJVgKNGdo2hI9XdrLqto46sCl40YI5pHKJ9wjojOXQ9vft1ckkVS3aVb0/3TTHI+79hwA4bN95KOi5SWSbnyI0O0PgRpC6r9cjyHGQ8W+xrfebQFw+R6lrCZib/UshcSl1cCClNCRe10yp3T/XXPQBfWA55SDUZxCnQHPA5M/X63jTuFAfPptWRlakXIeLIFwCbvQr4JcYoMHAjRuYVbqvN7Hf/3v8L5KzLSnqbHFt3hd0ubEOmU4nJuqnGHo5fbtB2p9/8+KQ+wmUdxSxIrjU9hL5lNGWUrPwge5YTiPNG2lJDjn1nQzByLrOH1MUjmhHBgzUqC8e+UydKBhNU/e3IQB2ECoIvK4Y7seYCQoOa1S1oMyqBi8HSdb5AyVHxFrvrXACZOu5yjq73UkCGHlopbf2RXSwQs0VhadTD/XYeNQpAGSs5kDV6UQ40o67T7Ev56O9tLp/DwDAmm2QZZpFAYCR8XgBTthvAd/W0LW3FjhDZJe2oclp5vSvwF3u42h8ZnUcUHcBNkbgICljvTTgB28b9viPjsilrwfyxAihZjNO/whQ2Y9Ky3Hwc1qWqQp0j/J0o4SnYLvYkWC7CNA7XukquC8SohwFHz1pZATAuxdddN4JJV7DuXfeIJZvG7hwQm2Rv9GL/re15nFwj/jBP7bUbfQb/lF0wKqMXtJ6DKDzZKN/cs0Q==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(36860700016)(376014)(6133799003)(56012099006)(10067099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	7DSkktayioMuAH1L6QdeVBgx8p7qyj6QkAnMj4UQLQBIH7zX6gUfsz57gmG3SRiBkSi3Yxl//GEk9bSs4O2nsA/C9v3mbnp4YD7nuSDRYU+uHJEbtRJJZ/vDAQosMBktgh4DG2N4NHGKzwcEA5gpqcWcWHyrcSlIJtTw/WAVoC3s+VjXDRk0QWum2ErGJrIS1F3yD3Xexqv0Ir2agazz/4IQAV8oM7A8f/jPvWSz5tExzpoPaUNTyc+piKAv6o+4z4pVmqxSbyxPYnFZ1Sg68VY4bT1PIprqXAR0/qI38j9LizfMDwVZJJenlXP8a+IsZg3VfzRXVBfCF0/daB7Y/2wgWSuUPfni8j89BIezKyM2Rcv65cq4j+tNnlrEkAVnuSW33xR57u7/80Y/ueHnU10rgqyKyQjU7+43PsOvDZN1K+jlJn13mUQSaKyM381w
X-Exchange-RoutingPolicyChecked: 
	JW2zjYNt5VmrZyttuZ/zcJDtrvp2tGMl6G8Blwx9BmlMODdWCVroIcx18qNL/gDjcYVz/X4+pE/UbnH+ucXuCnV5oObiH/0B28remdcmfSQwCkbOucx/I/s5pUHdfF2sYe+LSlbTza4fgjSv4Y3H8kXz+yphjyhaz3Bdxa015qGDSaLsWFCV6+h0m9kCYBkig4eSOp5Iugn+yRZ++7Md8c/ZUzitfrFcM9H1x8kGkMcWNE6OC3wgxqAEgepv/rGoElZsurhqOMV42HDxtT++8fWoTlsE8B7zKQm3OSa1h/tXpvqbbvEw/0kmYm/sx3NniJtXMAIcSU/DCKUZWfxLAw==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 22:58:42.7914
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04c95ce9-1344-4062-bef5-08dee844c711
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF000397AF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5164
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDIyNiBTYWx0ZWRfXwX7eRlZgBBv9
 V3LDLIORZof1F1Ps59gfS3aUPwOz9dwvfwRBMMnB6y5z2DqHd87aexFSz2wcC5WxDqZuc0kiRR+
 XGFWis0yGaY12ehqaZQrgKXpe62RDHs=
X-Proofpoint-ORIG-GUID: wdB1PUX7e3-of8fyopUP4_HyiA07rR-R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDIyNiBTYWx0ZWRfX56b7wO1azEtA
 aqXPFQoh1hjIF5rLqYQOorz0YzkI0bpYgDTfxu8ffiiHEVkOtChJcxJJsdOHWc0K1ZuoMRy5Far
 F6ovthiGbv9sGddk+9QRILF+suh0WiWFtV39btXt3zhsJhZ3/jaOmk4de2F2jpYJ/9MGawag2hv
 DzNI+WN/M/02GfH28eajAvr9gInFdBBqxHFGhti21klS7Jra/7cd+WlguduFAIStChwkjCFy4di
 Yz2WV/IEY2KEqOT+EIK9OWTauF5TJ8vOX9+S4GvWfbD+bRSrb9ollswWQA6NJsWkrQKbLkTmqsd
 BpktVbFIpbFd2AMwG5Dl1v51kPgtdbnkmtrPWyCCiqskL7qDor71UeaOrtYWurYNJ/ey7SyOynV
 PJcSyavFAFd/T/vkMnrCbnrnM/UfadSqwwomjz/URSfediaFUukT1C6/sMGh/KI7i0HxJkdu9/Q
 yQPCzJcZuOvEarcAWNg==
X-Proofpoint-GUID: wdB1PUX7e3-of8fyopUP4_HyiA07rR-R
X-Authority-Analysis: v=2.4 cv=PsyjqQM3 c=1 sm=1 tr=0 ts=6a614b25 cx=c_pps
 a=sWN/8n6q3Grq+dQ3JdI7kA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=f7IdgyKtn90A:10 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8
 a=NEAV23lmAAAA:8 a=pFhdvD0aA1vN495fsPgA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_05,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220226
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 22 Jul 2026 22:58:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20187

Updated the value(s) for:
  linux-ti-staging_6.18: SRCREV
  ltp-ddt: SRCREV

Changelogs:
  linux-ti-staging_6.18: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=8933766be737ed2cabb9466fce497b8bc8c1ce21..1510cd916429bb025e2d0fdbad7ceae652820d82
  ltp-ddt: https://git.ti.com/cgit/test-automation/ltp-ddt/log/?qt=range&q=dc5516f772ff621c2d7d517e094f1a4db3a972f3..26fc7b1db82d7852bdb804a21cda9e1c997702e5

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb | 2 +-
 meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
index 903133aa..f2f27e83 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
@@ -25,7 +25,7 @@ S = "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
 
 BRANCH ?= "ti-linux-6.18.y"
 
-SRCREV ?= "8933766be737ed2cabb9466fce497b8bc8c1ce21"
+SRCREV ?= "1510cd916429bb025e2d0fdbad7ceae652820d82"
 PV = "6.18.38+git"
 
 KERNEL_REPRODUCIBILITY_PATCHES = " \
diff --git a/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb b/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
index 5dd8b52f..e455267b 100644
--- a/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
+++ b/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
@@ -11,7 +11,7 @@ PE = "1"
 PR = "r1"
 PV:append = "+git"
 
-SRCREV = "dc5516f772ff621c2d7d517e094f1a4db3a972f3"
+SRCREV = "26fc7b1db82d7852bdb804a21cda9e1c997702e5"
 BRANCH ?= "master"
 
 SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
-- 
2.43.5


