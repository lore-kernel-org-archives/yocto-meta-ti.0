Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEAAFC5AC7A
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 06:22:15 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37094.1786083727524600111
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 06 Aug 2026 23:22:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=CRtXt4gG;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=agqjyKM6;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: m-shah@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6776ECDO2309106;
	Fri, 7 Aug 2026 01:22:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=9YcnOyaKOlrjvVeyV+JRyXSgkHiQHUQb+h3bqX1uG
	Qk=; b=CRtXt4gGmafXqOJes7Myg5XtWe31lWpYRWSGnOzYy6oL2R+Qhsj6VMWly
	2bMuv8llr1Rp+5zRtl3o6X+dRhjQj6sJnwP/1Sgx7oxp/DCTuBboMklK1zAsgPj/
	3qfNpPl9f85a1UG70CEH5jLqS9Wnkxixgli/gZC1sMsT5A4xqgPIY92MULYPtGTG
	bNx8WqNKeWKquHT7A0Uf6J00qN3SZPgtMXzKSOVnqol/o1CzaH787b2Zdmo3q9n9
	ODPDbnUJpEJEcJ8/76gtTnnMONcZjtqMROPER/GSVck8ouW3Tr7K9VfuQ6SunCYT
	PGwlUkr2ndy5RPZfuN+Oo38Wa8HfQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010021.outbound.protection.outlook.com [52.101.46.21])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fvqjgg3sj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 07 Aug 2026 01:22:05 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bnKuDuhEdAI03zFYi1vZXlWObVWZrYO/CKgfiiktB+iURePvdKYd8K1fEau7W0TXFiZH+gaJURH7TOWCl3rEM873IgXvxX/3CsB4akjt5QRC9ETw8qDzZB7VYgaFAqeZTIuB/RSZvYwiYdxdycINpUlB3YjXY3/rTIwi5F0JSCFUEp+zeWL64Ery6s57NUBUmwa+l28wgM0jX4kCO9tX9wG+MvQt8m32R4u4YJfpET6un+Na2K4toN8/Z7fGVCsrX2mxFfOxIaPtJir4NsZlHYtnvsUhfQW2VfBF9ninA7FqBhHWyOcT6wDfpye/t0Ik5nDNzXxmjYYc6UN37Nj1pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9YcnOyaKOlrjvVeyV+JRyXSgkHiQHUQb+h3bqX1uGQk=;
 b=xT19uQ6Frz5ZyIySwV6bPFSdhHt4xTPLDIsmQwjEgeqgt7sx81nAhBboblDENdl3nCD9xbDn062K9klwp0BAEk6BggK9jNKOc0qXIXZJNLedkvDLW3RgoflXVLdu7jtGGX8AbxtlqQgshkAeaQsjRNobqZRJzsScibrpE72zqzpYMA3tZayy2d9IUMRN+sMx7EcDDZKqWWEzYKm2GknWgJVdLc3+pWcFA2uO2YSFvUIQlzbMGHExi9C0ls70VkDgaGzVn1vX8xfX42zGsiiBq3LZjgw0MrVYtpq3RiwFcCOEXS5sI/sL215pv5oa8jKfLJu+/GUJiV4yBOr86LJl+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9YcnOyaKOlrjvVeyV+JRyXSgkHiQHUQb+h3bqX1uGQk=;
 b=agqjyKM6Ngu4Y3hHB3epGPbq/SvuPVSb/voJXHDOBXtXXi1ggX0iHYghP4nDUG6WUWsAF3zGCuq4/xeh8w6CQS+W2/1l9NAq0SflJmVTq8CEPn1ksRa9Nkwfn0Jh8SNoMTPf7RJEdUce90GK0uCqSXtaqfKRQ8Gjrqsq0BmRGD4=
Received: from MN2PR20CA0056.namprd20.prod.outlook.com (2603:10b6:208:235::25)
 by SJ0PR10MB5629.namprd10.prod.outlook.com (2603:10b6:a03:3e2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Fri, 7 Aug
 2026 06:22:03 +0000
Received: from BL02EPF0001A103.namprd05.prod.outlook.com
 (2603:10b6:208:235:cafe::a5) by MN2PR20CA0056.outlook.office365.com
 (2603:10b6:208:235::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.23 via Frontend Transport; Fri, 7
 Aug 2026 06:22:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF0001A103.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Fri, 7 Aug 2026 06:22:02 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 7 Aug
 2026 01:22:00 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 7 Aug
 2026 01:22:00 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 7 Aug 2026 01:22:00 -0500
Received: from aniket-z2-workstation.dhcp.ti.com (aniket-z2-workstation.dhcp.ti.com [10.24.53.43])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6776Ltrp537827;
	Fri, 7 Aug 2026 01:21:58 -0500
From: Moteen Shah <m-shah@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <u-kumar1@ti.com>, <s-vadapalli@ti.com>,
        <a-limaye@ti.com>, <m-shah@ti.com>, <gehariprasath@ti.com>,
        <denys@konsulko.com>
Subject: [meta-ti][scarthgap][PATCH v2 1/4] initramfs: add ti-core-initramfs image and packagegroup
Date: Fri, 7 Aug 2026 11:51:51 +0530
Message-ID: <20260807062154.1387339-2-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260807062154.1387339-1-m-shah@ti.com>
References: <20260807062154.1387339-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A103:EE_|SJ0PR10MB5629:EE_
X-MS-Office365-Filtering-Correlation-Id: b59dad01-c23d-4c7e-dfbf-08def44c31bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|376014|36860700016|22082099003|18002099003|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	c9x5Bb9kYH2tVazY46CTJbxz2xuNKQMPvuY1kxiteBqyzJrhfXoyMYO+7KqdTVEz7T7WfsIFNoyqAMb6XFtIAQZAzgXfxljHWr2ZFp0yuY2JCfC2Jfy+sab2zX1apd+YI2Ln7scxRmZqXRmqkC5t8bgqUf9G64Nnb9+saMS1nE0zE/wHfysWX9i1fYQ+th/vdOj3E9kej7oRl1DJoIP848994L9UsThrvo1o35hz9ZTrWV7K3af3/20kBbbieSkfD10hHzDpcRYnug8D2TiD6k7UnY8DFMVDJfV4D8UhleFL2+izYoCMU9Og5/VzXNhoBQzsOVDt/dCEnmesylmg9Mu00z8OwdYyzRcJFGm/OAPCN+axtX2OxO8DlKjr5ef/ZkGqZszGMDlfUg7NnPqejAQrRYdUsmhiEB6PwiuTcpRK9LA/6dqbgnTuuQoeLf8zXz0IJkqkBhLUcuDzZ7VGQmQ+Mi8oTY7qKi9DLAwiWEP+n8FdDKwxDZRhV3/Trc5RYvi96086objyecfYwm/kNAXyd4jztkqvOb4nRWi5q18BYwrSgtfuWu9rxhyY371sivIIWYl2tTV8ZsvNV3gEwfBAuRkQgwk8bBlZSEIw49DrTX6RxN9PpyR0JvKPUIfSgXjQ7bx8J/H4TXlucQfH00drz39zlvWq+wvyQo2zWL5xl232MdX+5oBRulgHGVnXWLHsTDZItX/WKrpPNjUDog==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(376014)(36860700016)(22082099003)(18002099003)(56012099006)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Iql8WtcXLC6SBftGMFfCRcVfTP9FtM4LnatWrx2P7gp0KOF8gRcSnJkJCGmMv9ONla2LfjFjA5hWneoxxGS7VlT2UrRpoqN3SP8Cs0xU+PQkR0161g2lRD+pgiaXcmFZRrFpf5tfxqaQ0b22M8qvt5LbmTQ73lDmMOQxh2ILDTcLI6Hd0APcZ8To0GEnh9WlE4yLjxM4DVEfhiYAfbFPfrTAhFPEXYU4XpTmr9Vq3e0A/8tl20Fp/iQxIQfxjXddPDF7Snh3/cvB521tVYcbUsoRRbHWpmY4LdcCch7me7ktwAz97II7ZQLgaDBNQb6indGsTfc95nTBbw2fqWFZfRxhPdqvRJF0bpmeXHz9eeGvXXnMVARJSJoDEv+rnfbjwDDVYnJvN6aolr1Z8bLNi6A4pRrPIlxDmlNjcM8b5qnl4hb/6E0yAEwWmQbYuYoJ
X-Exchange-RoutingPolicyChecked: 
	L/kPkzg5CNa5cbsClWBBDHN4jxYh5Q77RxdVN+tbPLbjIeOWoOMITMbMJku7SSGgmbGa1Sg+2PzDvxM8pPRDRcm6n9ECDtrZQlC06ubW03WJdoYV3bB8uC6CC/vlU/cN6aOzZMUhM6ZMeVU+aD+Uina44tP7PwGIfdP7l3egXUl45A/hqIcPNWRq/cvws/gB3GnNyCXTodCe4nahGD0YMLVuWv6LZpMoN7ZHFlSXzs1o7CnQtOJBuMsyFrmp7GrUceGEMNxn7CWNNLevk2auKxocHlU2PB3fqOgg3uaMrecd6ornpsEeZyzl1NirMMCYHoyBCR0tQiMHRAoKzB9n6g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 06:22:02.1094
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b59dad01-c23d-4c7e-dfbf-08def44c31bb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A103.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5629
X-Proofpoint-ORIG-GUID: Lh5YqRkRm8MSVrujO8oBDSHXprbs5cbc
X-Authority-Analysis: v=2.4 cv=WNdPmHsR c=1 sm=1 tr=0 ts=6a75798d cx=c_pps
 a=ReLZl+GdXdFt35wSL8r9Ug==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=_X8Bcqz0ue9J94y1HSkA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA0NSBTYWx0ZWRfXxXiAVKTz1nrc
 TLA3vJtTs/+cPVd9gO2LcbLkYDVohb6kl67EZ1suMhidJrsTpPBN2sCyyaHgOPho7A1UOxAAUCV
 cV7OHpaNiEDyk3qjj9IpNiPqj1b/zuo=
X-Proofpoint-GUID: Lh5YqRkRm8MSVrujO8oBDSHXprbs5cbc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA0NSBTYWx0ZWRfXw1MORv546EgL
 e2Vl9GS54Nm7Pv/fp4znZ2WDl0VVqzLUP6dWtAdUsLh+vxs4qOMKWLONxWOlVPEqL9ZmFH0wSGS
 l07ZayNZZF6NCOBUQ0y7eysLVe+4VXJsR0W3WayFp4CpRxPCFuOEGQvR8WhS1xNbEDS447v5/nB
 aAKurp7Zs6/gqEGhvCnukaNVhgKIw7GhA8ZfhNJS6SyjUEXasEKhmu8Lsr3nL+mQWCCnCCGKUIZ
 KdeOu+Kzsw/lVRMoqRn5oo3Jj31IUrXBBibiEfGIIhSj0z8/lPpRzDJXmrc2R/I3fq1/58rLfkC
 AnUqV3D1QqnDKOBerw6jG833lk+xqlD80S3/fvKUoCpy4KNbalp/8Em2j0SC/nuixf8GO7GenAJ
 CICKXBC0nQXfHnkVbwjflNbnnPi7FCt21AiNfbfq3jZ6L5fsqMboN9T10eLZSH8Kd6m0HsaTm/R
 GB7/L/PF9hziJVUONjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070045
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 07 Aug 2026 06:22:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20229

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


