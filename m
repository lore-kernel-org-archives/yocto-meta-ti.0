Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E4E0CDB46F
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 15:06:01 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23703.1782227158480131087
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 23 Jun 2026 08:05:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=Gql8WiwI;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=HKs9rj5M;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBbPBg1665159;
	Tue, 23 Jun 2026 10:05:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=tcXrbgC1Gjf4jL4liyrzpmID4leohe3uTsIvqzAtq
	r8=; b=Gql8WiwIPBqHxNOHiheAS6EeFdanUye2WNOVxoOTaThJEJkweU3NXmm1z
	L3mhfxuvlNUA5YEGLXtMvhM/f234tTHWkz+UuDpeFy7D505B1eny2FRUBayBCBjn
	H8xFYkDF8Sszh3/o01aeMCFZlsiQrPDnuFv/9eSIbYWmsN9lvLW/yLv68tkeuLYv
	uFXGV9hNB6U290BDDBrmMsXY7jaY9y739dsYnhuUpGbZKe3Af1UHD+ylIAfMhAyg
	rdCYZSkDOoMOH0RqmYzm899wg3ju63iavasli0aqJZHJtxVxPv1LpcZAZgcAQkfT
	1DqQ6k/g8Ccbby4GeLKpmZ/Lwm2Dg==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010020.outbound.protection.outlook.com [52.101.85.20])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4eys141cjs-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 23 Jun 2026 10:05:56 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IR6k5poCICGsn1Gryyrj+lmRUSb+MndGNGmCOAVbuc/mpcv4mWsJDB2Y8RvTwA9PL7d92ye3peDuG9W6LwWspRSSnUqUVI5Db8tRCvjpcAXc8l+FtPEzgc2kzPGN3Qsm5+kQvlCqQkd7UiWH4W+JCBswepE4oPvnkGKSqpEfGLrpLM5sxRbDG3yoPLPmr6zcxryVw2B9upWF+updIan8knQjycyjimRY14n5gIZn/9dPFYmsmtdLCFs76ctX4mi4poC26FuOis/HqSM4xzVpaYEnbxv58dOF8IFTSMqUxL+MzRtUcaqYTQCKHtuDM+kUuT8imbwvjoL1E3u+JW6R4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tcXrbgC1Gjf4jL4liyrzpmID4leohe3uTsIvqzAtqr8=;
 b=fECGY38KPAI31h5eL5s8KwNnSwAXPN9r8JI4zOH1SfmE7vCjEqnfvKPdmRoJ85/A6djYQFR3WccH389w5XRvs0au4+PyN7tw9pdTDQh7o2joKh8IwiJQLMqiqzbu+g/w33TkGbLX4Cy/q3mokyF4Hvb8rAcrXHLbnQEqw/pseSccpJrU0Qql5Bs1uBIaRAxmjmkoW9yEap8ievS93bQTXf1lJuByLGbWRBUqT7ZFTuXHDCUw0MWeX2pm5xrtq81dk3K5vPQmrQCjrohfL60vCDE+81SASs7QU7p1kFd+7bMJcbaib8DmpgHmbV/zg3yqOfxeJQxePOB1KebGrgUv5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tcXrbgC1Gjf4jL4liyrzpmID4leohe3uTsIvqzAtqr8=;
 b=HKs9rj5M/An+mOifudHks+nwWvGFTo1nVhhxFUOHVV4fqQmXDuDgVVLaplLeHRrzXYeqx3jCrkE34roxKJj7aaNClXpMumYYsbvsJbIBPu3FeoQTk5JCpS+s+61vCI56RmvK7IOEHeiTn684zAyPc03SVXd0u2pX8+YDRIKylBDdvEYjNeYUeudInCj05VBVk1t9+F79p7uzXyZKeOEPryP9UfnV8h2bPL6O/t7NM9SalGmcIPyRhTLwOzlz734HpSIEky4do3PDLycsNm94zJlAJyLyZSOh988yO2dLIN6fDCaYhojxPPQeUnNHgqHYIAHfgG0kMCtHSvXN4ZEpqQ==
Received: from SJ0PR03CA0014.namprd03.prod.outlook.com (2603:10b6:a03:33a::19)
 by BLAPR10MB4994.namprd10.prod.outlook.com (2603:10b6:208:30d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.12; Tue, 23 Jun
 2026 15:05:54 +0000
Received: from SJ5PEPF00000207.namprd05.prod.outlook.com
 (2603:10b6:a03:33a:cafe::4) by SJ0PR03CA0014.outlook.office365.com
 (2603:10b6:a03:33a::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.12 via Frontend Transport; Tue,
 23 Jun 2026 15:05:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF00000207.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Tue, 23 Jun 2026 15:05:51 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 23 Jun
 2026 10:05:26 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 23 Jun
 2026 10:05:26 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 23 Jun 2026 10:05:26 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65NF5Q883120438;
	Tue, 23 Jun 2026 10:05:26 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 62017138B5A; Tue, 23 Jun 2026 10:05:26 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: <a-christidis@ti.com>
CC: <reatmon@ti.com>, <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master/wrynose][PATH v3 0/2] mesa-pvr v24 -> v25
Date: Tue, 23 Jun 2026 10:05:26 -0500
Message-ID: <20260623150526.378541-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260623150317.1127756-1-a-christidis@ti.com>
References: <20260623150317.1127756-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000207:EE_|BLAPR10MB4994:EE_
X-MS-Office365-Filtering-Correlation-Id: 798fe405-06e0-450d-141c-08ded138eaba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|36860700016|376014|82310400026|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	yJikRaQUfEnY0LSt6M99zRR7knYdHjtgMkfBPaY6QE077Q0cd/t/likhTJXvTCiBYP1bsqSl6/4HFTrrW7IVR7eUSNYr3mcZdWsoSJ4ZrLHtJoSmmX0VMOOBCzsYPtbnzWfDBWkaJWVVxcL/GktEWR98GLI30YPRjMZgA2mj8TnU/TWrvUx034iEbjWq8CQbnmW5ZrHnrkWucdVl5edQdEZ3ggGe7EbSfbwjsyCU9V4rcfVUDZZ3W+u0OFOsK7WIPyVNMV95qO9Uxb3hrvsKEDtdrMjswgV2rko2i18gpBgNyHxxf4X5CNbv+1af+QaLOOnFHy0Qrs1WbtriRZ5wqd+b/UTd+OMTQKFNaW9EFjOPNBvaWwDx/zeD7JejriimSZr0e3hZm/OBom9t0R3/LgfDn+3+OjX2H/3Abvr2lhygLqajsCsphvjFcGpT8R5yh0o9SKJkRZT8qFAILXq/ChfTo3mjBlYPfgxM05aSgwameidxlg7lG7n+pS7FEfd5apqXndBByRo1nu9t6le1nNHnAKKLDPqg6fgRaQ6ZHYKiiqcS4M89XY+Lo41U/p+vptXY01XlF3ulXedjn92Xq+NRRNI1UM2fiCs27bVjDBgoqtre5KBWLzCZqqgbykOSwIgQmj99kAzmnh0ej8LDVqKyxK8kdIfXYOAjm5CxxONG+Ry+6LuV89lJ49MtXVYYo4KTCGFuxY9GNB/7LBNeJA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(36860700016)(376014)(82310400026)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	xyV+ZOsQDLlgnAN+GoeKIV9Okxbw6dU0xH82KkbeWNfFadQSdIqi72Fy6at5leMONb4xq8GnWrMuKcCpTu9ReWvJ4PoPBI+KZMOXaUNgEkgiu/vh3YamNVZaBdWnqYuFQbcILxRc/txHRGu7atBf+4m9NLcjjw6nx5hwjyEh3s8IkXjvpCj1+7HYaP5ImEGFB495be8Ub0CWz0wVdyWWMsDu5w4is9QM9ABgxdlazDtYDLBIlrTYXgfz81SbiLcJZoT0CN9yYsW8TdOq4vhpr1yAK/hsroScI/JHqtozl2ipauJm9oSfXS4WVZWivUTA/LUUpeSTq3zGeaGwyuksoDB858ysucam78lHWnXjp+hEeU6jDIqsW8ks0+A17HMTrfjjRU4RegVVEm+dfjxvjH0Xv+Njz7NdQyJbrt9YBT9K1dmo8E5W7/XH6+93Omls
X-Exchange-RoutingPolicyChecked: 
	qS8AjlBTV8A2LjMUZS6arnFvKQ3RujF7sgY+Lw5K7byu5uasFDdJCSuwnSlwzHUoEagPVk8T2nGObZFmE+HleILEEzgqXDwLN8kCSjR7O2XpU+DeINBSlAwfSelW44NkSd/A/CvBxyINJXL5SF6IUrT9STrAZlNqzIkEaxlkxx2UND86PCxXq/37mIjW5XXA3SQHraIyEAoLM5IFhJrv8ER17X1A4NfQ4JKsjlMt6mD9uS69eJ97Aau/7PZNGm1SZOkemIda1iJUcJllzREAU041WuvJRW32YgzHBe6hdxKpbXa3rGFvRvdWCvW/XmuGXJRTs9jXs0nd4+FguS7DHQ==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 15:05:51.8326
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 798fe405-06e0-450d-141c-08ded138eaba
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF00000207.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4994
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEyNCBTYWx0ZWRfX63hA9CTxPGDe
 TNd4Oks3hTB/TivQXRAynpVTp4hEWH4ITdypWrwDs/xzeqwyuy3tCROXepH5IPzu4be+4A1z3fm
 X6XrDf0musrt9DR0hi89jJg0GVdoSUE=
X-Authority-Analysis: v=2.4 cv=TbymcxQh c=1 sm=1 tr=0 ts=6a3aa0d4 cx=c_pps
 a=sXMHOUYdw3jg9yHb1uAjMQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=iGHA9ds3AAAA:8 a=e18DjPa9ksrohaVvu1QA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEyNCBTYWx0ZWRfXxN51U8smVzn9
 pWRIROkekmbsKdaxkgS7da9COK13QJOEa1FMn1HB8wZfHHI2HCaHru1bgizZieWgWFwv+LXtT+6
 9pCvLaHv7YNSc5bo04RT2NFVMHwM5v5OMVG1WWGvjUH20C0/evtWwfEe78nV2juoU91InAy4FT5
 5oM53voQAc8czldwT9a7Dm6UsYXzv4oYiOuVHASPwmLYGysVXgHrrVHMWATM9ihDHDVQzlkUUlX
 Ts2baEnpVWHMsfycvB4IrDKWdoIFO8KO5Wa/TKhCM8PdyhWt9UpGD/z2EZYlV0kW7vmRfDGR2sy
 aGcMHmowZrhhOqfVlFiArBw4RAeqhWXaHrP/UOrjuF8N6dZflKohVcQBzL6CxYxKON94BLNwO/+
 1taml0l8qoQS4TXBHTdNKTW7IIvENOoCgxohwqrFftHqUeefnKZxkus2rpHxK5kZUcBrGbBa1Kx
 J9bjRvbbhNEDbhm2TMg==
X-Proofpoint-GUID: 8C1hi0Zy9AdtJv4VBjnvCS0FqimF32B9
X-Proofpoint-ORIG-GUID: 8C1hi0Zy9AdtJv4VBjnvCS0FqimF32B9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230124
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 23 Jun 2026 15:06:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20057

meta-ti / na / 20260623150317.1127756-1-a-christidis

PRC Results: FAIL

=========================================================
  check-yocto-patches: FAIL
=========================================================
Patches
----------------------------------------
FAIL - [meta-ti][master/wrynose][PATCH v3 1/2] mesa-pvr: Add versioned mesa.inc copies from oe-core
    ERROR: Missing License-Update for change in LIC_FILES_CHKSUM. (LICENSE-UPDATE-1)
        patch
    
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887




