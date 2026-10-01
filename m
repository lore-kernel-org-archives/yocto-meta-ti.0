Return-Path: <a-dubey@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD32BCA5FB3
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 08:08:13 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6338.1790842089560035839
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 01 Oct 2026 01:08:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=proofpoint-05-2026 header.b=V6UA3Auq;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=JZR8RaMt;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: a-dubey@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69187Sqh1207686
	for <meta-ti@lists.yoctoproject.org>; Thu, 1 Oct 2026 03:08:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=i9LI58dewZJcG8b
	AlpL/zJxkH4iaPuTlxgxNiQyWEc8=; b=V6UA3AuqZeuwfgVjxv811AZ3Zz9bDKl
	PnEYRkLMSoTivhSpt0hyX8QLYO+T6O8M9LzBo0PhfJGkLF8lpAQtvv/D2F47WQXY
	Z1kfHavNgXz37XxG9FtPjkNsgRwu3ycE1NcyGbe46U4hx6i/ZggA2s4RC89FCCOJ
	CQ51QbQKZ/5H64M5ejHclV8AyhHOa+KFd7c2AXxKXHQp4aR/E5LOm+T6vpWN5MVZ
	SwCoKcLxc2i5kLM+9GYA+k9FC8+Ys9dBqXT+eA5RcTTN5lJSIVMNmDh9jg3WRq6e
	HqfyV5L8WkK15Aw6Mk+WwEB+nTGDJdZzBQHm1C7jS/xZmv9B+vEKiWw==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010043.outbound.protection.outlook.com [52.101.61.43])
	by m0380145.ppops.net (PPS) with ESMTPS id 4h1kqyg053-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Thu, 01 Oct 2026 03:08:09 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xI6D/SAy5/edbo4QOAVhiH565hFrpryGD+OLAO0NqA1SUZYs5oMBVQxhNgFvFpAAhvdFxIuHTW6lfNkQkrTisvQijr1vFPlGSICpYHWnZg3buv0svIXwo67XNb5JRnJYStMmI4e67cCSi+xfvqtfSLQfGoJf6UwlxlZDKmQ0meKxBEbCorwn/zb39Ke08NYh2snm3PHxMSnGypyh8UJaSH9GuyUEvn5cAa6C+D5KuXdXI8xn8/UXEsnNX6Tp4PtPeO7UXx5VU9UKvJJcQmHb//4v9/H2mA06xPkvNrwV17+AZBcCjTz+M20YH0c0r0O/4ak1MEVyRGBnQv8vJCNDkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i9LI58dewZJcG8bAlpL/zJxkH4iaPuTlxgxNiQyWEc8=;
 b=D5vEJKntgQr0echH44dG1/Bd/iJitcfmJiZs0Nq7jjjNDOnDUBaL1vOtRyZkTNdHgoKSqa78LKw3DWbROI6LVgVRYLnK6GMzvWiEZUbV0K8uJT2Bi+yAJV9dYjnHHsnOIciG7zX3mn4WEYuADgOnEAE3InyaUWFoubuki1Wn7RaiwaBp2BsbUpKbSRNUeSyAlgWJvX4lCeliYxhLXGh/FSFpZZpvdABSWnWZnpfo/4wDIitXa+mqUUoTVUXLJ0qhFtxqb3Rb/S8FhhS787ufc2LzNOouKqigguxObJzV+4xzDu+QEHkJUfdNzof04Ca6drop4bvBXWGg6vaaqV4TeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i9LI58dewZJcG8bAlpL/zJxkH4iaPuTlxgxNiQyWEc8=;
 b=JZR8RaMtgZc//vGLYLE66F9xh/CpUUqD5CPEo0G+XadJj4FEEX6EkM2SBE/Aee5BMUlqJMuO5lponicrB8z+9jRSlsgmi87WgwgujOrqxWz4QTuXz0y+zSDss2wUqz9xsXe57/lrfb5w/AjgXNT6h7ji5KRjaFzPZAjKb9W6rsA=
Received: from SJ0PR13CA0169.namprd13.prod.outlook.com (2603:10b6:a03:2c7::24)
 by DS4PPF6C5A39D55.namprd10.prod.outlook.com (2603:10b6:f:fc00::d26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.9; Thu, 1 Oct 2026
 08:08:05 +0000
Received: from MWH0EPF000C618E.namprd02.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::5a) by SJ0PR13CA0169.outlook.office365.com
 (2603:10b6:a03:2c7::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Thu, 1
 Oct 2026 08:08:05 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MWH0EPF000C618E.mail.protection.outlook.com (10.167.249.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 08:08:05 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 1 Oct
 2026 03:07:47 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 1 Oct
 2026 03:07:46 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 1 Oct 2026 03:07:46 -0500
Received: from [10.24.50.31] (lalit-ti-241.dhcp.ti.com [10.24.50.31])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69187jLg572123
	for <meta-ti@lists.yoctoproject.org>; Thu, 1 Oct 2026 03:07:46 -0500
Content-Type: multipart/alternative;
	boundary="------------8Fm0XOVSD2pszXDRZluL5Ygm"
Message-ID: <2266bc61-78d7-4e4f-8979-e5c50e67a51f@ti.com>
Date: Thu, 1 Oct 2026 13:37:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [meta-ti][master][PATCH v4 3/3] ti-core-initramfs:
 Extend with dm-verity support
To: <meta-ti@lists.yoctoproject.org>
References: <20260930125938.95629-1-a-dubey@ti.com>
 <20260930125938.95629-3-a-dubey@ti.com> <20260930162400.GJ4190@denix.org>
Content-Language: en-US
From: Atharv Dubey <a-dubey@ti.com>
In-Reply-To: <20260930162400.GJ4190@denix.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618E:EE_|DS4PPF6C5A39D55:EE_
X-MS-Office365-Filtering-Correlation-Id: 48b0b604-0455-4d16-ab35-08df1f931f27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700016|4022899009|1800799024|23010399003|10067099003|4133799003|56012099006|4143699003|6133799003|3023799007|8096899003|13003099007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	2oF3RYmocmCKzGepIgQpvzEsU9bDzbq3VgIKA8xLzDCsstm9WNbiTgopen/oMFnwWVzpdi1tR9LVc4zpIwGZe5MoPAMXuaOh0lk9Z4NfvOGDYoS3RaW6L2NlelK6Ar53TLcHhSYuz8Ry6kZsO6Sn4fd8Y2D+cnZ1UKn9AVs6dP4ebYETbV4HlPdSmbANJoaaVVCnCZo7BuEfO2pNgh/41jitYIQmpYsP+zx41y6Z4OU6+jgkxAOF/uHe0sPxarI9zQyD3iTunq672cPEmpnK3aaIah2SsUst2sHs4wpdldyUomkaWtaNI0Opl/W3oMJOr2hFS3K123GMnixVCeDxZUBTiVbgV1lrdEqs0Ja5nyx5j0/bG92+7rjs+QpxpZdRSCmBZWXQA9mP//BHXvzAtrXcQwYB3vzJtxmq/W5Q9iTM5Hp8OQF9Bn6l4ihifXbacIDu8+nKcasixcHsfon07EM3oTWmu666+IzvwokAdRm5WINQj0fk/jdz0YgaX2L1aPTwAAbPcv7LRtuwljZM1Z8r/DCAEkB+PTkqMBdRS0EpCX3OSvpZD5Bj7DcoFBiI8DqMs2lzs/stNvspyLyuUIRRevMQRzdfRrifde1vuiHdu31mgi5Exr7NPMTN2KBZ6fw67AKQBBS8eqP2/CcZvg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(4022899009)(1800799024)(23010399003)(10067099003)(4133799003)(56012099006)(4143699003)(6133799003)(3023799007)(8096899003)(13003099007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	j+0/WnVEjjVAp5vNRap5nntDO1C8oOPd12pQioGBdJ+T2Zk7vcyCeU4FMjshD7NEJdazyjFvEUiT+tZqeAane85G7M+hu7RenngkJ9m4IuesNrwIIdCMNfyH0Wytq+K5lv0tn7CYL5oUA4mX9t61HdbW5C3F526fZRmj9WQkSE8eqVefmo5f8QWs1MDmTl6YUiycGxri+9mWEb+8R01npoIH7s3B7gnV9OjhoV1pB0z/xhsVkO3JrgKA42hYycddXLtsYFH9uuCZVF8PaP5XNgIyxpzLg3fz9xKSn19ooljSSO+HG2LAqcgmqwUmbdWrTuC7ITDE2Y94FINR+F9RwxWFOEODWXeT6NauaSwZiTUWTa2OMkFpwqbb4hT8xNAIDv+zncNloaihy9YwdBq+wEpu/FFbETqxaVqMftwtOpe9QsByNd9oPgdMJRDxZ6pq
X-Exchange-RoutingPolicyChecked: 
	2gvevB4P/mdZKCUse11riZe+YgCY4TO7kfgilhUIvUX8sCNIrwMu/TGU8kDbdfBbXQXEE+IpJMmH1qE7NtItXPyGZ9kuJ4vt9zqfO/L6dGSBXbfB/74IQkyydXU1mUHVLQJVo2xCH7N7tm7GJy++bCK1HW6RdjeVHD/wuHpQUmbxvy4IwyNaQw5R++A2ChBozTBHelmY63YVzI+QlKaEuqexgf+lj+aSG/UHiTEzs+TU8+v2eKskqkrdeEak+kQcUrQuCkcMVCqNv1s99+QB5h0HnCLrb/CJLkAGDO/dGQbkrLbbThYEkXlyb2J6YuxLo9gqF0MuxPP20RUg19/Kdw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 08:08:05.1930
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48b0b604-0455-4d16-ab35-08df1f931f27
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000C618E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF6C5A39D55
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzMiBTYWx0ZWRfX3CLUOuyz7WAM
 ZWkci1LVfAfSIkHznsdkW7jPeZgGetOyeg3TtPPetXXWw3c9YkdYC9O7g2FZtDttn3Jey1zf0X4
 dg11i7zCXGKTNtYWqoj9HLCMmKfjmf0=
X-Authority-Analysis: v=2.4 cv=a6alZkSF c=1 sm=1 tr=0 ts=6abe14e9 cx=c_pps
 a=r4SLCykQvtwIPvheKTZvSw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=RpNjiQI2AAAA:8 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=CluXJGGqs6ERQA5Zo3gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=0gcC27t9AAAA:8
 a=PlhZGAWzua99qvcF8bMA:9 a=tqdMzFhGG8mD8GCBlf4leDhY3gs=:19
 a=sTxRpBpiy98KL1WkT8X2XIWo+SM=:19 a=lGdVaFIUyg8A3Fcw:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=f5sM90hAhNS9OGT-JDKn:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzMiBTYWx0ZWRfX9xaFaxqCNG0R
 GFqzh6fv9EpBruoqMx/sOdpp6nNyPrpcjArameEnNGEymClWtbpGED6IwrQI/veRSmLJIOWWJAZ
 UHzmqGAbe32Bld8Vd1K14dWUOD4ijOvg4iVsaRsnQtVRyxRLV/bZN2JPwknYYQPcGzZ99ZFU7ph
 HtQznvvX/uB2ttYTD/mEg3sXQTIvjOHdw3S2ME6FJBZoVjZtbRmK9+Uk8A5UZs9dYeC0yJYguEe
 3srzDhTGkohozuxItgYzFxdkHqjA5Kjh72BThjwWLXHjrt6Xn/QmBfP78bUCglHv6j+Gj3HHyNg
 XRtf6UbKOUQittAPu93tOcpiizOU0P28p6ce6SMk9yp7IN0G5WIj8CfNl+EVhyxMyxrrTmBE668
 ZNuwug/PGSKsqeHw2IJHB5Xkyn5KPuDpm1F6qGnVbBRzkDUq1/Q47MWUNcFPLzcll7DkeJOfh2V
 4LRDTbG1xIgdScJ4Jlw==
X-Proofpoint-ORIG-GUID: uEGKdQeMqTrm2sO0J8ATbx6MWXek4jRO
X-Proofpoint-GUID: uEGKdQeMqTrm2sO0J8ATbx6MWXek4jRO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010032
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 01 Oct 2026 08:08:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20429

--------------8Fm0XOVSD2pszXDRZluL5Ygm
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by m0380145.ppops.net id 69187Sqh1207686


On 30/09/26 21:54, Denys Dmytriyenko wrote:
> On Wed, Sep 30, 2026 at 06:=E2=80=8A29:=E2=80=8A38PM +0530, Atharv Dube=
y via=20
> lists.=E2=80=8Ayoctoproject.=E2=80=8Aorg wrote: > Add dm-verity support=
 to=20
> ti-core-initramfs by: > - Enabling dm-verity modules and tools=20
> (cryptsetup, util-linux-mount) when DM_VERITY_IMAGE is set
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe.
> Report=C2=A0Suspicious
> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!uJdqXRfPtmw7SgZE_=
JMD3PSdzRdTmnkXYRe2ioxpDfi8vZDP0_QavxK7wTdvuOnYrkFBk0RC1w$>=20
>
> ZjQcmQRYFpfptBannerEnd
> On Wed, Sep 30, 2026 at 06:29:38PM +0530, Atharv Dubey via lists.yoctop=
roject.org wrote:
> > Add dm-verity support to ti-core-initramfs by:
> > - Enabling dm-verity modules and tools (cryptsetup, util-linux-mount)=
 when DM_VERITY_IMAGE is set
> > - Adding do_rootfs[nostamp] and do_image[nostamp] to rebuild initramf=
s after rootfs verity task completes
> > - Making deploy_verity_hash gracefully handle missing .verity.env fil=
e on first pass with bbwarn
> >=20
> > Signed-off-by: Atharv Dubey <a-dubey@ti.com>
> > ---
> >  .../machine/include/ti-core-initramfs.inc     |  4 +--
> >  .../initramfs/ti-core-initramfs.bbappend      | 25 +++++++++++++++++=
++
> >  2 files changed, 27 insertions(+), 2 deletions(-)
> >  create mode 100644 meta-ti-bsp/dynamic-layers/security-layer/recipes=
-ti/initramfs/ti-core-initramfs.bbappend
> >=20
> > diff --git a/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc b=
/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
> > index c816f1dc..08da8e80 100644
> > --- a/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
> > +++ b/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
> > @@ -5,7 +5,7 @@
> >  #   TI_CORE_INITRAMFS_ENABLED =3D "0"
> >  #
> >  #-------------------------------------------------------------------=
-----------
> > -TI_CORE_INITRAMFS_ENABLED ?=3D "${@ '1' if d.getVar('TI_CORE_INITRAM=
FS_KERNEL_MODULES') or d.getVar('TI_CORE_INITRAMFS_EXTRA_INSTALL') or bb.=
utils.contains('DISTRO_FEATURES', 'luks', True, False, d) else '0'}"
> > +TI_CORE_INITRAMFS_ENABLED ?=3D "${@ '1' if d.getVar('TI_CORE_INITRAM=
FS_KERNEL_MODULES') or d.getVar('TI_CORE_INITRAMFS_EXTRA_INSTALL') or bb.=
utils.contains('DISTRO_FEATURES', 'luks', True, False, d) or d.getVar('DM=
_VERITY_IMAGE') else '0'}"
> > =20
> >  TI_CORE_INITRAMFS_KERNEL_MODULES ?=3D ""
> >  TI_CORE_INITRAMFS_EXTRA_INSTALL ?=3D ""
> > @@ -22,4 +22,4 @@ TI_WKS_INITRAMFS ?=3D "${@ ',initrd=3D${TI_CORE_INI=
TRAMFS_IMAGE_FILE}' if d.getVar('
> > =20
> >  IMAGE_BOOT_FILES +=3D "${@ '${TI_CORE_INITRAMFS_IMAGE_FILE}' if d.ge=
tVar('TI_CORE_INITRAMFS_ENABLED') =3D=3D "1" else ''}"
> > =20
> > -INITRAMFS_IMAGE ?=3D "${@ '${TI_CORE_INITRAMFS_IMAGE}' if d.getVar('=
TI_CORE_INITRAMFS_ENABLED') =3D=3D "1" else ''}"
> > +INITRAMFS_IMAGE ?=3D "${@ '${TI_CORE_INITRAMFS_IMAGE}' if d.getVar('=
TI_CORE_INITRAMFS_ENABLED') =3D=3D "1" else ''}"
> > \ No newline at end of file
>
> You are not changing the code here, but it shows as a diff because you =
lost
> the newline at the end of file.


Will fix this in the nxt revision.

>
>
> > diff --git a/meta-ti-bsp/dynamic-layers/security-layer/recipes-ti/ini=
tramfs/ti-core-initramfs.bbappend b/meta-ti-bsp/dynamic-layers/security-l=
ayer/recipes-ti/initramfs/ti-core-initramfs.bbappend
> > new file mode 100644
> > index 00000000..25fe775f
> > --- /dev/null
> > +++ b/meta-ti-bsp/dynamic-layers/security-layer/recipes-ti/initramfs/=
ti-core-initramfs.bbappend
> > @@ -0,0 +1,25 @@
> > +# Install the essential utils for dm-verity in ti-core-initramfs
> > +TI_CORE_INITRAMFS_EXTRA_INSTALL:append =3D "${@' initramfs-module-dm=
verity cryptsetup util-linux-mount' if=20
> d.getVar('DM_VERITY_IMAGE') else ''}"
> > +
> > +# Ensure dm-verity.env is updated also when rebuilding DM_VERITY_IMA=
GE
> > +do_image[nostamp] =3D "1"
> > +do_rootfs[nostamp] =3D "1"
> > +
> > +IMAGE_FSTYPES =3D "${INITRAMFS_FSTYPES}"
> > +
> > +deploy_verity_hash() {
> > +    # The .verity.env file is created by the DM_VERITY_IMAGE build (=
e.g., arago-base-image).
> > +    # On the first pass, it won't exist yet because the initramfs is=
 built before the rootfs
> > +    # (due to INITRAMFS_IMAGE dependency). The do_rootfs[nostamp] =3D=
 "1" causes this task
> > +    # to re-run after the rootfs is built, at which point the file w=
ill exist.
> > +    if [ -f ${STAGING_VERITY_DIR}/${DM_VERITY_IMAGE}.${DM_VERITY_IMA=
GE_TYPE}.verity.env ]; then
> > +        install -D -m 0644 \
> > +            ${STAGING_VERITY_DIR}/${DM_VERITY_IMAGE}.${DM_VERITY_IMA=
GE_TYPE}.verity.env \
> > +            ${IMAGE_ROOTFS}${datadir}/misc/dm-verity.env
> > +    else
> > +        bbwarn "dm-verity.env not found at ${STAGING_VERITY_DIR}/${D=
M_VERITY_IMAGE}.${DM_VERITY_IMAGE_TYPE}.verity.env - will retry on rebuil=
d (nostamp)"
> > +    fi
> > +}
> > +
> > +
> > +IMAGE_PREPROCESS_COMMAND +=3D "deploy_verity_hash;"
> > --=20
> > 2.34.1
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#20427):https://urldefense.com/v3/__https://lists.yo=
ctoproject.org/g/meta-ti/message/20427__;!!G3vK!VDAkXMq9ZcHrDAlzrWiJbW2ZJ=
5LBlhBeM-6UXmt_s_Dido7I4hdendkHIamu4ndIWJUqlByUPw$=20
> Mute This Topic:https://urldefense.com/v3/__https://lists.yoctoproject.=
org/mt/121507548/10595936__;!!G3vK!VDAkXMq9ZcHrDAlzrWiJbW2ZJ5LBlhBeM-6UXm=
t_s_Dido7I4hdendkHIamu4ndIWJWxPUKQYw$=20
> Group Owner:meta-ti+owner@lists.yoctoproject.org
> Unsubscribe:https://urldefense.com/v3/__https://lists.yoctoproject.org/=
g/meta-ti/unsub__;!!G3vK!VDAkXMq9ZcHrDAlzrWiJbW2ZJ5LBlhBeM-6UXmt_s_Dido7I=
4hdendkHIamu4ndIWJWrjHS9XQ$  [a-dubey@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------8Fm0XOVSD2pszXDRZluL5Ygm
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by m0380145.ppops.net id 69187Sqh1207686

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 30/09/26 21:54, Denys Dmytriyenko
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20260930162400.GJ4190@denix.org=
">
      <!-- BaNnErBlUrFlE-BoDy-start -->
      <!-- Preheader Text : BEGIN -->
      <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DU=
TF-8">
      <div
style=3D"display:none !important;display:none;visibility:hidden;mso-hide:=
all;font-size:1px;color:#ffffff;line-height:1px;max-height:0px;opacity:0;=
overflow:hidden;">
        On Wed, Sep 30, 2026 at 06:=E2=80=8A29:=E2=80=8A38PM +0530, Athar=
v Dubey via
        lists.=E2=80=8Ayoctoproject.=E2=80=8Aorg wrote: &gt; Add dm-verit=
y support to
        ti-core-initramfs by: &gt; - Enabling dm-verity modules and
        tools (cryptsetup, util-linux-mount) when DM_VERITY_IMAGE is set<=
/div>
      <!-- Preheader Text : END -->
      <!-- Email Banner : BEGIN -->
      <div
style=3D"display:none !important;display:none;visibility:hidden;mso-hide:=
all;font-size:1px;color:#ffffff;line-height:1px;max-height:0px;opacity:0;=
overflow:hidden;">ZjQcmQRYFpfptBannerStart</div>
      <!--[if ((ie)|(mso))]>
  <table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" width=3D"100%" =
style=3D"padding: 0px 0px 10px 0px; direction: ltr" lang=3D"en"><tr><td>
    <table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D"padd=
ing: 0px 8px 6px 8px; width: 100%; border-radius:4px; border-top:4px soli=
d #90a4ae;background-color:#d0d8dc;"><tr><td valign=3D"top">
      <table align=3D"left" border=3D"0" cellspacing=3D"0" cellpadding=3D=
"0" style=3D"padding: 0px 8px 4px 8px; font-size: 12px; line-height: 16px=
">
	<tr><td style=3D"color:#000000; font-family: 'Arial', sans-serif; font-w=
eight:bold; font-size:14px; line-height: 20px; direction: ltr">
	  This message was sent from outside of Texas Instruments.
	</td></tr>
	<tr><td style=3D"color:#000000; font-weight:normal; font-family: 'Arial'=
, sans-serif; font-size:12px; direction: ltr">
          Do not click links or open attachments unless you recognize the=
 source of this email and know the content is safe.
	</td></tr>

      </table>
      <![if ie]><br clear=3D"all"><![endif]>
      <table align=3D"right" border=3D"0" cellspacing=3D"0" cellpadding=3D=
"0" style=3D"padding: 0px 0px 4px 0px; font-size: 14px; line-height: 36px=
"><tr>
	<td style=3D"direction: ltr">&nbsp;&nbsp;<a target=3D"_blank" href=3D"ht=
tps://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!uJdqXRfPtmw7SgZE_JMD3P=
SdzRdTmnkXYRe2ioxpDfi8vZDP0_QavxK7wTdvuOnYrkFBk0RC1w$" style=3D"mso-paddi=
ng-alt: 7px; padding: 7px; border-radius: 2px; border: 1px solid #666666;=
 "><strong style=3D"font-weight: normal; color: #000000; text-decoration:=
 none; font-family: 'Arial', sans-serif; font-size: 14px;">&nbsp;&nbsp;Re=
port&nbsp;Suspicious&nbsp;&nbsp;</strong></a>&nbsp;&nbsp;&zwnj; </td>
      </tr></table>
    </td></tr></table>
  </td></tr></table>
<![endif]-->
      <!--[if !((ie)|(mso))]-->
      <div dir=3D"ltr" lang=3D"en" id=3D"pfptBannermxhjqvl"
style=3D"all: revert !important; display:block !important; text-align: le=
ft !important; margin: 0 0 10px 0 !important; padding:7px 16px 8px 16px !=
important; border-radius: 4px !important; min-width: 200px !important; ba=
ckground-color: #d0d8dc !important; background-color: #d0d8dc; border-top=
: 4px solid #90a4ae !important; border-top: 4px solid #90a4ae;">
        <div id=3D"pfptBannermxhjqvl"
style=3D"all: unset !important; float:left !important; display:block !imp=
ortant; margin: 1px 0 1px 0 !important; max-width: 600px !important;">
          <div id=3D"pfptBannermxhjqvl"
style=3D"all: unset !important; display:block !important; visibility: vis=
ible !important; background-color: #d0d8dc !important; color:#000000 !imp=
ortant; color:#000000; font-family: 'Arial', sans-serif !important; font-=
family: 'Arial', sans-serif; font-weight:bold !important; font-weight:bol=
d; font-size:14px !important; line-height:1.29 !important; line-height:1.=
29">
            This message was sent from outside of Texas Instruments. </di=
v>
          <div id=3D"pfptBannermxhjqvl"
style=3D"all: unset !important; display:block !important; visibility: vis=
ible !important; background-color: #d0d8dc !important; color:#000000 !imp=
ortant; color:#000000; font-weight:normal; font-family: 'Arial', sans-ser=
if !important; font-family: 'Arial', sans-serif; font-size:12px !importan=
t; line-height:1.5 !important; line-height:1.5; margin-top:2px !important=
;">
            Do not click links or open attachments unless you recognize
            the source of this email and know the content is safe. </div>
        </div>
        <div id=3D"pfptBannermxhjqvl"
style=3D"all: unset !important; float: right !important; display: block !=
important; display: block; margin-left: 16px !important; margin-top: 1px =
!important; text-align: right !important; width: fit-content !important; =
font-size: 12px !important">
          <a id=3D"pfptBannermxhjqvl"
href=3D"https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!uJdqXRfPtmw7=
SgZE_JMD3PSdzRdTmnkXYRe2ioxpDfi8vZDP0_QavxK7wTdvuOnYrkFBk0RC1w$"
style=3D"all: unset !important; display: inline-block !important; text-de=
coration: none"
            moz-do-not-send=3D"true">
            <div class=3D"pfptPrimaryButtonmxhjqvl"
style=3D"display: inline-block !important; display: inline-block; visibil=
ity: visible !important; opacity: 1 !important; color: #000000 !important=
; color: #000000; font-family: 'Arial', sans-serif !important; font-famil=
y: 'Arial', sans-serif; font-size: 14px !important;  font-weight: normal =
!important; text-decoration: none !important; border-radius: 2px !importa=
nt; margin-top: 3px !important; margin-bottom: 3px !important; margin-lef=
t: 16px !important; padding: 7.5px 16px !important; white-space: nowrap !=
important; width: fit-content !important;
	border: 1px solid #666666"> Report=C2=A0Suspicious </div>
          </a> </div>
        <div
style=3D"clear: both !important; display: block !important; visibility: h=
idden !important; line-height: 0 !important; font-size: 0.01px !important=
; height: 0px">=C2=A0</div>
      </div>
      <!--[endif]-->
      <div
style=3D"display:none !important;display:none;visibility:hidden;mso-hide:=
all;font-size:1px;color:#ffffff;line-height:1px;max-height:0px;opacity:0;=
overflow:hidden;">ZjQcmQRYFpfptBannerEnd</div>
      <!-- Email Banner : END -->
      <!-- BaNnErBlUrFlE-BoDy-end -->
      <!-- BaNnErBlUrFlE-HeAdEr-start -->
      <style>#pfptBannermxhjqvl { all: revert !important; display: block =
!important;
    visibility: visible !important; opacity: 1 !important;
    background-color: #d0d8dc !important;
    max-width: none !important; max-height: none !important }.pfptPrimary=
Buttonmxhjqvl:hover, .pfptPrimaryButtonmxhjqvl:focus {
    background-color: #b4c1c7 !important; }.pfptPrimaryButtonmxhjqvl:acti=
ve {
    background-color: #90a4ae !important; }html:root, html:root>body { al=
l: revert !important; display: block !important;
    visibility: visible !important; opacity: 1 !important; }</style>
      <!-- BaNnErBlUrFlE-HeAdEr-end -->
      <pre
style=3D"font-family: sans-serif; font-size: 100%; white-space: pre-wrap;=
 word-wrap: break-word">On Wed, Sep 30, 2026 at 06:29:38PM +0530, Atharv =
Dubey via lists.yoctoproject.org wrote:
&gt; Add dm-verity support to ti-core-initramfs by:
&gt; - Enabling dm-verity modules and tools (cryptsetup, util-linux-mount=
) when DM_VERITY_IMAGE is set
&gt; - Adding do_rootfs[nostamp] and do_image[nostamp] to rebuild initram=
fs after rootfs verity task completes
&gt; - Making deploy_verity_hash gracefully handle missing .verity.env fi=
le on first pass with bbwarn
&gt;=20
&gt; Signed-off-by: Atharv Dubey <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:a-dubey@ti.com">&lt;a-dubey@ti.com&gt;</a>
&gt; ---
&gt;  .../machine/include/ti-core-initramfs.inc     |  4 +--
&gt;  .../initramfs/ti-core-initramfs.bbappend      | 25 ++++++++++++++++=
+++
&gt;  2 files changed, 27 insertions(+), 2 deletions(-)
&gt;  create mode 100644 meta-ti-bsp/dynamic-layers/security-layer/recipe=
s-ti/initramfs/ti-core-initramfs.bbappend
&gt;=20
&gt; diff --git a/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc =
b/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
&gt; index c816f1dc..08da8e80 100644
&gt; --- a/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
&gt; +++ b/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
&gt; @@ -5,7 +5,7 @@
&gt;  #   TI_CORE_INITRAMFS_ENABLED =3D "0"
&gt;  #
&gt;  #------------------------------------------------------------------=
------------
&gt; -TI_CORE_INITRAMFS_ENABLED ?=3D "${@ '1' if d.getVar('TI_CORE_INITRA=
MFS_KERNEL_MODULES') or d.getVar('TI_CORE_INITRAMFS_EXTRA_INSTALL') or bb=
.utils.contains('DISTRO_FEATURES', 'luks', True, False, d) else '0'}"
&gt; +TI_CORE_INITRAMFS_ENABLED ?=3D "${@ '1' if d.getVar('TI_CORE_INITRA=
MFS_KERNEL_MODULES') or d.getVar('TI_CORE_INITRAMFS_EXTRA_INSTALL') or bb=
.utils.contains('DISTRO_FEATURES', 'luks', True, False, d) or d.getVar('D=
M_VERITY_IMAGE') else '0'}"
&gt; =20
&gt;  TI_CORE_INITRAMFS_KERNEL_MODULES ?=3D ""
&gt;  TI_CORE_INITRAMFS_EXTRA_INSTALL ?=3D ""
&gt; @@ -22,4 +22,4 @@ TI_WKS_INITRAMFS ?=3D "${@ ',initrd=3D${TI_CORE_IN=
ITRAMFS_IMAGE_FILE}' if d.getVar('
&gt; =20
&gt;  IMAGE_BOOT_FILES +=3D "${@ '${TI_CORE_INITRAMFS_IMAGE_FILE}' if d.g=
etVar('TI_CORE_INITRAMFS_ENABLED') =3D=3D "1" else ''}"
&gt; =20
&gt; -INITRAMFS_IMAGE ?=3D "${@ '${TI_CORE_INITRAMFS_IMAGE}' if d.getVar(=
'TI_CORE_INITRAMFS_ENABLED') =3D=3D "1" else ''}"
&gt; +INITRAMFS_IMAGE ?=3D "${@ '${TI_CORE_INITRAMFS_IMAGE}' if d.getVar(=
'TI_CORE_INITRAMFS_ENABLED') =3D=3D "1" else ''}"
&gt; \ No newline at end of file

You are not changing the code here, but it shows as a diff because you lo=
st=20
the newline at the end of file.  </pre>
    </blockquote>
    <p><br>
    </p>
    <p>Will fix this in the nxt revision.=C2=A0</p>
    <blockquote type=3D"cite" cite=3D"mid:20260930162400.GJ4190@denix.org=
">
      <pre
style=3D"font-family: sans-serif; font-size: 100%; white-space: pre-wrap;=
 word-wrap: break-word">


&gt; diff --git a/meta-ti-bsp/dynamic-layers/security-layer/recipes-ti/in=
itramfs/ti-core-initramfs.bbappend b/meta-ti-bsp/dynamic-layers/security-=
layer/recipes-ti/initramfs/ti-core-initramfs.bbappend
&gt; new file mode 100644
&gt; index 00000000..25fe775f
&gt; --- /dev/null
&gt; +++ b/meta-ti-bsp/dynamic-layers/security-layer/recipes-ti/initramfs=
/ti-core-initramfs.bbappend
&gt; @@ -0,0 +1,25 @@
&gt; +# Install the essential utils for dm-verity in ti-core-initramfs
&gt; +TI_CORE_INITRAMFS_EXTRA_INSTALL:append =3D <a class=3D"moz-txt-link=
-rfc2396E" href=3D"mailto:${@'initramfs-module-dmveritycryptsetuputil-lin=
ux-mount'ifd.getVar('DM_VERITY_IMAGE')else''}">"${@' initramfs-module-dmv=
erity cryptsetup util-linux-mount' if d.getVar('DM_VERITY_IMAGE') else ''=
}"</a>
&gt; +
&gt; +# Ensure dm-verity.env is updated also when rebuilding DM_VERITY_IM=
AGE
&gt; +do_image[nostamp] =3D "1"
&gt; +do_rootfs[nostamp] =3D "1"
&gt; +
&gt; +IMAGE_FSTYPES =3D "${INITRAMFS_FSTYPES}"
&gt; +
&gt; +deploy_verity_hash() {
&gt; +    # The .verity.env file is created by the DM_VERITY_IMAGE build =
(e.g., arago-base-image).
&gt; +    # On the first pass, it won't exist yet because the initramfs i=
s built before the rootfs
&gt; +    # (due to INITRAMFS_IMAGE dependency). The do_rootfs[nostamp] =3D=
 "1" causes this task
&gt; +    # to re-run after the rootfs is built, at which point the file =
will exist.
&gt; +    if [ -f ${STAGING_VERITY_DIR}/${DM_VERITY_IMAGE}.${DM_VERITY_IM=
AGE_TYPE}.verity.env ]; then
&gt; +        install -D -m 0644 \
&gt; +            ${STAGING_VERITY_DIR}/${DM_VERITY_IMAGE}.${DM_VERITY_IM=
AGE_TYPE}.verity.env \
&gt; +            ${IMAGE_ROOTFS}${datadir}/misc/dm-verity.env
&gt; +    else
&gt; +        bbwarn "dm-verity.env not found at ${STAGING_VERITY_DIR}/${=
DM_VERITY_IMAGE}.${DM_VERITY_IMAGE_TYPE}.verity.env - will retry on rebui=
ld (nostamp)"
&gt; +    fi
&gt; +}
&gt; +
&gt; +
&gt; +IMAGE_PREPROCESS_COMMAND +=3D "deploy_verity_hash;"
&gt; --=20
&gt; 2.34.1
</pre>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre wrap=3D"" class=3D"moz-quote-pre">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#20427): <a class=3D"moz-txt-link-freetext" href=3D"ht=
tps://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta-ti/messag=
e/20427__;!!G3vK!VDAkXMq9ZcHrDAlzrWiJbW2ZJ5LBlhBeM-6UXmt_s_Dido7I4hdendkH=
Iamu4ndIWJUqlByUPw$">https://urldefense.com/v3/__https://lists.yoctoproje=
ct.org/g/meta-ti/message/20427__;!!G3vK!VDAkXMq9ZcHrDAlzrWiJbW2ZJ5LBlhBeM=
-6UXmt_s_Dido7I4hdendkHIamu4ndIWJUqlByUPw$</a>=20
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://urlde=
fense.com/v3/__https://lists.yoctoproject.org/mt/121507548/10595936__;!!G=
3vK!VDAkXMq9ZcHrDAlzrWiJbW2ZJ5LBlhBeM-6UXmt_s_Dido7I4hdendkHIamu4ndIWJWxP=
UKQYw$">https://urldefense.com/v3/__https://lists.yoctoproject.org/mt/121=
507548/10595936__;!!G3vK!VDAkXMq9ZcHrDAlzrWiJbW2ZJ5LBlhBeM-6UXmt_s_Dido7I=
4hdendkHIamu4ndIWJWxPUKQYw$</a>=20
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:meta-ti=
+owner@lists.yoctoproject.org">meta-ti+owner@lists.yoctoproject.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://urldefens=
e.com/v3/__https://lists.yoctoproject.org/g/meta-ti/unsub__;!!G3vK!VDAkXM=
q9ZcHrDAlzrWiJbW2ZJ5LBlhBeM-6UXmt_s_Dido7I4hdendkHIamu4ndIWJWrjHS9XQ$">ht=
tps://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta-ti/unsub_=
_;!!G3vK!VDAkXMq9ZcHrDAlzrWiJbW2ZJ5LBlhBeM-6UXmt_s_Dido7I4hdendkHIamu4ndI=
WJWrjHS9XQ$</a>  [<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:a-=
dubey@ti.com">a-dubey@ti.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
  </body>
</html>

--------------8Fm0XOVSD2pszXDRZluL5Ygm--

