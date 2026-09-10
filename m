Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14C65C79FB7
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 01:55:39 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4299.1789005337788160679
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 09 Sep 2026 18:55:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=TmCHN84P;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=GscNKqQF;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A1jJW31830724;
	Wed, 9 Sep 2026 20:55:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=AeEfUtvkm7Mz1EJTwsD6k0tHQKoM0w6fkB8ZmAxzK
	fA=; b=TmCHN84Pv2dj7vtaiLEVdr0keNkQaTeXA+BN9V/ukndbHF35FIw0updlU
	kDyZ4lHC6AQIXjdeLcWPG+PqJzw9wHwY9VyXmK7dE4nTQChbg2/P5qqEe6rR28T5
	MutREQ4ip11FGumzweqQbHH1eKaSmP1Ag+WjdYs2aPEVRnQjsiyLVo4pU8AD2hIT
	RBCn3+1EILp9nyAu4htLQhySY9u2CbsSl5KwIYi7yne1TrMhCI/MYdewTNr/1VpW
	u+tb+ZS6EI33gRrEBQB2XjUm7G0fppGESZVEadt1SCISK37VtaZvxAj7/jv5MLjP
	n4aFw39SBy0FMpG0fwikVUjlfF5Mw==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012059.outbound.protection.outlook.com [40.107.200.59])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gkcxfth31-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 20:55:35 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IblrR6D74NYPSNa4FmZbAmfcNw1mM4BV+zatyBxrArbKB/vxl1ubg6a+qLXXmaWNRf92/9cLV7L76SmPigM39iox3GZ3kyk26FX6QhKiBeqb++qCM/W3e7jJzq+T0bGC4t8DEtO2mide8wOzqhqRaT1zx8qhV5krn7xQn2b49mqhquaJuJgWggguupZpJlxz6z1nYwDQZwrr4CjiJXZ27621NVBllfvQXweQ+7EerEzLvzs9hgoLkgf7DrJVDa7oOCB8bH0m9suQbYCQatUkPmGfrueKJjoOckKGv0wgacPjz3D/0zB6E7kLy5zmQKMLO+h7e526jjZeEtXQVL9/5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AeEfUtvkm7Mz1EJTwsD6k0tHQKoM0w6fkB8ZmAxzKfA=;
 b=gyw8LeNE7rZ5CUc29S3bFqPzImp14zScavGIGDGaECvbNmOJ0DkvR76VEWWVnlZjlBFtnwGFwaZQKPjI5CcAfUmn/CV4WEFkCDKvf0JspIJh+m0BViSxlAr4KZtQmCI/dHn+12jlPAJ5CAkwBwJaWYCbl9fXBo7Y1mHYhBMap2HchY6xj02Yaz+QeNzNRWoDHFUUGPnp+6/TllTzG2BNr87IxxiD0GHDOLxBnQUc9icPvZfsVFNvxV+cpa6B5KU9BqnEXy4PhentEDR6lZFvkM4KcPLfGY0n6Egvxu7B5MnW/zh9xVZf9KSKOxi/wjwc+PLi/XrF7QRiIz0POV7Jow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AeEfUtvkm7Mz1EJTwsD6k0tHQKoM0w6fkB8ZmAxzKfA=;
 b=GscNKqQFCyodUfV4wBRObju0dPiPMzWqUdZJIG4YQai+3xF6moSLBxKEoQmxohRR5NxCYu28sQ2kzOjFpiPCRahkDaMKotcviG3Kdi0HdOwL83c+R1QYeR1d/ES4YhZYfrtJAhOrB4vPREe0rIbM5JjewNtLlrooiV8LoK2ZEYg=
Received: from BN1PR10CA0008.namprd10.prod.outlook.com (2603:10b6:408:e0::13)
 by PH3PPF63308C95B.namprd10.prod.outlook.com (2603:10b6:518:1::7a8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Thu, 10 Sep
 2026 01:55:28 +0000
Received: from BN3PEPF0000B36F.namprd21.prod.outlook.com
 (2603:10b6:408:e0:cafe::35) by BN1PR10CA0008.outlook.office365.com
 (2603:10b6:408:e0::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.8 via Frontend Transport; Thu, 10
 Sep 2026 01:55:28 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN3PEPF0000B36F.mail.protection.outlook.com (10.167.243.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.0 via Frontend Transport; Thu, 10 Sep 2026 01:55:27 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 20:54:54 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 20:54:54 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 9 Sep 2026 20:54:54 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68A1ssuK2381552;
	Wed, 9 Sep 2026 20:54:54 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1x4U06-0000000CJb3-1hZ1;
	Wed, 09 Sep 2026 20:54:54 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v2 2/5] linux-ti-staging_6.6: Backport OpenSSL 4.0 patches
Date: Wed, 9 Sep 2026 20:54:49 -0500
Message-ID: <20260910015454.2933250-2-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910015454.2933250-1-reatmon@ti.com>
References: <20260910015454.2933250-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36F:EE_|PH3PPF63308C95B:EE_
X-MS-Office365-Filtering-Correlation-Id: 3714374b-e8ee-4ca9-2846-08df0ede9620
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|1800799024|23010399003|82310400026|13003099007|10067099003|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	HF1chLjNWv8i/BF1U8cleObDmRC6gSOIHkoMb8wgEjRSV6Bd+CNd0ju/F9559WZCcsiKhf/c5s1P6ZGOGRy2yBbHcQq3seYrF/MTdYSvTKhpT8k5QXiAh+6PyzkMlR2a9LaCuvf0ejnIkYszfIB9ftO7VT6wX+3KeMOeyo+zPdDPkBwLW2fIFUj7X3OhRLINFeh9/BON1q0RXmguCyOnjFKCccsoddiCqTzH7HDtB9IPrpll6AdEF94q5nXWKALNlWAQxwwt9LnzeQiprYHHN35nbQa3NLI7vyDE5APiBDF1rmgvvZ3DO5+dPLt47VVwgLkSxR7HGxwIn24nr6VDCdcp3PjkshybgmpdRgDG4Mz2QVtDRQGluabh2FfVAJYVl9R8IfcJVZA5jMCVEtCRLPsSvslEJxRIVhRtSvYTneVReJAE3wxaivMCSm1S1X6jbduERbXQ3xMu3nAkJ/22drLe4L+Pp1p5WIWWihzPnhurU90XXMaNBLncDcsHpz1l80Z/GDJOHKAEqYqJclRbUr76V1FipUO0tkcR1S43GkOvF9ToF8Y12rVCnymsb2dWCeX3RKNVOEWX3yMJ/ZhN8u7s3muh6TnU94IQ1eFGa36JyGXI7DCffFyciXfyts9y5qV3yncEtP3fz8rzpEQBO+BVGoaGKM2QRbuAqnWEhRs2Z4dqtQisbJF1DI8cU5fiWHfx5wdqh53zoEksoO+ANg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(13003099007)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	02Qo22y/ER6wiV3yFNraTTS7nf8R+mhpM/shmfe2c8RcHQi3Gor5FTwQLbzfWR2ycOWknQbPr7oOD9H07OsebdvoaVQ0F1ZZDpKkwdIZcEMXqnKmpNGMZL4sg1LT4dQB6GUDM1tFxOAYFWtkPxvGTspFRK5o2pLxe29Y3di1l4CTkq0+fxKPjnxNcySgQ/39RUGgkybfWYwrVgYaYURltwkNAIyCzviOcKxTGVPdr2k14UaDdI+aQh5yd+NGShuE2N0PElzFuFCIQxkLfkvtZ6ZqB3w1rzCh7vzWCP19FtmcmALmzYwjTX2lXtM9LNtfMbldon+LnUWe68EopezrEwF6MaqsoyfmV7nALf2j/UrAAkEhqjEKI6IT84rjk7QUflWqw96L5kiIJ75mFzu0Tl/josruWU7g9Dqfr4l3wRCbKz/YPUwYgse4qFq+gGZp
X-Exchange-RoutingPolicyChecked: 
	wx4q9ssdFH+qKS3g3Xo6mx3n41t93WC7VaJeSTXgexrMPL2Z/L73oUqEPoHFMmL5J2478GmhsdqFRvUD1m4Zj+elmlXcAHBbnM1gO36M2mw/F8bLSPwr089tvOiMI4S0+ucMKzrxjTCXBucdWmTYofK6ZUqhTwmifsHnqj27kof6St5MKdC+djIXXlvS/tbykqXXSbne2axt5t5BwG/HIxlOcwSVtaKDRSDatXpAermYAPbG2JvDBc16PFuCvBvP76l6UG7hLd1QBK7YKnGmOzD8OE0q6ufck81jKtBkRG9jHkStYpM0hQKpEHPvK5Kgsa/GLN7wAradBuuUjCI15w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 01:55:27.2918
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3714374b-e8ee-4ca9-2846-08df0ede9620
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B36F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF63308C95B
X-Proofpoint-ORIG-GUID: Vu2FRDVD4vQu5xqT3xLJKpKBf4aW-DVd
X-Authority-Analysis: v=2.4 cv=SoAFe/O0 c=1 sm=1 tr=0 ts=6aa20e17 cx=c_pps
 a=+/t0CT+QaJpOasvqRK9qOg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=FOZC9FOpAAAA:20 a=sozttTNsAAAA:8 a=20KFwNOVAAAA:8 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=l8scnuim6UHnXm2-afMA:9 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDAxOCBTYWx0ZWRfX6+TWXgBEBJLm
 duoOqCN458xskZzvxTUMZlRNGSi9H+T3vh53c5Lix5jLr7LF+SrO4F+383AO+nUPkoA1ZwhDDEt
 rYQQ2W+D5jKcjBkW1nwccSWRa3nYwq+krCrGtj9IXK71Ff0Uhwo2gZHJWe82RZWZOzTXepIO0cx
 +yLRxXBHQ+uB1WK2QDYreonjF+JplmjzztkV+Qshl/g9UCLZ92oSiKm7GpbdGCuXyuxV0cJ5V82
 0fikL10o5r914V2DxPhhD3NouMOKsKkp0Ms+guT8ERPhtV5zDkIQFZXVNWPuHndqOYEV1xe4iiG
 Xbax4PRD7R5qGP0jJwOU0DNhFuWS5tIW84RMFbh1PiHoY3j7zf1EFHU9JtUlooGJHYYvoTJvWCg
 PoDY+/cOC6ISQu8IbdhJ5S8occzkq4n9hjwoJYGgbhGiY6Xw/bZxpWXWsUphS+Regm9ET18y6L0
 9OpWnEUYaiYXgOgC46Q==
X-Proofpoint-GUID: Vu2FRDVD4vQu5xqT3xLJKpKBf4aW-DVd
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDAxOCBTYWx0ZWRfX28mMms35VA7l
 vTEjlxrBIpAWbmRlzTKlXa064D9H1rYVUPH95cYyYCHAdQuXQlVHuTkP03GXf2oj3NduEQHAb+G
 c7ki2OFD3V9J7lVKcNb12FLCmwRNhlc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100018
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 10 Sep 2026 01:55:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20360

Backport a set of kernel patches to 6.6 to fix the OpenSSL build
failures.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2; Added missing Upstream-Status.

 ...mon-SSL-helper-functions-to-a-header.patch | 205 ++++++++++++++++++
 ...-using-deprecated-ERR_get_error_line.patch | 121 +++++++++++
 ...-pkcs11-provider-for-OPENSSL-MAJOR-3.patch | 163 ++++++++++++++
 .../linux/linux-ti-staging_6.6.bb             |   6 +
 4 files changed, 495 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/files/0001-move-common-SSL-helper-functions-to-a-header.patch
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/files/0002-avoid-using-deprecated-ERR_get_error_line.patch
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/files/0003-use-pkcs11-provider-for-OPENSSL-MAJOR-3.patch

diff --git a/meta-ti-bsp/recipes-kernel/linux/files/0001-move-common-SSL-helper-functions-to-a-header.patch b/meta-ti-bsp/recipes-kernel/linux/files/0001-move-common-SSL-helper-functions-to-a-header.patch
new file mode 100644
index 00000000..6a58b5eb
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/files/0001-move-common-SSL-helper-functions-to-a-header.patch
@@ -0,0 +1,205 @@
+From 300e6d4116f956b035281ec94297dc4dc8d4e1d3 Mon Sep 17 00:00:00 2001
+From: Jan Stancek <jstancek@redhat.com>
+Date: Fri, 12 Jul 2024 09:11:14 +0200
+Subject: sign-file,extract-cert: move common SSL helper functions to a header
+
+Couple error handling helpers are repeated in both tools, so
+move them to a common header.
+
+Signed-off-by: Jan Stancek <jstancek@redhat.com>
+Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
+Tested-by: R Nageswara Sastry <rnsastry@linux.ibm.com>
+Reviewed-by: Neal Gompa <neal@gompa.dev>
+Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
+
+Upstream-Status: Inappropriate [OE specific]
+---
+ MAINTAINERS          |  1 +
+ certs/Makefile       |  2 +-
+ certs/extract-cert.c | 37 ++-----------------------------------
+ scripts/sign-file.c  | 37 ++-----------------------------------
+ scripts/ssl-common.h | 39 +++++++++++++++++++++++++++++++++++++++
+ 5 files changed, 45 insertions(+), 71 deletions(-)
+ create mode 100644 scripts/ssl-common.h
+
+diff --git a/MAINTAINERS b/MAINTAINERS
+index 9278c30ef1d5a..23f9028848552 100644
+--- a/MAINTAINERS
++++ b/MAINTAINERS
+@@ -5204,6 +5204,7 @@ S:	Maintained
+ F:	Documentation/admin-guide/module-signing.rst
+ F:	certs/
+ F:	scripts/sign-file.c
++F:	scripts/ssl-common.h
+ F:	tools/certs/
+ 
+ CFAG12864B LCD DRIVER
+diff --git a/certs/Makefile b/certs/Makefile
+index 1094e3860c2a7..f6fa4d8d75e05 100644
+--- a/certs/Makefile
++++ b/certs/Makefile
+@@ -84,5 +84,5 @@ targets += x509_revocation_list
+ 
+ hostprogs := extract-cert
+ 
+-HOSTCFLAGS_extract-cert.o = $(shell $(HOSTPKG_CONFIG) --cflags libcrypto 2> /dev/null)
++HOSTCFLAGS_extract-cert.o = $(shell $(HOSTPKG_CONFIG) --cflags libcrypto 2> /dev/null) -I$(srctree)/scripts
+ HOSTLDLIBS_extract-cert = $(shell $(HOSTPKG_CONFIG) --libs libcrypto 2> /dev/null || echo -lcrypto)
+diff --git a/certs/extract-cert.c b/certs/extract-cert.c
+index 70e9ec89d87d3..8e7ba9974a1fa 100644
+--- a/certs/extract-cert.c
++++ b/certs/extract-cert.c
+@@ -23,6 +23,8 @@
+ #include <openssl/err.h>
+ #include <openssl/engine.h>
+ 
++#include "ssl-common.h"
++
+ /*
+  * OpenSSL 3.0 deprecates the OpenSSL's ENGINE API.
+  *
+@@ -40,41 +42,6 @@ void format(void)
+ 	exit(2);
+ }
+ 
+-static void display_openssl_errors(int l)
+-{
+-	const char *file;
+-	char buf[120];
+-	int e, line;
+-
+-	if (ERR_peek_error() == 0)
+-		return;
+-	fprintf(stderr, "At main.c:%d:\n", l);
+-
+-	while ((e = ERR_get_error_line(&file, &line))) {
+-		ERR_error_string(e, buf);
+-		fprintf(stderr, "- SSL %s: %s:%d\n", buf, file, line);
+-	}
+-}
+-
+-static void drain_openssl_errors(void)
+-{
+-	const char *file;
+-	int line;
+-
+-	if (ERR_peek_error() == 0)
+-		return;
+-	while (ERR_get_error_line(&file, &line)) {}
+-}
+-
+-#define ERR(cond, fmt, ...)				\
+-	do {						\
+-		bool __cond = (cond);			\
+-		display_openssl_errors(__LINE__);	\
+-		if (__cond) {				\
+-			err(1, fmt, ## __VA_ARGS__);	\
+-		}					\
+-	} while(0)
+-
+ static const char *key_pass;
+ static BIO *wb;
+ static char *cert_dst;
+diff --git a/scripts/sign-file.c b/scripts/sign-file.c
+index 3edb156ae52c3..39ba58db5d4ea 100644
+--- a/scripts/sign-file.c
++++ b/scripts/sign-file.c
+@@ -29,6 +29,8 @@
+ #include <openssl/err.h>
+ #include <openssl/engine.h>
+ 
++#include "ssl-common.h"
++
+ /*
+  * OpenSSL 3.0 deprecates the OpenSSL's ENGINE API.
+  *
+@@ -83,41 +85,6 @@ void format(void)
+ 	exit(2);
+ }
+ 
+-static void display_openssl_errors(int l)
+-{
+-	const char *file;
+-	char buf[120];
+-	int e, line;
+-
+-	if (ERR_peek_error() == 0)
+-		return;
+-	fprintf(stderr, "At main.c:%d:\n", l);
+-
+-	while ((e = ERR_get_error_line(&file, &line))) {
+-		ERR_error_string(e, buf);
+-		fprintf(stderr, "- SSL %s: %s:%d\n", buf, file, line);
+-	}
+-}
+-
+-static void drain_openssl_errors(void)
+-{
+-	const char *file;
+-	int line;
+-
+-	if (ERR_peek_error() == 0)
+-		return;
+-	while (ERR_get_error_line(&file, &line)) {}
+-}
+-
+-#define ERR(cond, fmt, ...)				\
+-	do {						\
+-		bool __cond = (cond);			\
+-		display_openssl_errors(__LINE__);	\
+-		if (__cond) {				\
+-			errx(1, fmt, ## __VA_ARGS__);	\
+-		}					\
+-	} while(0)
+-
+ static const char *key_pass;
+ 
+ static int pem_pw_cb(char *buf, int len, int w, void *v)
+diff --git a/scripts/ssl-common.h b/scripts/ssl-common.h
+new file mode 100644
+index 0000000000000..e6711c75ed913
+--- /dev/null
++++ b/scripts/ssl-common.h
+@@ -0,0 +1,39 @@
++/* SPDX-License-Identifier: LGPL-2.1+ */
++/*
++ * SSL helper functions shared by sign-file and extract-cert.
++ */
++
++static void display_openssl_errors(int l)
++{
++	const char *file;
++	char buf[120];
++	int e, line;
++
++	if (ERR_peek_error() == 0)
++		return;
++	fprintf(stderr, "At main.c:%d:\n", l);
++
++	while ((e = ERR_get_error_line(&file, &line))) {
++		ERR_error_string(e, buf);
++		fprintf(stderr, "- SSL %s: %s:%d\n", buf, file, line);
++	}
++}
++
++static void drain_openssl_errors(void)
++{
++	const char *file;
++	int line;
++
++	if (ERR_peek_error() == 0)
++		return;
++	while (ERR_get_error_line(&file, &line)) {}
++}
++
++#define ERR(cond, fmt, ...)				\
++	do {						\
++		bool __cond = (cond);			\
++		display_openssl_errors(__LINE__);	\
++		if (__cond) {				\
++			errx(1, fmt, ## __VA_ARGS__);	\
++		}					\
++	} while (0)
+-- 
+cgit 1.3.1-korg
+
diff --git a/meta-ti-bsp/recipes-kernel/linux/files/0002-avoid-using-deprecated-ERR_get_error_line.patch b/meta-ti-bsp/recipes-kernel/linux/files/0002-avoid-using-deprecated-ERR_get_error_line.patch
new file mode 100644
index 00000000..993f6739
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/files/0002-avoid-using-deprecated-ERR_get_error_line.patch
@@ -0,0 +1,121 @@
+From 467d60eddf55588add232feda325da7215ddaf30 Mon Sep 17 00:00:00 2001
+From: Jan Stancek <jstancek@redhat.com>
+Date: Fri, 12 Jul 2024 09:11:15 +0200
+Subject: sign-file,extract-cert: avoid using deprecated ERR_get_error_line()
+
+ERR_get_error_line() is deprecated since OpenSSL 3.0.
+
+Use ERR_peek_error_line() instead, and combine display_openssl_errors()
+and drain_openssl_errors() to a single function where parameter decides
+if it should consume errors silently.
+
+Signed-off-by: Jan Stancek <jstancek@redhat.com>
+Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
+Tested-by: R Nageswara Sastry <rnsastry@linux.ibm.com>
+Reviewed-by: Neal Gompa <neal@gompa.dev>
+Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
+
+Upstream-Status: Inappropriate [OE-specifc]
+---
+ certs/extract-cert.c |  4 ++--
+ scripts/sign-file.c  |  6 +++---
+ scripts/ssl-common.h | 23 ++++++++---------------
+ 3 files changed, 13 insertions(+), 20 deletions(-)
+
+diff --git a/certs/extract-cert.c b/certs/extract-cert.c
+index 8e7ba9974a1fa..61bbe00856717 100644
+--- a/certs/extract-cert.c
++++ b/certs/extract-cert.c
+@@ -99,11 +99,11 @@ int main(int argc, char **argv)
+ 		parms.cert = NULL;
+ 
+ 		ENGINE_load_builtin_engines();
+-		drain_openssl_errors();
++		drain_openssl_errors(__LINE__, 1);
+ 		e = ENGINE_by_id("pkcs11");
+ 		ERR(!e, "Load PKCS#11 ENGINE");
+ 		if (ENGINE_init(e))
+-			drain_openssl_errors();
++			drain_openssl_errors(__LINE__, 1);
+ 		else
+ 			ERR(1, "ENGINE_init");
+ 		if (key_pass)
+diff --git a/scripts/sign-file.c b/scripts/sign-file.c
+index 39ba58db5d4ea..bb3fdf1a617c2 100644
+--- a/scripts/sign-file.c
++++ b/scripts/sign-file.c
+@@ -114,11 +114,11 @@ static EVP_PKEY *read_private_key(const char *private_key_name)
+ 		ENGINE *e;
+ 
+ 		ENGINE_load_builtin_engines();
+-		drain_openssl_errors();
++		drain_openssl_errors(__LINE__, 1);
+ 		e = ENGINE_by_id("pkcs11");
+ 		ERR(!e, "Load PKCS#11 ENGINE");
+ 		if (ENGINE_init(e))
+-			drain_openssl_errors();
++			drain_openssl_errors(__LINE__, 1);
+ 		else
+ 			ERR(1, "ENGINE_init");
+ 		if (key_pass)
+@@ -273,7 +273,7 @@ int main(int argc, char **argv)
+ 
+ 		/* Digest the module data. */
+ 		OpenSSL_add_all_digests();
+-		display_openssl_errors(__LINE__);
++		drain_openssl_errors(__LINE__, 0);
+ 		digest_algo = EVP_get_digestbyname(hash_algo);
+ 		ERR(!digest_algo, "EVP_get_digestbyname");
+ 
+diff --git a/scripts/ssl-common.h b/scripts/ssl-common.h
+index e6711c75ed913..2db0e181143cf 100644
+--- a/scripts/ssl-common.h
++++ b/scripts/ssl-common.h
+@@ -3,7 +3,7 @@
+  * SSL helper functions shared by sign-file and extract-cert.
+  */
+ 
+-static void display_openssl_errors(int l)
++static void drain_openssl_errors(int l, int silent)
+ {
+ 	const char *file;
+ 	char buf[120];
+@@ -11,28 +11,21 @@ static void display_openssl_errors(int l)
+ 
+ 	if (ERR_peek_error() == 0)
+ 		return;
+-	fprintf(stderr, "At main.c:%d:\n", l);
++	if (!silent)
++		fprintf(stderr, "At main.c:%d:\n", l);
+ 
+-	while ((e = ERR_get_error_line(&file, &line))) {
++	while ((e = ERR_peek_error_line(&file, &line))) {
+ 		ERR_error_string(e, buf);
+-		fprintf(stderr, "- SSL %s: %s:%d\n", buf, file, line);
++		if (!silent)
++			fprintf(stderr, "- SSL %s: %s:%d\n", buf, file, line);
++		ERR_get_error();
+ 	}
+ }
+ 
+-static void drain_openssl_errors(void)
+-{
+-	const char *file;
+-	int line;
+-
+-	if (ERR_peek_error() == 0)
+-		return;
+-	while (ERR_get_error_line(&file, &line)) {}
+-}
+-
+ #define ERR(cond, fmt, ...)				\
+ 	do {						\
+ 		bool __cond = (cond);			\
+-		display_openssl_errors(__LINE__);	\
++		drain_openssl_errors(__LINE__, 0);	\
+ 		if (__cond) {				\
+ 			errx(1, fmt, ## __VA_ARGS__);	\
+ 		}					\
+-- 
+cgit 1.3.1-korg
+
diff --git a/meta-ti-bsp/recipes-kernel/linux/files/0003-use-pkcs11-provider-for-OPENSSL-MAJOR-3.patch b/meta-ti-bsp/recipes-kernel/linux/files/0003-use-pkcs11-provider-for-OPENSSL-MAJOR-3.patch
new file mode 100644
index 00000000..8f509895
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/files/0003-use-pkcs11-provider-for-OPENSSL-MAJOR-3.patch
@@ -0,0 +1,163 @@
+From 558bdc45dfb2669e1741384a0c80be9c82fa052c Mon Sep 17 00:00:00 2001
+From: Jan Stancek <jstancek@redhat.com>
+Date: Fri, 20 Sep 2024 19:52:48 +0300
+Subject: sign-file,extract-cert: use pkcs11 provider for OPENSSL MAJOR >= 3
+
+ENGINE API has been deprecated since OpenSSL version 3.0 [1].
+Distros have started dropping support from headers and in future
+it will likely disappear also from library.
+
+It has been superseded by the PROVIDER API, so use it instead
+for OPENSSL MAJOR >= 3.
+
+[1] https://github.com/openssl/openssl/blob/master/README-ENGINES.md
+
+[jarkko: fixed up alignment issues reported by checkpatch.pl --strict]
+
+Signed-off-by: Jan Stancek <jstancek@redhat.com>
+Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
+Tested-by: R Nageswara Sastry <rnsastry@linux.ibm.com>
+Reviewed-by: Neal Gompa <neal@gompa.dev>
+Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
+
+Upstream-Status: Inappropriate [OE-specifc]
+---
+ certs/extract-cert.c | 103 ++++++++++++++++++++++++++++++++++++---------------
+ 1 file changed, 73 insertions(+), 30 deletions(-)
+
+(limited to 'certs/extract-cert.c')
+
+diff --git a/certs/extract-cert.c b/certs/extract-cert.c
+index 61bbe00856717..7d6d468ed6129 100644
+--- a/certs/extract-cert.c
++++ b/certs/extract-cert.c
+@@ -21,17 +21,18 @@
+ #include <openssl/bio.h>
+ #include <openssl/pem.h>
+ #include <openssl/err.h>
+-#include <openssl/engine.h>
+-
++#if OPENSSL_VERSION_MAJOR >= 3
++# define USE_PKCS11_PROVIDER
++# include <openssl/provider.h>
++# include <openssl/store.h>
++#else
++# if !defined(OPENSSL_NO_ENGINE) && !defined(OPENSSL_NO_DEPRECATED_3_0)
++#  define USE_PKCS11_ENGINE
++#  include <openssl/engine.h>
++# endif
++#endif
+ #include "ssl-common.h"
+ 
+-/*
+- * OpenSSL 3.0 deprecates the OpenSSL's ENGINE API.
+- *
+- * Remove this if/when that API is no longer used
+- */
+-#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
+-
+ #define PKEY_ID_PKCS7 2
+ 
+ static __attribute__((noreturn))
+@@ -61,6 +62,66 @@ static void write_cert(X509 *x509)
+ 		fprintf(stderr, "Extracted cert: %s\n", buf);
+ }
+ 
++static X509 *load_cert_pkcs11(const char *cert_src)
++{
++	X509 *cert = NULL;
++#ifdef USE_PKCS11_PROVIDER
++	OSSL_STORE_CTX *store;
++
++	if (!OSSL_PROVIDER_try_load(NULL, "pkcs11", true))
++		ERR(1, "OSSL_PROVIDER_try_load(pkcs11)");
++	if (!OSSL_PROVIDER_try_load(NULL, "default", true))
++		ERR(1, "OSSL_PROVIDER_try_load(default)");
++
++	store = OSSL_STORE_open(cert_src, NULL, NULL, NULL, NULL);
++	ERR(!store, "OSSL_STORE_open");
++
++	while (!OSSL_STORE_eof(store)) {
++		OSSL_STORE_INFO *info = OSSL_STORE_load(store);
++
++		if (!info) {
++			drain_openssl_errors(__LINE__, 0);
++			continue;
++		}
++		if (OSSL_STORE_INFO_get_type(info) == OSSL_STORE_INFO_CERT) {
++			cert = OSSL_STORE_INFO_get1_CERT(info);
++			ERR(!cert, "OSSL_STORE_INFO_get1_CERT");
++		}
++		OSSL_STORE_INFO_free(info);
++		if (cert)
++			break;
++	}
++	OSSL_STORE_close(store);
++#elif defined(USE_PKCS11_ENGINE)
++		ENGINE *e;
++		struct {
++			const char *cert_id;
++			X509 *cert;
++		} parms;
++
++		parms.cert_id = cert_src;
++		parms.cert = NULL;
++
++		ENGINE_load_builtin_engines();
++		drain_openssl_errors(__LINE__, 1);
++		e = ENGINE_by_id("pkcs11");
++		ERR(!e, "Load PKCS#11 ENGINE");
++		if (ENGINE_init(e))
++			drain_openssl_errors(__LINE__, 1);
++		else
++			ERR(1, "ENGINE_init");
++		if (key_pass)
++			ERR(!ENGINE_ctrl_cmd_string(e, "PIN", key_pass, 0), "Set PKCS#11 PIN");
++		ENGINE_ctrl_cmd(e, "LOAD_CERT_CTRL", 0, &parms, NULL, 1);
++		ERR(!parms.cert, "Get X.509 from PKCS#11");
++		cert = parms.cert;
++#else
++		fprintf(stderr, "no pkcs11 engine/provider available\n");
++		exit(1);
++#endif
++	return cert;
++}
++
+ int main(int argc, char **argv)
+ {
+ 	char *cert_src;
+@@ -89,28 +150,10 @@ int main(int argc, char **argv)
+ 		fclose(f);
+ 		exit(0);
+ 	} else if (!strncmp(cert_src, "pkcs11:", 7)) {
+-		ENGINE *e;
+-		struct {
+-			const char *cert_id;
+-			X509 *cert;
+-		} parms;
++		X509 *cert = load_cert_pkcs11(cert_src);
+ 
+-		parms.cert_id = cert_src;
+-		parms.cert = NULL;
+-
+-		ENGINE_load_builtin_engines();
+-		drain_openssl_errors(__LINE__, 1);
+-		e = ENGINE_by_id("pkcs11");
+-		ERR(!e, "Load PKCS#11 ENGINE");
+-		if (ENGINE_init(e))
+-			drain_openssl_errors(__LINE__, 1);
+-		else
+-			ERR(1, "ENGINE_init");
+-		if (key_pass)
+-			ERR(!ENGINE_ctrl_cmd_string(e, "PIN", key_pass, 0), "Set PKCS#11 PIN");
+-		ENGINE_ctrl_cmd(e, "LOAD_CERT_CTRL", 0, &parms, NULL, 1);
+-		ERR(!parms.cert, "Get X.509 from PKCS#11");
+-		write_cert(parms.cert);
++		ERR(!cert, "load_cert_pkcs11 failed");
++		write_cert(cert);
+ 	} else {
+ 		BIO *b;
+ 		X509 *x509;
+-- 
+cgit 1.3.1-korg
+
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
index 9acc95c8..3d6b7007 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
@@ -28,6 +28,12 @@ KERNEL_REPRODUCIBILITY_PATCHES = " \
     file://0001-vt-conmakehash-improve-reproducibility.patch \
 "
 
+SRC_URI += "\
+    file://0001-move-common-SSL-helper-functions-to-a-header.patch \
+    file://0002-avoid-using-deprecated-ERR_get_error_line.patch \
+    file://0003-use-pkcs11-provider-for-OPENSSL-MAJOR-3.patch \
+"
+
 # Special configuration for remoteproc/rpmsg IPC modules
 module_conf_rpmsg_client_sample = "blacklist rpmsg_client_sample"
 module_conf_ti_k3_r5_remoteproc = "softdep ti_k3_r5_remoteproc pre: virtio_rpmsg_bus"
-- 
2.43.0


