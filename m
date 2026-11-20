Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5775.1795210936384855799
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 20 Nov 2026 13:42:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=k3L9L4P5;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=egwNcqOE;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKLDnXi4006180;
	Fri, 20 Nov 2026 15:42:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=HSjy5WXd/xTL7
	SdxMMpw5xl1BwMIv7sAyDd+12Xfp9k=; b=k3L9L4P5LovGeDDpcvAWOqXHKxFYN
	8eiZEMWOx0ZhPlpk4aryqS8VbudwXmHyZjGP7EGHxDjN1ZJ69dqkdO70L0aRso2y
	Lt9BsymFr4k2EFEylKuShgjbwSpoJryUAfw3RDcft5hNm68jI7e6x3PNFV8g+id1
	yedawkSWlL/MyP9JBvt2SPuxGe1UNRnd7dNpz3uqNzzls3Jj9nC+AakYR7cTVuSB
	Gt3B9OGV9b+jRUkDzBMYLYChf3R8F/9USonMkCbaUEwQF7ZCkN5UhmMPqCmIYYvO
	HKqNM9A8kQzpeuSkhDlwrPLuY1ZC227oGN2mV4pUexXNaAM46FSg9HUQw==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012067.outbound.protection.outlook.com [40.93.195.67])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4j2rjjj1vh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 20 Nov 2026 15:42:03 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YCMt/Z2Zb7Q05yx4DHWG239RyEwxlIZgkiU2sKcxWxC71AkhdEg8z3ig33Fq+UtlebkjZsp5xc4623NZ8VHiWFL6hU425L1ZaQVnQU++uVbOnFi8upg2x8MyVn3ZE9Nc5d/lf8TK4uuGWg3F4lq3RYtY8Z7x39f4OWrbJrkGYu2QA9cIV1FXoHBO7kM/WvuRfxNuQKIRSpZuXXjCanru5bAC1aMSiDXaDyAiKy/jyrwH0NKEj2Nm3OSZddbNwNOmYwUTNSDZtOGjwbTWau1aarISsyb8KURfGCTlNViBim2/OoY1Mdb6yKaycA1jx5IICpCUIOnNu+uK6IjvNso9uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HSjy5WXd/xTL7SdxMMpw5xl1BwMIv7sAyDd+12Xfp9k=;
 b=ya+fhcFaBKk9PzwbFLu3oEN9Er+BMUYK4zBXrrD9Qq9OQBFhOs5f4EywRFpNovYFd3habLgEP7r8CPXqKuauih/9mNdmu5mJeT0g4dM55eFffoy7GhqvMG9c8A+zKaFFaQnlA5CUiEUUm2fzduk0TKyii/z9Ng7RKwjgefwRJFrAS4f3JuwffdfAZ98WMfvVgvE3xqAE2LWSC5jpP3ZIOucXUzwwxv+FDc3htWBAFKDqml9ChL9P0vacJu9d/zuuxdxzVoRKmj0TUHLdPU6cWC13UcfZHuOR38d0QHjl9Z/KDv3s3gezFnHjiO2jew5qI2oCsjujc6/XprazHYHJXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HSjy5WXd/xTL7SdxMMpw5xl1BwMIv7sAyDd+12Xfp9k=;
 b=egwNcqOEa3TAxsSf7gz6rLY3QiMmcWXoVk/GOnnQ2RRzbkacelQmZYh++bxvvlyVadi5p9lrVfSBaGMP7ahaAWsYFVoTtp4vXzdYCcNPL02EM+sJssJqc5PX9uP4RjprnVQaCxNyDqwP+Va4YvkRY3dpaSjmkhUwEJfCC9BDBaU=
Received: from SJ2P220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5da::6)
 by SA2PR10MB4538.namprd10.prod.outlook.com (2603:10b6:806:115::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 21:41:59 +0000
Received: from SJ1PEPF00002322.namprd03.prod.outlook.com
 (2603:10b6:a03:5da:cafe::6d) by SJ2P220CA0003.outlook.office365.com
 (2603:10b6:a03:5da::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 21:41:59 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00002322.mail.protection.outlook.com (10.167.242.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 21:41:57 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 20 Nov
 2026 15:40:58 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 20 Nov
 2026 15:40:58 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 20 Nov 2026 15:40:58 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AKLewew1890196;
	Fri, 20 Nov 2026 15:40:58 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1xUWLq-00000007dRu-18bN;
	Fri, 20 Nov 2026 15:40:58 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/wrynose][PATCH 1/2] conf: am62l: Add ECDSA key signing
Date: Fri, 20 Nov 2026 15:40:57 -0600
Message-ID: <20261120214058.1819929-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002322:EE_|SA2PR10MB4538:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fd05a2d-bf5d-4608-d037-08df474f1a58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|10067099003|56012099006|261022105027099003|261021123027099003|261021121427099003|261009223027099003|261022075727099003|261022115727099003|261102123227099003|261026140227099003|261028144727099003|18002099003;
X-Microsoft-Antispam-Message-Info: S28ZFJXaI3vfR7j9kjxt3G75z9SduTF4Z6qouzuZwfhsCCEvikXD2/E+QLNeAxeDUXgV34ayb5/kXg8nbk713dQ1ebYlRLLiVbcQ5PgDL1QQ0/+zVFAzz2OuCJw5BDicLvvhmbeizlvRuTLdqfVMVjxt8LfI+zCzVmYPkzSY3XN+LGl6BtXx4+Ze7/xleVZwNiy4fsLv0a4yhybAnyZD5D95ZuIKH30EOoPdf+SeoCOohSCEBsMAdVTZdqQR/dXeXXJgFOfyCI3wrSX9x7hkOZ7Pkx3ng/5FygXp4zn9DXTs88L+CaD3m+jE2QH0qxYZ59A3X1q7Yq/UiMLLc6EoVwCCFfSXcbjK7o4Z7Nm/MKzZ/sqx0Cx4fG5LDnVRe3wH0sFs014sCtxI4e2I4x3JR5WnnZjj0KumXtMx/eVTqrtaUpWwOYqd2gGf7wbig66knjBzVQym5RGqDPIpqUmIZdhnfVTaSU/e20xZ4PbhO/+AcdPKWP9H5jlWTLwNRcU9SdUysh5xX0Ng/ffURQR/o3ZZdfk2CdY9o8DUEg2gGNjcY+wxeozZqbWYxtmM+uMXgC5DlOrpT7bUNzuAEJgnIXkMonVSRJc8QMjvVa7fNGVEbiktf776uB2m7oG3WvjhR/zULzeLVeI6Dox7ZkgNtBwjLiotb1q58NlHysG6CKTG5A2N0GUiYqWLB8h0FMCzCKKAEY/Rc1dl2mfRNGgzRA==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(10067099003)(56012099006)(261022105027099003)(261021123027099003)(261021121427099003)(261009223027099003)(261022075727099003)(261022115727099003)(261102123227099003)(261026140227099003)(261028144727099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +lRcs7EKfPR1wKKmzwM6ZGjrLETNFTZyv6iH6azwCpI9RS8VyBMaXw6xzFIyrkZfsl73sIg/Y1spMR8chhIa9Y4TYajlvBxce16pmbsX7na+StCjUsiEEjptq4L/ipNe1x7aOqf4UljP5NGDmSFkv9F8jKPUGqLDwdK3hWybqOPFIwX0ZKBLzF24FNzCA36LEsZQWBYE/7WBOqUgoyuJSggf3LTciIIdRTtfndKyeNBSNwWNl7E48k1402aqdPoa53pzRllws48Qi29iiXjOjdbSKeCp1Jv7+sEnFZDS4DxAzH89gM30asPtbP037PSuQbcq0HQk2mUgpM/X56CPxJQ8sh/028lEn0pd6tzrnGP/L0JeZa+RssOSn+Kk83K1ISt6zxAyg/85+59xHmyt4WKsgU/AGl9/4q1MTFU9g3XG7zned4wM93M4ZswZ0o+b
X-Exchange-RoutingPolicyChecked: OpVq3t8JgXzGkIeXV5EtJOYQjDk7d5pb/kEaFDaeGJbX+ChdSd3Jmmi7fmjmD+Rt4Mb8B/bRtKWSUDCuxc8R1TKadHY50ti9ZMerJhA1IxpLJ1RH8JABvBaXLhX02kClMHkY6bmVNrTCHoqk8iMwhcNQCjWfCkFLpyreV8JojoKaD0YcNKjSJvNkIMBWaB/ZjDab+n4vsO3AKLXUpdI7/Y9XA/AXqzOUtmpf0U3ytPHDW6vBPrxDDZNiOZM/tavoRbks6yAYY1p/+LM3oRMNJ7SfbK5/gPuSx6eq1WIM3edNPvfTHYlQS6dccqIaLjjPtFp+G3gDkNP7LfCw66o8fw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 21:41:57.8653
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fd05a2d-bf5d-4608-d037-08df474f1a58
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002322.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4538
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA4NiBTYWx0ZWRfX2mKpxpncfIem
 M1k/KWs7HiFFqjJMsFqPhZm0E/3wmGk4qo4YHQ7kKcJOO61rJOqDpuASuCobdatCLpI86OvTnoK
 OaX4UDvOxxqCx39ev2miuoHSTdFzbr9dfqMsXptjGmDxj7ecZiorHdbTUUEtTPQdcPaYUCHq8m/
 zt7bbnclxBF3n6wVdCpzN6M9G6jcz5M/3H/xGYCQ1lYHes2z2HOtp2rStFFdPaeu0Lw0FMES/h5
 Js6qQrwL9hW4Kltg4k9/6CaXfAUhTmHsQUGRqy+h39oRj2xeMhEDNEl6IUnDr1EeUpyQMHLrXOA
 XAs77jLfip0aFnBM/S7JjCNSshPgjyPQRZp6MnDtP2l9Z4NAnKPOsMDIP3DIDDgRCfkzSyeJPq5
 BkvEO6M8yOUGGfshf/1bk9QM4TBsUKzdzYgaFGZjphC2ByJdUi5HvEhLSdqG/GJJMjegwdhYvR6
 7K/0jU7FyR7EhonxYDQ==
X-Authority-Analysis: v=2.4 cv=GI2dgeNK c=1 sm=1 tr=0 ts=6b00beab cx=c_pps
 a=ButkoIHTjR5vDxq5MUTXqA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=vzkXXw8NIJsEJjKD4YkA:9
X-Proofpoint-GUID: lI-X4o5Ih9e5bpowy-RiUUFBS2sRtK30
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA4NiBTYWx0ZWRfX5EK6UK6EBa/Q
 weO/u37yU9liWQGbAADsm6vXYy1dt8/NeFG9hY4WSXaFDnuQUtIhdJfWj+6N34sqQ57hZVOLaZI
 HbPnsTKUFO5WZYuM2+zDVb29lWn6hYA=
X-Proofpoint-ORIG-GUID: lI-X4o5Ih9e5bpowy-RiUUFBS2sRtK30
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20568
Content-Type: text/plain; charset="utf-8"

Add support for signing the u-boot files with an ECDSA key.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/am62lxx-evm.conf | 24 ++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/am62lxx-evm.conf b/meta-ti-bsp/conf/machine/am62lxx-evm.conf
index 7a422617..0bec33d6 100644
--- a/meta-ti-bsp/conf/machine/am62lxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62lxx-evm.conf
@@ -16,7 +16,29 @@ KERNEL_DEVICETREE_PREFIX = " \
 
 KERNEL_DEVICETREE = ""
 
-UBOOT_MACHINE = "am62lx_evm_defconfig"
+UBOOT_MACHINE = ""
+
+UBOOT_ECDSA_SIGN_CONFIG ?= "ecdsa"
+UBOOT_ECDSA_SIGN_CONFIG:bsp-ti-6_12 = ""
+UBOOT_ECDSA_SIGN_CONFIG:bsp-ti-6_6 = ""
+UBOOT_ECDSA_SIGN_CONFIG:bsp-next = ""
+UBOOT_ECDSA_SIGN_CONFIG:bsp-mainline = ""
+
+ECDSA_BOOT_FILES ?= "tiboot3.bin-ecdsa tiboot3-*-evm.bin-ecdsa tispl.bin-ecdsa u-boot.img-ecdsa"
+ECDSA_BOOT_FILES:bsp-ti-6_12 = ""
+ECDSA_BOOT_FILES:bsp-ti-6_6 = ""
+ECDSA_BOOT_FILES:bsp-next = ""
+ECDSA_BOOT_FILES:bsp-mainline = ""
+
+UBOOT_CONFIG = "${UBOOT_ECDSA_SIGN_CONFIG} main"
+
+UBOOT_CONFIG[main] = "am62lx_evm_defconfig"
+UBOOT_CONFIG[ecdsa] = "am62lx_evm_defconfig"
+
+UBOOT_CONFIG_MAKE_OPTS[ecdsa] = "${TI_SIGN_WITH_ECDSA_KEY}"
+
+IMAGE_BOOT_FILES += "${ECDSA_BOOT_FILES}"
+
 FIT_CONF_DEFAULT_DTB = "ti/k3-am62l3-evm.dtb"
 UBOOT_LOADADDRESS = "0x82400000"
 UBOOT_ENTRYPOINT = "0x82400000"
-- 
2.43.0

