Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34D77C98304
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 14:12:20 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8027.1790172734372054626
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 23 Sep 2026 07:12:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=proofpoint-05-2026 header.b=DIoKIy9M;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=B5nsgabA;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NDOKYV775597;
	Wed, 23 Sep 2026 09:12:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=r+w2+z965PdX+rOPkaVsgYp+l9TXu0taZyU1wX0dK
	Do=; b=DIoKIy9Mz+aUS6gPQvp3RGdbZxMDl0prP39/VqkE2W4YE2BooRlBdIZ+2
	687ih7uUOD3MBrYTGb7m1WZ00e8tun1y5llM3zaM/5dJPc0TNbpIBnJa8MJB4fLJ
	6/IcKBSej3uRn8FkeXJyUUI2EzeBHBPjEFoDxYos/XHAosRNpwGiE0z0P23qRuu0
	cMpN3xVelYRzpT3ZCsYIy/YUDVjCMtQMmChyKKuGjieiCrCdtQRc/7eACa64gcut
	iZJuiHQC66Q3jI8wO8PkM1PixiH8aMHnypT6D0t4u3VuMoD/pLLjnzGxuMtTJj6j
	kGVqh0py2e45rtkSoQaxHkpHjLdPw==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010034.outbound.protection.outlook.com [52.101.85.34])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gv2ycvpvq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 09:12:10 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TkzNRiPtNCO4Hgguhp1Dnksnec79q0Y5mSRtE4PW6pwBEAzqFUF0TEKR8M2HEKYK2vUJPN25AZaAB6oMmheIPlkgs8e6353eLBs2DXtITtAr4+tpN8v06Q48D1cLb0bqrpW3IHDuS/rweHSKn0dB3xr3RdOA+RJredSmNDoj3jW6HfvlF9JBK0yCSJexaVzZ6WEAMeqyqR41DqoBDGqO1WKIVO0pkQ4yhpvDYx797t+PCH7Xn/UpqO/kMIymUdFYF8ASDd0AJ6Q0yOFRs5Q0sF8NrE+J/GbiimF8oNMyql/AuhSTlgfRGSBQ/HyvJ2Sv73em19h4o7kgaPAPKb3vxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r+w2+z965PdX+rOPkaVsgYp+l9TXu0taZyU1wX0dKDo=;
 b=BCS732idqdOohDSBCQ8Scv5IBlJZGW4XKNXapJ5Vk/bn9FkmzXfKCuxcWxKKdE2CKOWocbCXwJfRD7J9K7FX594ZwORwR34SH+fMqGWpjRqDRBANaswSjloHdjD+rhPrPXK1ECuKOCC4oVEu/m4nTIHfa/6mCKCc+2YeF9CtDRJKMXS9LBHb523dzHXjqJCjVYg1HiiJN909xa4jgH6ZqvOqysE7f+fwW0pMAWz2sPIkyDOu/hfyra5azEhCp7geHuR0szT7jp1R216Kyo+tZi8cJc6lZO0WL0KIlyLbQdbi+FRzKwF1LIoN8mht0JbtsKT5NDdxRKbkY15ArTb/ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r+w2+z965PdX+rOPkaVsgYp+l9TXu0taZyU1wX0dKDo=;
 b=B5nsgabAVDhReLe1axgxl7B5ErScY8HLbBoQmJiQy77Q3G9FgHDhETWsuW2yyQsV4hjRdV0RgZ8OAvPvLtlxCQrBwNkZ5IExSGl4Ppi9SIBpKp1xZw89mlJJ8/PedSlZuwhniVegvraCqjD9HX8WO3NN7gehGWtMmSa220HYnVE=
Received: from BN0PR03CA0018.namprd03.prod.outlook.com (2603:10b6:408:e6::23)
 by IA6PR10MB849052.namprd10.prod.outlook.com (2603:10b6:208:5ec::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Wed, 23 Sep
 2026 14:12:08 +0000
Received: from BN1PEPF00018075.namprd04.prod.outlook.com
 (2603:10b6:408:e6:cafe::1) by BN0PR03CA0018.outlook.office365.com
 (2603:10b6:408:e6::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Wed,
 23 Sep 2026 14:12:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN1PEPF00018075.mail.protection.outlook.com (10.167.245.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Wed, 23 Sep 2026 14:12:07 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 09:11:45 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 09:11:45 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 23 Sep 2026 09:11:45 -0500
Received: from [10.249.33.88] ([10.249.33.88])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68NEBjJ12171022;
	Wed, 23 Sep 2026 09:11:45 -0500
Message-ID: <e6390483-42ae-48cf-82e3-fd6e334c259b@ti.com>
Date: Wed, 23 Sep 2026 09:11:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [master/wrynose][PATCH] recipes-multimedia: Add PipeWire bbappend
 for config files
To: Paresh Bhagat <p-bhagat@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <praneeth@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <denis@denix.org>,
        <j-sahu@ti.com>, <p-gupta5@ti.com>, <r-soni@ti.com>, <s-kapoor@ti.com>,
        <s-sinha@ti.com>, <sen@ti.com>, <y-hegde@ti.com>
References: <20260922103002.3723697-1-p-bhagat@ti.com>
 <edb0e4e5-f125-4bf7-9292-c15b1be85ecc@ti.com>
 <df233001-5b8e-48d3-9e19-20f560041761@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <df233001-5b8e-48d3-9e19-20f560041761@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018075:EE_|IA6PR10MB849052:EE_
X-MS-Office365-Filtering-Correlation-Id: a4a56df1-7a10-47eb-6076-08df197ca6f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|1800799024|376014|10067099003|56012099006|4143699003|3023799007|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	VOgnSl42ATYHhfOqnHEz5dDGTvnRxgyOCcU45Eupq8C2DptZo/mFrs7+PD/GuIPqpCBBcHqvVByfl75Kc55Nhp9THJ1uoiwuqDSW4xkJ2eR3pLQH+zRts+KQW7bJJ2xt3QOmEdjT8hCkMy3P5xxsnBxV1USF/rnay2WjgLai7PeLuJxwLYhyUVbsWAlhD0YwwoPg/h0LR1TV4EerVIEU2HIfMkCosv6skrT1bjkIOt5LyzcBVjzd8TnFcPEYvD1GoU4cOHUNnrDXq8MQDYiFwdTyqYTvmC2HHj/I2JxhS6wTgjmlsgV0y3UaYfoWFKee+g/PIdfr7+tpzuZ9b6TKAIYcl0MKaIgL2qcJO9jDtlY5z5ICqSJ7y70K+AZBdUHuSb1sDmdNm2bD3NjS70blt8LqU5c/MRvOy/vM/gAopRXPsrXOO+qNSOddBkBzh7ucimk405ZKP4kG78Sf72y6BTbt21pv821wOo/CXvwDcK5hoJpTLtnW4NR3/AVk+wDZftokghKZSjmsO6htodK35JXekCXJV2rPB4lJfpg6amq6Fnj2sx5kiSYIu07X70nZarCm01SYqOCL3VdMFRs3wpelJ70bcH39mke1kl0sLKTDe5Pd7gKMBUZt7xbA5fwRhpq7mkN+JP5GDb9tkOPIPB+PajnmtVaDXDnCWV4ebLli7lepdFqUDeWTWPiQ05gFu9wgtMzNoHJI8fxAqgFsCA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(1800799024)(376014)(10067099003)(56012099006)(4143699003)(3023799007)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	TlcKy9i2Kik9TrFYmyb8SamSIgeFlXkNIxxDoXG8Yy4nhNazB/SbUqqe6cXj2Ptrz0Vw/9aVT/9/h3ltnb0fDzR+hUwJ7tY/w7/e1HfL1LnpRxDL6jiVNhXQ3sv0v46040+RbR+cqRgwigZk2K67yC0cvXpdOzQUbJ2w6f2gdpEuf8B2kfFDCYb9RmqzIf37b4uoaMGVI8EBC+5bV8xG6qZIQ/BrA0U8/j4qGkOnZsGIcxU6v3e9v2hSkcsvsy55mMrRw2NMchqDX4HyGRN+usKGs1Xw75Yh0atTjoUKIQFsnPDDQhJZn7InqBNXk7G2Fk4UmZvFbzOF5Kxn0CMYameYVIhyeVKWPxnKoPSspygXDhJhock8a9N+jRUfAXTig3TcI3hM1YVO/oawofqXHuCM9kmm//HDwrBhQUReNzWmPC5FWCADT3E85VKgtVgN
X-Exchange-RoutingPolicyChecked: 
	j16r6dechvEIkfJrA0Yottog5l2xnZ9BdCoNv/w5qzoP0tPqErOQYGga64M9Xv+xDLhgDRmtMs9bp8ZyzSD3D50ncAYPoS2P8btD/l0mPjmUayhJme7o9ZTknJ/6TLUYVHJl1nuy7iBmgLy9XK5hhUR56epDsLuIjXdKjW/qYj6OBd3/hzvdcvvPBBtRxi264YDmYbyGHRPSV4LDhmLTbFXnq+PcnA9d1lrKLxxRxRxsdjV+pJk/qlaBGfPD7BwaXt98tdl678tm4u/Es9D0vymxtysrwLRw89RxWdQV92MvV+GgRsJpvtt0OiOAtQbmb6vUfvNh+S+r8H0sJttWug==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 14:12:07.6061
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4a56df1-7a10-47eb-6076-08df197ca6f0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00018075.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA6PR10MB849052
X-Proofpoint-GUID: Sjk2nPkKTja-wqcQuUDfP8rcGocaqoW-
X-Authority-Analysis: v=2.4 cv=WZKZ+EhX c=1 sm=1 tr=0 ts=6ab3de3a cx=c_pps
 a=h6NrD5D8j3GnK3ckJnoRDA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8
 a=Dm9dxDc33IPCQTXqrqQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1NiBTYWx0ZWRfX1Ofpd3y+8pKX
 a+uQBoMWsqzgp7CfAigvDcB4yLGnUhBCJTqycjpfWfvcVo78cAjmuWof2yKG4hB9Dku3Iin+i8k
 5VZyo7BIPfegsfRHO4Bn62ScyMc+caZxdV0jx00L+8ey0drKf2ae1DwUsuQbm1moyzu1xz9bcyk
 pUnlmTjLGGeH2qSuqQ8i1ABBfcI6DVYsC3OSDoYsw/bdJuc34QGWiDmh3xwKPP9MPgr9KdOaxjf
 zKDbnnVfYLIoxIx1/6B1HFTDO4DAzV0UF6v6VuVxONSTuDyjQJd6IZ1eBUzZmlhnqqEaycLnAxF
 gIwImtFeyLqXE9p/MmA84yTFyItCpd9G01H/VWF77stSYRiZkFKlk7M/N10y4ZJcOEWQHKmTR3R
 fVgktWGmTJ4s5Gw+87WbL6jwtREBfnFTpGzIr2UBChOKmrI0r24AkjBd4eawgZFb7uoxxvTSYUt
 lDyHsa1bR+zHE28Dr9w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1NiBTYWx0ZWRfX/4xYFqY3hylB
 v8HhdRozJ7pTTzqOazuPaliu8qCvgXIAYWqxbqo6TVqcbdhlc8H9g/yxTJbV075u/Gpc9JQR++V
 I0E6aCEp17rhL09jZB9mNEbdIMJsRYc=
X-Proofpoint-ORIG-GUID: Sjk2nPkKTja-wqcQuUDfP8rcGocaqoW-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230056
Content-Transfer-Encoding: base64
X-MIME-Autoconverted: from 8bit to base64 by mx0b-0002e601.pphosted.com id 68NDOKYV775597
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 23 Sep 2026 14:12:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20401

DQoNCk9uIDkvMjMvMjAyNiAyOjMyIEFNLCBQYXJlc2ggQmhhZ2F0IHdyb3RlOg0KPiBIaSBS
eWFuLA0KPiANCj4gDQo+IE9uIDIzLzA5LzI2IDAyOjUzLCBSeWFuIEVhdG1vbiB3cm90ZToN
Cj4+DQo+PiBPay7CoCBEZW55cyBhbmQgSSB3ZXJlIGRpc2N1c3NpbmcgdGhpcyBhbmQgd2Ug
aGF2ZSBhIGZldyBjaGFuZ2VzIGZvciANCj4+IHRoaXMgcGF0Y2ggc2VyaWVzIHRoYXQgd2Ug
d291bGQgbGlrZSB0byBzZWUuDQo+Pg0KPj4gMSkgVGhpcyBjYW4gbW92ZSB0byBtZXRhLXRp
LWJzcCBzbyB0aGF0IGlzIGVhc2llciB0byBnZXQgaW50byB1c2VycycgDQo+PiBoYW5kcy4N
Cj4+IDIpIFdoZW4gaXQgbW92ZXMgdG8gbWV0YS10aS1ic3AgbW92ZSBpdCBpbnRvIGEgZHlu
YW1pYy1sYXllciBmb3IgDQo+PiBtdWx0aW1lZGlhLWxheWVyIGFuZCBhZGQgbXVsdGltZWRp
YS1sYXllciB0byB0aGUgDQo+PiBMQVlFUlJFQ09NTUVORFNfbWV0YS10aS1ic3Agc2V0IG9m
IGxheWVycy4NCj4+IDMpIE1ha2Ugc3VyZSB0byBsYXllciB0aGUgY2hhbmdlcyBpbnRvIG11
bHRpcGxlIHBhdGNoZXMgYW5kIG5vdCBqdXN0IA0KPj4gZ2xvYiB0aGVtIGFsbCBpbnRvIG9u
ZS4NCj4+IMKgIGEpIENyZWF0ZSB0aGUgZHluYW1pYyBsYXllciBkaXJlY3RvcnkgYW5kIHVw
ZGF0ZSBsYXllci5jb25mDQo+PiDCoCBiKSBBZGQgdGhlIHBpcGV3aXJlIGJiYXBwZW5kICh0
aGUgY3VycmVudCBwYXRjaCkgdG8gdGhlIGR5bmFtaWMgDQo+PiBsYXllciBkaXJlY3Rvcnku
DQo+Pg0KPj4gSSB0aGluayB0aGF0IHdpbGwgYmUgY2xlYW5lc3QgZm9ybWF0aW9uIGZvciB0
aGlzLg0KPj4NCj4+IERvIGFsbCB0aGF0IGZvciBhIHYyIHBsZWFzZS4NCj4gDQo+IA0KPiBU
aGVyZSBpcyBvbmUgc21hbGwgaXNzdWUuIEFuIGVtcHR5IG11bHRpbWVkaWEtbGF5ZXIgZGly
ZWN0b3J5IHdpbGwgbm90IA0KPiBiZSB0cmFja2VkIGJ5IGdpdC4gRWl0aGVyIGkgd2lsbCBo
YXZlIHNxdWFzaCBpbnRvIG9uZSBjb21taXQgb3Igb25seSBhZGQgDQo+IGxheWVyLmNvbmYg
aW4gZmlyc3QgcGF0Y2guDQo+IA0KDQpWYWxpZCBwb2ludC4gIFRoZW4gZmxpcCB0aGVtLiAg
VGhlIGZpcnN0IHBhdGNoIGFkZHMgdGhlIHJlY2lwZXMsIHRoZSANCnNlY29uZCBwYXRjaCBh
ZGRzIHRvIHRoZSBsYXllci5jb25mLg0KDQoNCj4+DQo+Pg0KPj4gT24gOS8yMi8yMDI2IDU6
MzAgQU0sIFBhcmVzaCBCaGFnYXQgd3JvdGU6DQo+Pj4gRXh0ZW5kIHRoZSBQaXBlV2lyZSBy
ZWNpcGUgdG8gYWRkIHBsYXRmb3JtLXNwZWNpZmljIEFMU0EgY29uZmlndXJhdGlvbi4NCj4+
PiBBZGQgc2luayBhbmQgc291cmNlIGNvbmZpZ3VyYXRpb24gZm9yIDgtY2hhbm5lbCBhdWRp
byBwbGF5YmFjayBhbmQNCj4+PiBjYXB0dXJlIG9uIHRoZSBBTTYyRDJFVk0gYXMgdGhlIGRl
ZmF1bHQgY29uZmlndXJhdGlvbiBpcyAyLWNoYW5uZWwuDQo+Pj4NCj4+PiBTaWduZWQtb2Zm
LWJ5OiBQYXJlc2ggQmhhZ2F0IDxwLWJoYWdhdEB0aS5jb20+DQo+Pj4gLS0tDQo+Pj4gwqAg
Li4uL3BpcGV3aXJlL3BpcGV3aXJlLXRpLmluY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfCAyMCArKysrKysrKysrKysrKysrKysrDQo+Pj4gwqAgLi4uL2FtNjJkeHgt
ZXZtLzkwLXBpcGV3aXJlLXNpbmsuY29uZsKgwqDCoMKgwqDCoMKgwqAgfCAxNyArKysrKysr
KysrKysrKysrDQo+Pj4gwqAgLi4uL2FtNjJkeHgtZXZtLzkxLXBpcGV3aXJlLXNvdXJjZS5j
b25mwqDCoMKgwqDCoMKgIHwgMTcgKysrKysrKysrKysrKysrKw0KPj4+IMKgIC4uLi9waXBl
d2lyZS9waXBld2lyZV8lLmJiYXBwZW5kwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKg
IDQgKysrKw0KPj4+IMKgIDQgZmlsZXMgY2hhbmdlZCwgNTggaW5zZXJ0aW9ucygrKQ0KPj4+
IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCANCj4+PiBtZXRhLXRpLWV4dHJhcy9yZWNpcGVzLW11
bHRpbWVkaWEvcGlwZXdpcmUvcGlwZXdpcmUtdGkuaW5jDQo+Pj4gwqAgY3JlYXRlIG1vZGUg
MTAwNjQ0IA0KPj4+IG1ldGEtdGktZXh0cmFzL3JlY2lwZXMtbXVsdGltZWRpYS9waXBld2ly
ZS9waXBld2lyZS9hbTYyZHh4LWV2bS85MC1waXBld2lyZS1zaW5rLmNvbmYNCj4+PiDCoCBj
cmVhdGUgbW9kZSAxMDA2NDQgDQo+Pj4gbWV0YS10aS1leHRyYXMvcmVjaXBlcy1tdWx0aW1l
ZGlhL3BpcGV3aXJlL3BpcGV3aXJlL2FtNjJkeHgtZXZtLzkxLXBpcGV3aXJlLXNvdXJjZS5j
b25mDQo+Pj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IA0KPj4+IG1ldGEtdGktZXh0cmFzL3Jl
Y2lwZXMtbXVsdGltZWRpYS9waXBld2lyZS9waXBld2lyZV8lLmJiYXBwZW5kDQo+Pj4NCj4+
PiBkaWZmIC0tZ2l0IA0KPj4+IGEvbWV0YS10aS1leHRyYXMvcmVjaXBlcy1tdWx0aW1lZGlh
L3BpcGV3aXJlL3BpcGV3aXJlLXRpLmluYyANCj4+PiBiL21ldGEtdGktZXh0cmFzL3JlY2lw
ZXMtbXVsdGltZWRpYS9waXBld2lyZS9waXBld2lyZS10aS5pbmMNCj4+PiBuZXcgZmlsZSBt
b2RlIDEwMDY0NA0KPj4+IGluZGV4IDAwMDAwMDAwLi42NWE4MjY3MQ0KPj4+IC0tLSAvZGV2
L251bGwNCj4+PiArKysgYi9tZXRhLXRpLWV4dHJhcy9yZWNpcGVzLW11bHRpbWVkaWEvcGlw
ZXdpcmUvcGlwZXdpcmUtdGkuaW5jDQo+Pj4gQEAgLTAsMCArMSwyMCBAQA0KPj4+ICtQUjph
cHBlbmQgPSAiLnRpMCINCj4+PiArDQo+Pj4gK0ZJTEVTRVhUUkFQQVRIUzpwcmVwZW5kIDo9
ICIke1RISVNESVJ9L3BpcGV3aXJlOiINCj4+PiArDQo+Pj4gKyMgQU02MkQtc3BlY2lmaWMg
Y29uZmlnIGZpbGVzDQo+Pj4gK1NSQ19VUkk6YXBwZW5kOmFtNjJkeHgtZXZtID0gIiBcDQo+
Pj4gK8KgwqDCoCBmaWxlOi8vOTAtcGlwZXdpcmUtc2luay5jb25mIFwNCj4+PiArwqDCoMKg
IGZpbGU6Ly85MS1waXBld2lyZS1zb3VyY2UuY29uZiBcDQo+Pj4gKyINCj4+PiArDQo+Pj4g
K2RvX2luc3RhbGw6YXBwZW5kOmFtNjJkeHgtZXZtKCkgew0KPj4+ICvCoMKgwqAgaW5zdGFs
bCAtZCAke0R9JHtzeXNjb25mZGlyfS9waXBld2lyZS9waXBld2lyZS5jb25mLmQNCj4+PiAr
wqDCoMKgIGluc3RhbGwgLW0gMDY0NCAke1VOUEFDS0RJUn0vOTAtcGlwZXdpcmUtc2luay5j
b25mIA0KPj4+ICR7RH0ke3N5c2NvbmZkaXJ9L3BpcGV3aXJlL3BpcGV3aXJlLmNvbmYuZC8N
Cj4+PiArwqDCoMKgIGluc3RhbGwgLW0gMDY0NCAke1VOUEFDS0RJUn0vOTEtcGlwZXdpcmUt
c291cmNlLmNvbmYgDQo+Pj4gJHtEfSR7c3lzY29uZmRpcn0vcGlwZXdpcmUvcGlwZXdpcmUu
Y29uZi5kLw0KPj4+ICt9DQo+Pj4gKw0KPj4+ICtGSUxFUzoke1BOfTphcHBlbmQ6YW02MmR4
eC1ldm0gPSAiIFwNCj4+PiArICR7c3lzY29uZmRpcn0vcGlwZXdpcmUvcGlwZXdpcmUuY29u
Zi5kLzkwLXBpcGV3aXJlLXNpbmsuY29uZiBcDQo+Pj4gKyAke3N5c2NvbmZkaXJ9L3BpcGV3
aXJlL3BpcGV3aXJlLmNvbmYuZC85MS1waXBld2lyZS1zb3VyY2UuY29uZiBcDQo+Pj4gKyIN
Cj4+PiBkaWZmIC0tZ2l0IA0KPj4+IGEvbWV0YS10aS1leHRyYXMvcmVjaXBlcy1tdWx0aW1l
ZGlhL3BpcGV3aXJlL3BpcGV3aXJlL2FtNjJkeHgtZXZtLzkwLXBpcGV3aXJlLXNpbmsuY29u
ZiBiL21ldGEtdGktZXh0cmFzL3JlY2lwZXMtbXVsdGltZWRpYS9waXBld2lyZS9waXBld2ly
ZS9hbTYyZHh4LWV2bS85MC1waXBld2lyZS1zaW5rLmNvbmYNCj4+PiBuZXcgZmlsZSBtb2Rl
IDEwMDY0NA0KPj4+IGluZGV4IDAwMDAwMDAwLi44NTdjMzQ0ZQ0KPj4+IC0tLSAvZGV2L251
bGwNCj4+PiArKysgDQo+Pj4gYi9tZXRhLXRpLWV4dHJhcy9yZWNpcGVzLW11bHRpbWVkaWEv
cGlwZXdpcmUvcGlwZXdpcmUvYW02MmR4eC1ldm0vOTAtcGlwZXdpcmUtc2luay5jb25mDQo+
Pj4gQEAgLTAsMCArMSwxNyBAQA0KPj4+ICsjIFBpcGVXaXJlIHNpbmsgY29uZmlndXJhdGlv
biBmb3IgQU02MkQuDQo+Pj4gKw0KPj4+ICtjb250ZXh0Lm9iamVjdHMgPSBbDQo+Pj4gK8Kg
wqDCoCB7DQo+Pj4gK8KgwqDCoMKgwqDCoMKgIGZhY3RvcnkgPSBhZGFwdGVyDQo+Pj4gK8Kg
wqDCoMKgwqDCoMKgIGFyZ3MgPSB7DQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZmFj
dG9yeS5uYW1lwqDCoMKgwqDCoMKgwqDCoMKgwqAgPSBhcGkuYWxzYS5wY20uc2luaw0KPj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG5vZGUubmFtZcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgID0gImFsc2FfYXVkaW9fc2luayINCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBub2RlLmRlc2NyaXB0aW9uwqDCoMKgwqDCoMKgID0gIkF1ZGlvIE91dHB1dCINCj4+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtZWRpYS5jbGFzc8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgPSAiQXVkaW8vU2luayINCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBhcGkuYWxz
YS5wYXRowqDCoMKgwqDCoMKgwqDCoMKgID0gImh3OkFNNjJEMkVWTSwwIg0KPj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGF1ZGlvLnJhdGXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
PSA0ODAwMA0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGF1ZGlvLmNoYW5uZWxzwqDC
oMKgwqDCoMKgwqDCoCA9IDgNCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBhdWRpby5w
b3NpdGlvbsKgwqDCoMKgwqDCoMKgwqAgPSBbIEZMIEZSIEZDIExGRSBSTCBSUiBTTCBTUiBd
DQo+Pj4gK8KgwqDCoMKgwqDCoMKgIH0NCj4+PiArwqDCoMKgIH0NCj4+PiArXQ0KPj4+IGRp
ZmYgLS1naXQgDQo+Pj4gYS9tZXRhLXRpLWV4dHJhcy9yZWNpcGVzLW11bHRpbWVkaWEvcGlw
ZXdpcmUvcGlwZXdpcmUvYW02MmR4eC1ldm0vOTEtcGlwZXdpcmUtc291cmNlLmNvbmYgYi9t
ZXRhLXRpLWV4dHJhcy9yZWNpcGVzLW11bHRpbWVkaWEvcGlwZXdpcmUvcGlwZXdpcmUvYW02
MmR4eC1ldm0vOTEtcGlwZXdpcmUtc291cmNlLmNvbmYNCj4+PiBuZXcgZmlsZSBtb2RlIDEw
MDY0NA0KPj4+IGluZGV4IDAwMDAwMDAwLi5hYzc2MzVkZQ0KPj4+IC0tLSAvZGV2L251bGwN
Cj4+PiArKysgDQo+Pj4gYi9tZXRhLXRpLWV4dHJhcy9yZWNpcGVzLW11bHRpbWVkaWEvcGlw
ZXdpcmUvcGlwZXdpcmUvYW02MmR4eC1ldm0vOTEtcGlwZXdpcmUtc291cmNlLmNvbmYNCj4+
PiBAQCAtMCwwICsxLDE3IEBADQo+Pj4gKyMgUGlwZVdpcmUgc291cmNlIGNvbmZpZ3VyYXRp
b24gZm9yIEFNNjJELg0KPj4+ICsNCj4+PiArY29udGV4dC5vYmplY3RzID0gWw0KPj4+ICvC
oMKgwqAgew0KPj4+ICvCoMKgwqDCoMKgwqDCoCBmYWN0b3J5ID0gYWRhcHRlcg0KPj4+ICvC
oMKgwqDCoMKgwqDCoCBhcmdzID0gew0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZh
Y3RvcnkubmFtZcKgwqDCoMKgwqDCoMKgwqDCoMKgID0gYXBpLmFsc2EucGNtLnNvdXJjZQ0K
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG5vZGUubmFtZcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgID0gImFsc2FfYXVkaW9fc291cmNlIg0KPj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIG5vZGUuZGVzY3JpcHRpb27CoMKgwqDCoMKgwqAgPSAiQXVkaW8gSW5wdXQiDQo+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWVkaWEuY2xhc3PCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgID0gIkF1ZGlvL1NvdXJjZSINCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBh
cGkuYWxzYS5wYXRowqDCoMKgwqDCoMKgwqDCoMKgID0gImh3OkFNNjJEMkVWTSwwIg0KPj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGF1ZGlvLnJhdGXCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgPSA0ODAwMA0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGF1ZGlvLmNoYW5u
ZWxzwqDCoMKgwqDCoMKgwqDCoCA9IDgNCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBh
dWRpby5wb3NpdGlvbsKgwqDCoMKgwqDCoMKgwqAgPSBbIEZMIEZSIEZDIExGRSBSTCBSUiBT
TCBTUiBdDQo+Pj4gK8KgwqDCoMKgwqDCoMKgIH0NCj4+PiArwqDCoMKgIH0NCj4+PiArXQ0K
Pj4+IGRpZmYgLS1naXQgDQo+Pj4gYS9tZXRhLXRpLWV4dHJhcy9yZWNpcGVzLW11bHRpbWVk
aWEvcGlwZXdpcmUvcGlwZXdpcmVfJS5iYmFwcGVuZCANCj4+PiBiL21ldGEtdGktZXh0cmFz
L3JlY2lwZXMtbXVsdGltZWRpYS9waXBld2lyZS9waXBld2lyZV8lLmJiYXBwZW5kDQo+Pj4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4+PiBpbmRleCAwMDAwMDAwMC4uZjgwNmQyOGYNCj4+
PiAtLS0gL2Rldi9udWxsDQo+Pj4gKysrIGIvbWV0YS10aS1leHRyYXMvcmVjaXBlcy1tdWx0
aW1lZGlhL3BpcGV3aXJlL3BpcGV3aXJlXyUuYmJhcHBlbmQNCj4+PiBAQCAtMCwwICsxLDQg
QEANCj4+PiArUElQRVdJUkVfVEkgPSAiIg0KPj4+ICtQSVBFV0lSRV9USTp0aS1zb2MgPSAi
cGlwZXdpcmUtdGkuaW5jIg0KPj4+ICsNCj4+PiArcmVxdWlyZSAke1BJUEVXSVJFX1RJfQ0K
Pj4NCg0KLS0gDQpSeWFuIEVhdG1vbiAgICAgICAgICAgICAgICByZWF0bW9uQHRpLmNvbQ0K
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NClRleGFzIEluc3Ry
dW1lbnRzLCBJbmMuICAtICBMQ1BEICAtICBNR1RTDQo=

