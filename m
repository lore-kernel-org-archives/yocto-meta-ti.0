Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2101C43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 16:34:35 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1406.1782750868621545306
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 09:34:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=proofpoint-05-2026 header.b=ZfKBaeLK;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=VODe4Em5;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: a-christidis@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65TGUQJY2370251;
	Mon, 29 Jun 2026 11:34:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=t9NCFXHzijanCqC7cfeuKDhKLGbEYgVAz+oOJ/Z3C
	/o=; b=ZfKBaeLKJvuDIckWQG9SMZpjsYFzoPa77QhT9vEh1UMEBVY+7xM//muCE
	ndrPb5KysjemCciF7qp9ucMlofoz5fuHYPnOlEusYSQGaRcM7UAP67unsOvvzfxg
	qzVj8CoY1LsdQSN26X/koTNMUywJ6tFotVBst9Hf+3f8ICRnH5e9h4kojjQNCzrn
	MCCFaN5OBUa4byFh2sc8NWl797Vf6ANXYjwYYPhCDc/F9nRihuuby14cY5u5C2fS
	5ZGOPvJfWYk9tsUG7E6SZFE2q/S/1L4dnXfXNYxJo90cIyg9ICz8q0DydBt0SuzE
	Q9JcZIq1gEcl5YkiR/ezfUBv4MpOQ==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012040.outbound.protection.outlook.com [52.101.43.40])
	by m0384305.ppops.net (PPS) with ESMTPS id 4f30fshbrt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 29 Jun 2026 11:34:26 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SWp/BcVU7C6MYTAbgyd6I++d3RmsE6KJVKzzEvm7aYs39I0cYTlf610/RdUwfv7Ug2fhtDfo68cEuxpOA2SuVmv8uEr/m9FLaDvV/a8xFgG2lFwiBfTL5nEOZ9044GQaNx9kyKPGYiqyfD8FZfVEdx7zOFu/Wz72jXDOf4duPIDtVUkoBaQmkmvbap1d/xK8yM04HkeFA+0jaur4nCb8hGM2hRqqjnM4DM3ZWri9kZb1cI0eLHpw6q34MBmGRsReWau4Xa82ne5sosKMo/HTx2WrZnEL0XlaX/Fok9eVVTZUZ62kGxIhn6HjF6zwq2ryjw4P2FNw6BLRoScRUtPJEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t9NCFXHzijanCqC7cfeuKDhKLGbEYgVAz+oOJ/Z3C/o=;
 b=aBDSpyfv6kelQ43MhR+FNR2xbC0C6+w6S+ypqVxQaRR27PGhQPRGad2ZIgWa213FzeutpFATQ03fwMK5q2Jywz2SK8R4L18sx3dZ3CNUiLJc3kS5xL92nGiCRZQ7POdjlN2VbR9VqPocRQStrdaEsnBXMsUT20lgDI3Wq6LIDjq/1D2TlNfvbNk2JBtBYDK3+HJdr+DLeRC1OdvyMK+PUfFg4zTnpH8YvGILehjsB3XR/AMV5tSNx2Q7gIBnP6xvcNKwKx2YVFzPVUQiHM42o/dYog/hRiQT2+yKyrvAvKfdBgqxbwbeonmm6EpUd9qUliWZK5xRPFj62oRuTqWxUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t9NCFXHzijanCqC7cfeuKDhKLGbEYgVAz+oOJ/Z3C/o=;
 b=VODe4Em5A4/2NLOZaSnXpS1Ro6ZS9y/ntlEiHlwSwhv38yO+CG7o8rTwlTlz4L88tRKJHOJLCPajiszpDwH3w/Ar7F9oWhNGkh9LApgB8WweiN0KrEOHkl1JVi6oHf5js0oIVQXL7UODXoavF8IlUg64KQ6kYAiZ9U/h/LYqNJo=
Received: from CH0P220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::19)
 by CO1PR10MB4755.namprd10.prod.outlook.com (2603:10b6:303:9f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 16:34:23 +0000
Received: from CH2PEPF0000009C.namprd02.prod.outlook.com
 (2603:10b6:610:ef:cafe::66) by CH0P220CA0001.outlook.office365.com
 (2603:10b6:610:ef::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 16:34:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH2PEPF0000009C.mail.protection.outlook.com (10.167.244.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 16:34:23 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 29 Jun
 2026 11:34:03 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 29 Jun
 2026 11:34:02 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 29 Jun 2026 11:34:02 -0500
Received: from [128.247.75.243] (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.75.243])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65TGY2DB415129;
	Mon, 29 Jun 2026 11:34:02 -0500
Message-ID: <59ea791b-920c-4ba2-aafd-d1cf935c07d2@ti.com>
Date: Mon, 29 Jun 2026 11:34:02 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/wrynose][PATCH] libsdl2: Set runtime dependency
 for SDL2 tests
To: Andrew Davis <afd@ti.com>, <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20260625200942.1370480-1-a-christidis@ti.com>
 <fbbb7452-b179-4382-870a-5e38cd9b8584@ti.com>
 <d6d816be-491e-4bdd-b81c-1b31b1e4d51d@ti.com>
 <5ff6423c-3076-4690-aa09-08c35649a89f@ti.com>
Content-Language: en-US
From: Antonios Christidis <a-christidis@ti.com>
In-Reply-To: <5ff6423c-3076-4690-aa09-08c35649a89f@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009C:EE_|CO1PR10MB4755:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cf8e300-bddf-4be5-17fa-08ded5fc46e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700016|23010399003|1800799024|4022899009|22082099003|18002099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	NjRIzueo7VagNTtWcksZt9MugCymkIpnOoRenOgHwAgQqAHL48yXo7dQvgY7rM6N7izJ/BA6ZHDJK7gYQJu0uJiY5JcD1F8lCL+eo/+Ym2arT8F9tT4/5fnv/OGGjPmBzmSEVPcgFuoAIfwsCjwOO/cZpbyyssqP+ptGXGd/oN7/AwCcWlSuRx+n0SM5xzO2yN1o5FM5VDuuk+op4zg1o4BfFco6svXEPc30iPPzpvag82utYoIXZP7vY83ur/uv1jVKYo4MK2k2mNlGxlPbMUY67EpK3z8gj9iIKeiNnkFin2B4zvSw34oFR9/BszOO9PKFex7tbloyfGCjhAOL+fKOaopL3K691INring+eG8D6fkUIhaAgL6Fo7dbJti3Gohxv6Yd/F6CrzJMVdVwhA76hAuUIH0zKaxL7UaFc+uydeDnVr6B5av/YzmAsHOhc1lRH7Uj43sqBaJZk9iJvL/JiL27E7EsXQ1E98etz8tEgSRd8gOQ9kkAvynln8C4VofEl16TNyQ54wTIH+10qyQwN+yJaRsq+oXOt3L71L3WRdEOeWH+RXBD7DjJaGwn3XJa7Tc0NIoVSBzH0H3YyxcFWPjDdalCPsT3IV2cvc8EEOtc0TUBnI9KqD7x1Cawmcqaca6KYxl3d226+tirvw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(23010399003)(1800799024)(4022899009)(22082099003)(18002099003)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	0dYN22onDOm+/9HmgyXpj2Xxx7uBYUNOVOizWi2HIs6+aB2xATCUcD3OjeJGjWdtiGwrDGrT0JYtWhS2xDo8L9pMBBVNywyOGdrVEmOYEap8SZkXGXRM3XkDCNxWdUq7NPwCh9768/rDOINHNpLxJphfCpjHhBKW7wGJuj3hlohYMfbpsB2nEoRQcMJTneaLJ6zugxLfkXpjKK6dItS6PfMKS4NjekH4ARy6jDWkDsL/GkO4T1vS8hc2MhM+Cwa131NewYzDIffBvs1A2TthTVSFcPN2Q7D24TjkbpbcagoK8KBuJqtMWXaowaS3LHWaQfTOn5fpjkgprjU5hmhcewLpkG09/PVI0YeiToOQSaaiLFrEr/C1+A8OJ044xb5GSIQ0LLLMb5SjzjRChNGc6Hg/kzidBaTpBZrKfD6ZGYMQK8gU8AqHx4FXjirsWokI
X-Exchange-RoutingPolicyChecked: 
	G3b8efoPlNwpAZCi9BHi9aTYMrbNKQ9tpoLwA0+Az/qYuH6UqT22vImnDQrp+bCu4GBMWS2CEtX1vRaOPLFbqztDtBjlsNeXfJ0hZT+qSuV/BM8U7qw9jihWD7VcSCAO7IAjKUhqBwkVsbtjl8efRiUxEgH0gXZllBL6zc2Psin9ToQx5aVLyhcchzCKQcYjfD2QZOrHVwFv5hoDgYDTtD89YCNtBGzQ6Sy1jgKBMLlbNWQQ7KEFmzY8Wv9gaq3zLKNl5jpZoAI4oC9erOcFk7u5FwfXpZNhYD4VGXHyILg/HISXgry3F1NX8GVSRotSUPpsJBGAkdjXnx3FlFP90A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 16:34:23.0235
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cf8e300-bddf-4be5-17fa-08ded5fc46e7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF0000009C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4755
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEzOCBTYWx0ZWRfXyNJKw2zGXQdF
 2zW9CKhN5rBzTe6j/PuMwXywMOLqJWpsOpv7dFlQ/JgtIlKV2YjMmcU0CBKOEXmJTbBeAK2+mBL
 1ohLtjV7cv0RTlpcQA9Xw/PJ9+iAMx0XrK3ed/lI8IczafZQKbGv9YxrmCMGoel+Fy72CNeEXhq
 LQhjWV+nTgdfiQSwkP1W5FJSlI/7NBANm9n7zpe3CCGd0OQjx6g1is2DtNsogmDwBsVf7UQUaxp
 Kqb56Zyj6W+/T/3L4+cMKVEZ78vxKniqAG+0rNmjoZhLnd38xY0OGOW9bxb7xTLDHDWB2v7kqCl
 3CNu2bo8KPUKjuvWX+qgmZNRrya6moaqww4zv9Zh6I7olFWLLo83lt8KZCK0+i7orCxXe3qa59d
 QaUlLGH6Be1zwgGbx1520EIzENTSkIYYw8MhU1wk5QCIgLHyXXWMBeXLYo3uCXUOH82SyB4oLMT
 uxGR6pULnInUOcuJWmg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEzOCBTYWx0ZWRfX5FkV8RaAVcM0
 6Qnh8O4Xysn8jUH1lcb90axuHbmfDGmDR1tawi7xq4+Hgcvxy7g0eV8CFcHOaWQQ9LvZ5UEHGPf
 YrBc1/+hV9GGT/iiyiOCsgyYLGsxfGw=
X-Proofpoint-GUID: MsyCkwIsFER9pXkm104X7d_yTnQ2dA63
X-Authority-Analysis: v=2.4 cv=dcmwG3Xe c=1 sm=1 tr=0 ts=6a429e92 cx=c_pps
 a=cXHsTeABgwIgPhuKzetQTw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=TDH47yfqfk5zolPf10kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: MsyCkwIsFER9pXkm104X7d_yTnQ2dA63
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290138
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by m0384305.ppops.net id 65TGUQJY2370251
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 29 Jun 2026 16:34:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20104


On 6/29/26 9:58 AM, Andrew Davis wrote:
> On 6/29/26 9:50 AM, Antonios Christidis wrote:
>>
>> On 6/25/26 5:38 PM, Andrew Davis wrote:
>>> On 6/25/26 3:09 PM, Antonios Christidis via lists.yoctoproject.org=20
>>> wrote:
>>>> From: Antonios Christidis <a-christidis@ti.com>
>>>>
>>>> Set a runtime dependency on libsdl2 for the libsdl2-tests package.
>>>>
>>>
>>> Any clue on why this isn't automatic? Do the application in the test
>>> package not link to libsdl2?
>>>
>> This isn't automatic because a custom package is created using the=20
>> PACKAGE_BEFORE_PN
>> variable, so I need to explicitly set its dependencies.
>>
>
> Odd, wasn't aware that would mess up the automatic dependency=20
> tracking. So side
> question then, why use `PACKAGE_BEFORE_PN`? What is special about this=20
> recipe
> that the test package can't be a normally added sub-package?
>
Normally the packaging rules for ${PN} are evaluated first in the=20
do_package_split task. I use PACKAGE_BEFORE_PN for two reasons: it=20
automatically creates the package, and it evaluates FILES:${PN}-tests=20
before FILES:${PN}. Without this, test binaries would end up in the main=20
package since both packages claim ${libexecdir}.

>> Currently, when SDL_TESTS is enabled, the test binaries have SDL2=20
>> libs statically
>> compiled in. However, I'm sending a revision to add support for=20
>> dynamic linking instead.
>> This is needed because customers using the sysroots to cross-compile=20
>> their applications
>> have the SDL2 libraries available in their build environment, but the=20
>> binaries can't run
>> since those libraries don't exist in the target filesystem.
>
> Sounds good. BTW, any idea why the tests statically linked with the=20
> library before?
> Even if the library includes both dynamic and static libs, I would=20
> expect the default
> to always be dynamic linking (saves space, upgradable, etc..)
>
The default build type for tests back in 2018 was expecting the test=20
executables to dynamically link with libsdl2 until=20
6cf4d0e43bf12de05374e07eb076a0c73b6f95b1 commit. The reasoning behind=20
the switch is not documented within the commit unfortunately. I will ask=20
the SDL community if they have any further info.

> Andrew
>
>>
>> |
>>
>> |
>>
>>> Andrew
>>>
>>>> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
>>>> ---
>>>> =C2=A0 meta-ti-test/recipes-graphics/libsdl2/libsdl2-ti.inc | 1 +
>>>> =C2=A0 1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/meta-ti-test/recipes-graphics/libsdl2/libsdl2-ti.inc=20
>>>> b/meta-ti-test/recipes-graphics/libsdl2/libsdl2-ti.inc
>>>> index 33ff0632..750a5603 100644
>>>> --- a/meta-ti-test/recipes-graphics/libsdl2/libsdl2-ti.inc
>>>> +++ b/meta-ti-test/recipes-graphics/libsdl2/libsdl2-ti.inc
>>>> @@ -3,3 +3,4 @@ EXTRA_OECMAKE +=3D "-DSDL_TESTS=3DON \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
>>>> =C2=A0 PACKAGE_BEFORE_PN =3D "${PN}-tests"
>>>> =C2=A0 FILES:${PN}-tests +=3D "${libexecdir} ${datadir}/installed-te=
sts/SDL2"
>>>> +RDEPENDS:${PN}-tests +=3D "${PN}"
>>>>
>>>>
>>>>
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online (#20098):=20
>>>> https://lists.yoctoproject.org/g/meta-ti/message/20098
>>>> Mute This Topic: https://lists.yoctoproject.org/mt/119980196/3619733
>>>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>>>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub=20
>>>> [afd@ti.com]
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>
>>>
>

