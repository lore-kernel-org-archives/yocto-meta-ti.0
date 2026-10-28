Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1235.1793206709513654875
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 28 Oct 2026 09:58:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=ioc7MjA9;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=AQXl6itL;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SGajmh4032827;
	Wed, 28 Oct 2026 11:58:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=N3FPzMs9D0bIcJKRYvv5molXlaWDzlpYoZCscfhns
	gQ=; b=ioc7MjA9ETT4qwWJAiAFSDS+qgx+kuWDsc9lbmCJo1qQ/z2O8lZIXUD7l
	QG3hsn1soyIyrvBQGjAvpahDagJ2BxtZDGn0pTJmgUXMqahLaOujVP2Iq2Xu+/VS
	9q0L709P+86Tr7kjjaqUbWGLOQrHxr5KtdDC6GfcBm0LDOYBpWqhWPYHfb3x5A+z
	mxPN+TBuyJt26wGeaxjCtPJgsFC3qujnJxmp2FhmShl7bXXnD0sjiMC9cDIEeu/V
	ECZDQ+G3YYqipzwER6igi5qLfzKFbXD2PBK05oEYuJA6CbOHTu2dOv2QV/p1Tq3a
	9dFL0LRwPW9/zK5RSpOVuLZ4izeyw==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012020.outbound.protection.outlook.com [40.93.195.20])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hkmqe84j3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 28 Oct 2026 11:58:26 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RjaU3BPWPAoU4R51EgGuPyox4apMaDk8QsFzY/4xQbaVv31fq7ziCXc1r6jtol/DT6aS+EJPYZQmK90LGd9FzWbhE4a36wwckUSoMrsrm686tlo/LMUL31TV/MnMwwNsaccYw6Lb2bAniu9/L4jIdqlgQK3W3atjGeGTIOhiq4ypf8hyDANvgODhEPKoxN7rc9vU1mPlk0/IGC/Va+yyDRaGPmcXeq/M63dUlwWL49DxI5MhCAfu8w99IDhIUPcHAAVlTx8+7HKKzKZth13GOI8rBC5bTojKwx7vzExjBxDVLJ308AmjolS9dZRsBO3TNeWsLz3RY9wxyUIngYua4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N3FPzMs9D0bIcJKRYvv5molXlaWDzlpYoZCscfhnsgQ=;
 b=GP3xTCiv9nOPuz0NacE+jxHGmAuf5Q01nFg4qXUlWw4+tZlNZ3sAgcZNeKryHrraa9UsFvAWK5e3JN96gLHiYTePX5UyqZOo89F5PAk0r2EhOv4sJw87IHljr/EmNiPpXPm8omIkTfYOopjr+jX8UyMhNU4nHeZu+sRV2Fi2F+WMooXVxiyVN8demEhygu+dL5prA+wJY6VAL37IQv5yFlP4ri9SXM2UWr7HRK0yOv10+/FslHqbEPLkw+grrYVCT5SGGNhm8x/JCox8L9h6PLm1fA+B/zx/VYF9NwTiRMlngIZQGwR6hZs7Uhw4bb/4lTyZef4F2wHJAnlaNvc++A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N3FPzMs9D0bIcJKRYvv5molXlaWDzlpYoZCscfhnsgQ=;
 b=AQXl6itLWTp/v2/ibVtaic9lDXSA6PCn/nNkaw1mjSe8gvAy0T87mhZXiJWWgENfvGKONt1ajxLnVSkVRZnXbGRyfup9a0jQiuYMBlpBtsLuj97U4/VVzUQjnVFhrSZfUlXKE29JtDnFY79tf/tOeQ4L23lv1pP960IxRmE3opw=
Received: from CH2PR08CA0005.namprd08.prod.outlook.com (2603:10b6:610:5a::15)
 by PH0PR10MB997783.namprd10.prod.outlook.com (2603:10b6:510:3b1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 16:58:21 +0000
Received: from CH3PEPF00000010.namprd04.prod.outlook.com
 (2603:10b6:610:5a:cafe::4e) by CH2PR08CA0005.outlook.office365.com
 (2603:10b6:610:5a::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Wed,
 28 Oct 2026 16:58:21 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH3PEPF00000010.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Wed, 28 Oct 2026 16:58:20 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 28 Oct
 2026 11:57:24 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 28 Oct
 2026 11:57:24 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 28 Oct 2026 11:57:24 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69SGvOxC191704;
	Wed, 28 Oct 2026 11:57:24 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1xM6xo-0000000BePp-2fYq;
	Wed, 28 Oct 2026 11:57:24 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][wrynose][PATCH 2/2] ti-test: Fix inclusion for iwlwifi-ty package
Date: Wed, 28 Oct 2026 11:57:24 -0500
Message-ID: <20261028165724.2776953-2-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028165724.2776953-1-reatmon@ti.com>
References: <20261028165724.2776953-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000010:EE_|PH0PR10MB997783:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e15eac0-3ca8-4457-2385-08df3514ab6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|23010399003|6133799003|22082099003|261026121527099003|18002099003|3023799007|261021123027099003|56012099006|5023799004|261009223027099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info: 0106/WQoo2csAgV7vY5L1V9XM8P2NcCWpK+Dt85Lk0UGvN9luYZsnv0D6okKrsMKmaCeUFztgRXHFT+w4mdfJGDuX5OKHfrhQ63I8WkYurpXjrponoWUmYeZSkgRc1ua+YPCZqSxDR6idlwjmQjwkGN/c1frtAQab6VNxJDTuoIPkdd3ekNwkQEPvAwz7xBpjrxvv7LKnXJuzqRzCLG7FY46y9qu86kEFRqsLQZIZs2H70F+tYKSJVU6mWVUVEQewy479pf2MdyQNKPvS3zJlg/DWmuYKqGy3jw94TGUovxVWWNnHXmciuBhMRYliNuoylYBzDV3xNOZXDDOhi90f7DOae59jiccwuQr9BLkBfqU/gLZRnKvXVX38P9ZNPzaIe0fOCbbxsaCWg9ozLgT7f4uQF9IxMxCylKuxuzsVSoWQQZmg1dvlzMI/aGD5CHwPaYmYUhAFS3IKGsfbDrocWpErBIK1VXXfKr9vCeMfyZpiwSEpK8DUoNLPM/OXdAivvLxy83nSBOoS3tzwZhS0oOHVxoqAcKzwQvdbzRRVX54ZmC2yvOW+JuTNr3OcrTNI3BzSHkRTHpgfYR6HyCMCGFe3PEsJls8eEivdgW89ntlkUnlfNk/IixC8BV9Ya6iPJFdfkjbcZtuTVipjLkoICCZqyQChA2Cwn3VMriWuKrSNabIPHPuLzW1KFpWJ3AbqvOD4M27QARp8Zaw0yPS9w==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(23010399003)(6133799003)(22082099003)(261026121527099003)(18002099003)(3023799007)(261021123027099003)(56012099006)(5023799004)(261009223027099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ElQqi1S+ud0IRzSowhyC6wAbFB47hjKMV03e9iYesYZ+lDpqzK9SpKPZL6+fG6dKagANXWm8XKie+ti/wipI4j6AjDu2XeojjB9n9nxEBcUVYmeS5MXR9hPXWEJYiCKmUeaxXnPCPLgzpVCzk+RrmlGEGiJKAOsISYyCV0AOfHdfcEjowWBm/pf6BjLG2756mC9PrOYfqz2HkgB6CWQskpFKEQFnSvVVZ86vxBx5iARTZ7ucVlES/dkqrwcma5sYaPEvwkRgw/Hdv1Q4iMjT1TRjUQbV3XMXV8EcX5isMUdX0pA1c5Chkqu3sCpSyCv7uRxbA/tvQpVffIbMvNws5+XYXzjrHluq8w+I51ORxHXTR4PnpsKySdHHpa9cLeOO7dBX4yBCxSS6EfpgpkSD6qxAoauW8JkAsWvrHNvJJwLJF5C9EyfvMBwI7D8AbwXO
X-Exchange-RoutingPolicyChecked: QimKhzplRmUrxsIK+dMctkrrlxKme/jo9d0TMOmqS2SG5gzf+N+OP4YKr/uMi0aafsCOhP21SjG52eswz/BedJYCZ8e/ZYELSdvHveFZCKQCh7EsC9IMcezftPTrbYvaGdCkiYpOuY2/Mmi95+8Gi3Hc8+RXC/HpbtnnF45QKbs0VtD61Q62Im+nhw1RDLGRCRwBnCI4K5vtOEioEffZmeXCpIXSxa4ZlsFRSqQmEhA4ppBIAWGxjCfxAwbe/QFrlAu77hXkNr+siHmJI05j4QXmiu3vgrGhmzRyyO33AQ9koW+PAKNqvu+ZdmSGM8Ic6CH6ZmGZybY42A9aexDa7g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 16:58:20.0348
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e15eac0-3ca8-4457-2385-08df3514ab6a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000010.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB997783
X-Proofpoint-ORIG-GUID: eFL-ubZrfUuE4bE3veIAD-TWMqDPQUq-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2NyBTYWx0ZWRfX5c2lJ/TPaYYo
 T9iYMZNApBjSIiWj0SnEo4otkS1AapDhaeQYemdvjQVIn07lwpdxziicVHYUt7fMJp7o70Vxjvd
 bmcGC9tlzoHsm/ebvPZY3Dc7AL/TjHtGtasKlK53nEaFxW0mOEDTTMmQbW4tg/mcmaqc4F+29+d
 rGj7gbMjACZ2Ad3KI2c9ApzHvZi/1BQCaJLRQIUUb+I/zlfqpnkQ32z8q3tPMkDZimQsfQlgEM/
 X2kIwEF/x4pM9vybyht0mC086Yrddp1cEKo9KbKUIcby07jVHwuj//YxgND+fjgxGXcUV7S153o
 zQBmlAJ0/49HYD6bPYQCI0ERItF1ReXWwUgS21g59Mb5eHwPrc7oFonKWYnt+UoOyIflVu53mXn
 6ZQArkXKH9Vza2gMi9QllHw41OwZg+75zv1SC2W6oMb8qNy0RKTBdv98tAQhcre51laSxejdV89
 l6Sy95hbTrQ+pe0UDoQ==
X-Authority-Analysis: v=2.4 cv=G8uJgNk5 c=1 sm=1 tr=0 ts=6ae229b2 cx=c_pps
 a=88sJ5CXPnL4yMuzzfZxD4w==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=xgL22VE7oYkUXKNbIrwA:9
X-Proofpoint-GUID: eFL-ubZrfUuE4bE3veIAD-TWMqDPQUq-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2NyBTYWx0ZWRfX7jb5KRg8lgF8
 DL1F8cW+8B0Xp5drB79sziNhK8oFprd1mPDQCpg54fRh0Ug59kDYZbyOqaLJuNKoIBtmAc34H30
 yGJSJ1LSoIm3CdfCagY1ctf4aZOEzAo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280067
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Wed, 28 Oct 2026 16:58:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20500
Content-Type: text/plain; charset="utf-8"

Move the iwlwifi-misc dependency over to iwlwifi-ty, but make it hidden
behind building a ti-soc since the bbappend that creates iwlwifi-ty is
also gated by the ti-soc override.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-test/recipes-core/packagegroups/ti-test.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-ti-test/recipes-core/packagegroups/ti-test.bb b/meta-ti-test/recipes-core/packagegroups/ti-test.bb
index 81f38ae5..258ae9a4 100644
--- a/meta-ti-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-ti-test/recipes-core/packagegroups/ti-test.bb
@@ -115,7 +115,6 @@ TI_TEST_NETWORKING = "\
     iproute2-bridge \
     iproute2-devlink \
     iproute2-tc \
-    linux-firmware-iwlwifi-misc \
     lldpd \
     mstpd \
     netperf \
@@ -124,6 +123,10 @@ TI_TEST_NETWORKING = "\
     xdp-tools-ti \
 "
 
+TI_TEST_NETWORKING:append:ti-soc = " \
+    linux-firmware-iwlwifi-ty \
+"
+
 TI_TEST_STORAGE = "\
     dosfstools \
     fio \
-- 
2.43.0

