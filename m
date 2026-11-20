Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5776.1795210936385151345
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 20 Nov 2026 13:42:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=KHz7Ji4E;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=oBV7nlx0;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKKjQAe4006242;
	Fri, 20 Nov 2026 15:42:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=/vII3C4eiyH8YsDOdl4mDto6iRl8ij+g3Oro14YLq
	ZY=; b=KHz7Ji4ET6j7/rQZ9opvrQ+kNq1gj6Qc+AfBReKCHkIF1jIDuGO76c5tq
	ExeBkHDiZlgBUWcdGgkehC4xLylJKsxrxLiaxoH5tQnnbdGD6VxWT3mQ3Qr80Hj+
	oLzVgDa0IOOWfxPSakAlp4h44wzXcEYhXwhl1KXrOfuDNukwELkQyUsG//OT6RSM
	ywLcJ5JIe77pQkHCkqZsFE0VCwj0/i2aN/aqbc7Nh7+tQJWaybyCPPVNwaWiAqM4
	GpVwGsP2riPoq07XIlLlhXnTxmU7eMn3ovoAHXzj5smLcP4vW3HT+rKJdxdyBcud
	HfaLiX5Fx6dLq8oH/aoBfiPaML6XQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012033.outbound.protection.outlook.com [40.107.209.33])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4j2rjjj1vr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 20 Nov 2026 15:42:09 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sae714Q21ac7CUsaVWl56LSGtsdnn3ZEjmx3CT8ctEy4ZwXofSNgslk2BQb178bVSJweYpK+02qDt/hsmNJGFivFSCMSq2S2Ij8na6qji9+bSU4BbvPDxHDcNekMiL1V7a/UrfrnddAA1BIBS0WZxC8EINvynFcOV+KLSYRZJbv1IvfFJCRqjPtboAFrl9Ta+9P06iedJ1VXhtqiF61QUxTzGtTbJL1PzuZ4gZIofcwZaOxdLK4OrN7pu+aqyY0esRKxfckfpjhQnhbLMddWjqO4jBv61mRyv48dKfcsydeSpgOxQbQ/zwRVi39Wln9+7EhDG2RFyQomOIe9gjjLOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/vII3C4eiyH8YsDOdl4mDto6iRl8ij+g3Oro14YLqZY=;
 b=DA0jVw7lr3/oQicQ5t6s9AvSnkmRncNGKXSdMhaKLPq1rUjSoBk5T5DFnRjkxsJcmozmeNh/AYMo26pahAT1UCfS69HV3sbWVedyw80oBICR+8G0L4c+b/g2aYzZOs2itqnn8d2LrYJVYwRWWYeP9xNEN5e8KWdQS9gSACej/7qNXyhURmNAV5W8YS1cVB+Soj18XSDNiekvEDzKHOb7J8ceCzrHr87rfJvhgA3V59IElTE9jmhHWoXs5hJ1GHlpMX5XvNbLumSadQiIMEKye89is0Bysv34WEjclTSOHWMrJ3w3kU5ER1UDiAlpKkmOlQAMvsPKphbb6ZhpUHV6LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/vII3C4eiyH8YsDOdl4mDto6iRl8ij+g3Oro14YLqZY=;
 b=oBV7nlx00nCj+PQnEq8EOgrgbnePu1I/Y0aKPiEtltuvUnrR7xTc4Chski0tWidZCTOolEFFaC999/F7eOR5FpvFZo9i79E6iO/PjLcXwXx9YhyjcnfIx5SRSqzBq7TckSB2dEKxWVBzrbctma+8qPT1whJ67TQ1E8wlhT9L5xI=
Received: from SJ0PR05CA0200.namprd05.prod.outlook.com (2603:10b6:a03:330::25)
 by PH3PPFD88A49DCD.namprd10.prod.outlook.com (2603:10b6:518:1::7c9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 21:41:59 +0000
Received: from SJ1PEPF00002323.namprd03.prod.outlook.com
 (2603:10b6:a03:330:cafe::28) by SJ0PR05CA0200.outlook.office365.com
 (2603:10b6:a03:330::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Fri, 20
 Nov 2026 21:41:59 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00002323.mail.protection.outlook.com (10.167.242.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 21:41:58 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 20 Nov
 2026 15:40:58 -0600
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 20 Nov
 2026 15:40:58 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 20 Nov 2026 15:40:58 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AKLewbm2893122;
	Fri, 20 Nov 2026 15:40:58 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1xUWLq-00000007dRx-1Eif;
	Fri, 20 Nov 2026 15:40:58 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/wrynose][PATCH 2/2] u-boot: Fix uboot_config for am62lxx
Date: Fri, 20 Nov 2026 15:40:58 -0600
Message-ID: <20261120214058.1819929-2-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120214058.1819929-1-reatmon@ti.com>
References: <20261120214058.1819929-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002323:EE_|PH3PPFD88A49DCD:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b4d2dee-9f8d-422d-c534-08df474f1a75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|23010399003|1800799024|82310400026|56012099006|261026121527099003|261022115727099003|261022075727099003|261021121427099003|261009223027099003|261021123027099003|261102123227099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: jvqbuZQmW44/RWJ/pyZ4Gf3mpQn66KbT5W2FQnk8a/lvn5Ux1CidXNOOZDkcU6lQzv6dGbXy4ITyicg7kqnPsksTruRocE+p7IvdYdGzYni+CZ8Onxfd3PvSzNXSk8IiihQD9gW7TSJVUqxayQoXQtScNwbfHlJnCbM5A0bO0aEk7lIQfKYtwUb5ZFa7Xe1gItjP3U8QYGH/BwKwto0OCkTI/Vt5cSjAZYGJW7+tH5JnKFShxRDHWYyei5/LFRrHm+fawQMi4gq77n0TLZmhs5+/4XTRMs40cUN5anQPu3f8YPrTWP8+TDYd16Q5EZuquU5+RXGsmk2V1T9kdiiTYwMzqUH4J2nD0iLyP+1vu38pdw8MtED6Gdlx3mqHV6xhRMXzw5NBwai8Ja/0ha+64EZu61MOoAu/yqCZSOt+4KY/ng6ZdkA0vCUYEyYsTP94Oz5xtKl/eQs/0SJhtyACQy1jx1o+RlCWMbS4qkxymmE19fibmrIrf3ycHdYbb5Zd94uR1IpGOphuYe9DY9AxC7NWnBAnngakeYr/bDYUXA2sB6zNCn0IG9ErrPVo+29j6jmZAJrOZg4ZvCDLrWJT1hVmZAsNZj5dDwvsMCe6qAE9kYHqB1RVZZNpnMYMmPYsUIis3K3HLnlzsGLB57gOiuXees1l6MHzwNGeECQbjQLZeYtHmtpvX84cz5r+vSt3TFOcyZNT1ZVUf4Tk/ABUvQ==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(1800799024)(82310400026)(56012099006)(261026121527099003)(261022115727099003)(261022075727099003)(261021121427099003)(261009223027099003)(261021123027099003)(261102123227099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: HKndhM0r/LyPl/Avys8yaxPTVGVzqypIHMj/OBZiYhIHzDWB2+CtUmZr7HN7sDoOKm2g35YDAYnSFKn9x5c2n3fglZ2QHNzMe8TomnQ2tAvkxTUObjP7JnAesuVV63D0AI9TuBUSxEMRIX+cgV+MpgHuXUq344WVgm3kza5UhsyOTEDw/sf8UuM3Vhh816Jt8R+w7vRMODluUITV6ePTPT+STygTXmtP5aMKcYij68LeKynd0Zp6itHbdz6vGRQYuUjUEiJ02Arc8wI5+1lrfuaYwgWHt8R3a0uMlqUOuTzXWshnqGjzVRV7hOnj18O3/Ad/g9F4gqg/leyrNXa9iZuWxGRcfww2D36qyw3q9+cHFMvzNO5vc84Jy59ryE5rkpM5BhoPB05niOQUpJTUhD7YWj5iAUKB6eVrqzoGq+/+mfxQUPCoGmLl+7O74v2A
X-Exchange-RoutingPolicyChecked: 3JJk1VYi0IbQtgmDVRt7DSLgVHIXL3QFpfN1XeLXZ8n5EqwUrPDltQovt26zjK+VJjU+A5zIoNiZW7nwqmjkMk8QlXattCKZK9UCqbjnmHusfrB8FtZKjqfKiESQwwXhqfz5NGL/LoIz9wOL6aUzRp/MfhkDNlDIOV55YmglkDpBUQjxwILZLGsPpQ9or8JvLmrYHk+KCsqa1H1XXPaQQc17xhXHmyM/urPRAuu16M0y4mJKowAaWwRvx6LYr4D0tquzqk3YcyL5A3xyjTBQg3hqWTG/jCp2qWF+EvHtuqWpv8gv40b4Ck8AAGrRVxmoDPpFm5p0A1IZdjDzGDuq4A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 21:41:58.0524
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b4d2dee-9f8d-422d-c534-08df474f1a75
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002323.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFD88A49DCD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA4NiBTYWx0ZWRfX+uUuPOpOger3
 hebcNxucNPUwsmM7iDRPsSil1cz2NB817skbNWjtvTE6h56e12rEa7AaN+QiKWEhhmCjYY6LE1P
 GbDYBAuvN1GxBj38BwFhVnZZxCTRsj9vO9M5tx9IrMq8PK3pV5Noz+9JfhYKOg31LW4xxoOcey0
 4ZlJ2tqRNMx9KEX8SGqxBnjKX0WVMZS6MNMcRcvnfVQ+/rOvXGMN5AT8vG28bjLeKz3dHDy9iTt
 fdSfS4qBhoyTz86kjlcWcTl/zwcC1W5P1FNm66/mR5CevzW4aZvRAwGsvhd13x8GgKZIS1a1vtI
 MT7DAkvu4Y201+BvMKUVsUJjBxOlzr8wVt/hGwHI02F5QeuTchqzR9o2QxGaKVIOMfRIOpJM9KT
 Z2INePNEkcMqZwQb1pOUpFs7cOO5gp+rsdi+NMvm7f7bRqraZKA2ho8pJDJcuoUCD6QXRGdcAtI
 5mrgSKAN0nCPjvpepyw==
X-Authority-Analysis: v=2.4 cv=GI2dgeNK c=1 sm=1 tr=0 ts=6b00beb1 cx=c_pps
 a=TIoD7Y9874wd1wHQAFcRHg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=ZaAZIxQZN5wjW78OAqoA:9
X-Proofpoint-GUID: zoQ-JYini1whC_r0pETaYSRkBRYSqj34
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA4NiBTYWx0ZWRfX83qaGG2JphLl
 kLlIeUM25xNbfYfSIJn5qm1921fJAuj590VxG4GFByZEQE2FIOEfBPSuWc7PafbW1QN12utCqUv
 Rg+y8CakmvPDyWaVqpPckrHKtkP/AfM=
X-Proofpoint-ORIG-GUID: zoQ-JYini1whC_r0pETaYSRkBRYSqj34
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200086
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Fri, 20 Nov 2026 21:42:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20567
Content-Type: text/plain; charset="utf-8"

We need to adjust the code for copying tiboot3* files when running under
the UBOOT_CONFIG flow for am62lxx.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 22 +++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
index 3d6769bf..7f2c1143 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -167,6 +167,26 @@ uboot_compile_config_copy_binary:k3r5 () {
     fi
 }
 
+uboot_compile_config_copy_binary:am62lxx () {
+    config=$1
+    type=$2
+    binary=$3
+
+    builddir="${builddir}"
+
+    if ! [ -L ${B}/${builddir}/${binary} ] && ! [ -f ${B}/${builddir}/${binary} ]; then
+        ln -s ${B}/${builddir}/spl/u-boot-spl.${UBOOT_SUFFIX} ${B}/${builddir}/${binary}
+    fi
+
+    if ! [ -L ${B}/${builddir}/${UBOOT_BINARYNAME}-${type}.${UBOOT_SUFFIX} ] && ! [ -f ${B}/${builddir}/${UBOOT_BINARYNAME}-${type}.${UBOOT_SUFFIX} ]; then
+        tgt="${B}/${builddir}/${binary}"
+        if [ -L ${B}/${builddir}/${binary} ]; then
+            tgt=$(realpath ${B}/${builddir}/${binary})
+        fi
+        ln -s ${tgt} ${B}/${builddir}/${UBOOT_BINARYNAME}-${type}.${UBOOT_SUFFIX}
+    fi
+}
+
 uboot_install_config:append () {
     if [ "x${SPL_UART_BINARY}" != "x" ]; then
         install ${B}/${builddir}/spl/${SPL_UART_BINARY} ${D}/boot/${SPL_UART_IMAGE}-${type}
@@ -271,7 +291,7 @@ uboot_deploy_config:append:k3r5 () {
 }
 
 uboot_deploy_config:append:am62lxx () {
-	for f in ${B}/${builddir}/tiboot3-*.bin; do
+	for f in ${B}/${builddir}/tiboot3*.bin; do
 		if [ -f "$f" ]; then
 			f_base=$(basename $f)
 			install -m 644 $f ${DEPLOYDIR}/${f_base}-${type}
-- 
2.43.0

