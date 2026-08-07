Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C332C2A09B
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 06:02:12 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36610.1786082529568782945
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 06 Aug 2026 23:02:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=p45zQX97;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=gCa760Xx;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: m-shah@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6770FxsQ1467161;
	Fri, 7 Aug 2026 01:02:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=9YcnOyaKOlrjvVeyV+JRyXSgkHiQHUQb+h3bqX1uG
	Qk=; b=p45zQX97Siq94XQ6gtmtoCuT4sHTqCdS1v+W27gsa+R8n1TZrbkBQPezq
	bOf1RlGett/r85hx3aqtpwmlKelvj8Z6cqQGyapwYGGL2qfSpAhRn5dozZ64uSkl
	veiI7C59we5TwppFQF3L39MDzw9R3w6SJu1KTdydvvNMLl6vfKoPVB1F7axqZEi2
	7Ypu2ay7qn7Cv0yY1z9T5Ao7tahd4Y4awYgjGhlwa3ALuv+tsMVq6PJ12QE//uLM
	0Dl3LMrPRmzSAligNbmEReY6+IDHbyHTFzoFkEExUXhd+fnum/BHJqsmREXG9MUS
	O9G+u62XS+RjMZ22+hU4jg9pJ8Slw==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013042.outbound.protection.outlook.com [40.93.196.42])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fvsruyemp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 07 Aug 2026 01:02:07 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bLT/BewV7qmakfQ9Wl4EtxJFiO1WPD0pG2VxLLZqUbpPFsiQym6SGaL8vI12hMX7o+lrGgUW/ZNHzRt/CaB8RHmIlzqd3+XN4k8l0KL8Jc+5FV/MgLMR7mkQiKQS1vlKPiw9LW9VaJqVwNAU+i0LMFhMFrOpQwnb9Z5jZXbYlOkBNinn7kA4bVixl0qF+i39GT6YVyD27mHAp38NnjtCLH9c4Jc9bul47N+m8im5GlOjWFNt+JZrHOkuJ3XQ2dW2PyNPn+1aAHXRnBTUQC/C3L+W+xxFeIOryh5Aj5PbuN3pVx0TyGfs4uH0b0xq8I0SmPoW8m8uIxrH7lPuKNBJlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9YcnOyaKOlrjvVeyV+JRyXSgkHiQHUQb+h3bqX1uGQk=;
 b=iu3hEZZdIjp2Bt0LJM7gwW5rhRlDfZ5ow5AfLB6+uXXNvoevunjwH9kX5RfPAfesCkHxYb8V0ovzvi5FtpP/a7Ks7xGBCdkYbcqOseYcmZc8ehqpONw/F+Bel/1oay6l/OVsYLiQL2tdjZbmZKMn2yjSuS4IgEVExrcScdMksYT9dETsIhzTcEdQWus4a02iid7w3e+NL/qX2FD8+gqV4041SHcx39K57JGLzNlbsJTcfm23LL8GzBn13m+P66DwkcDj/Q4jWvlmwfNuh2AxYNolefLHWBd8Ae9A/9y/rOm+R2IVHBjrzuPw/Mzm55o04KvQZSVtPeKlmZgkwcwJ8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9YcnOyaKOlrjvVeyV+JRyXSgkHiQHUQb+h3bqX1uGQk=;
 b=gCa760Xxh/iCcaoxsZ6e4TRq+a/alom/NB8Db89pi6639mbMQyUw3YQ94mejpkVePRIpqV+GcdJO0YhMyFyLCMfVj8yGO2xknNPtvl7QNggp8k5nbiXrQ71pVuGTzpPcRMcQ7/LmFO0SiUbTbWAojtPij9bA9Pwa8mPTnodoBBU=
Received: from CH0P221CA0030.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::18)
 by SJ2PR10MB7599.namprd10.prod.outlook.com (2603:10b6:a03:541::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 06:02:04 +0000
Received: from CH3PEPF00000009.namprd04.prod.outlook.com
 (2603:10b6:610:11d:cafe::6b) by CH0P221CA0030.outlook.office365.com
 (2603:10b6:610:11d::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.19 via Frontend Transport; Fri, 7
 Aug 2026 06:02:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH3PEPF00000009.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Fri, 7 Aug 2026 06:02:03 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 7 Aug
 2026 01:02:03 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 7 Aug
 2026 01:02:03 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 7 Aug 2026 01:02:03 -0500
Received: from aniket-z2-workstation.dhcp.ti.com (aniket-z2-workstation.dhcp.ti.com [10.24.53.43])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67761uDn508776;
	Fri, 7 Aug 2026 01:02:00 -0500
From: Moteen Shah <m-shah@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <u-kumar1@ti.com>, <s-vadapalli@ti.com>,
        <a-limaye@ti.com>, <m-shah@ti.com>, <gehariprasath@ti.com>,
        <denys@konsulko.com>
Subject: [meta-ti][scarthgap][PATCH 1/4] recipes-ti: initramfs: add ti-core-initramfs image and packagegroup
Date: Fri, 7 Aug 2026 11:31:52 +0530
Message-ID: <20260807060155.1381364-2-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260807060155.1381364-1-m-shah@ti.com>
References: <20260807060155.1381364-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000009:EE_|SJ2PR10MB7599:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f87ac1e-5d17-4d35-4717-08def4496787
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|22082099003|18002099003|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	LG94pQpNJiyCfj7iihTrJ34kZFW1RZSPiwlaW2QILg0PHcIXiBOT1wiXbJffhg8lcyS4dxv9LrTe0JufiabcDpobMTras2xt31gyvN+HPka8O+EWs8a8NkRYZh2P8bDEMnKWjFpurQ7wcmRyjYsNVCaJ3j03455e0NnAcenxpkGZuQe9MYbAIrUkUCRVkLmQ7KYrjpxhe4hgl0mLMnc8G9KqQ3RP41/WDDM9dchgVelkDWbt+sNJKYHSv13BiGM3Ar0tfRcG4nlt+0BXnhaQ103tOg4KX0cddFBR9qIInUVTu5Gh3fHs7jaDrUmA7OWyfMrG0inkSARthDRinwlOnB/FUEyABmcuKuKRzXsIqpazyUETt3KOdziC5SMJS4rl4SfZ3qtd7EISG2f8sLsuAAJCIssfI60uLK+Yz1qYjvFQ/mLEeh40TVBdFIenY6BAn6LYPAwGBUn+DqUvYfVCSzGBYwdfjhVY/wf1gyITySqq/LUp8EnMsgw2+WFpQ1aIJ1PHiwGHcq6cGL+X4ipxrW+VpBayVss4TYeUDuTMQKEgrso9Qns2CzS+UtuXF5NMVOxstVG3et7HwkBLhWU80T3cZA2vO0423EGJwgO3ZEHF5uAocb/YBCekkXRgyOQD79Itr/nqBJDkCxhXjmLX7Jxdwzmc5jVFR+yGI0J5xUM9j6sEfqFcqc44wd+OrqV1wUqmBuvp2VhYmVvlitcKMQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	9z9NMurAiU1V87799jOqwjXkzYhSGBfbW6+qjg7zktHV707ujy7OZRnMtW3FcwfnJ+tYXKkwFTRR9mtvQuMHaj2ObteFYCh7U1wXLGqznz08C9fVC/p+zIRpvmcidX9shMTa+L9d8y1uhO2hTFFY8vtNVKLOCoQKCRSg/icSfIyc+GcyINp1Fn8ws4gjqTb/mwA/T8W/ZNB/eUajMSKMMeI/duPh3s5RuZjFtOVgyfDOoVWVOba3UeuO2sCpvPOREVxmHs9k++ThSKK7cmMNzcjFXIdlJCF+LdyqhGxU9tm4Tct5gKoLOOeWYJ2Z2QiTaITvWXcLugGvmAzSrXAGmaS37gXMa7t3NQkC5ql+eftdEyNtbGSYo5u5HM3YDCSAef9RtZBmddWyrNGzZHtksPUMX0e//UER/q1fES4L42B58POYzPWWHaxTS8iMm0lK
X-Exchange-RoutingPolicyChecked: 
	mTy4xb9vHY/fz7VsofBwl34kt231cSCQT5kETdzfcl6CXgS+aG3pJv+YXWCnsXxmP4+LDb5zgBUT55loVu71bDO/NB0AYhPa6MrFT6olPgl+5Mog9NCiMSNfH14WHVrBDWBqGYgiRbtdu4iTC/SxpD0K4MYTl4TR1xR6C4pS6i+a8PK5Hf/7fGprDsGrgyqRqXDSElafoyEQOzJy8kCs3y7HEr/Z6Rz+HCOmJSZykELUhJThVwbdMLXCqGSMDx8O/hcIkZ1OJiIxO882Kimx58gb7xzmwxB0dEzm8tDW4CWuuUnk1BXbiETNhDj1GxpasAQu3NvytHxwLXhYsp+2ZA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 06:02:03.8836
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f87ac1e-5d17-4d35-4717-08def4496787
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF00000009.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7599
X-Proofpoint-GUID: vsV-3Ktkdoq-l3qw5dxxL84yEOE-Nztl
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA0MiBTYWx0ZWRfX7ayEpi+uUGwS
 DEILVrsMZLKqlH3vLZ8qFgwleoY3wnvpRKKXbCLV1XjL7tpSr6GG2d+F9VKrK5nNfLgsU0lhyNk
 hMOBFS4WgK0u3vFDkddQocCSpJpCmc4=
X-Proofpoint-ORIG-GUID: vsV-3Ktkdoq-l3qw5dxxL84yEOE-Nztl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA0MiBTYWx0ZWRfX/9UoRuNZJg/Z
 aQ1gAUV/fS/NSkXwrcIiNPk2Hkcgt2ScTx9TfC+Qy0mzV5aY0CLKFlATnko3RBhKa4kHcMIQedH
 0mi5sBXIoZZLwOjCSq5FHotpYY66f2+IdtL8idJPOWSj8EcD0o3v4ErlJuHKxTNcLJaPXKDJIt9
 vI/A2pdix3QQ4g6Ij2a3BVwyb42S3BeQujiLXu8OUe+vyMCd2a0wDXmoNN9j2WamlATTx9dpcOu
 KZCFPUnP2uQY58mhfofn/hXyxUZdKasSjI9bIw3iniRuJRdxgFKsiDshOvE+ZX8z2gBMX/r153r
 Q8de6bR6MPscNCAFSCE3Z9jY+7HEd0aoCY7VWTDW3gu1eA8wTHhgMP5Jp3rTpJBhLdsxYi2amtz
 0MEflPYMXgfljNBoEV2/K4vKAhXk4r2zKHKpQO8bpdXP8Nw3+iqp6Pk5WvuRaGKePtHReC3c61Q
 cjHtx/Pz5cckz7eNczA==
X-Authority-Analysis: v=2.4 cv=GdcnWwXL c=1 sm=1 tr=0 ts=6a7574df cx=c_pps
 a=BmBYDrMhH73hh332m6kGpQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=_X8Bcqz0ue9J94y1HSkA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070042
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 07 Aug 2026 06:02:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20223

Introduce a minimal initramfs image used to probe boot-essential and
other modules that cannot be built directly into the upstream Linux
kernel image without growing it unnecessarily. ti-soc.inc wires the
enable/trigger logic (ti-core-initramfs.inc) in so any K3 image's
do_image_wic automatically depends on it once
TI_CORE_INITRAMFS_ENABLED is set.

Signed-off-by: Moteen Shah <m-shah@ti.com>
---
 .../machine/include/ti-core-initramfs.inc     | 23 ++++++++++++
 meta-ti-bsp/conf/machine/include/ti-soc.inc   |  1 +
 .../packagegroup-ti-core-initramfs.bb         | 25 +++++++++++++
 .../recipes-ti/initramfs/ti-core-initramfs.bb | 37 +++++++++++++++++++
 4 files changed, 86 insertions(+)
 create mode 100644 meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
 create mode 100644 meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
 create mode 100644 meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb

diff --git a/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc b/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
new file mode 100644
index 00000000..15c05e04
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
@@ -0,0 +1,23 @@
+#------------------------------------------------------------------------------
+#
+# To turn off the ti-core-initramfs.cpio creation just set:
+#
+#   TI_CORE_INITRAMFS_ENABLED = "0"
+#
+#------------------------------------------------------------------------------
+TI_CORE_INITRAMFS_ENABLED ?= "${@ '1' if d.getVar('TI_CORE_INITRAMFS_KERNEL_MODULES') or d.getVar('TI_CORE_INITRAMFS_EXTRA_INSTALL') or bb.utils.contains('DISTRO_FEATURES', 'luks', True, False, d) else '0'}"
+
+TI_CORE_INITRAMFS_KERNEL_MODULES ?= ""
+TI_CORE_INITRAMFS_EXTRA_INSTALL ?= ""
+
+TI_CORE_INITRAMFS_IMAGE = "ti-core-initramfs"
+TI_CORE_INITRAMFS_IMAGE_FILE = "${TI_CORE_INITRAMFS_IMAGE}.cpio.xz"
+
+#------------------------------------------------------------------------------
+# Apply all of the needed changes to create/use the initramfs (if enabled).
+#------------------------------------------------------------------------------
+do_image_wic[depends] += "${@ '${TI_CORE_INITRAMFS_IMAGE}:do_image_complete' if d.getVar('TI_CORE_INITRAMFS_ENABLED') == "1" else ''}"
+
+TI_WKS_INITRAMFS ?= "${@ ',initrd=${TI_CORE_INITRAMFS_IMAGE_FILE}' if d.getVar('TI_CORE_INITRAMFS_ENABLED') == "1" else ''}"
+
+IMAGE_BOOT_FILES += "${@ '${TI_CORE_INITRAMFS_IMAGE_FILE}' if d.getVar('TI_CORE_INITRAMFS_ENABLED') == "1" else ''}"
diff --git a/meta-ti-bsp/conf/machine/include/ti-soc.inc b/meta-ti-bsp/conf/machine/include/ti-soc.inc
index 438dd6ab..c4472113 100644
--- a/meta-ti-bsp/conf/machine/include/ti-soc.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-soc.inc
@@ -3,6 +3,7 @@
 SOC_FAMILY = "ti-soc"
 require conf/machine/include/soc-family.inc
 require conf/machine/include/ti-extras.inc
+require conf/machine/include/ti-core-initramfs.inc

 # kernel, initrd load addresses for the fitImage in all TI platforms
 UBOOT_ENTRYPOINT = "0x82000000"
diff --git a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
new file mode 100644
index 00000000..a9eff847
--- /dev/null
+++ b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Minimal initramfs for boot requirements"
+
+LICENSE = "MIT"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+inherit packagegroup
+
+TI_CORE_INITRAMFS_KERNEL_MODULES ?= ""
+
+RDEPENDS:${PN} += "\
+    ${TI_CORE_INITRAMFS_KERNEL_MODULES} \
+    ${VIRTUAL-RUNTIME_base-utils} \
+    ${VIRTUAL-RUNTIME_login_manager} \
+    ${VIRTUAL-RUNTIME_init_manager} \
+    ${VIRTUAL-RUNTIME_dev_manager} \
+    ${VIRTUAL-RUNTIME_update-alternatives} \
+    netbase \
+    base-files \
+    base-passwd \
+    initramfs-framework-base \
+    initramfs-module-udev \
+    initramfs-module-nfsrootfs \
+    nfs-utils-mount \
+"
diff --git a/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb b/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
new file mode 100644
index 00000000..0180f09e
--- /dev/null
+++ b/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
@@ -0,0 +1,37 @@
+SUMMARY = "TI SDK minimal initramfs image"
+
+DESCRIPTION = "Image meant to probe boot essential modules\
+ and other modules to reach the userspace, which cannot be\
+ built inside the upstream linux kernel image.\
+"
+
+LICENSE = "MIT"
+
+INITRAMFS_FSTYPES = "cpio cpio.xz"
+
+INITRAMFS_MAXSIZE = "131072"
+
+IMAGE_NAME = "ti-core-initramfs"
+
+export IMAGE_BASENAME = "${IMAGE_NAME}"
+
+TI_CORE_INITRAMFS_EXTRA_INSTALL ?= ""
+
+PACKAGE_INSTALL = "\
+    packagegroup-ti-core-initramfs \
+    ${TI_CORE_INITRAMFS_EXTRA_INSTALL} \
+"
+
+# Ensure the initramfs only contains the bare minimum
+IMAGE_FEATURES = ""
+IMAGE_LINGUAS = ""
+
+# on the kernel image.
+PACKAGE_EXCLUDE = "kernel-image-*"
+
+IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
+IMAGE_NAME_SUFFIX ?= ""
+IMAGE_ROOTFS_SIZE = "8192"
+IMAGE_ROOTFS_EXTRA_SPACE = "0"
+
+inherit image
--
2.34.1


