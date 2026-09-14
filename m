Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B818C88E73
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 14:26:46 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21408.1789395999093824942
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 14 Sep 2026 07:26:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=AiQtxbE8;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=iEMdhw5H;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: lcpdbld@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68ED0jw23343233;
	Mon, 14 Sep 2026 09:26:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=6ciN/qOMoyFU0
	s2uE0QxpqRBfQ/M9ebWDRaJ8x2rA0A=; b=AiQtxbE8adlPoXsgurs3GPJVEYPL+
	fF+7Hvu1coGe7WGUpnBHxs4n6jIlw14oPj0o4ckVYyXetyyus8rNq0e14C/nrBMC
	mSfV80j49y5yW3K93E271fBQ93Z9jdCQJXyIHT8xvaI1cYrSzN26093Y7Gtxmhvn
	1hTPrex+Ne3BQWq7w/7jfzWZoGOTEGIaC65OZUPbE0cWpSdWW5XiGhe+x40TRGOE
	S64QSCVv35hlT/U74+esB8dV0Z0aM8D1mQ96JHPKPhtLhd/2FoLGoJ57gIqrOjWB
	L+mgCxV6OP6xI4LG0DdsEQzHuERSltdKv/l13YJaAQP9ijsd3mG0Z1yhw==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010057.outbound.protection.outlook.com [40.93.198.57])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gnrpnf7bw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 14 Sep 2026 09:26:37 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qPUMW+ZeLJijtcDhw8g0aZC6WhTXRtdMZG5xdpm2UTseMnq8Lm8SV3EAY/OpZHXUgutQ0AHjYIhAdE0B2WK94dsmTtzyT8sdW5EH5hh+6h2wvHCrdFfD+PypBWMYKPRkZBWgybGN+Xqj2QmAbqP9jhmcypD3ufTGUVi6Aekkc6YDltC8PEoRCMBGJOIbpdR34WE+xXYv1g3Ns58DhDDsgpT8ztdEkP26BUKg+RdvFd1eoat6b6wvB/CxMffweH7BY6t9JgiIa886/5f31wNKNIHKAYzbRBnxRKBbTPYvDcaEq/C9+NchhMwpgXXIlbU+P1lT03FY+ldf+CbkRJJqgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ciN/qOMoyFU0s2uE0QxpqRBfQ/M9ebWDRaJ8x2rA0A=;
 b=I3j3QjkH8L5i1WYX83NX3jVYdgnioDEx82vAUuLcyqhsgBGYLWL+PuGlBuwOFvS1dJ/cI4F50ADtlU9JBIiLLn5d64sStMoKBHYuPpNhTQCSIAPIKbhIM69x5uGxudcadDWj0Oxq0bgiSOSWZUUVYVnVbj0OsBClJpigsDnB78JZ4J+S3GC/tYNcT/HbCuHB3/FgrDqdTF1j263heZUe4HDT300BSUXyXhrceSVIBG70vWzzWcSyJaBDQiHJSmuVXo3B4/xRIy8xvD9M9TI4qd2sb66BrmAvl6sxlCTHzdIp+apEfm1cDo9BqDMRT92ApCQMlWnWpfgUzMe0EJ63FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ciN/qOMoyFU0s2uE0QxpqRBfQ/M9ebWDRaJ8x2rA0A=;
 b=iEMdhw5H27sSK96Navc6hwQPxrtfw58ochuAXRvD8xll84jVIlB6P8fH2ys5j/72m7p6MOapbPmDAHtV7NAzhiHF9AUpYGSq44PaVcdSynFhI9sT48G0ug4Z/gKVdu5/eTAcZOZhgapdNqEofI/zrHgl8s82Z/QOsRtRAULemUxi9IeqJTZjnRbc9k/lvaS9S57qGTnIwyGn7e/88SrzWOuzSY7k1srPKFpk9hoaxRBecxbRjXQ+AEaXpHkve6gQrmEPk3G7fDGWLYmBugBHmKCVLa6ZeHC+r7KlF+wGKc+iQstIWVP6AwrPzx3tmEZgLK+Gva7lJHW7IZARZoXh4w==
Received: from SJ0PR13CA0161.namprd13.prod.outlook.com (2603:10b6:a03:2c7::16)
 by PH7PR10MB7695.namprd10.prod.outlook.com (2603:10b6:510:2e5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.8; Mon, 14 Sep
 2026 14:26:32 +0000
Received: from CO1PEPF00012E83.namprd03.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::53) by SJ0PR13CA0161.outlook.office365.com
 (2603:10b6:a03:2c7::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.8 via Frontend Transport; Mon, 14
 Sep 2026 14:26:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF00012E83.mail.protection.outlook.com (10.167.249.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 14:26:31 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 14 Sep
 2026 09:26:08 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 14 Sep
 2026 09:26:08 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 14 Sep 2026 09:26:08 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68EEQ7Jx710193;
	Mon, 14 Sep 2026 09:26:07 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 1FE9A2A65; Mon, 14 Sep 2026 09:26:07 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][][PATCH] TDA54 Presil CICD Auto-Merger: cicd.wrynose-tda54-presil.202609140706
Date: Mon, 14 Sep 2026 09:26:07 -0500
Message-ID: <20260914142607.2817385-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E83:EE_|PH7PR10MB7695:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c017d24-ad83-4c5f-0917-08df126c2c43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|36860700016|82310400026|1800799024|56012099006|10067099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	0GdWrMeeqgH64Weg/oGoJLtMAe4WNPb3KXR25aU+W5hibP60x8jwqjIrVZxf5ZLcCBK1srYVcWm98xoAyzaln28ORmf10ECxiy1VDof/xtNaMNDf2qP+Caf6wugFEU6he4I74tnJ7bJGxCnM2S++nl8r0tsAHRvI3ibLHDcEKJXF9xU+7ZizTLeF3N9EVmxXeaMuYSAlhU4Pml3Bg6PW88jbBTQa8t97/wZ9Pk/20rfG/Fnm1efbErpPHS9TFFsSHoXReUPdrkFidn+AwWhHJuHgORldLDTqIp7NntGe0FItr44s+zdsFxWmUnQxsUDTIPwKj9LDzfeGwTwAnt6Th+xTTSeK0cq1Uh39/6d/0xdEc7fJnI4fliacqIT1qzc1od+KCyLJEA3IY0MeaOv5U9manNSeq4pld2zEykrKXKxrrPUexN3NLRY/1xNDmomlH30weRXvBf8f0lNcXlPXW2mf7Uc345NG/J0Sq7SdweOdEnoMLe3xO5a7eHgEyWzMEu4fQOSc8t1ufS3jseDVuz/opMTs6JC1JfnbYKZn/xXjSHDHCcVJ1X01/TAryI8zQML/EwTbdc/FZ4R62Jwcj8TgxTZ4QKhtIXBbofIEvkaUqI/y3UyEBl1n0Vwn6hj+YyIAwxtzEjsvyojbbw/mi4nKyRauDHPIc9chM+Q9s2I=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(82310400026)(1800799024)(56012099006)(10067099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	HiAufTO2jQHMe0JVBKVN2Gf9b4B7RCSaYM5ZBT4p46bvH3mT8B7Nifhrfpa5KBP/vxAcLD8kbudCqqx02qcBUeUprxPsXSrUmJmiBCRD5LKGkjblzZi7HM+DVZedVhn9Ci/Mu+GK9w/uWiAbkCxJ/MdGq8HnGGSeR7V2hJqvfKMT3LIiwo6368sNOzOzaJaJ5qZwB1mQyi608y1lU6BSezb1d/vOmDOss3SvqMFgmyqrgg3YPeakWt20TrCHDrE9trR8+6O2I09OhkaAtJ5FT/mozrzKa9oif3tN0WroulMpS41d/ObmeDgGugI0ssm71t5ti6zp8NiFEeqsfqrjj/2Rmj8zo1RrMdsWLKZhiQALEeL+RcZDdVaOOTm3j4DOpi2WNwhuhlJrYXsUXw54gpc5cxGhhYUU/ctJM+DPHzf/zC/p9gV1sr09qAY+fEYb
X-Exchange-RoutingPolicyChecked: 
	M0m0XaIfoiFziUy6Cn3bBNMq94klD1jBmKRW1S35GZZNHny5Y23SddN3FcjT03TV8g0uA4e+BTlZCFJUaLawgmc1p/ndKrThuxxnIdXSf5BlQ35KAQ/PAKRQjRpkL+BlFuzYNwmesM14zEJkrs+gdUBqK4Sm1Q9L1keWHooBKWpQeBiH8OB2fIvv7gjUOog50c6x3ApNLGtVwqp9BYlbFboF0qVuRYOi1z08Bma+vIwtuvozBJMc04F2M6NNDYvJEhqcqgIxIYkPsLJ0NCQ7JLMAJzT0nEj+ujMi0YjV40B01DOX2v0dhZBIqbxTqQlGWuxjWuStCv7FgbPKGdJ4Xw==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 14:26:31.6954
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c017d24-ad83-4c5f-0917-08df126c2c43
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF00012E83.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7695
X-Authority-Analysis: v=2.4 cv=GfOCDgXL c=1 sm=1 tr=0 ts=6aa8041d cx=c_pps
 a=qvqF8turvYOtl5AkBRhhWA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=f7IdgyKtn90A:10 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8
 a=NEAV23lmAAAA:8 a=76tTa_PEfKba-i-gUfcA:9
X-Proofpoint-GUID: t-IMYPSluRu3ujx3f9WGxmEi1EszHFVF
X-Proofpoint-ORIG-GUID: t-IMYPSluRu3ujx3f9WGxmEi1EszHFVF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIwNyBTYWx0ZWRfXxUfE2RvGMJG/
 6QCI2cKcpc8fRQvf/pWHdIXQ84yRRpWdsqekF1qHJ1jmbBrtSEv2KyA7maHnnaR8CoREzD/M+1p
 EBzggjcrDuCH0c3FB/LCvsQmtw+7w70=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIwNyBTYWx0ZWRfX/xqpceKa9Bem
 v94RvetiEVxI05zrwp/YPfoW1t13pKmda1A1ncrTRXRKHrjKRSgOZ6ejl/wezXcZDItJOu1kW4k
 GjARmfn57u0q4xU6KkQOv+ADm32sU3grJa2rIKWTrosW0nwhVJCz1yKd7/4iUcFwguC2QWfNyOi
 QvsPD1tH2uocP/qXNJlXOB0nnafv7irQLwZb0wM4eL5FGIrR/vTgfrctfhiAsJSSxj7msrbH/Yv
 GwUzVwhyqqjGxkTR8BSZGf1k1cLnUIlXJjhQzKd7sPhhaD3wKDosF6teKRvaB7XOHJjzvYmWsFn
 dx70y2RClUdwu41D1rWXGuyLAjNYpUQ/xtEVHu+eEnpcbNV5Yarq8xKfqrdqt0VW41WCGsUkNFI
 5xfQLx9ER/Y+ZVaThBkf766zrWd8e+bkdkDy44IDDgT3PcpDSNNtOo7gHdvYsOLdmCkNHKQevMS
 iypEZMwKVVBUBZbrh0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140207
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 14 Sep 2026 14:26:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20372

Updated the value(s) for:
  atf: SRCREV_tfa
  u-boot-ti-staging: SRCREV_uboot
  linux-ti-staging: SRCREV
  ltp-ddt: SRCREV

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc    | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb     | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb       | 2 +-
 meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb       | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
index b6a98b48..32c92221 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -5,7 +5,7 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/trusted-firmware-a:"
 PV = "2.15+git"
 
 LIC_FILES_CHKSUM = "file://docs/license.rst;md5=6ed7bace7b0bc63021c6eba7b524039e"
-SRCREV_tfa = "7bc455dfbc20d575c965e691021cd3011373f89b"
+SRCREV_tfa = "3653f26cc4f30b84a3db61c468f1c0dc54416926"
 SRC_URI_TRUSTED_FIRMWARE_A = "git://git@bitbucket.itg.ti.com/lcpd-priv-sdk/arm-trusted-firmware.git;protocol=ssh"
 SRCBRANCH = "tda54-presil-12.x"
 
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
index a7542183..528c4ffe 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
@@ -4,4 +4,4 @@ PR = "r0"
 
 BRANCH = "tda54-presil-2026.01"
 
-SRCREV_uboot = "0061ad054d697320b6e4af32c5d428fa4eb3b7e6"
+SRCREV_uboot = "8c6f840be4d3ccfc1e363b2c711190ff3f5d35f9"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
index 0c6f27cb..5830c612 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
@@ -22,7 +22,7 @@ S = "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
 
 BRANCH ?= "tda54-presil-6.18"
 
-SRCREV ?= "178cc9a28df1e93a9ff9baa7a619f5f6e66b2af5"
+SRCREV ?= "3aaa703133a9b88f87ee8970211be5b860956122"
 PV = "6.18.32+git"
 
 KERNEL_REPRODUCIBILITY_PATCHES = " \
diff --git a/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb b/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
index 6f4728ef..044244f5 100644
--- a/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
+++ b/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
@@ -11,7 +11,7 @@ PE = "1"
 PR = "r1"
 PV:append = "+git"
 
-SRCREV = "76fe5cfa8d2eb4ae1681d49f8313bf02a68e38b2"
+SRCREV = "38638d15d7e5797387d43b56708a16b3af52f2e4"
 BRANCH ?= "master"
 
 SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
-- 
2.43.5


