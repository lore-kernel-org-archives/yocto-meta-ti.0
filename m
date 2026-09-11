Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7172C88E50
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 13:52:00 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39934.1789134716080088592
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 11 Sep 2026 06:51:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=OLlsHt/a;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=RMxRzbO4;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BCjVcY1982907;
	Fri, 11 Sep 2026 08:51:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=/eizqIbpVrQb7pzaTKYoPb4lsTrw35xZE7bcs+lFD
	2c=; b=OLlsHt/axPgmDzxOSOhbZ3PzIx+blRBGrTsW9KghfquRvVFKTmR2ZMUpZ
	yB+v9EK0uGRjlidnJO72WuNxxOSOVG/TDCf7O6NOpWhbr3y1IJz4sGnBCVfyFSYq
	XBfkv1K0wOOXpEgzzCWGCWYvoRq5W+jywxzG/rUX3F7hZf4CFqOJKfz5YIgsNH6G
	8+A6OSOVvsmXC5yYYqTg6SY/VCQKatHnrbrMcof9vEbUiZ88mu6WuA8ExnsszYex
	Y0HjMXYT1/0J6QnvqyOfzQ+7iMWAr2lTfdvb7KyW8IJZ+dzU9YgegsMjxjrZnijW
	/g1GK8iR9hKpTzBFBV8JgavXbpVCw==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012001.outbound.protection.outlook.com [52.101.48.1])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gkyw9pkf5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Sep 2026 08:51:51 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pYgCjk+57DfFKgUhIOZGmr4MRmbZ+HtdokhDoTeNVrocb4W1FQP/BhTBQPH9YXvEtb0jCh0WQTjFFaFNtR6bJS+IYpyIqPdF956oxblBwpDB6eJaAj/Wxth4Dbk7WR50UiSdftJ+Z0SHaJYSuDnFxqbgXfQTJJTeqbx7cu2wc8cK9XGDXrT8/q0mWiLtdDou9aZ898fP1mmNKn+dJ4fYlsAvb6cUnLvxQeslgndB4xEoSVjNRBGLWIuEx2H/6HGfGcNX+iM2nIO+jrtmAOvDjSoXq1xuBMWDTf4ykiW3wwAJk3I0Mi2H7Dnkcr/ve5AughSNzpCNENQtranHpyXg/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/eizqIbpVrQb7pzaTKYoPb4lsTrw35xZE7bcs+lFD2c=;
 b=YAEmCZ/MCPK6Hl7dCfk9fIUhIYqu8MQtktF0d+3U5HjXh04O/GYfMSPbWclwwhMMzn/FnjXrDfUsX8KqCjtpnD/zkbQofk5N9NLm2glHE+nZp0fnYAxZ+2OzTK2TgQhMusenZQlx2rYpXjzc/63qKRtzf9yIfcZRzmunYGCdjAJI6WLfJUuI5a/pNTyMrjmIN3cyv944EUw9Hz8TrD0jUW5Fu6JfjxIxM4GAvsfkyd0A5mOzQuY7cV5U3LShsdVsrtL1IBntvTbDznZaOtQ+hr8COP4XHIwqa7kilpLoQhLsM2VJOC468anWyErE6fy45vlIcZn1iY8nHlqJE4SgtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/eizqIbpVrQb7pzaTKYoPb4lsTrw35xZE7bcs+lFD2c=;
 b=RMxRzbO4DpZq4SPvHGPte5IFdXMWOAB9WOxGj6UIJ5TjD3qbYCQ/X0gC3+sHiBMq8AmMrOkZQAL1d9C+64tRWn/8KPLET3Nw8y8dR1zJekTsoler9ty7qf5hiAGKGNX5gd1drPFmrrNgs5vh0ncjf6hJnlwlRzPTx2X0SdKj0O0=
Received: from SJ0PR03CA0219.namprd03.prod.outlook.com (2603:10b6:a03:39f::14)
 by PH0PR10MB4501.namprd10.prod.outlook.com (2603:10b6:510:43::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.7; Fri, 11 Sep
 2026 13:51:47 +0000
Received: from SJ5PEPF000001CE.namprd05.prod.outlook.com
 (2603:10b6:a03:39f:cafe::76) by SJ0PR03CA0219.outlook.office365.com
 (2603:10b6:a03:39f::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.10 via Frontend Transport; Fri,
 11 Sep 2026 13:51:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001CE.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Fri, 11 Sep 2026 13:51:46 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 11 Sep
 2026 08:51:44 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 11 Sep
 2026 08:51:44 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 11 Sep 2026 08:51:44 -0500
Received: from [10.249.66.148] ([10.249.66.148])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68BDph5N1203254;
	Fri, 11 Sep 2026 08:51:43 -0500
Message-ID: <9ad6b10c-2e5a-48da-90b8-0667331e7b14@ti.com>
Date: Fri, 11 Sep 2026 08:51:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH v2 1/5] u-boot-ti-staging: Fixes for
 OpenSSL 4.0
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20260910015454.2933250-1-reatmon@ti.com>
 <20260910181307.GT19759@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260910181307.GT19759@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CE:EE_|PH0PR10MB4501:EE_
X-MS-Office365-Filtering-Correlation-Id: 367fba3c-0ac3-4125-5363-08df100bd255
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|376014|36860700016|82310400026|13003099007|6133799003|3023799007|10067099003|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	TKuVT9fkIthVlYCTX00FlcHOXR+/JUfqL0ofcRTEaazCO4KeDF2mXUWvHEdjX2F+zI5Qzva2S7H61f9ru0AMV7tybZwmSKBAzxmb3114QmF7wo0OBbDrbD86UojC8ebVimRSmwCU11IEEg/aCynInpJG2EafrtjJpW6PR66F6XyH3N7amLYbt7gvTlkx1ACf/1pOrgsiUsUgjlZDY/tUq+H0prn6cRf/30RjxrGB7SSzJ4IjMJDO6AmoWkxynZwaOvqt+WFhH1Dq5wE7J5ffSUvFd1ILvdTphE8vGPZ/VYdAp8FcZenxS4Ivgoi6GhD1sRBADDHSvo6OXS0ijWrDPiwzbZ1WCkumzodIRn7yrvPpIQmiqu1Bw4BqMyJkRQi1l7NYen1+jTHfIAsLowM1ovSsuMBUbFaF5NqRtarl9LupRla1Q8aqJ8r6IOrity9adFFIm+j5gZjIUXFshtgZTSXNdCsR1hvqwUUOkbdiKmo2TIsHZgvT7zQ47G8orM6TGGu8G0z8Dp64MtJp6qRW2i1RmppNqJ2/uyLi0cs1JS8lvHBGenVuZL1y5DzRDQQQ3k7GWZcNhiT5AmOjfaO11/PZQ670OsnO84hRgNjC8LwTn36E2DAgpnEsT4563Kv5RKoY0oyAJFm9zui+AMXTJg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(36860700016)(82310400026)(13003099007)(6133799003)(3023799007)(10067099003)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	sT4+ABNbA6huZODU6U5xVgDzOdftUR1K+9A9VUPzrTnQeJnM2TqodjQOIMQiabiieiDOaIMkGcUpbwS4dDmLdR7a3Xwx7e+S7k33NcI3XkW/W6Ob10zli2Ex21qhdSmxL90Lt3dKYzjVo+a3HKUG8vtthcaVxibWrHZZidiDIFEWtg0VVbqbUK53ErrJtoCB24SG69e54Cmsw2X+qYYGAuE9zgdILlvk7AyW2hG4kFYYkNUP3VbduelogLCY7K49ae0PemTPwgYSwgHqaaga87A+61NfNKTR9Yg8UwenDBxK8kU3L7jsHlSnrqxO35+FlqH+kU85lifiOfNkY0u72aoX9v5RNSH6N1b/C00RWehVaipPHHZY6//HF9cWwH15bX1Wm2zGdXKlFtuIoukXtrvgBVk0RcN6th0kjl9LP0dxB/YJk9cn0lA9Tgh3fw9E
X-Exchange-RoutingPolicyChecked: 
	EATnx+4UIn77xRW8T9YBBDfzsNE18/P+spM0dz84a5iloy1mLkHLJ4ybAq8GzKJ2NAQpEaIM14ZNf5jXaNgn+L9AigCfFI1SG720sD9/0khLj2hIydHQ1vIJnFH3pIMoTsvE4fLGfxkJRUlP3uRvFS5kFatB1b0IbcgpjFvhTeqErR/kXa1E08yHzPOfjhCw1tZWZsp0qypenBUwIAKhGXuaRzqjDhvG5uD7TtD82k92QlGLYG9ora8I9ZSdD0hLfCynbEQZjSNDd/CuL+H6OsG7a9kOm93Csi7m1wqOdHRThJBR5uj6IQsU84zyuH1sUnFdGuiwdey6BgXmUXjZxg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 13:51:46.8108
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 367fba3c-0ac3-4125-5363-08df100bd255
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001CE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4501
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE5NCBTYWx0ZWRfX5f/Om6A+Boep
 CNybZFf+nVN7VQGKdyWJUidkW5MTZ58HBCXfV1JTWECTgfUVdj2lkxxitJX6QATwUIIgLOk0Ink
 zZ1sHUpJiLRA7KmP6O6OiOCxFhQ2RX0=
X-Authority-Analysis: v=2.4 cv=ON6yTiaB c=1 sm=1 tr=0 ts=6aa40777 cx=c_pps
 a=qHyJGWWDR7+eWeZXJqH6eg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=Q4-j1AaZAAAA:8
 a=iGHA9ds3AAAA:8 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8
 a=sozttTNsAAAA:8 a=ptNznvi-AAAA:8 a=zD9w2t6x5acdA8mNODcA:9 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=__MQohX_fo54y4GeBRKl:22
X-Proofpoint-GUID: UTev3FBoXFW3OjVK2J5wt2lalqdNG0Yp
X-Proofpoint-ORIG-GUID: UTev3FBoXFW3OjVK2J5wt2lalqdNG0Yp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE5NCBTYWx0ZWRfX/9afq7l9/Yul
 xbB6XgRrN9Vw7oIIN5vbDbVr+8eUz1ny3OWX0lPrhRqhoCTqReGb/Di8PJWYuQOd5roONaMDL7p
 haF9VtVf+zwYvr03eWuwfwlWgbQWfV7AIrsq261LnUNZIMieYN1/3KO7ts8S3Gjs/rrnRU3WnQy
 9jX2HqUNCOJIZ76s5grsd6FCHeIds2/5myaB9Mpe7jeglfzDeL9rLRez2D57Oz3cB/9owREehvi
 b8mBVipvXc0QrtuyTazXAimgEaj2Uvj4F4qi6pkxFQblcyBPTn7LzduGGftVc95NVx6KRC3/iCo
 VMzaQWm4CvvtZP28Yh8rjLHdPd4IvcmOnROna1AjQUWKWRgsCJ2jLh8ehqjgG7W43Tf3JRkygo+
 BIKOH89uimE/TfRX15hhPslIPkg2kPX0yhXe51R7vVKprZ+TMFUYUSJOHWPinLGUaAtC9OpAStl
 HSagaohzJrUlZfy0ELQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110194
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 11 Sep 2026 13:52:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20371



On 9/10/2026 1:13 PM, Denys Dmytriyenko wrote:
> On Wed, Sep 09, 2026 at 08:54:48PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>> With the recent move to OpenSSL 4.0 [1] we need to update the same code
>> in the various u-boot versions that we support.
>>
>> [1] https://git.openembedded.org/openembedded-core/commit/?id=20bf704e5809e95036b998f0f45145cf7205b05b
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>> v2; No change.
>>
>>   ...ort-for-OpenSSL-Provider-API-2024-04.patch | 300 ++++++++++++++++
>>   ...ort-for-OpenSSL-Provider-API-2025-01.patch | 300 ++++++++++++++++
>>   ...ort-for-OpenSSL-Provider-API-2026-01.patch | 340 ++++++++++++++++++
>>   .../u-boot/u-boot-ti-staging_2024.04.bb       |   6 +-
>>   .../u-boot/u-boot-ti-staging_2025.01.bb       |   1 +
>>   .../u-boot/u-boot-ti-staging_2026.01.bb       |   2 +
>>   meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc  |   1 +
>>   7 files changed, 948 insertions(+), 2 deletions(-)
>>   create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API-2024-04.patch
>>   create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API-2025-01.patch
>>   create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API-2026-01.patch
> 
> For the old U-Boot versions, instead of massaging the patch heavily and
> carrying multiple copies of it, should we just use the workaraound, like
> meta-arm[1] does? And 2026.10 will have this fixed upstream...
> 
> https://patchwork.yoctoproject.org/project/arm/patch/20260909180341.3858400-1-ross.burton@arm.com/

Didn't know that was an option.  Well, the patches have already passed 
CICD and made it to master, so if this is better then I can send another 
patch with this approach.  I'll test things out and see.

> 
>> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API-2024-04.patch b/meta-ti-bsp/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API-2024-04.patch
>> new file mode 100644
>> index 00000000..9f67644b
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API-2024-04.patch
>> @@ -0,0 +1,300 @@
>> +From 401c19f6b0a7c63afad92e9d3f2cbb75d6ed8566 Mon Sep 17 00:00:00 2001
>> +From: Ryan Eatmon <reatmon@ti.com>
>> +Date: Wed, 9 Sep 2026 10:04:50 -0500
>> +Subject: [PATCH] Add support for OpenSSL Provider API
>> +
>> +Backport from 2026.01 patch [1] by Ryan Eatmon <reatmon@ti.com>
>> +
>> +Upsatream-Status: Inappropriate [OE-specific]
>> +
>> +The Engine API has been deprecated since the release of OpenSSL 3.0. End
>> +users have been advised to migrate to the new Provider interface.
>> +Several distributions have already removed support for engines, which is
>> +preventing U-Boot from being compiled in those environments.
>> +
>> +Add support for the Provider API while continuing to support the existing
>> +Engine API on distros shipping older releases of OpenSSL.
>> +
>> +This is based on similar work contributed by Jan Stancek updating Linux
>> +to use the Provider interface.
>> +
>> +    commit 558bdc45dfb2669e1741384a0c80be9c82fa052c
>> +    Author: Jan Stancek <jstancek@redhat.com>
>> +    Date:   Fri Sep 20 19:52:48 2024 +0300
>> +
>> +        sign-file,extract-cert: use pkcs11 provider for OPENSSL MAJOR >= 3
>> +
>> +The changes have been tested with the FIT signature verification vboot
>> +tests on Fedora 42 and Debian 13. All 30 tests pass with both the legacy
>> +Engine library installed and with the Provider API.
>> +
>> +Signed-off-by: Eddie Kovsky <ewk@edkovsky.org>
>> +
>> +Upstream-Status: Submitted [https://lore.kernel.org/u-boot/20260429180247.83091-1-ekovsky@redhat.com/]
>> +
>> +Note: Modified to make pkcs11 provider loading optional. The upstream
>> +patch unconditionally requires the pkcs11 provider, which is not
>> +available in the OE build environment. File-based key signing only needs
>> +the default provider; pkcs11 is only required for pkcs11: URI keys.
>> +Changes from upstream:
>> + - Load default provider first (was pkcs11 first)
>> + - Make pkcs11 provider load failure non-fatal (ERR_clear_error instead
>> +   of ERR(1, ...) which calls errx/abort)
>> +
>> +Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
>> +
>> +Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> +---
>> + lib/aes/aes-encrypt.c |  4 +-
>> + lib/rsa/rsa-sign.c    | 95 ++++++++++++++++++++++++++++++++++++++++++-
>> + 2 files changed, 97 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/lib/aes/aes-encrypt.c b/lib/aes/aes-encrypt.c
>> +index e74e35eaa28..8a6f7715df9 100644
>> +--- a/lib/aes/aes-encrypt.c
>> ++++ b/lib/aes/aes-encrypt.c
>> +@@ -16,7 +16,9 @@
>> + #include <openssl/err.h>
>> + #include <openssl/ssl.h>
>> + #include <openssl/evp.h>
>> +-#include <openssl/engine.h>
>> ++#if !defined(OPENSSL_NO_ENGINE) && !defined(OPENSSL_NO_DEPRECATED_3_0)
>> ++# include <openssl/engine.h>
>> ++#endif
>> + #include <uboot_aes.h>
>> +
>> + #if OPENSSL_VERSION_NUMBER >= 0x10000000L
>> +diff --git a/lib/rsa/rsa-sign.c b/lib/rsa/rsa-sign.c
>> +index 2304030e32f..29b3bd3dbb1 100644
>> +--- a/lib/rsa/rsa-sign.c
>> ++++ b/lib/rsa/rsa-sign.c
>> +@@ -19,7 +19,47 @@
>> + #include <openssl/err.h>
>> + #include <openssl/ssl.h>
>> + #include <openssl/evp.h>
>> +-#include <openssl/engine.h>
>> ++#if OPENSSL_VERSION_MAJOR >= 3
>> ++# define USE_PKCS11_PROVIDER
>> ++# include <err.h>
>> ++# include <openssl/provider.h>
>> ++# include <openssl/store.h>
>> ++#else
>> ++# if !defined(OPENSSL_NO_ENGINE) && !defined(OPENSSL_NO_DEPRECATED_3_0)
>> ++#  define USE_PKCS11_ENGINE
>> ++#  include <openssl/engine.h>
>> ++# endif
>> ++#endif
>> ++
>> ++#ifdef USE_PKCS11_PROVIDER
>> ++#define ERR(cond, fmt, ...)				\
>> ++	do {						\
>> ++		bool __cond = (cond);			\
>> ++		drain_openssl_errors(__LINE__, 0);	\
>> ++		if (__cond) {				\
>> ++			errx(1, fmt, ## __VA_ARGS__);	\
>> ++		}					\
>> ++	} while (0)
>> ++
>> ++static void drain_openssl_errors(int l, int silent)
>> ++{
>> ++	const char *file;
>> ++	char buf[120];
>> ++	int e, line;
>> ++
>> ++	if (ERR_peek_error() == 0)
>> ++		return;
>> ++	if (!silent)
>> ++		fprintf(stderr, "At main.c:%d:\n", l);
>> ++
>> ++	while ((e = ERR_peek_error_line(&file, &line))) {
>> ++		ERR_error_string(e, buf);
>> ++		if (!silent)
>> ++			fprintf(stderr, "- SSL %s: %s:%d\n", buf, file, line);
>> ++		ERR_get_error();
>> ++	}
>> ++}
>> ++#endif
>> +
>> + static int rsa_err(const char *msg)
>> + {
>> +@@ -98,6 +138,7 @@ err_cert:
>> +  * @evpp	Returns EVP_PKEY object, or NULL on failure
>> +  * Return: 0 if ok, -ve on error (in which case *evpp will be set to NULL)
>> +  */
>> ++#ifdef USE_PKCS11_ENGINE
>> + static int rsa_engine_get_pub_key(const char *keydir, const char *name,
>> + 				  ENGINE *engine, EVP_PKEY **evpp)
>> + {
>> +@@ -157,6 +198,7 @@ static int rsa_engine_get_pub_key(const char *keydir, const char *name,
>> +
>> + 	return 0;
>> + }
>> ++#endif
>> +
>> + /**
>> +  * rsa_get_pub_key() - read a public key
>> +@@ -170,8 +212,10 @@ static int rsa_engine_get_pub_key(const char *keydir, const char *name,
>> + static int rsa_get_pub_key(const char *keydir, const char *name,
>> + 			   ENGINE *engine, EVP_PKEY **evpp)
>> + {
>> ++#ifdef USE_PKCS11_ENGINE
>> + 	if (engine)
>> + 		return rsa_engine_get_pub_key(keydir, name, engine, evpp);
>> ++#endif
>> + 	return rsa_pem_get_pub_key(keydir, name, evpp);
>> + }
>> +
>> +@@ -207,6 +251,38 @@ static int rsa_pem_get_priv_key(const char *keydir, const char *name,
>> + 		return -ENOENT;
>> + 	}
>> +
>> ++#ifdef USE_PKCS11_PROVIDER
>> ++	EVP_PKEY *private_key = NULL;
>> ++	OSSL_STORE_CTX *store;
>> ++
>> ++	if (!OSSL_PROVIDER_try_load(NULL, "default", true))
>> ++		ERR(1, "OSSL_PROVIDER_try_load(default)");
>> ++	/* pkcs11 provider is optional; only needed for pkcs11: URIs */
>> ++	if (!OSSL_PROVIDER_try_load(NULL, "pkcs11", true))
>> ++		ERR_clear_error();
>> ++
>> ++	store = OSSL_STORE_open(path, NULL, NULL, NULL, NULL);
>> ++	ERR(!store, "OSSL_STORE_open");
>> ++
>> ++	while (!OSSL_STORE_eof(store)) {
>> ++		OSSL_STORE_INFO *info = OSSL_STORE_load(store);
>> ++
>> ++		if (!info) {
>> ++			drain_openssl_errors(__LINE__, 0);
>> ++			continue;
>> ++		}
>> ++		if (OSSL_STORE_INFO_get_type(info) == OSSL_STORE_INFO_PKEY) {
>> ++			private_key = OSSL_STORE_INFO_get1_PKEY(info);
>> ++			ERR(!private_key, "OSSL_STORE_INFO_get1_PKEY");
>> ++		}
>> ++		OSSL_STORE_INFO_free(info);
>> ++		if (private_key)
>> ++			break;
>> ++	}
>> ++	OSSL_STORE_close(store);
>> ++
>> ++	*evpp = private_key;
>> ++#else
>> + 	if (!PEM_read_PrivateKey(f, evpp, NULL, path)) {
>> + 		rsa_err("Failure reading private key");
>> + 		fclose(f);
>> +@@ -214,6 +290,7 @@ static int rsa_pem_get_priv_key(const char *keydir, const char *name,
>> + 	}
>> + 	fclose(f);
>> +
>> ++#endif
>> + 	return 0;
>> + }
>> +
>> +@@ -226,6 +303,7 @@ static int rsa_pem_get_priv_key(const char *keydir, const char *name,
>> +  * @evpp	Returns EVP_PKEY object, or NULL on failure
>> +  * Return: 0 if ok, -ve on error (in which case *evpp will be set to NULL)
>> +  */
>> ++#ifdef USE_PKCS11_ENGINE
>> + static int rsa_engine_get_priv_key(const char *keydir, const char *name,
>> + 				   const char *keyfile,
>> + 				   ENGINE *engine, EVP_PKEY **evpp)
>> +@@ -293,6 +371,7 @@ static int rsa_engine_get_priv_key(const char *keydir, const char *name,
>> +
>> + 	return 0;
>> + }
>> ++#endif
>> +
>> + /**
>> +  * rsa_get_priv_key() - read a private key
>> +@@ -306,9 +385,11 @@ static int rsa_engine_get_priv_key(const char *keydir, const char *name,
>> + static int rsa_get_priv_key(const char *keydir, const char *name,
>> + 			    const char *keyfile, ENGINE *engine, EVP_PKEY **evpp)
>> + {
>> ++#ifdef USE_PKCS11_ENGINE
>> + 	if (engine)
>> + 		return rsa_engine_get_priv_key(keydir, name, keyfile, engine,
>> + 					       evpp);
>> ++#endif
>> + 	return rsa_pem_get_priv_key(keydir, name, keyfile, evpp);
>> + }
>> +
>> +@@ -325,6 +406,7 @@ static int rsa_init(void)
>> + 	return 0;
>> + }
>> +
>> ++#ifdef USE_PKCS11_ENGINE
>> + static int rsa_engine_init(const char *engine_id, ENGINE **pe)
>> + {
>> + 	const char *key_pass;
>> +@@ -372,6 +454,7 @@ err_engine_init:
>> + 	ENGINE_free(e);
>> + 	return ret;
>> + }
>> ++#endif
>> +
>> + static void rsa_engine_remove(ENGINE *e)
>> + {
>> +@@ -471,11 +554,13 @@ int rsa_sign(struct image_sign_info *info,
>> + 	if (ret)
>> + 		return ret;
>> +
>> ++#ifdef USE_PKCS11_ENGINE
>> + 	if (info->engine_id) {
>> + 		ret = rsa_engine_init(info->engine_id, &e);
>> + 		if (ret)
>> + 			return ret;
>> + 	}
>> ++#endif
>> +
>> + 	ret = rsa_get_priv_key(info->keydir, info->keyname, info->keyfile,
>> + 			       e, &pkey);
>> +@@ -487,16 +572,20 @@ int rsa_sign(struct image_sign_info *info,
>> + 		goto err_sign;
>> +
>> + 	EVP_PKEY_free(pkey);
>> ++#ifdef USE_PKCS11_ENGINE
>> + 	if (info->engine_id)
>> + 		rsa_engine_remove(e);
>> ++#endif
>> +
>> + 	return ret;
>> +
>> + err_sign:
>> + 	EVP_PKEY_free(pkey);
>> + err_priv:
>> ++#ifdef USE_PKCS11_ENGINE
>> + 	if (info->engine_id)
>> + 		rsa_engine_remove(e);
>> ++#endif
>> + 	return ret;
>> + }
>> +
>> +@@ -636,11 +725,13 @@ int rsa_add_verify_data(struct image_sign_info *info, void *keydest)
>> + 	ENGINE *e = NULL;
>> +
>> + 	debug("%s: Getting verification data\n", __func__);
>> ++#ifdef USE_PKCS11_ENGINE
>> + 	if (info->engine_id) {
>> + 		ret = rsa_engine_init(info->engine_id, &e);
>> + 		if (ret)
>> + 			return ret;
>> + 	}
>> ++#endif
>> + 	ret = rsa_get_pub_key(info->keydir, info->keyname, e, &pkey);
>> + 	if (ret)
>> + 		goto err_get_pub_key;
>> +@@ -717,8 +808,10 @@ done:
>> + err_get_params:
>> + 	EVP_PKEY_free(pkey);
>> + err_get_pub_key:
>> ++#ifdef USE_PKCS11_ENGINE
>> + 	if (info->engine_id)
>> + 		rsa_engine_remove(e);
>> ++#endif
>> +
>> + 	if (ret)
>> + 		return ret;
>> +--
>> +2.43.0
>> +
>> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API-2025-01.patch b/meta-ti-bsp/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API-2025-01.patch
>> new file mode 100644
>> index 00000000..c5f3655e
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API-2025-01.patch
>> @@ -0,0 +1,300 @@
>> +From 0525693750b1b7a8fb7228dbb97bf592a21322fc Mon Sep 17 00:00:00 2001
>> +From: Ryan Eatmon <reatmon@ti.com>
>> +Date: Wed, 9 Sep 2026 10:04:50 -0500
>> +Subject: [PATCH] Add support for OpenSSL Provider API
>> +
>> +Backport from 2026.01 patch [1] by Ryan Eatmon <reatmon@ti.com>
>> +
>> +Upsatream-Status: Inappropriate [OE-specific]
>> +
>> +The Engine API has been deprecated since the release of OpenSSL 3.0. End
>> +users have been advised to migrate to the new Provider interface.
>> +Several distributions have already removed support for engines, which is
>> +preventing U-Boot from being compiled in those environments.
>> +
>> +Add support for the Provider API while continuing to support the existing
>> +Engine API on distros shipping older releases of OpenSSL.
>> +
>> +This is based on similar work contributed by Jan Stancek updating Linux
>> +to use the Provider interface.
>> +
>> +    commit 558bdc45dfb2669e1741384a0c80be9c82fa052c
>> +    Author: Jan Stancek <jstancek@redhat.com>
>> +    Date:   Fri Sep 20 19:52:48 2024 +0300
>> +
>> +        sign-file,extract-cert: use pkcs11 provider for OPENSSL MAJOR >= 3
>> +
>> +The changes have been tested with the FIT signature verification vboot
>> +tests on Fedora 42 and Debian 13. All 30 tests pass with both the legacy
>> +Engine library installed and with the Provider API.
>> +
>> +Signed-off-by: Eddie Kovsky <ewk@edkovsky.org>
>> +
>> +Upstream-Status: Submitted [https://lore.kernel.org/u-boot/20260429180247.83091-1-ekovsky@redhat.com/]
>> +
>> +Note: Modified to make pkcs11 provider loading optional. The upstream
>> +patch unconditionally requires the pkcs11 provider, which is not
>> +available in the OE build environment. File-based key signing only needs
>> +the default provider; pkcs11 is only required for pkcs11: URI keys.
>> +Changes from upstream:
>> + - Load default provider first (was pkcs11 first)
>> + - Make pkcs11 provider load failure non-fatal (ERR_clear_error instead
>> +   of ERR(1, ...) which calls errx/abort)
>> +
>> +Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
>> +
>> +Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> +---
>> + lib/aes/aes-encrypt.c |  4 +-
>> + lib/rsa/rsa-sign.c    | 95 ++++++++++++++++++++++++++++++++++++++++++-
>> + 2 files changed, 97 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/lib/aes/aes-encrypt.c b/lib/aes/aes-encrypt.c
>> +index e74e35eaa28..8a6f7715df9 100644
>> +--- a/lib/aes/aes-encrypt.c
>> ++++ b/lib/aes/aes-encrypt.c
>> +@@ -16,7 +16,9 @@
>> + #include <openssl/err.h>
>> + #include <openssl/ssl.h>
>> + #include <openssl/evp.h>
>> +-#include <openssl/engine.h>
>> ++#if !defined(OPENSSL_NO_ENGINE) && !defined(OPENSSL_NO_DEPRECATED_3_0)
>> ++# include <openssl/engine.h>
>> ++#endif
>> + #include <uboot_aes.h>
>> +
>> + #if OPENSSL_VERSION_NUMBER >= 0x10000000L
>> +diff --git a/lib/rsa/rsa-sign.c b/lib/rsa/rsa-sign.c
>> +index fa9e143b4ca..af5b18e0c95 100644
>> +--- a/lib/rsa/rsa-sign.c
>> ++++ b/lib/rsa/rsa-sign.c
>> +@@ -19,7 +19,47 @@
>> + #include <openssl/err.h>
>> + #include <openssl/ssl.h>
>> + #include <openssl/evp.h>
>> +-#include <openssl/engine.h>
>> ++#if OPENSSL_VERSION_MAJOR >= 3
>> ++# define USE_PKCS11_PROVIDER
>> ++# include <err.h>
>> ++# include <openssl/provider.h>
>> ++# include <openssl/store.h>
>> ++#else
>> ++# if !defined(OPENSSL_NO_ENGINE) && !defined(OPENSSL_NO_DEPRECATED_3_0)
>> ++#  define USE_PKCS11_ENGINE
>> ++#  include <openssl/engine.h>
>> ++# endif
>> ++#endif
>> ++
>> ++#ifdef USE_PKCS11_PROVIDER
>> ++#define ERR(cond, fmt, ...)				\
>> ++	do {						\
>> ++		bool __cond = (cond);			\
>> ++		drain_openssl_errors(__LINE__, 0);	\
>> ++		if (__cond) {				\
>> ++			errx(1, fmt, ## __VA_ARGS__);	\
>> ++		}					\
>> ++	} while (0)
>> ++
>> ++static void drain_openssl_errors(int l, int silent)
>> ++{
>> ++	const char *file;
>> ++	char buf[120];
>> ++	int e, line;
>> ++
>> ++	if (ERR_peek_error() == 0)
>> ++		return;
>> ++	if (!silent)
>> ++		fprintf(stderr, "At main.c:%d:\n", l);
>> ++
>> ++	while ((e = ERR_peek_error_line(&file, &line))) {
>> ++		ERR_error_string(e, buf);
>> ++		if (!silent)
>> ++			fprintf(stderr, "- SSL %s: %s:%d\n", buf, file, line);
>> ++		ERR_get_error();
>> ++	}
>> ++}
>> ++#endif
>> +
>> + static int rsa_err(const char *msg)
>> + {
>> +@@ -98,6 +138,7 @@ err_cert:
>> +  * @evpp	Returns EVP_PKEY object, or NULL on failure
>> +  * Return: 0 if ok, -ve on error (in which case *evpp will be set to NULL)
>> +  */
>> ++#ifdef USE_PKCS11_ENGINE
>> + static int rsa_engine_get_pub_key(const char *keydir, const char *name,
>> + 				  ENGINE *engine, EVP_PKEY **evpp)
>> + {
>> +@@ -157,6 +198,7 @@ static int rsa_engine_get_pub_key(const char *keydir, const char *name,
>> +
>> + 	return 0;
>> + }
>> ++#endif
>> +
>> + /**
>> +  * rsa_get_pub_key() - read a public key
>> +@@ -170,8 +212,10 @@ static int rsa_engine_get_pub_key(const char *keydir, const char *name,
>> + static int rsa_get_pub_key(const char *keydir, const char *name,
>> + 			   ENGINE *engine, EVP_PKEY **evpp)
>> + {
>> ++#ifdef USE_PKCS11_ENGINE
>> + 	if (engine)
>> + 		return rsa_engine_get_pub_key(keydir, name, engine, evpp);
>> ++#endif
>> + 	return rsa_pem_get_pub_key(keydir, name, evpp);
>> + }
>> +
>> +@@ -207,6 +251,38 @@ static int rsa_pem_get_priv_key(const char *keydir, const char *name,
>> + 		return -ENOENT;
>> + 	}
>> +
>> ++#ifdef USE_PKCS11_PROVIDER
>> ++	EVP_PKEY *private_key = NULL;
>> ++	OSSL_STORE_CTX *store;
>> ++
>> ++	if (!OSSL_PROVIDER_try_load(NULL, "default", true))
>> ++		ERR(1, "OSSL_PROVIDER_try_load(default)");
>> ++	/* pkcs11 provider is optional; only needed for pkcs11: URIs */
>> ++	if (!OSSL_PROVIDER_try_load(NULL, "pkcs11", true))
>> ++		ERR_clear_error();
>> ++
>> ++	store = OSSL_STORE_open(path, NULL, NULL, NULL, NULL);
>> ++	ERR(!store, "OSSL_STORE_open");
>> ++
>> ++	while (!OSSL_STORE_eof(store)) {
>> ++		OSSL_STORE_INFO *info = OSSL_STORE_load(store);
>> ++
>> ++		if (!info) {
>> ++			drain_openssl_errors(__LINE__, 0);
>> ++			continue;
>> ++		}
>> ++		if (OSSL_STORE_INFO_get_type(info) == OSSL_STORE_INFO_PKEY) {
>> ++			private_key = OSSL_STORE_INFO_get1_PKEY(info);
>> ++			ERR(!private_key, "OSSL_STORE_INFO_get1_PKEY");
>> ++		}
>> ++		OSSL_STORE_INFO_free(info);
>> ++		if (private_key)
>> ++			break;
>> ++	}
>> ++	OSSL_STORE_close(store);
>> ++
>> ++	*evpp = private_key;
>> ++#else
>> + 	if (!PEM_read_PrivateKey(f, evpp, NULL, path)) {
>> + 		rsa_err("Failure reading private key");
>> + 		fclose(f);
>> +@@ -214,6 +290,7 @@ static int rsa_pem_get_priv_key(const char *keydir, const char *name,
>> + 	}
>> + 	fclose(f);
>> +
>> ++#endif
>> + 	return 0;
>> + }
>> +
>> +@@ -226,6 +303,7 @@ static int rsa_pem_get_priv_key(const char *keydir, const char *name,
>> +  * @evpp	Returns EVP_PKEY object, or NULL on failure
>> +  * Return: 0 if ok, -ve on error (in which case *evpp will be set to NULL)
>> +  */
>> ++#ifdef USE_PKCS11_ENGINE
>> + static int rsa_engine_get_priv_key(const char *keydir, const char *name,
>> + 				   const char *keyfile,
>> + 				   ENGINE *engine, EVP_PKEY **evpp)
>> +@@ -293,6 +371,7 @@ static int rsa_engine_get_priv_key(const char *keydir, const char *name,
>> +
>> + 	return 0;
>> + }
>> ++#endif
>> +
>> + /**
>> +  * rsa_get_priv_key() - read a private key
>> +@@ -306,9 +385,11 @@ static int rsa_engine_get_priv_key(const char *keydir, const char *name,
>> + static int rsa_get_priv_key(const char *keydir, const char *name,
>> + 			    const char *keyfile, ENGINE *engine, EVP_PKEY **evpp)
>> + {
>> ++#ifdef USE_PKCS11_ENGINE
>> + 	if (engine)
>> + 		return rsa_engine_get_priv_key(keydir, name, keyfile, engine,
>> + 					       evpp);
>> ++#endif
>> + 	return rsa_pem_get_priv_key(keydir, name, keyfile, evpp);
>> + }
>> +
>> +@@ -325,6 +406,7 @@ static int rsa_init(void)
>> + 	return 0;
>> + }
>> +
>> ++#ifdef USE_PKCS11_ENGINE
>> + static int rsa_engine_init(const char *engine_id, ENGINE **pe)
>> + {
>> + 	const char *key_pass;
>> +@@ -372,6 +454,7 @@ err_engine_init:
>> + 	ENGINE_free(e);
>> + 	return ret;
>> + }
>> ++#endif
>> +
>> + static void rsa_engine_remove(ENGINE *e)
>> + {
>> +@@ -480,11 +563,13 @@ int rsa_sign(struct image_sign_info *info,
>> + 	if (ret)
>> + 		return ret;
>> +
>> ++#ifdef USE_PKCS11_ENGINE
>> + 	if (info->engine_id) {
>> + 		ret = rsa_engine_init(info->engine_id, &e);
>> + 		if (ret)
>> + 			return ret;
>> + 	}
>> ++#endif
>> +
>> + 	ret = rsa_get_priv_key(info->keydir, info->keyname, info->keyfile,
>> + 			       e, &pkey);
>> +@@ -496,16 +581,20 @@ int rsa_sign(struct image_sign_info *info,
>> + 		goto err_sign;
>> +
>> + 	EVP_PKEY_free(pkey);
>> ++#ifdef USE_PKCS11_ENGINE
>> + 	if (info->engine_id)
>> + 		rsa_engine_remove(e);
>> ++#endif
>> +
>> + 	return ret;
>> +
>> + err_sign:
>> + 	EVP_PKEY_free(pkey);
>> + err_priv:
>> ++#ifdef USE_PKCS11_ENGINE
>> + 	if (info->engine_id)
>> + 		rsa_engine_remove(e);
>> ++#endif
>> + 	return ret;
>> + }
>> +
>> +@@ -645,11 +734,13 @@ int rsa_add_verify_data(struct image_sign_info *info, void *keydest)
>> + 	ENGINE *e = NULL;
>> +
>> + 	debug("%s: Getting verification data\n", __func__);
>> ++#ifdef USE_PKCS11_ENGINE
>> + 	if (info->engine_id) {
>> + 		ret = rsa_engine_init(info->engine_id, &e);
>> + 		if (ret)
>> + 			return ret;
>> + 	}
>> ++#endif
>> + 	ret = rsa_get_pub_key(info->keydir, info->keyname, e, &pkey);
>> + 	if (ret)
>> + 		goto err_get_pub_key;
>> +@@ -726,8 +817,10 @@ done:
>> + err_get_params:
>> + 	EVP_PKEY_free(pkey);
>> + err_get_pub_key:
>> ++#ifdef USE_PKCS11_ENGINE
>> + 	if (info->engine_id)
>> + 		rsa_engine_remove(e);
>> ++#endif
>> +
>> + 	if (ret)
>> + 		return ret;
>> +--
>> +2.43.0
>> +
>> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API-2026-01.patch b/meta-ti-bsp/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API-2026-01.patch
>> new file mode 100644
>> index 00000000..346d0584
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API-2026-01.patch
>> @@ -0,0 +1,340 @@
>> +From a81cb0932dce109af44d7245d47489fe54ae390f Mon Sep 17 00:00:00 2001
>> +From: Eddie Kovsky <ewk@edkovsky.org>
>> +Date: Mon, 23 Feb 2026 09:43:22 -0700
>> +Subject: [PATCH] Add support for OpenSSL Provider API
>> +
>> +The Engine API has been deprecated since the release of OpenSSL 3.0. End
>> +users have been advised to migrate to the new Provider interface.
>> +Several distributions have already removed support for engines, which is
>> +preventing U-Boot from being compiled in those environments.
>> +
>> +Add support for the Provider API while continuing to support the existing
>> +Engine API on distros shipping older releases of OpenSSL.
>> +
>> +This is based on similar work contributed by Jan Stancek updating Linux
>> +to use the Provider interface.
>> +
>> +    commit 558bdc45dfb2669e1741384a0c80be9c82fa052c
>> +    Author: Jan Stancek <jstancek@redhat.com>
>> +    Date:   Fri Sep 20 19:52:48 2024 +0300
>> +
>> +        sign-file,extract-cert: use pkcs11 provider for OPENSSL MAJOR >= 3
>> +
>> +The changes have been tested with the FIT signature verification vboot
>> +tests on Fedora 42 and Debian 13. All 30 tests pass with both the legacy
>> +Engine library installed and with the Provider API.
>> +
>> +Signed-off-by: Eddie Kovsky <ewk@edkovsky.org>
>> +
>> +Upstream-Status: Submitted [https://lore.kernel.org/u-boot/20260429180247.83091-1-ekovsky@redhat.com/]
>> +
>> +Note: Modified to make pkcs11 provider loading optional. The upstream
>> +patch unconditionally requires the pkcs11 provider, which is not
>> +available in the OE build environment. File-based key signing only needs
>> +the default provider; pkcs11 is only required for pkcs11: URI keys.
>> +Changes from upstream:
>> + - Load default provider first (was pkcs11 first)
>> + - Make pkcs11 provider load failure non-fatal (ERR_clear_error instead
>> +   of ERR(1, ...) which calls errx/abort)
>> +
>> +Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
>> +---
>> + doc/build/gcc.rst      |   4 +-
>> + lib/aes/aes-encrypt.c |   4 +-
>> + lib/rsa/rsa-sign.c    | 102 +++++++++++++++++++++++++++++++++++++++---
>> + tools/docker/Dockerfile |  1 +
>> + 4 files changed, 103 insertions(+), 8 deletions(-)
>> +
>> +diff --git a/doc/build/gcc.rst b/doc/build/gcc.rst
>> +index 1fef718ceecb..29a6a632e7e3 100644
>> +--- a/doc/build/gcc.rst
>> ++++ b/doc/build/gcc.rst
>> +@@ -25,8 +25,8 @@ Depending on the build targets further packages maybe needed
>> +
>> +     sudo apt-get install bc bison build-essential coccinelle \
>> +       device-tree-compiler dfu-util efitools flex gdisk graphviz imagemagick \
>> +-      libgnutls28-dev libguestfs-tools libncurses-dev \
>> +-      libpython3-dev libsdl2-dev libssl-dev lz4 lzma lzma-alone openssl \
>> ++      libgnutls28-dev libguestfs-tools libncurses-dev libpython3-dev \
>> ++      libsdl2-dev libssl-dev lz4 lzma lzma-alone openssl pkcs11-provider \
>> +       pkg-config python3 python3-asteval python3-coverage python3-filelock \
>> +       python3-pkg-resources python3-pycryptodome python3-pyelftools \
>> +       python3-pytest python3-pytest-xdist python3-sphinxcontrib.apidoc \
>> +diff --git a/lib/aes/aes-encrypt.c b/lib/aes/aes-encrypt.c
>> +index 90e1407b4f09..4fc4ce232478 100644
>> +--- a/lib/aes/aes-encrypt.c
>> ++++ b/lib/aes/aes-encrypt.c
>> +@@ -16,7 +16,9 @@
>> + #include <openssl/err.h>
>> + #include <openssl/ssl.h>
>> + #include <openssl/evp.h>
>> +-#include <openssl/engine.h>
>> ++#if !defined(OPENSSL_NO_ENGINE) && !defined(OPENSSL_NO_DEPRECATED_3_0)
>> ++# include <openssl/engine.h>
>> ++#endif
>> + #include <uboot_aes.h>
>> +
>> + #if OPENSSL_VERSION_NUMBER >= 0x10000000L
>> +diff --git a/lib/rsa/rsa-sign.c b/lib/rsa/rsa-sign.c
>> +index 0e38c9e802fd..f456f3c58e65 100644
>> +--- a/lib/rsa/rsa-sign.c
>> ++++ b/lib/rsa/rsa-sign.c
>> +@@ -19,7 +19,47 @@
>> + #include <openssl/err.h>
>> + #include <openssl/ssl.h>
>> + #include <openssl/evp.h>
>> +-#include <openssl/engine.h>
>> ++#if OPENSSL_VERSION_MAJOR >= 3
>> ++# define USE_PKCS11_PROVIDER
>> ++# include <err.h>
>> ++# include <openssl/provider.h>
>> ++# include <openssl/store.h>
>> ++#else
>> ++# if !defined(OPENSSL_NO_ENGINE) && !defined(OPENSSL_NO_DEPRECATED_3_0)
>> ++#  define USE_PKCS11_ENGINE
>> ++#  include <openssl/engine.h>
>> ++# endif
>> ++#endif
>> ++
>> ++#ifdef USE_PKCS11_PROVIDER
>> ++#define ERR(cond, fmt, ...)				\
>> ++	do {						\
>> ++		bool __cond = (cond);			\
>> ++		drain_openssl_errors(__LINE__, 0);	\
>> ++		if (__cond) {				\
>> ++			errx(1, fmt, ## __VA_ARGS__);	\
>> ++		}					\
>> ++	} while (0)
>> ++
>> ++static void drain_openssl_errors(int l, int silent)
>> ++{
>> ++	const char *file;
>> ++	char buf[120];
>> ++	int e, line;
>> ++
>> ++	if (ERR_peek_error() == 0)
>> ++		return;
>> ++	if (!silent)
>> ++		fprintf(stderr, "At main.c:%d:\n", l);
>> ++
>> ++	while ((e = ERR_peek_error_line(&file, &line))) {
>> ++		ERR_error_string(e, buf);
>> ++		if (!silent)
>> ++			fprintf(stderr, "- SSL %s: %s:%d\n", buf, file, line);
>> ++		ERR_get_error();
>> ++	}
>> ++}
>> ++#endif
>> +
>> + static int rsa_err(const char *msg)
>> + {
>> +@@ -94,10 +134,11 @@ static int rsa_pem_get_pub_key(const char *keydir, const char *name, EVP_PKEY **
>> +  *
>> +  * @keydir:	Key prefix
>> +  * @name	Name of key
>> +- * @engine	Engine to use
>> ++ * @engine	Engine to use or NULL when using pkcs11 provider
>> +  * @evpp	Returns EVP_PKEY object, or NULL on failure
>> +  * Return: 0 if ok, -ve on error (in which case *evpp will be set to NULL)
>> +  */
>> ++#ifdef USE_PKCS11_ENGINE
>> + static int rsa_engine_get_pub_key(const char *keydir, const char *name,
>> + 				  ENGINE *engine, EVP_PKEY **evpp)
>> + {
>> +@@ -157,21 +198,24 @@ static int rsa_engine_get_pub_key(const char *keydir, const char *name,
>> +
>> + 	return 0;
>> + }
>> ++#endif
>> +
>> + /**
>> +  * rsa_get_pub_key() - read a public key
>> +  *
>> +  * @keydir:	Directory containing the key (PEM file) or key prefix (engine)
>> +  * @name	Name of key file (will have a .crt extension)
>> +- * @engine	Engine to use
>> ++ * @engine	Engine to use or NULL when using pkcs11 provider
>> +  * @evpp	Returns EVP_PKEY object, or NULL on failure
>> +  * Return: 0 if ok, -ve on error (in which case *evpp will be set to NULL)
>> +  */
>> + static int rsa_get_pub_key(const char *keydir, const char *name,
>> + 			   ENGINE *engine, EVP_PKEY **evpp)
>> + {
>> ++#ifdef USE_PKCS11_ENGINE
>> + 	if (engine)
>> + 		return rsa_engine_get_pub_key(keydir, name, engine, evpp);
>> ++#endif
>> + 	return rsa_pem_get_pub_key(keydir, name, evpp);
>> + }
>> +
>> +@@ -207,13 +251,45 @@ static int rsa_pem_get_priv_key(const char *keydir, const char *name,
>> + 		return -ENOENT;
>> + 	}
>> +
>> ++#ifdef USE_PKCS11_PROVIDER
>> ++	EVP_PKEY *private_key = NULL;
>> ++	OSSL_STORE_CTX *store;
>> ++
>> ++	if (!OSSL_PROVIDER_try_load(NULL, "default", true))
>> ++		ERR(1, "OSSL_PROVIDER_try_load(default)");
>> ++	/* pkcs11 provider is optional; only needed for pkcs11: URIs */
>> ++	if (!OSSL_PROVIDER_try_load(NULL, "pkcs11", true))
>> ++		ERR_clear_error();
>> ++
>> ++	store = OSSL_STORE_open(path, NULL, NULL, NULL, NULL);
>> ++	ERR(!store, "OSSL_STORE_open");
>> ++
>> ++	while (!OSSL_STORE_eof(store)) {
>> ++		OSSL_STORE_INFO *info = OSSL_STORE_load(store);
>> ++
>> ++		if (!info) {
>> ++			drain_openssl_errors(__LINE__, 0);
>> ++			continue;
>> ++		}
>> ++		if (OSSL_STORE_INFO_get_type(info) == OSSL_STORE_INFO_PKEY) {
>> ++			private_key = OSSL_STORE_INFO_get1_PKEY(info);
>> ++			ERR(!private_key, "OSSL_STORE_INFO_get1_PKEY");
>> ++		}
>> ++		OSSL_STORE_INFO_free(info);
>> ++		if (private_key)
>> ++			break;
>> ++	}
>> ++	OSSL_STORE_close(store);
>> ++
>> ++	*evpp = private_key;
>> ++#else
>> + 	if (!PEM_read_PrivateKey(f, evpp, NULL, path)) {
>> + 		rsa_err("Failure reading private key");
>> + 		fclose(f);
>> + 		return -EPROTO;
>> + 	}
>> + 	fclose(f);
>> +-
>> ++#endif
>> + 	return 0;
>> + }
>> +
>> +@@ -226,6 +301,7 @@ static int rsa_pem_get_priv_key(const char *keydir, const char *name,
>> +  * @evpp	Returns EVP_PKEY object, or NULL on failure
>> +  * Return: 0 if ok, -ve on error (in which case *evpp will be set to NULL)
>> +  */
>> ++#ifdef USE_PKCS11_ENGINE
>> + static int rsa_engine_get_priv_key(const char *keydir, const char *name,
>> + 				   const char *keyfile,
>> + 				   ENGINE *engine, EVP_PKEY **evpp)
>> +@@ -293,22 +369,25 @@ static int rsa_engine_get_priv_key(const char *keydir, const char *name,
>> +
>> + 	return 0;
>> + }
>> ++#endif
>> +
>> + /**
>> +  * rsa_get_priv_key() - read a private key
>> +  *
>> +  * @keydir:	Directory containing the key (PEM file) or key prefix (engine)
>> +  * @name	Name of key
>> +- * @engine	Engine to use for signing
>> ++ * @engine	Engine to use or NULL when using pkcs11 provider
>> +  * @evpp	Returns EVP_PKEY object, or NULL on failure
>> +  * Return: 0 if ok, -ve on error (in which case *evpp will be set to NULL)
>> +  */
>> + static int rsa_get_priv_key(const char *keydir, const char *name,
>> + 			    const char *keyfile, ENGINE *engine, EVP_PKEY **evpp)
>> + {
>> ++#ifdef USE_PKCS11_ENGINE
>> + 	if (engine)
>> + 		return rsa_engine_get_priv_key(keydir, name, keyfile, engine,
>> + 					       evpp);
>> ++#endif
>> + 	return rsa_pem_get_priv_key(keydir, name, keyfile, evpp);
>> + }
>> +
>> +@@ -325,6 +404,7 @@ static int rsa_init(void)
>> + 	return 0;
>> + }
>> +
>> ++#ifdef USE_PKCS11_ENGINE
>> + static int rsa_engine_init(const char *engine_id, ENGINE **pe)
>> + {
>> + 	const char *key_pass;
>> +@@ -380,6 +460,7 @@ static void rsa_engine_remove(ENGINE *e)
>> + 		ENGINE_free(e);
>> + 	}
>> + }
>> ++#endif
>> +
>> + static int rsa_sign_with_key(EVP_PKEY *pkey, struct padding_algo *padding_algo,
>> + 			     struct checksum_algo *checksum_algo,
>> +@@ -480,11 +561,13 @@ int rsa_sign(struct image_sign_info *info,
>> + 	if (ret)
>> + 		return ret;
>> +
>> ++#ifdef USE_PKCS11_ENGINE
>> + 	if (info->engine_id) {
>> + 		ret = rsa_engine_init(info->engine_id, &e);
>> + 		if (ret)
>> + 			return ret;
>> + 	}
>> ++#endif
>> +
>> + 	ret = rsa_get_priv_key(info->keydir, info->keyname, info->keyfile,
>> + 			       e, &pkey);
>> +@@ -496,16 +579,21 @@ int rsa_sign(struct image_sign_info *info,
>> + 		goto err_sign;
>> +
>> + 	EVP_PKEY_free(pkey);
>> ++
>> ++#ifdef USE_PKCS11_ENGINE
>> + 	if (info->engine_id)
>> + 		rsa_engine_remove(e);
>> ++#endif
>> +
>> + 	return ret;
>> +
>> + err_sign:
>> + 	EVP_PKEY_free(pkey);
>> + err_priv:
>> ++#ifdef USE_PKCS11_ENGINE
>> + 	if (info->engine_id)
>> + 		rsa_engine_remove(e);
>> ++#endif
>> + 	return ret;
>> + }
>> +
>> +@@ -645,11 +733,13 @@ int rsa_add_verify_data(struct image_sign_info *info, void *keydest)
>> + 	ENGINE *e = NULL;
>> +
>> + 	debug("%s: Getting verification data\n", __func__);
>> ++#ifdef USE_PKCS11_ENGINE
>> + 	if (info->engine_id) {
>> + 		ret = rsa_engine_init(info->engine_id, &e);
>> + 		if (ret)
>> + 			return ret;
>> + 	}
>> ++#endif
>> + 	ret = rsa_get_pub_key(info->keydir, info->keyname, e, &pkey);
>> + 	if (ret)
>> + 		goto err_get_pub_key;
>> +@@ -726,8 +816,10 @@ int rsa_add_verify_data(struct image_sign_info *info, void *keydest)
>> + err_get_params:
>> + 	EVP_PKEY_free(pkey);
>> + err_get_pub_key:
>> ++#ifdef USE_PKCS11_ENGINE
>> + 	if (info->engine_id)
>> + 		rsa_engine_remove(e);
>> ++#endif
>> +
>> + 	if (ret)
>> + 		return ret;
>> +diff --git a/tools/docker/Dockerfile b/tools/docker/Dockerfile
>> +index 73bf6cdd2c52..50e98e83dc20 100644
>> +--- a/tools/docker/Dockerfile
>> ++++ b/tools/docker/Dockerfile
>> +@@ -122,6 +122,7 @@ RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
>> + 	openssl \
>> + 	picocom \
>> + 	parted \
>> ++	pkcs11-provider \
>> + 	pkg-config \
>> + 	python-is-python3 \
>> + 	python3 \
>> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb
>> index d3a78d8b..5812b914 100644
>> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb
>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb
>> @@ -4,6 +4,8 @@ PR = "r0"
>>   
>>   BRANCH = "ti-u-boot-2024.04"
>>   
>> -SRC_URI += "file://0001-scripts-dtc-pylibfdt-libfdt.i_shipped-Use-SWIG_Appen.patch"
>> -
>>   SRCREV_uboot = "29d0c23d67ee7b88e46fe1753cd020e2b04c2ef6"
>> +
>> +SRC_URI += "file://0001-scripts-dtc-pylibfdt-libfdt.i_shipped-Use-SWIG_Appen.patch"
>> +SRC_URI += "file://0001-binman-migrate-form-pkg_resources-to-importlib.patch"
>> +SRC_URI += "file://0001-Add-support-for-OpenSSL-Provider-API-2024-04.patch"
>> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
>> index f7475c2b..af4b1b77 100644
>> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
>> @@ -7,3 +7,4 @@ BRANCH = "ti-u-boot-2025.01"
>>   SRCREV_uboot = "4ca322ca563a21cccad8c9ba65e386b9fd34dd16"
>>   
>>   SRC_URI += "file://0001-binman-migrate-form-pkg_resources-to-importlib.patch"
>> +SRC_URI += "file://0001-Add-support-for-OpenSSL-Provider-API-2025-01.patch"
>> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
>> index 7637cfaf..d1ef241d 100644
>> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
>> @@ -5,3 +5,5 @@ PR = "r0"
>>   BRANCH = "ti-u-boot-2026.01"
>>   
>>   SRCREV_uboot = "2a85f4bcffc50ddc8b443d8e4162e9e46ed0f200"
>> +
>> +SRC_URI += "file://0001-Add-support-for-OpenSSL-Provider-API-2026-01.patch"
>> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> index 3d6769bf..8213ac60 100644
>> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> @@ -25,6 +25,7 @@ UBOOT_GIT_PROTOCOL ?= "https"
>>   UBOOT_GIT_BRANCH ?= "branch=${BRANCH}"
>>   SRC_URI = "${UBOOT_GIT_URI};protocol=${UBOOT_GIT_PROTOCOL};${UBOOT_GIT_BRANCH};name=uboot"
>>   
>> +SRC_URI:append:bsp-ti-6_6 = " file://0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch"
>>   SRC_URI:append:bsp-ti-6_12 = " file://0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch"
>>   SRC_URI:append:bsp-ti-6_18 = " file://0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch"
>>   
>> -- 
>> 2.43.0

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

