Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D55E2C55165
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 13:01:56 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11199.1785416513672345993
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 30 Jul 2026 06:01:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=Gmb4X6mr;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=wZXkONaJ;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UCK2XN1401912;
	Thu, 30 Jul 2026 08:01:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=lIhn/JL8VDPf+
	1WHUNHvU1uA9QEvLEwskUDNr8X+3Kc=; b=Gmb4X6mrpO1mm0pdMAnDbzLKEz1Ck
	tcFo/SEa393E2rjlBGTOwJBzDmxL+uOepbT9rlRRtInGnNr2iVDFcYIwNv1DS8OL
	HK96sptYm9JCgmxp2NZRLPkJUELq9rJWNwmFDSNrctJjaVbJIg+O+CTgQP0g0i+E
	fQ02x94Z6NMUQBC8HwA29aT8byxR+cDehby4mi4ytTmzRPe+0lINvODrwfU9fTTw
	LBt1oDpr9y71oKwAnEnpFdhxWnrhYjWH7fuTXxRvwj6wHxgPQoLf5X+nxjbHJZXR
	rZdklDYgJfXWBMmOkTOIEz0y+Q94fKxFPUWF3dficOeXEgIyniyUy7Ebg==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012069.outbound.protection.outlook.com [40.93.195.69])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fr6ha075x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 30 Jul 2026 08:01:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H7TnC3gjHTsFf2vj95AX2sB14GNnwozxEQxHqm07qGiP8BFLzQErXrgKDHTw1lsxgSODsaHu3D4BNOb5ht+76UNbXuylpv5jg+kBye48hKSW8au8A+7fSeh9mwyfx3E0UY2sTVBEHn8gJBijfyulAP5Lpjn1IsSD5P6GFbCMgM/QKYleCcz9aSdWE4rLavgn+v/tiw/7bjJmgj/BVnRzeU57YtWvhMnOiGfFSUmnX8UjrZIjpWFT14A7mAXxe0HCPD4TsdV642hxnjbDGWyI+LM08rPHfMH5HJC+RiXqPEQr/Si5t6KPuLDurVtUYPg50X/Lio3SdhhxQiPZVjy8sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lIhn/JL8VDPf+1WHUNHvU1uA9QEvLEwskUDNr8X+3Kc=;
 b=V6bjhoSRU2PYdSvXZ164h1WW+C6dBH+67Di8rp1Vc/obIz9OoxXpf3p1auGeEeltXJLnl6mcf/p6jy76+/bTqhhIJQD8scHXM9VJdRtOmBOGzbEpB1MCyosAehT6yn6AlqhkFI5E5fzg7asJpvToSwrNhkNu/wgBJb/DoS1lw6MK9DbVGuamyNaG8NOoRtDQgM+aXEOmOf21R4moARTmT3yMvhvatZmk+mIUPBqR+dzUr8UvAmnCU4/m00q/po0vdCd18GQi1IKdzD4abwKWCNrWd9q7Hkzo1t+2LI8tdBjb1InzGGUJMhgnIU35SR4UnZTDh84sU896Y10KZJY0ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lIhn/JL8VDPf+1WHUNHvU1uA9QEvLEwskUDNr8X+3Kc=;
 b=wZXkONaJpEsBJYOSdyBlJ9qJO/Ok42UakhaQg+JfE1o/Qvne/g2xp7CrcLAaXHZzYlIgC34ZAnoqBYVda7Al23uJxIaCBMJk5lD9DDd1C9CcOR8vu61aZi6jZW/0z/jedHnnmzQiHFOa6DPqdfTSWtRNwloNKJhEj8VSAOIZv04=
Received: from MW4PR03CA0074.namprd03.prod.outlook.com (2603:10b6:303:b6::19)
 by CY8PR10MB6492.namprd10.prod.outlook.com (2603:10b6:930:5c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Thu, 30 Jul
 2026 13:01:47 +0000
Received: from BY1PEPF0001AE17.namprd04.prod.outlook.com
 (2603:10b6:303:b6:cafe::8) by MW4PR03CA0074.outlook.office365.com
 (2603:10b6:303:b6::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.14 via Frontend Transport; Thu,
 30 Jul 2026 13:01:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BY1PEPF0001AE17.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Thu, 30 Jul 2026 13:01:46 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 30 Jul
 2026 08:01:14 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 30 Jul
 2026 08:01:13 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 30 Jul 2026 08:01:13 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66UD1DhJ3344369;
	Thu, 30 Jul 2026 08:01:13 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wpQNt-000000050HL-2vxI;
	Thu, 30 Jul 2026 08:01:13 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] ti-core-initramfs: Add the initramfs to the fitImage
Date: Thu, 30 Jul 2026 08:01:13 -0500
Message-ID: <20260730130113.1192704-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE17:EE_|CY8PR10MB6492:EE_
X-MS-Office365-Filtering-Correlation-Id: 8379dc08-80a4-4a80-14d8-08deee3ab62d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|23010399003|36860700016|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	xswQwMm0D+G1s1mFDEcXsQuX2nv8IqmPTrRp8lfcrKu3feYDqgKH0cof4zWW6d6IJNjzn82HTrhHUX95YIK2g2n7gWaxzc6baHIO/DmZGXdZyxgE6xZMP4az2ItKxfRfkkx3visoLuDKyxlPrQtWY3AyTvDpEbn/lv04tEf0XBHpqjFw8IAVqcDBldqo1lYO6pJy2eyZzLMhsXChwDo6kRWp16G8b/dDsHsifPX/GoLevZtYmpFoZutLFKPJt4uj2t06Y+IAivFYxgQmV76O49F8y2d48BO6Hb3KrcJgvbB53KLKt7FShbtAdNLptwcTLtiYNN/IQGHS8xoRJ3/lSIJ5PnLLcvG67+m2HP+2eRwJpYdoSdwejTG3rdtn2DtckxEZ9l7FahF5LgNtSAPI+Is//iV9HWlYeRPJn+/8IE8ZZfQ1kiZtCyCT0eyAUB1M3gKbGn5IbLBWMkxmHevnpy3Dyq4aUY6gWyjP7rZvQstATcyNJUrUl6ZuwK87FtbCivcnIvu2HBnn3BY4rAVWfvSLTsL6NZah9YQ0+EpJtDlmmL6x1xvAX/49qWsT4Tv0Ugoi76AhnCWFbeUKACi1p/Uzvu5T/XPPiVhlmrVJ49Fvx3P13+g5IC0adXFB9905nkMOK63GARhrYQs75wTmA4lZuZvxYOyvx8vrIpz/tPApSCwvyL+8eTC4pmRAMO6HBQpGgfJXGIVgMWwk1E3IMA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(23010399003)(36860700016)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	SRX04OQLiUj5GSBKNSfHfCHcf3NJvr7aL7z6UQG4CHz+lQrjwiD8RcjomIaR0V3JbShdBbf9O4FEm24xWvKKeXQYy4lmz7TK7qNWLZc87KjSkNgbVSPWEXwwlDYXiygmcSOr8deaige3j8H+0JQVSphz2XfRIU0LYhiXlrNVFosYgTQnDyMfiQIr3utquDSmoGeIKkTuw+nKHUaZUdsEiTLbKNW+deiOwJ8N5t5K5hLykhnqbQM0JSq/AP/SgOYlUzKsBAWJ7ZJ3LPfpHbef/oDxfb4OfRgJrMc2M5uL4xGQOLmjWlTXYahVLZgs4XHGwzcsL/T1jRvNcFSV7q3F2fWKoqhoTJSHmn+kMMJGGVTTntRTGo+A1ixwU7SXC6IlbFAwXVyghlvhUVxrJe8hbJK9HisuXwZ8fQmeSTSsdqdNhYG32+MzVWIaBY+bsjDp
X-Exchange-RoutingPolicyChecked: 
	jF95qmxHnIieuH9mpKyN6m2t53GehmVb0DBWy+M/Pz51NqjHyM1GVBZvrEccvv829IhJQkfDSFutdC2YEBHRxLn5AW8OOq6bB9S24QBGyplDNvc+GIEzDFTVgx2S1i+ofHjwJwXZUEtrSkVBaDAdxdR8RsxyqrxNb1QinscE4TJ4iX6bMqUxrQ9iIQsCoznTvGdnFOuH7Srf4kjY9XnOm9TJ3HQL+rkrQ9iXXz12GfHAeTr5lvT3v/ZQWEUVx2C/JJw4m34OefEDTyWbVtPtnc1ZpCJHxAH8ezFPQ7/xfaz+cGrjel0VJ1xN7WVe/fTUXAzLrGgVbe9fXnglkl0ybQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 13:01:46.3837
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8379dc08-80a4-4a80-14d8-08deee3ab62d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BY1PEPF0001AE17.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6492
X-Proofpoint-GUID: c8wnfRbbuqG3VNQQ2wvBWdA3SfWfOg85
X-Proofpoint-ORIG-GUID: c8wnfRbbuqG3VNQQ2wvBWdA3SfWfOg85
X-Authority-Analysis: v=2.4 cv=e9Q2j6p/ c=1 sm=1 tr=0 ts=6a6b4b3e cx=c_pps
 a=LyZwXkN/zJaPlZXKe3eCLA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=_UdV8_DdjjVpoORkB88A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA5OCBTYWx0ZWRfX01w6p4Hb/Eyq
 J5H74hOXeqrHK21jHP7qCRIleg/ewVT60KCpUri8HvxYy1U6yYlHGXHx8Gc88IL1nRwi4r/yI43
 RCe755eWrDUuVpcotNdsBkyva/RfFnponHwDtey8VmTfba3I8P1jP5Z7Q02hjUShppKLna8sKqu
 GTJM1fNF6gJK2tiYOJ23liqxkaCT7Q6l8EiA5tBE28OTNB7RPxosJad+loisiG4kWu7DkSosLr4
 JEglkAm1cKR6uRGoeiWZvr+FBURUZzySrKq4HWbItQKk9oO8izXs07CrAx9qDz+Re39U3p1EQqN
 7d18N26qvATQ0qkFugheSFQTfAlI/Awo3a7UFVPO9ry8eztnRFDSKGztvL2mgR5Kk+eWFEYRfri
 8FUya3e5wvZfe0xxBy0FCD+S448Wput1UBaTstgUto+hvZimxfD/551FuvDdGUXRFdTdpB/S2wf
 FRKUatM0qH3uaDPdEhA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA5OCBTYWx0ZWRfX7/VJTkz76iCz
 gFRDJ1LGxY0TXPYktqWm2WViNTEpEl3vhywkhAcno41Crkl3XpYFATM7CPQ9quV0kVxiyZuD+kC
 e9kBb4OIOVJeMlhjfh5+GXVi3fn73/w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_03,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300098
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 30 Jul 2026 13:01:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20209

If the ti-core-initramfs is configured to be built, then make sure to
add it to the fitImage.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc b/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
index 15c05e04..c816f1dc 100644
--- a/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
@@ -21,3 +21,5 @@ do_image_wic[depends] += "${@ '${TI_CORE_INITRAMFS_IMAGE}:do_image_complete' if
 TI_WKS_INITRAMFS ?= "${@ ',initrd=${TI_CORE_INITRAMFS_IMAGE_FILE}' if d.getVar('TI_CORE_INITRAMFS_ENABLED') == "1" else ''}"
 
 IMAGE_BOOT_FILES += "${@ '${TI_CORE_INITRAMFS_IMAGE_FILE}' if d.getVar('TI_CORE_INITRAMFS_ENABLED') == "1" else ''}"
+
+INITRAMFS_IMAGE ?= "${@ '${TI_CORE_INITRAMFS_IMAGE}' if d.getVar('TI_CORE_INITRAMFS_ENABLED') == "1" else ''}"
-- 
2.43.0


