Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15FCCC4450B
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 14:28:27 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7099.1784125706422506010
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Jul 2026 07:28:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=WIvl8Gs3;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=veBKLXXO;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: lcpdbld@list.ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66FE2xv11142406;
	Wed, 15 Jul 2026 09:28:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=ApXcCJT2rO/lT
	Y/tn/vnmgd73UZjEBJ9E42u7UVTKws=; b=WIvl8Gs3srOPspDp3S8jKI8fqoLoD
	CCJc8428QDQS7zHrYaub/NUM05/qjIFT5bCva0Geom6oXygBhFAERkk3LG5j27EE
	4apfIPORZZEITWCSsjPesUCd3HMetgCw8v7Ns+qTWcbdm643k0osJkwxq6iGcQ0J
	dNEpjEP8G8wJEBW+8qFqI7MgGo1TXal3sU1ZT29dpjtAsH2ijOetWEkBDegTbsco
	7VAiKz/9fwtSHXkWdsA0QlphDzDfALC+2Jmesrhh79YRDUUXp3l5qJe4pp1Ma5w/
	QHJPRJzkrY3lp7A5u8jhx/YzjWrY4K0bjt3VKrXvzHnX8rMviwFB3uu9A==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011000.outbound.protection.outlook.com [52.101.57.0])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fe96hh91s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 15 Jul 2026 09:28:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iBbmnC1wA//7sWEZrWTtsFZQVg6kRj+KvyVFuDjiKtIS1qUrIjPF72QFDXlzqO5qHtK7EI6LcfRJNum1yfYf2EJTAbQKOGfQLNEsOIf/8BHlg5fvA1FIEwKA25QtTyHFNY/g3s4GEGAb2YmgNbddSLHjmsS/PtUTOOws5wBMhWP+OakPjMMTP2IqFoAtBWjXM0tYBETPnP6W6LfUKcBndXqcWT+TLcxYRLhsxcps90LyF+gqtNmAyJdcuW5+6UBP+7qZczmWgf/vilGutmd2U+k1x1fHIJAlH6Dl7gkP7D4j9l25SsmuEj5d8gZ73oIg0WyZnkSN5QlW08VoFkpFPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ApXcCJT2rO/lTY/tn/vnmgd73UZjEBJ9E42u7UVTKws=;
 b=emxJocrOVKxMe4T3ll8p6XtYdc3s1d/CEqpDii5bOeBlrhxjsM094ldxtl1MONc/B8BN2djPDlW6xmJkLmPohBAXQk1MwWpbWbCJRTMtAgJzFXLhjHnnxRsA/wLuwUAJ0xi2GmGWTDEDrHROkaf8VDlYMhbkUs9dYvGAd+zUlw5ATgNay6tNcAAM7aUSD7Olc4fgFOHSoT3RHkj5AE7qVWMrYFu1gKq+wsDV+01SRNgUPVn1FGUoYG/kMZ9o4WLCRFeWt5pBnefnAHiCnwl/u6fW7KiJM2sJmp93niSUMnyV51vMtLEUxXgI/lAnU093p75+nQ1B5f+LBuxCc55P1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ApXcCJT2rO/lTY/tn/vnmgd73UZjEBJ9E42u7UVTKws=;
 b=veBKLXXOeFCdOdt/bv02/RCCnxQnMejl/KthS9Es2utab22wBRiicT3RBLRl4cxkEXw9ESE3kesExhPDWteRe0vK9rXtYgtmCHGLQjX5WM3EBXvF5z/eqiK2m5uPD1m1/jG6vSMNB+FdbOScgOg5i/GJoQW8oYE6zhlB8bT0PvF3Jf94rpE8DROp6YVV7Qvr+j71GkLcLP+autBG8VNppPQ8dFJiqoO4OdRlekhLCfE/wGqRse12/IVhw8yRQ38JAU0O0hikjreK3gBtzbzLj9U9CNlkDl9EjwjqqVc4l7voBgDHiYj5GWGaTNTG2vTfXEjf7gXupYTXplKed2rR9g==
Received: from SJ0PR03CA0274.namprd03.prod.outlook.com (2603:10b6:a03:39e::9)
 by IA3PR10MB8092.namprd10.prod.outlook.com (2603:10b6:208:50d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Wed, 15 Jul
 2026 14:28:21 +0000
Received: from MWH0EPF000A6734.namprd04.prod.outlook.com
 (2603:10b6:a03:39e:cafe::e) by SJ0PR03CA0274.outlook.office365.com
 (2603:10b6:a03:39e::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.12 via Frontend Transport; Wed,
 15 Jul 2026 14:28:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MWH0EPF000A6734.mail.protection.outlook.com (10.167.249.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Wed, 15 Jul 2026 14:28:19 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 15 Jul
 2026 09:28:18 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 15 Jul
 2026 09:28:18 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 15 Jul 2026 09:28:18 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66FESHrs2667364;
	Wed, 15 Jul 2026 09:28:17 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id E48AF2A67; Wed, 15 Jul 2026 09:28:17 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202607150653
Date: Wed, 15 Jul 2026 09:28:17 -0500
Message-ID: <20260715142817.1560417-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6734:EE_|IA3PR10MB8092:EE_
X-MS-Office365-Filtering-Correlation-Id: 20d58303-e43e-4c3c-2adf-08dee27d5176
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|23010399003|82310400026|376014|56012099006|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: 
	JoDqCkq5XOXLeIxrbEAV3mF7UXdRaWu9Obhx82+LU+/eRICBQP91blRdIMkq72gsyVf8IiDMA2zPP/8vhOQRGcmz6IJtuuU6YweLGdQj9SKixRoZ1IqLJ499jC+mqxZZQSgppGK7X7sNKReg+HRfg4o1joY1DAAPVPc4fYdqWFSzKCu/37r/yQUULiDQTgVtCag4krcrMk8rER+mLD3KQazi+TUebgVdiC7njJVebMuSxEsheQLQ6oUtRIiDbOcAxp3YyE7ILbr/zKlXbqgwecmN/JGo1nTsBzDJiMFrpI+Dqmorb5/c42CN9vv4VTojewDJuI/lUjX8gOSgciGi4PyASwVLv1egq2uzw5GoUBIYR9Bd0G2uuEU0OtvdvKqWNoY9UH7bS0BBM2CVcTny/qwNgoMBzjDf8mxyL4aKuRt+kp5ktLw+cTRje87Zuh+gA+eV5TJuzoOyVIsgSpcZdYokxeHSh0j/AvLMGZ1iZfTE6lXN5VY44Z+gyLH3EDck9wnqKsYVUfCU8Q9hw0XkxDymsUzj1elIi+NVs8s5OZxh2ICafEhlFQxFo3APVlegH5lq3+PaBLsv+nkwmivCpaBqNKgxIneov5rzqWviBNeBBabrGou/ojXP55RyvVkn//OCzSuivCPxGdiYWG0U2sdqVH9wqeUs4sSvOohLgm0gr4Hp2piTSVnUrj4HNhVYBUbFdJ3ZvmMygNJ0DqjZxA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(23010399003)(82310400026)(376014)(56012099006)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	AQUUI/facHRS/OftkRxIbsjbbE2s6KWbb3fjRm2Np9o/1x21IJOamqTjnQXnb3HA9/LwG7iNRzc0N+WEGGem74EPeAKemX+KDRDZ3TWit7P2KBb/VCA4YZ0dbsKs7WkaBr5Ovswqbxp0+d9Xa0xJuGVEohUACYTbda35QCioCWfQho8uce+V9vKfxncqhL/041sD/UzXtDRkJffdxeOfoVD2CU0iZeXYblzBHEklqEfi8jMCritfx7/hKU04QgL4p7XXyLdDhgpP3yPmS7l/zk1hczpqqa73tBGAXLWKW2jwVvKZHslzGEi9mP3OAVY74B22tXaEQZxbJJsldgw5NS+WCE1oJWQ0alow2Yta+TnNnmuQOrRzPshdTNjwehlbErqEEbmIxoRdLJnQXsH6j1Q4GKZiRF9Ljxf3mxvtFnBW+4hrw4xwfwy3U0OrdNby
X-Exchange-RoutingPolicyChecked: 
	i5IU/wDtwnBlNev9f6Tl4kfS4W1EukQftgs80NYZwzDhVtaX44E3joL6ImQKJ8i8yIpA9ES5zQyej73mJvAxlJNETxp3A6z0Unl/yHGYS7qCHLD76JEos0K677D7HAfM+XkAp75v+i5XyAxVCfqG6hGbTZ6iuTCFOUFCXytIW4ezN/RCmnnndZMjaM9Q2G9wBIiFlo0BU/aoqItNvmNQH5WvkFPANB5YiFOa8rMriw2DyRb2kBXK6Hdf3z5UuoPgQPw+IWTkLMBCSEvNREtQuKYf/1zASXVHh2/ayc7t4ibRZmafPHyAzZqsJ9PKyx/Ufgz5uPjWN+Ysx07wEQP5SA==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 14:28:19.7401
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20d58303-e43e-4c3c-2adf-08dee27d5176
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000A6734.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8092
X-Proofpoint-ORIG-GUID: 7uHD-H6TSgeO-L4xWc5phndQ3d5CkqaJ
X-Authority-Analysis: v=2.4 cv=Zfwt8MVA c=1 sm=1 tr=0 ts=6a579908 cx=c_pps
 a=3ImmgSqUqdqu0AlmHxYeZg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=f7IdgyKtn90A:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=b1XpvO65Q2qoUaGQSecA:9
X-Proofpoint-GUID: 7uHD-H6TSgeO-L4xWc5phndQ3d5CkqaJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDE0MyBTYWx0ZWRfX7yclBDaot6/6
 2tLPaqfCFrGUlIvS2yrIhNqLAVagEGZsxFpyMSpqyLgk8vldgDgA2UQrdkSOIjGGFGvQudtMJR+
 mTns81guUD085BgvL+s36msKXSkmCLmbqsXtrZvHkTepu8/cZrGQQfR3hnwowkEDC3xszA3zuwQ
 RGhG6ljjMoxfjx/e1txECsVdpAWuTYZNctFCXQptI3v/NOpizkwPLDNm0C5ub3E4yJ9Xv5BAlSP
 vD6nMCQqPWEySmCJImIm4A85vU3xgyswFY5SbwgC79bz0Ys68CBNEk3rxNJX2A/FUMRznv8jIiq
 3Mie+WRbYn9KRmmaU3HvmOKViR850bxCFzQj8S5GdK1ktWm+l/L6BHCasjVAXC5c02lhiJj7LoG
 PjcMMJPDVD+oGLDNSyDu7IlAQPLhhcgvVDWinRO1iCG7L1UAw9797zk8FYYmrr9NnXfcBgCHbNT
 4p2HQ5eyD6geHefEI6w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDE0MyBTYWx0ZWRfXx6jKhEqapblf
 eJUpLWWL5+Y09zBG8Sy1ixzjUJs0X+dD2AiacNJPSraRKodHzKHYlH/q7GeeYoaNLQchN7cMW3y
 df/qqfD9dnqM12VQ9tHJUof8ICNq364=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150143
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Jul 2026 14:28:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20142

Updated the value(s) for:
  linux-ti-staging_6.12: SRCREV

Changelogs:
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=98bbe0d37952d0ce1b6508f108c357ceb6d58bf3..5ae038766eda6647bee6dc52c88308a0a280878d

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index 2ec29a12..0429daaf 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -22,7 +22,7 @@ S = "${WORKDIR}/git"
 
 BRANCH ?= "ti-linux-6.12.y"
 
-SRCREV ?= "98bbe0d37952d0ce1b6508f108c357ceb6d58bf3"
+SRCREV ?= "5ae038766eda6647bee6dc52c88308a0a280878d"
 PV = "6.12.57+git"
 
 # Special configuration for remoteproc/rpmsg IPC modules
-- 
2.43.5


