Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0BADC5B56A
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 19:59:23 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.63082.1786478356498658456
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Aug 2026 12:59:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=proofpoint-05-2026 header.b=R7lJOlEH;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=CrHKEC54;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BJKVYE2524067;
	Tue, 11 Aug 2026 14:59:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=reLLEOlt26DaWPmCG5kLDi/PlxuwAJp4leq+iXqPK
	0E=; b=R7lJOlEHRy8BYdDe5wVai3CDXXT41q7t8iQ/TZ8aJQEA0czu7gFybhwRH
	44h4L93JRVL6ItcTws2+JjDERkhjoYIBiTZgh0U+/4vP+Utfx2Avsh7ZpCO0LmZF
	pMqx44s5dSJT7hT4YaqKnWXhwiElzAU9wrKScVomiE8s7hNhnuCVXbTJuYvlDz2R
	6kT4yeWe9Ao+GyrAbS+tU91L5nZiKSNZkeQfXmM3D2UPuuQ25nmbcvMTW7GBelPP
	0ErY2kHaIidVonIBf/DqmIRZqx1inZKOWhC856qDXmnkphgw2xK1S3rI3HxfOj/F
	KKe3N3zJtIIjshCXCPPcASsTpa+gA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011007.outbound.protection.outlook.com [40.93.194.7])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4g00w4v3tj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 11 Aug 2026 14:59:07 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BmjHcrahXVmOn5+y7bcPCMlgxTmDaXPV4SLME+m2tGkv/T04eZjULIMAdOCalrP1Rj3+7xLOnouOm1CYbx6chkJE72cWenoOJRm5ENm36N1W2ZFFHlGu5M8vFL9Dxp6p0maUGHHFTJ118dzZn4/kiV3QYva1pd1krGge3z59qRyF+xRAdrRiUKY4kt5xC+YDxAQC3aUbFVPvzgV8rNtB9xYlKzhpAgTeBrJtiYtKAghUGblOU9BVOxRxzNmxsXBvOQJi+rNjDSuDs6Zwwj8m3Hz36Av4ItbNInw0gjzDzS22hu5wxK4OcTdfzINkbM84UdYjxdFQ27r9olEJPLdF9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=reLLEOlt26DaWPmCG5kLDi/PlxuwAJp4leq+iXqPK0E=;
 b=GDhCq/jv4an2BFzvXkaHktuTpL9xfVZv9fsu1VPAJ4Z238RTtx61KGpaeDs51YrQDbVdb6MVs2N08OBcCjYbtyVpLEcz5Gg7GbKUItqAdRAEESgJ/NLxDLCgMgfvLKWLDSEQSXvRqGEwo4kc/oGxM4Q0B3eZuNSALIIovMZHEltkgyjVz55T3xLiMIBqeYoBG9awKTQMuiYm+BUHMxspA7FrE6yc9/fWriSj2RZTCY+4Qj/I0N5MH456tl4NBlS8dpJguSoCIx7RtWjJiMf5ZrIhLhkEd6fhbRk6WPG7aqxg8bBakccwFM/gEkwIj1sAbZn4OOu9h0BHLPhYlLz+uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=dolcini.it smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=reLLEOlt26DaWPmCG5kLDi/PlxuwAJp4leq+iXqPK0E=;
 b=CrHKEC54wCQJ1t2fZgH1q4tpTeM67Yqu5Dtr987/shez0AL8toBewuJDtRGNPbJrK8txddu9boY+sQu+2fCWBkm0WpbWBRUjrW4R607EMDIttyYgN2xjCBTSMiFIEGlL0TZhUiwJBIwWEaHFDRZ/pavY2zq+3yFKT2uLtndfMoE=
Received: from SA0PR11CA0052.namprd11.prod.outlook.com (2603:10b6:806:d0::27)
 by BL3PR10MB6043.namprd10.prod.outlook.com (2603:10b6:208:3b3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 19:59:01 +0000
Received: from SA2PEPF00003F64.namprd04.prod.outlook.com
 (2603:10b6:806:d0:cafe::aa) by SA0PR11CA0052.outlook.office365.com
 (2603:10b6:806:d0::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Tue,
 11 Aug 2026 19:59:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SA2PEPF00003F64.mail.protection.outlook.com (10.167.248.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Tue, 11 Aug 2026 19:59:00 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 11 Aug
 2026 14:59:00 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 11 Aug
 2026 14:58:59 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 11 Aug 2026 14:58:59 -0500
Received: from [10.249.32.130] ([10.249.32.130])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67BJwxbX759897;
	Tue, 11 Aug 2026 14:58:59 -0500
Message-ID: <a3a25ae4-2355-47d5-8d37-3cdd89d6de14@ti.com>
Date: Tue, 11 Aug 2026 14:58:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH] weston: upgrade weston bbappend to
 16.0.0
To: Antonios Christidis <a-christidis@ti.com>,
        Denys Dmytriyenko
	<denis@denix.org>, <antoine.gouby@gmail.com>
CC: <meta-ti@lists.yoctoproject.org>,
        Antoine Gouby
	<antoine.gouby@toradex.com>,
        Francesco Dolcini <francesco@dolcini.it>
References: <20260811150043.97146-1-antoine.gouby@gmail.com>
 <20260811181911.GG19759@denix.org>
 <40172c8d-e119-4231-8bdc-84203e68e58e@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <40172c8d-e119-4231-8bdc-84203e68e58e@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F64:EE_|BL3PR10MB6043:EE_
X-MS-Office365-Filtering-Correlation-Id: 77f504be-320d-42da-c523-08def7e2fc81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|36860700016|4022899009|1800799024|82310400026|13003099007|22082099003|18002099003|4143699003|10067099003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: 
	KthzsD3MuipDdozHjRwXEUqhISxoBw2TyrkyA9ltmITVpPoR8PxNSQ7j/lH7EAtvG5NK3QPOCQ6uXmJYvt1watNcwGrQVMkKsQ4SIrOtQGzaPHsRCFzvS6qA7VMpT0Bv9kPTwI9NbRz1mn7vxMYrkUoxmx1tW8JUb5r2V3FTtzXcE0uusWbFs5HNu3LixluUn8tHDZ8nlXaUcSTre1v8aP+/qcK7A5u87Nt0Pis0B4xPRJtMH/2n/Lc4nX8hMgE/Tvd+RR2XhT0DV7fAwpaLu77lS+yrjdS3csreHIqonUEafujF3ffnLnjGbyEs1mfVZi+gU1Vuu7TtSw1jq/BrXUu10sQ8g6spKdNq/VtmkEupDvEQQ4qMteHo5mXGwf0von1jmSuLDLnYg6h7/sWgZKRjmdi+OFv+p3qnAO6Jp2WhCWmGV/NwKdQO4DkcM/UN1Nfak+5iP8HBjY21M03+QSlFB2JduJpaYq7X0oLtDlj9GXdY7XAoQ/bo2DW91p6cGOZ4r2mhUjDQVra8XSnLAnAnAhpZaPuFMsSlTGGEsDNqYnxhLW2QMqMW7djMe6rE9OYJqBMXJZKgzU7kkEgTDASXMCaf77NS5DHpc+MweHzQOMUYfnj+QS+62b9GoAki+DmU0fX638YS8VMkxMnVn8Jl+jxhoWonsEKusCLXDCpovbesx/6Q4lRKt/80MZ3cZOp3w4s7jyE9wP2w21OlTw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(4022899009)(1800799024)(82310400026)(13003099007)(22082099003)(18002099003)(4143699003)(10067099003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	D7jfk8PS27ttHzhIWzSqaKYIlKxqTS+l6iSVXHa6MGrZGiwKaU2iJ+1E7wKDqM9aMHTr2I4756XUQcXkazy7Wg55n0LpcdxfH52QURRgE9UfnY4EDzugShLChC97zcF7Zkr99w0w9cWZN/Rtk/VZ+YsyKgLMC1qQIyujG8a5yiMgAXENWJoysGHsQWnrcfNiLxU9+nDItJm2Ui0Bwjv1T/pvJoKAjicgNNelLLwprrZiNVdhJemOt5wmWH/AdLdYx9JbST8+PK+EElDb9uk96AZQXpJgokONjqs0SfokaGa6P/JF0iGX24OtJ5CJRRaI3EEjvDOhRmKYUGZH0uifj7z3vry/j3w1q1rU7/yiXXNNTmjK7sml0i2XznEApHafsphD7Pz2A+kGQcxaAxpLNzhjD1NScZbL+LQI1ioSL+YYS5Td/LthUKhbUm8OTKFH
X-Exchange-RoutingPolicyChecked: 
	IIyWGtX8T6gywOFNcAwv6RX0NL7Mc+DgCHppa1K5C2g0YOo5V48FFJVhZc3cettdGh+tIszlPg01B1ogILcuC1EHTxEUhOqtCoTg6Kn3WwA85LV6k7DGR+A9w5tbn4U6lhUVW+MSPDP9sZ95+54w0MjmIb8kdMRlVFBxyZaAoKSNEBxLvKuglC3bt/Kec76BnLTG/wJwtxKkWTXiXiqATcU1e4cqMHAsD/pkSGj7wrXX1/TLU2/Yh3fef2WUihjgklxLxxjRv3qwWgiF4NfafpjJdkph8VjXRDdoNZHYjcvn5xu2ro1NGUJom7d8kvBI9+4BtTQxvXcGb3e1s0Rdyw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 19:59:00.3548
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77f504be-320d-42da-c523-08def7e2fc81
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003F64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6043
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDE2NyBTYWx0ZWRfX8nutsGSzfNUB
 i4emUrZWahoNE9TpbBpPRD58XqYcjBVL1kckRjYMssuF92ESzNCLqEwf8yvIx/pnDPg+TvcWiC0
 hy0dXW0NvhLu6QBOt9gYtD0CcCUz0csa2E+PXD+b5wA0YAC9O6B6S7ljOY9DRKURhL+wsKkbUfD
 /hmIyOdjl0mBd4QfNXct/ZlPkchhpjUHzsUe2ItB8P47UbDI/j861iwpAgoxlh2RPki8SWZoJ0z
 Ha2sqeiclWtPnZZnIgyJ30NW4rLDqNZxW479DNNrsmrywNhyZSGY5OP5SOCDMqydjsDKgkkGfod
 KcQtSaOeyuSfiJNN6DB31qWmG73IoYJVI2BwMMe/Q85K81fTBpLxIU26SdKTZolABmeHOzHgmTb
 5WhcSUmaENHwPlMiM+rNPCq6GKCOGBgDuA307WBb+5F6WnpdG6R/eeOMFZL7uE4KWRBMKSKEeIQ
 X3jnXSkP09pQrMNMlWg==
X-Proofpoint-ORIG-GUID: xPh5f7A5sYrbRGHppxy__Jyh-tdwx7lS
X-Authority-Analysis: v=2.4 cv=KZ/idwYD c=1 sm=1 tr=0 ts=6a7b7f0b cx=c_pps
 a=4hG4CnY/eg4LDOVkUp5rMg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=iGHA9ds3AAAA:8
 a=m8ToADvmAAAA:8 a=sozttTNsAAAA:8 a=_nUFHdf3y8hcGL_Ke48A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-GUID: xPh5f7A5sYrbRGHppxy__Jyh-tdwx7lS
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDE2NyBTYWx0ZWRfXye96Z3tasbtX
 vdwCORa2bjQ85Fx1gOIn5DrdZGfRHfHMfYQctCxehPRCc79BQoHs+jpaj29nCv4Y8KDjtj2bYl7
 4jHfe8NAWwg92qruc5A1daTDdq8Z6n8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_05,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 suspectscore=0 clxscore=1011
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110167
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0b-0002e601.pphosted.com id 67BJKVYE2524067
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 11 Aug 2026 19:59:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20249



On 8/11/2026 2:08 PM, Antonios Christidis wrote:
>=20
> On 8/11/26 1:19 PM, Denys Dmytriyenko wrote:
>> On Tue, Aug 11, 2026 at 05:00:40PM +0200, Antoine Gouby via=20
>> lists.yoctoproject.org wrote:
>>> From: Antoine Gouby <antoine.gouby@toradex.com>
>>>
>>> Commit ad85da159d41 ("weston: upgrade 15.0.1 -> 16.0.0") from OE-core
>>> bumped weston to 16.0.0, but the meta-ti bbappend was still named for
>>> the 15.0.x version and was therefore no longer being applied. Rename
>>> the bbappend to match the new version.
>> NAK.
>>
>> This hasn't been tested at all. The bbappend applies 2 patches that no=
=20
>> longer
>> apply cleanly to version 16.
>>
>> I have a proper change that I'm currently testing locally.
>=20
> The current graphics driver does not officially support Weston 16.
>=20
> I can run the full test suite for graphics, and see if this move is=20
> feasible. Otherwise we need to wait for the next version of the driver.

Well, we cannot "wait".  Something has to change.  If we can't move to=20
16, then someone needs to backport the 15 files from oe-core and setup=20
the needed version for weston in the ti-bsp file.

I don't really care which solution we go with, but we need to do=20
something to fix the breakage we have.

>=20
> ~ Antonios
>=20
>>
>>> Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
>>> ---
>>> =C2=A0 .../wayland/{weston_15.0.%.bbappend =3D> weston_16.0.%.bbappen=
d}=C2=A0=C2=A0=C2=A0 | 0
>>> =C2=A0 1 file changed, 0 insertions(+), 0 deletions(-)
>>> =C2=A0 rename meta-ti-bsp/recipes-graphics/wayland/{weston_15.0.%.bba=
ppend=20
>>> =3D> weston_16.0.%.bbappend} (100%)
>>>
>>> diff --git=20
>>> a/meta-ti-bsp/recipes-graphics/wayland/weston_15.0.%.bbappend=20
>>> b/meta-ti-bsp/recipes-graphics/wayland/weston_16.0.%.bbappend
>>> similarity index 100%
>>> rename from meta-ti-bsp/recipes-graphics/wayland/weston_15.0.%.bbappe=
nd
>>> rename to meta-ti-bsp/recipes-graphics/wayland/weston_16.0.%.bbappend
>>> --=20
>>> 2.55.0
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#20247):=20
>>> https://lists.yoctoproject.org/g/meta-ti/message/20247
>>> Mute This Topic: https://lists.yoctoproject.org/mt/120702649/9164840
>>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub=20
>>> [a-christidis@ti.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

