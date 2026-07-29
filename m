Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CB8AC53200
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 10:14:22 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8186.1785320059723525508
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Jul 2026 03:14:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=F7WRnyLl;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=R4GmuROv;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: lcpdbld@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7efld2162181;
	Wed, 29 Jul 2026 05:14:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=PTOEnPBCZOYaZ
	/u8HwYGnWMqzLghOegEhGA/UZIoN8E=; b=F7WRnyLl3v256/x25qIMXAYNb4dxU
	//uH+1BzqhrTPF53FRp4FnJeAhiyAkjC4TcvRa6TLqnR0CzjizBT617PV3N3FwnZ
	DpSAKYVM6zkEp4XRUxMj7SqDDD8aQi60cv9r0mHv25aP3/pnr4JYpUYZ1B7Y0vZS
	xdk8yAz8XI3hQu8cuBEY08eN1mM6fALmCy5LMlTzEXcZyd0IxHPL0GsgGMCA+L04
	/O2qX60gHKNzLJvHwepWwl0zNresAJQso4SwDtw1w3RtFVeupxTII4K1yttNtUyo
	T53fQfh8NIoA3hq/lVhPqtUmqWotmgQqO8U9efDnHRtHqTwil5W4c9QxA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013041.outbound.protection.outlook.com [40.93.201.41])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fqcwv0w2c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 29 Jul 2026 05:14:17 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mMUoId/+M0g5ipFa0cHhMhaRtS5yGx7q1ir7mNaXrJN/D4qHnC87sfAxiDySjddYQ2NrTqHYseeJBRi8YNvLkbGkdftM9ro/5aR6nnEKrHU4baBIV0PRN7AoSnG6Bz5VoeT6B/UA6lKXO4DTKY1kUl0qbSp3lsuL0vl9716JZ9W1P9vEYHX2LNVOTL8PMQW0xkVcZ0I/4vwJfoQtdC3qC9nLXwS1zRF+yzdZCx+x6VsPeAt+YjwP91KrqhSqoAQRzbui+9CVudjKN/G/jQPcjIY1tPbcqrRiGKeRMbS7njaS3HBRyYoQaG8v2aM84eaZpBJuICA8VjvgE9VU9cG8cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PTOEnPBCZOYaZ/u8HwYGnWMqzLghOegEhGA/UZIoN8E=;
 b=VcihQGpypmijVCtlwJyIvFYo5uSbfRptPtB1fGFl8fSazxdzfkp0aR1rvU3YddRuW1E8PsUrX7cctTbZuCM4+Cvz5cTXNqKD8dkBEtn8zq1E7CVb7P0/cgUvVaoObGfENU9cZvIudzWnq13J1QZxjoJnwxR5Qok9oOfMN6xxGTWlVjnViHy+5DfhGv12d9tet2N91rxICh4WfQ/Vynnm0IdlO0MLAJJgDR8OIT0HIfHYZEwbAYrIs71Ayi1/EfLXCx9UJyc3pZHvE3D3DVZySH50eojH7pa8R+tVL2zVXWhJHH5SxiXPKm/jHpFw5s2DTbWRINc5rGpZcYJZdhwt8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PTOEnPBCZOYaZ/u8HwYGnWMqzLghOegEhGA/UZIoN8E=;
 b=R4GmuROvwcg0wQjqmX0ZhZletxmgDo2qUG2Fjzoslgh0/tSMXeRMQxGgjOSsC/ftisKSIDz/O3mk6+kUQS5OKMu5sMMvVTD5Wh/kEd+ZrC7ZB41xaS0Z71mQtyB66zW8VF15+6l4+cYdIpQlb/OSB2xIzQhMkPNGi8q3vSO3tN3qdAIP/bqLJFRKCJnObVFCiEs8RY7BhI9qXLaNXWUHz2fHCYxx6YGOZe4qe/v2c3FsATn3Ctb4uUf4FGn1eEqvQUH6E2CwU39v2SPXGxgoU3NpPa9Pm1jhXhTiz+bQmZ9cIQ9dsyPlMZkMe6uq19hA6KoRRR0jjj9r30YqSp8yTw==
Received: from SA9PR13CA0075.namprd13.prod.outlook.com (2603:10b6:806:23::20)
 by IA0PR10MB7302.namprd10.prod.outlook.com (2603:10b6:208:407::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 10:14:14 +0000
Received: from SA2PEPF00003AE8.namprd02.prod.outlook.com
 (2603:10b6:806:23:cafe::1b) by SA9PR13CA0075.outlook.office365.com
 (2603:10b6:806:23::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Wed,
 29 Jul 2026 10:14:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF00003AE8.mail.protection.outlook.com (10.167.248.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Wed, 29 Jul 2026 10:14:13 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 29 Jul
 2026 05:14:13 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 29 Jul
 2026 05:14:13 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 29 Jul 2026 05:14:13 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66TAEDEh1084206;
	Wed, 29 Jul 2026 05:14:13 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 20FF02A65; Wed, 29 Jul 2026 05:14:13 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202607290100
Date: Wed, 29 Jul 2026 05:14:13 -0500
Message-ID: <20260729101413.2461030-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE8:EE_|IA0PR10MB7302:EE_
X-MS-Office365-Filtering-Correlation-Id: efc350f5-e369-4a0b-9cb2-08deed5a23df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|23010399003|18002099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	GRYY63DGiZMbmkBE0rgKH0q08D+lpJsePc0K/kJYEeulCRBtTYqGQxDLjbOok1pijZplMWjUMTkaexHwinYUNzqkA9OSu7Db7ssb0+cmKLZSjRfbZnB3R3KUMQALBRMx4m8NWluHbpuB/rn2+A+zgoWO5Bca6e0YHg0+fwx/Xs/MDp/56CGBCAZ+JeYsoh5exbq67t/RvvoXXTMk0rg9hcKljToI/sFTeSMCMtZhOEjSlaPuq7BBbvAtGmCYw0bDGKGZ+P/mtuuCBGguEjZ1kSzYm4UpEwL/nu5+9l/J4u64yDwFcEYuzxeMEAG14+w1gdHPj3pav5w/EhmpCJPO3TcJwXBh3OFpoWhy9jwzSp83pIQCxFKfxI3n9yGt4EoOLXu3Ao0EZFvudKfCmO6K71Wgel453rL9wco0Z39yww0aMXVepifazieKrJhG/sk/C+ix8PtQkf4VZFU5XuRuheWT1RRyKKed3XthHzWfDseBWPTkR3XtaBLreRAwE7PpQiiSqfGgUekYJIT+x0tgPiLXDaYEXb5zfaiOku5thQLmfRprr1puFYWnX9YPPGA21prz2AApjdmhiQ6gOuI1I/yJfH6Z/kEvwPcxWHsBB4oPE2detIkXUZbGFHlsQU9kls3CSz1IyBjKM3HoFVXQoyelPFD+7UGwt8AfitEfIG/0BjMshXI231HNrPka9xrt+6sOEiks3yZBA/xChOv4/w==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(23010399003)(18002099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	UcvIfPwBphxqu0aUT+aP8OkCr66TKNRIKT5IOeSjO0HfqUo8UruuTCDGqUVlYrh0leU4219Xk+oNmsc2oFjPsgFi8JEnoYrnb8yhiVKwweqWTB1Zrc5jlqJL2jogzMy08jfEG8C2bFJhz0Uc3xKgsYjXTDNt3ABwjc7GfzUdT24mKC7Kh1ouoh5/rMCBKgSQG440aIQNahilJcXd2uV9HaHS3dJtpL8ZcnWpofUIFMW9xHk05QwFrp/xyCjS39F5UzSwmSOUKploNReYlWdMoiSD0xhIqcpOfDLNzAHuc6CHpAwN3mC8XzDU9jNiMVZBGU8Z1W0S/Y9QWACxZsJ8C6/OZVRGN9lsgAJaHlOELHUvCsxgCp10KyNNfGzD+91cf6klERyv8PQyhmos5mdmL7hj/EvtlyX8qyDEil+zrFZt2CdHSu1mKxxKzkzA/V/w
X-Exchange-RoutingPolicyChecked: 
	ivfwTMnWZjRWDlcj2UOeBSekDMjGB1r5c5sfEZrdpeZ+NMoO4tZMttM97Fan95P3JPDvCGtk8F/EPh4I8o4OWY+kko8NKBAAPk2tMm5NcX5I3C3AEZm3ncIjpwHm8LC4xQ5fNuJHhlU4NBwEzFNUEQsgJRJsdcW2oFuXEUD8mIipJYq7mY43os99hvp+zZOwuY//9GOkVcGFVDqQGSVP7PLxi+pWnqWzXk7+V+iAnMHY5NpGy28hKRgtM2j7BrFHOXsKPXRPHTv97nItK6cSDcwLa/Xe1G5NW5wFKRoj0BkkjG2WFl/2Mj2Qc83iyx7Qk+emJiB6kesB1RbSJ9++Vw==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 10:14:13.7188
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: efc350f5-e369-4a0b-9cb2-08deed5a23df
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003AE8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7302
X-Proofpoint-ORIG-GUID: L3ArYEXcWkvfxmDIAMRAm-UHnjiHyisu
X-Proofpoint-GUID: L3ArYEXcWkvfxmDIAMRAm-UHnjiHyisu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA4NCBTYWx0ZWRfX/yiDfX/CtTKN
 wfkxkhik7Q24V8tGBMfbb5JcSt5nFSjPDp57Ihc//9vdwNWXnlLpbxPeQ4NanZmVpZJyu/2D7LR
 agMTex4VpQXSCn5xtNC/IIfVWowuoX0=
X-Authority-Analysis: v=2.4 cv=PsijqQM3 c=1 sm=1 tr=0 ts=6a69d279 cx=c_pps
 a=7YeuQJ2t1o+NR7xo1DCA9A==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=f7IdgyKtn90A:10 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8
 a=AzTgbU4CxPL6J20Q0CIA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA4NCBTYWx0ZWRfX/qJ3eDpIWW3P
 s3EkarKauzPJV4gBzC6zHyBdKo5MHP+9UIKB+QbsPOYKI1uk5Bu5JJlzrMtVSKocthakfpgRRbZ
 J8nXI3xc8EZVGFP1CUVFGGqCdjLRaOgGyMbxN4qiux78Vhm8thWqtKPQZVEgzOfKS5ZCKADeNc0
 2iQrN0i7ObR/rDi5m0k3z055fO4eaZYPsINF50y0of1CB8hPzKT8eKcm2qdQs5N0geLR/9if8WK
 RNrs5FNMUTCTp+J8LcGoBfBQyZY2PNpX0RM80nk8jxwphD9ZyLxkHrmVsUIsekktHHbL/Bqm2jr
 7AW3r0hEN0Gvj3pQ598ftNxCbIisCGmqRXaG4ppH3bsbs/sHtDMEuam9Y8B4V488IRWW67S0NRJ
 322WI1mWowGEIea4XNGZm4pvKkUOYLNLz6ltjHQgwKa6x2b8wMSAmckNqnJcJXg18N6ClnvLuzu
 9F6FqMwHorXSRM9Vr5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290084
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Jul 2026 10:14:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20205

Updated the value(s) for:
  ti-linux-fw: TI_LINUX_FW_SRCREV
  u-boot-ti-staging_2025.01: SRCREV_uboot

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/log/?qt=range&q=59351d453295295909a25a68b30f87e5c85a6e8a..8de2d25bc69fd9dfb79e9a96940b0a1d6081198e
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=1612e4d1deb11d49304c715576854b28cc10e34d..ea09c8fdc98285f8359e5faa2d4372fd58aa4165

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc         | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index d8416ce1..932be1d2 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -22,7 +22,7 @@ TI_PKA_FW_VERSION = "2.1.0"
 TI_IPC_EXAMPLES_FW_VERSION = "3.52.00.01"
 PCM6240_FW_VERSION = "1.0.0.0"
 
-TI_LINUX_FW_SRCREV ?= "59351d453295295909a25a68b30f87e5c85a6e8a"
+TI_LINUX_FW_SRCREV ?= "8de2d25bc69fd9dfb79e9a96940b0a1d6081198e"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware-6.12.y"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index 8ffc1cf5..235b0b5a 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -6,4 +6,4 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2025.01"
 
-SRCREV_uboot = "1612e4d1deb11d49304c715576854b28cc10e34d"
+SRCREV_uboot = "ea09c8fdc98285f8359e5faa2d4372fd58aa4165"
-- 
2.43.5


