Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4698.1795048284077524179
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 18 Nov 2026 16:31:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=EyvvmaNQ;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=qLgkNG9Q;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: rs@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ008Rb3635100;
	Wed, 18 Nov 2026 18:31:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=pAaEhNe/0Crsz
	jAWR8aLdZYPD86wtthwrkrCqywm/fc=; b=EyvvmaNQ5U2YAVqlsWZB7Td5ZQG7D
	nxzJT5s0i/gSUVlj2m36zGIWKgNWaimls0YGTQgGScJWN/8EZg3lR7Noq5DIlUjf
	kJWTfE1/seixuFSVHaUApi2eQ63xpvDQtjLkgqLLgCX2SITEELqqONMCav6ylSYO
	1MEcAT/DewilUR9PRywRH6/GCQlWt3tb4mOgRLF+LMwJmFDXKPDndUdXbZzFYkRy
	EDgfiwC0TcKSmNCTFXt+FH55Xd6UFjh/ciufTX0DvNakugk/auewDL2ybU612hPe
	VBuwfi8+rfSmQ+qFhI4rTgvnzHvdo5JoPqu8uHdESbaNi5nGBwbR5bO2w==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010024.outbound.protection.outlook.com [52.101.56.24])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4j1p6d04jv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 18 Nov 2026 18:31:21 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KHDmp5ePf1x9Ll/CLJq2d0saWJy0rZMzdQ9wRbnlVTUncw7UCVjivztEHy8CfiXn4Llk5fe52La60qEEbgXDrhnGCHIDIJhQsdbWuScmExA5ioPsu5fpOLXay/NZ8OKOqt8dWGPvQE2CZs/Mset4xrX+kvc6j/VYtgeM5G0vQTn8lLegFSmY/+gzaiIMKulJ0zKqmg+Txs6j63dipTwMwXmmdXHfsjmM44y07ubJifgogmDZKFimV+TWV6rOvF93Rwueu1XyKh1+IHd2Su6FDy55oxI86C9TqE+OKRaLhydgBEi7XpFGEM1MVXHNTe0qjkH4S62lx/0TpydRyYz0Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pAaEhNe/0CrszjAWR8aLdZYPD86wtthwrkrCqywm/fc=;
 b=ONvL15lAk74jqIfuC5GXdi1gK1BfxkwAr/2w5lLdvLgM+nKPfRZ7OCAGevHQqzZneocoKiC5OvAy6e0cOIxjtfM5VUJIOn1ijE+LN5iktPTrgpmYdGNhDLJDP8XxnhS4/UnL8QFUnKbTVqDuyJu4MTMeskm6zoGxCU3N6l3z7Sf8FJYLNTsZT6ZbU13Jc5m3zuGvAlKTCYLSePdLikpnNh+F043nmgxihsSlZFID4d3ACO40jR9379C5N8i/bSb2MqK8y+6fCC4C7V7xKDFv2fpm+Vu8qq+hlPRrp8v/VyitadBYDAMHhlMwxwLK8RiFhjniOMVPGHFTrxeccRKi6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pAaEhNe/0CrszjAWR8aLdZYPD86wtthwrkrCqywm/fc=;
 b=qLgkNG9QhsVjZjs+0qdm0Qwl+uvpm+TCNlt3uCvrHr30UBCywvA45PrXFC2zaXuL+opK+gAKfnoNNQ7EBwA5YMUiprijx9upIQyJz3uM4PqEcBdTRnmrqzSfJbRVufcn0bdMwMbnPl8wJzg6XhShQYA6gQutroDiONK6l2GTSdU=
Received: from CH0P223CA0019.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::7)
 by MW4PR10MB5726.namprd10.prod.outlook.com (2603:10b6:303:18c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Thu, 19 Nov
 2026 00:31:18 +0000
Received: from CH2PEPF00000141.namprd02.prod.outlook.com
 (2603:10b6:610:116:cafe::ae) by CH0P223CA0019.outlook.office365.com
 (2603:10b6:610:116::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Thu,
 19 Nov 2026 00:31:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH2PEPF00000141.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 19 Nov 2026 00:31:17 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 18 Nov
 2026 18:30:58 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 18 Nov
 2026 18:30:58 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 18 Nov 2026 18:30:58 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.75.60])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AJ0UwII3043643;
	Wed, 18 Nov 2026 18:30:58 -0600
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>, <detheridge@ti.com>, <afd@ti.com>,
        <praneeth@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/wrynose][PATCH] ti-sgx-ddk-um: re-enable multisampling
Date: Wed, 18 Nov 2026 18:30:36 -0600
Message-ID: <20261119003036.1552487-1-rs@ti.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000141:EE_|MW4PR10MB5726:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b5c1129-b9a1-45b5-33ee-08df45d46d67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|23010399003|36860700016|1800799024|376014|18002099003|261009223027099003|3023799007|56012099006|261026121527099003|261102123227099003|10067099003|261026140227099003|261021123027099003|261021121427099003|261022105027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info: jCWbZzLtN+RJVDvk9NB77T/8zIq9XAeoLBgz+Yf0nXwLkT+MijxKS0k+7Lrb82izb5JL4mpLXuVeIjEWUq3aCOMm9VOT8RcyODbuTDasNVtYLVAeZDfPiYiD+TGQZ9xWJDuoEVMgRmWGFZH4gJAQWvBiRt2yS3n5T6hroDq+RkFOOd4b7P47hP1tIgjXO0h1l4fpwupj5ChARxl/dZZZurY6+XD41tuVGQ9+O/AVdtNGCSHuYaZGS37Leg1YlC/ZtTmj//7+89OjPEf2A0cwBPJsPC8CeDfvW6DBNdIzJmJ0Cc6IhpZAJC0uInyBS6R6gQB/GhuCFnZQR2Cs9+AAzHR+vKBVsx71IubNbKowHluPOsp2vGOfKkt6E6gcBClcvRcprv3qclUHwd9J2RgKt2bu8OS3FFd8DSz5YXvAoEdWdDftzFQjrnUU34lGr2LWNz4ewz8vtXoDitadPaz+gKvDEqioYaViKXHnDu1ZDsK0WoVChakY5IF1DFHGxgLfDs0DeZTJHZwKY1lIN4wPR1CHWgkpGB5fjCAQDFH4A3oT9A585SlHVD7eweDvO1yjUKoxUEDdztDOx1NNy2oWASmJp0sTfrxpi5DwkqWCaAG17TOJBXp2vtY6BGf7VuRiReG0462/vvW+vs1yef0VAPtwIouBK/9vmNp+q+q3OxKUC1phx6pH1uSIk+0WNfXHshvR1W5TmVZyxZhUD7pRgA==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(1800799024)(376014)(18002099003)(261009223027099003)(3023799007)(56012099006)(261026121527099003)(261102123227099003)(10067099003)(261026140227099003)(261021123027099003)(261021121427099003)(261022105027099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +MWB7boWMFsF2h6AEkzsxaXfxaaeeOWkky9nopgBKyr8akl0R4fi7TSwfQpoW8XbZbflWNE4LtoQt06TzGjDCmtIpDo2sI0Qr4otJKRiTFwhJWPbvzvySX+TlKQU9LOGPEZjhsQYZmndDEj92VBkhtVsF8fJB6D7QxuCEonn5lrnG4evkkNKHlvaBtAzYp3Q07Zyd3VOTwCssQxq5X3GWoWFp+ocCqB3pTW7dWmEMMGRCOTs4xMG4RX1w0ll1jnImKyhOptZ6in7szbP1LXwX/Md93DiLD9kbRwmO0Db2TGBoK4thwm4hShXb38PLfJSuZReFxyn8JIGpsVA1P36a3rRibhPSnsgEXYOvOOSzEr6KVYXgZ326BNjsh4lCIyYDSSPxXLOsF6MgpAen+9ZHPSUtu1ATuS2AEcpyMPnqn3GlDLUQ2GiT/qp4zMX6CKv
X-Exchange-RoutingPolicyChecked: cJEpcWIrVOnwqOdE7E6qphGG/tM2e0TEYJ/Ewbim9eVYirkcIGJDehjP2KaGwbV/gAz49lrmySoHynFatgj8iAOwuHxzm7nmiQs0CeLAKVajOuZYnjWx6PZsvMe0aljp6CyaWGQ682bvT4W/w7l2DPaSA4J9jLbqOmB0SvvfwEY2b35kJYp+J+SkwPwndr7XpG8zresd+CO7h6jwCPWeABN573G+8fkr2A3P8ZbqNFIAZUWVvuHNlcoMMypEF6RFVCC6VkXTdBIh4vpE1SWC9OjkIPruTwv8cdKZ+QNU402ik/72gFTtZKD+Y8wjzJAaH4+tzn5KvV4yJgrzv4TwDg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 00:31:17.9779
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b5c1129-b9a1-45b5-33ee-08df45d46d67
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000141.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5726
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAwMSBTYWx0ZWRfX6coZ7Ui3IPPU
 mRGzwI1yu+n/QmsxalY/4hTL2ed8jIFLHIa0EXOav6fVlYJMwAGWzD6JrjJ7dGxqvvz9r+iDdB8
 bqECmOLSDF4IaUH6skK2W+FfIYbZoh6xwouz/+IvWPngQjZD8Y/31mJWGwWJJ5REc2yckboOkeL
 u175PBpDGLJomUGtk6poygvSnUyy8b+kTtPhR9qKqwPG1kHs+F5uPcOE4QxNwnBJkqRFk8prpw2
 V2z3r6uXDjANdsKT7MKB8RNpZReqOWr02tpbn9V6XfOH+Hl81JvpcgsmK1hbMvbnZHHRlU2eN7/
 XE3mrEKYgBul+IRBA9S/sORORySJLtv/VwMuynqTypnLvtj+u9YNI5SWpNjGpUT6+YuJEkPpANo
 u2o4mkqNU1/mS2rFPC5xWiI4q+OstQ9JiiOjS+GRoN1GMCddZi+EL0+s9VbwD4xEkUdfReCxnLb
 39jDehqjfeyQ9YnxgjQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAwMSBTYWx0ZWRfX7LJaIGCKfM8M
 SF2LiTMk+FHQSbqMXrTkgl9vq5WI9lnYBNk1tskuVEfHmO3mdUPJR1sllCruRxkql/l41zp5shZ
 f7iYaDEKCNCYW90YGv9vXfLEPwfCj7w=
X-Authority-Analysis: v=2.4 cv=Qc/zLcbv c=1 sm=1 tr=0 ts=6afe4359 cx=c_pps
 a=qaGWf3H7ZUycNCJ7m3WmPQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=0mMb4WsRAWjuxA3QwbQA:9
X-Proofpoint-GUID: MBhcnRRRFgRfD1G87yCfVmk5exm6JqaD
X-Proofpoint-ORIG-GUID: MBhcnRRRFgRfD1G87yCfVmk5exm6JqaD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_07,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190001
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Thu, 19 Nov 2026 00:31:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20557
Content-Type: text/plain; charset="utf-8"

From: Randolph Sapp <rs@ti.com>

Re-enable the multisampling configs now that they work again. Fix an
issue with EGL blit operations.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb
index bd0656a3cb7e..fd1f64ea853b 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb
@@ -13,7 +13,7 @@ BRANCH = "${PV}/mesa/glibc-2.35"
 SRC_URI = " \
     git://git.ti.com/git/graphics/omap5-sgx-ddk-um-linux.git;protocol=https;branch=${BRANCH} \
 "
-SRCREV = "f52f27edce0e961be46eb4426dd030a6ab17ad16"
+SRCREV = "8f24e3402a15658c0a39b53dedb91677a60eca94"
 
 INITSCRIPT_NAME = "rc.pvr"
 INITSCRIPT_PARAMS = "defaults 8"
-- 
2.56.1

