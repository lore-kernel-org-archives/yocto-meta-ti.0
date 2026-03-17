Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4FF2FF6E90
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 22:36:42 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com (BL0PR03CU003.outbound.protection.outlook.com [52.101.53.38])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1682.1773786999821509143
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 15:36:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=gghmLYO8;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.53.38, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TkS+i7zwLmCv9ga38DfMAVjlrXwKVsIg6ERrEMviODRhKmaEifFxMKEzFjOzj///RdtTa1dV/p+F1agEOThc7I9jtZ+QoHiazqZrFrDwSaPIX48Cwhci9iQ+3iHSb6u9vYTw7xoAvo5EJo0PetQn6y4cShSbaLzo51bf/PltmvQTfKCA0+x49wPQAbmK6AIRDcNO2XkN0viMsNchuBgWzIDOAONs17tEx4/Rmdf32DlntppuPcXfyYOMXsT4SCg86STRch6comgBLnD1b7xHqU1Vr2EIHLKPo3e0cvmtMuFi1IYPp5iz0g48pGKTBEZInipLK9PNuAa2khL4tuF01w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K6aMdu6bT2VwegH0cuJHKtoEiw+3PBgZ2ucHJMP4KBA=;
 b=REP+lOGfXNsTf0YF00hH3F1gS00y/BuhjR3qe1We9XJcQ/DTrUW+6oIxwQdcLCFEbHPfHC8DIYywqJTarUjWNL68bP8mu7XqYih7oNr0N905uJm+XX7HcX0N9RKl2oTPcLoFkCoXk50ilVRFE2yf91FVZu0iKqGkB3CaU0PmNXM5qYs7iwDaKC+tWjnOuSNLb6qgEJmK3jSjqsxlX0nzON5ZVfIBABnwbqQu5iCdSPnXrnR/3Zk//01Qh0um8tssIlLnnksMw15Bo/jy3oaxdmwDP5xDDoBMOi6zz+TMVzEzUrhnRlkgMrbvevAVNQL+Os00TjSq7/WNElwwBs6kLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K6aMdu6bT2VwegH0cuJHKtoEiw+3PBgZ2ucHJMP4KBA=;
 b=gghmLYO8Yk2D7UNodN1q390EoYik7N271HKLPs8PKgM33kfaAQLOkevXeWXE3/axzOb+7Z5c38J0ZxUiednJva6D1nmojatLkEQoggvmVS47MIqiTnyK6eTakX91tYJ8d68tq5n2a3CuXKBxt7sXoN/5zx6+YTWPR/ZR5mVDNMM=
Received: from CH2PR07CA0049.namprd07.prod.outlook.com (2603:10b6:610:5b::23)
 by SA3PR10MB6971.namprd10.prod.outlook.com (2603:10b6:806:311::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Tue, 17 Mar
 2026 22:36:37 +0000
Received: from CH2PEPF0000009E.namprd02.prod.outlook.com
 (2603:10b6:610:5b:cafe::b2) by CH2PR07CA0049.outlook.office365.com
 (2603:10b6:610:5b::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Tue,
 17 Mar 2026 22:36:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH2PEPF0000009E.mail.protection.outlook.com (10.167.244.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 22:36:35 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 17:36:08 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 17:36:08 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Mar 2026 17:36:08 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62HMa8vq3950357;
	Tue, 17 Mar 2026 17:36:08 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1w2d1E-00000008HWH-1cD6;
	Tue, 17 Mar 2026 17:36:08 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] layer.conf: Update the layers to support wrynose
Date: Tue, 17 Mar 2026 17:36:08 -0500
Message-ID: <20260317223608.1973962-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009E:EE_|SA3PR10MB6971:EE_
X-MS-Office365-Filtering-Correlation-Id: 64fd6a54-358d-4021-b6da-08de8475a5c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	PlUG+tGBuOb+5+NDnvB+skiAkroJNdlyCydEpSOrdqcEAGoXD2cqb/xExnzg07aG2aA1A0TLWjA4e5JMZc9oeipa20+fPQ3cU3XmGHrcTSRuC4L5tR32fL/fyLapzJoMVHJrzNwFtKzH9r1oYGejNkY2pvprIWZPmvCN9HY7kGiIx8u4AnQttV4CHpnyRhYT2duEWwkSfC2X7S85lHtlkIqXagSpyWf+Jc/pZw0ljQtDiP9Mi/11rIqUsOWAzHQs0ssFymaHbmRVm/1eukIjRAsTC6bLDXoROgXOxwKl5q1Szmzugz6rsYwl1LUaIItNHFM/D8rS7jMKS2/5BIfgimdvlMd84VxorPiEurH/P/BUncmzTmqfFThk6hOIxwzf8PNAji13yJyp7dS9EYvmr1RrIQ2hxDOxrDxpasnrzRjlUlEx7Kn8WR63XZp6pGvYwDdfsmq8YjToIGM+6LLZ3bXzNvfV3gg1HWbpWA5WAA6TmqItb/phTJ+rFO3QTg1Q9gOUpoADcg/5JaGkOu84Lls5Txs+MZ/HvL2KWuzxt3p+w3Yj1zYVYPRr+o5vSHFkNbooff3E1IR0wAjZIXfko/i+iJ3c1ZiHQ/x+lC5QGV4s0CyvszGJsvAO2s4kj3dh2Ecg2i42WgC/H8QRaYHR27izG/8wzRzoB8tFDeart7i0P+QBMXqQppd1ZB9p39Uko2KOIdrx/9SBHA/plTLsCzzpu+DgVtrPWOzih1Hnxg1mIS2DUndHdAn/9V4ZZg+XfO3lC3G7+ILUIQMyQInAGw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	pF3YEDb/O/Mv1BIcy9E5tRvYgBbO2BVrapJXi/on8/9IpsSmKKLTh8nyq9ifAuvmbpjS7fWLuvTPI5gyFXtq1KwdxcYdX1G6KgNw9Pzx2lTE9RelPP57vPuVlN6RT/C5i511SRdGJB8l2VJW7PZaxg3clm3aD8ViVfblrkKPnwKryRqJHlmQ4kr/yEkkoLj+j0RKkVa6v8shSfGvil7jAt/pnW9tJj6LiG4b1bI+eQnqRYXnDJlSwmkBCpQEY+mqquI6Q5Roont/Z5w5bzdZy+Gcwo5gIbtNtvQqrf1ps3yMqr8IOU0ljYqnXYIFtoisdKH1C0cpuZ8SQYy+1fzAM37u1s3u5uCL9PD48rPHKdlxMuhl5V4apfPS+qkGdyOw/kDAeD/ymH0IEw+7AZMpx9TaqWEjvGMjpCHGf0wzTTszqMv7oTPruysOftA15bEq
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 22:36:35.9433
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64fd6a54-358d-4021-b6da-08de8475a5c4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF0000009E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB6971
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Mar 2026 22:36:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19751

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-beagle/conf/layer.conf    | 2 +-
 meta-ti-bsp/conf/layer.conf    | 2 +-
 meta-ti-extras/conf/layer.conf | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-beagle/conf/layer.conf b/meta-beagle/conf/layer.conf
index 87a12268..5ef549d9 100644
--- a/meta-beagle/conf/layer.conf
+++ b/meta-beagle/conf/layer.conf
@@ -8,7 +8,7 @@ BBFILE_COLLECTIONS +=3D "meta-beagle"
 BBFILE_PATTERN_meta-beagle :=3D "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-beagle =3D "6"
=20
-LAYERSERIES_COMPAT_meta-beagle =3D "whinlatter"
+LAYERSERIES_COMPAT_meta-beagle =3D "whinlatter wrynose"
=20
 LAYERDEPENDS_meta-beagle =3D " \
     meta-ti-bsp \
diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
index f78da573..86744b2f 100644
--- a/meta-ti-bsp/conf/layer.conf
+++ b/meta-ti-bsp/conf/layer.conf
@@ -9,7 +9,7 @@ BBFILE_COLLECTIONS +=3D "meta-ti-bsp"
 BBFILE_PATTERN_meta-ti-bsp :=3D "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-ti-bsp =3D "6"
=20
-LAYERSERIES_COMPAT_meta-ti-bsp =3D "whinlatter"
+LAYERSERIES_COMPAT_meta-ti-bsp =3D "whinlatter wrynose"
=20
 LICENSE_PATH +=3D "${LAYERDIR}/licenses"
=20
diff --git a/meta-ti-extras/conf/layer.conf b/meta-ti-extras/conf/layer.con=
f
index af82e95b..23d54095 100644
--- a/meta-ti-extras/conf/layer.conf
+++ b/meta-ti-extras/conf/layer.conf
@@ -9,7 +9,7 @@ BBFILE_COLLECTIONS +=3D "meta-ti-extras"
 BBFILE_PATTERN_meta-ti-extras :=3D "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-ti-extras =3D "6"
=20
-LAYERSERIES_COMPAT_meta-ti-extras =3D "whinlatter"
+LAYERSERIES_COMPAT_meta-ti-extras =3D "whinlatter wrynose"
=20
 LICENSE_PATH +=3D "${LAYERDIR}/licenses"
=20
--=20
2.43.0


