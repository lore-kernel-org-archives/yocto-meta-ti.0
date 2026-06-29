Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A04D9C44500
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 14:58:31 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39454.1782745105725734456
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 07:58:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=proofpoint-05-2026 header.b=bxQ8t9F4;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=wEm3myZs;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: afd@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65TAT3AK1834486;
	Mon, 29 Jun 2026 09:58:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=JfKwkXEv0xL77TO4Q/DSlPvxpx1k4EAi8AYx1UE9p
	tw=; b=bxQ8t9F4kggbwibbCZc/lqGFV+UmeYCjPE205LqK7XWscXkhgJGJ93BFa
	QlP/+eeec5EwCzcidVSqqqPJiEI1tzT5qJOI1Yb9xwtRqWfPEM7oq4gC8zYZlzK8
	0wdHTh4uWb4+ojEadtqHl9iC1ytBe/sSAkt2BkvSEy0hUkfANkK8ApPG/8aj9b7R
	mt56e0SPu6NFsS7YtfyipGQ4d/usN7OExDBk/DdfI2t4G8HI2ES7Vqermnp5PA5i
	blhul4VFuCsFw9B2l57jTZDafbc1/Yykp5HtH4BNjoYvpug1aWvrAQRApOy8XhIk
	dfaCkOmsvL9IOa6l6EZHlGAEn8tyw==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013052.outbound.protection.outlook.com [40.107.201.52])
	by m0380145.ppops.net (PPS) with ESMTPS id 4f3p9ut5w4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 29 Jun 2026 09:58:17 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oGCIt4i05RhZuq5EkxbiNprqcRwXxFx8iBlH4FKxZZueTAglACsrRPAac9TAeHONLYJrbZFcZbYgRSJ5mhElkle+DP7oi3JmoS2BlamcQh2S9FNzf9cBQkvAWD8SMCxEGC6a6+6ahTJr0kLg31tBNXCHTxD/DUIIVH+rH2146ixtFsnZ2fxwY9etW2fHNSsmu6dV63Q9H6fqMoR/Lk5GqMNUJgYXWH2hJjr0Mcg/fyRfVgTw3G3tBfVmtYQSsrdYCV9xk5bmm77QBUxU+04Vwc3wVfXMRpgFGwhhAC2aYFSEZAXDNbvdabQekDzsx8jNDqY2slU7ZFdsYOSi/w1P/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JfKwkXEv0xL77TO4Q/DSlPvxpx1k4EAi8AYx1UE9ptw=;
 b=mfPqzTYcq+QASmd6LyrYjtDYDr/VmYxa8lu/LK12TPop8iHTusmVXKuLOdyGS0TCR7Elle3REsdGhPtO4I44j+ZDmXDr7sIDLTyCnaBpIbgzofZjDT7lpHXzCEKSeMlvvMQLjiVx/Iis4reqcPsN1sgpVV8BJYapXcKSiHFmhh5oLvOky8Kr8tgVIhFXJz3Scq8aPawH6z8N5GJwAN2nUdxDmuUYfuYBH44/rpy+DoZvlNoUGO8y0ZXA+jUWWzKAuyd7Nds5r6fMefQyMHePWIcsX1OM1I/4m8Hhf4MYGXqaDqltjowZ9CpWTQOctyapdoCm20cZPZPVaXDMAUxkqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JfKwkXEv0xL77TO4Q/DSlPvxpx1k4EAi8AYx1UE9ptw=;
 b=wEm3myZsgA6kAm44ZQ4oCJXh4sKA0MO4KQVsfP/HLksYReFd2GuWlqD0/BmFu8YpmMzmGCC7Jyqzwcj5XTpHKiatR2r2ayppZDKly5l1DyTLsYibZ1KcnXHaFH43kbNVUJqF9HZKOje32qLJaqU+XzDrNt78LAMtmZHDqHoxe9k=
Received: from SJ0PR13CA0102.namprd13.prod.outlook.com (2603:10b6:a03:2c5::17)
 by PH0PR10MB4631.namprd10.prod.outlook.com (2603:10b6:510:41::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Mon, 29 Jun
 2026 14:58:11 +0000
Received: from MWH0EPF000C6187.namprd02.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::43) by SJ0PR13CA0102.outlook.office365.com
 (2603:10b6:a03:2c5::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Mon, 29
 Jun 2026 14:58:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MWH0EPF000C6187.mail.protection.outlook.com (10.167.249.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 14:58:09 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 29 Jun
 2026 09:58:05 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 29 Jun
 2026 09:58:05 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 29 Jun 2026 09:58:05 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65TEw45w761965;
	Mon, 29 Jun 2026 09:58:04 -0500
Message-ID: <5ff6423c-3076-4690-aa09-08c35649a89f@ti.com>
Date: Mon, 29 Jun 2026 09:58:04 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/wrynose][PATCH] libsdl2: Set runtime dependency
 for SDL2 tests
To: Antonios Christidis <a-christidis@ti.com>, <reatmon@ti.com>,
        <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20260625200942.1370480-1-a-christidis@ti.com>
 <fbbb7452-b179-4382-870a-5e38cd9b8584@ti.com>
 <d6d816be-491e-4bdd-b81c-1b31b1e4d51d@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <d6d816be-491e-4bdd-b81c-1b31b1e4d51d@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6187:EE_|PH0PR10MB4631:EE_
X-MS-Office365-Filtering-Correlation-Id: 760471d6-fc28-46e1-b2a1-08ded5eed5e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|4022899009|1800799024|376014|18002099003|22082099003|13003099007|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	7EwNrQcu/1DpLGJ2wLuhvUveeT/OzC15Ww1ADZ1O3sS/NLiUxI4kki9Wvk0Y5PqodA90YPOrFmX0ibZWYO4dgrFdRhm2jufahpjUcE0kZgv2NALuEpiEERgYJarkUQeLeAZsIbVbpsndICRFv9cwPHz/LpYtg5HIliRMqwno+RrmHvqzwGydaDEjxYsQagFbw3PgGN26Eo/3EsjdsBt8p/8inXNCNyTuIG8w+d0ynLhogexQANhnB9BJADH9sxog2bx3kfVZZVohokgbbnx4iLOd4E1soJEdweLAt0FdK2GwlcZ2oQZGKkEqDoQPlwuUfH88EsaNkSdjgwVY8RGQ/FUAN7b0psOXlQtTwuIuRnfOFkhZMJJt1M+OScUfKCSc3N/GQ+nWOuLZbWiDusWzGcPCl7ib3ghOCYXhdj1l0ucn7auAia8ba6RepFqYtLDtaBdUWQ4hSRpFBDkv+MQ2C+CqBpS20qNn+W1Og9J3EOq4fZKBqsJHEM9rc5dyIimfKxEGvQNAFfRk5qEbmMYszWeApXNSaA/LSsNK3Z/rOb6ECfktNVPjoCZyRH8bQalafKuwtDPDznsjvLIh0VkhEhppUDOi/FV0APs5gm1sy7Bb21F1iavT6KbkTMA5grIdXH7Hn0L8aqoePBC37dYypQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(4022899009)(1800799024)(376014)(18002099003)(22082099003)(13003099007)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	qlRT4UcncCKXLe1ZqzWVshzLnKGY60+wFO4STGM3BkmzxU9OH1owrNxB8+YUVhY8UUZV25yeyGIZkEJnuIkGTI4oVm89r8t1JrUYV8fJt/wZwQdbWMFR47dDVPsusLiM1cXuJMs5kM5wPQNOExPT4fiCKbg36iWNoAorfRtXgNMXF6phMXunD8V7L1FEuuL59s4rvntabFf0TBj6v5So7MZ8OpjGczp+8G/BFiaqsJnCbtvORDHHM6TYvYi0i+LtmhLycYjEkACg725KL6Zmkj07Y74qQ6HEq65/e/2gD0wE4en8150jlu6Is3Fn77r20JF/5UCBT8waBNLrZfkL1XzgNS/4r2JFHB34D5aMO+3w+zGrPwaLgnmRAmWqsr9NYgY1tlDylp+z8YPmcmjtldSngclk6mtLgBU7Qtxd0fLlS9QEDyzobj5NStcZgKz4
X-Exchange-RoutingPolicyChecked: 
	jUzg1Fbl9q76IBrlGLLM3Ze1808DN9v2g52jvKyqBE/mVIE7RlPuE59Le97RH8PFB9mJ2RjV0Wqf3XDd9pQNGViJHHmsazD1l18cW0dypoTDeYdRwDrgvhES32+83gifCxoeUmA5H6A/74bH+THDaRSs0ukMugu2KPk9PdTzxsfZ37NbQW+MpfdqTChfljcSSjCNbRDemrmx9luL9BhtrahtdxzaUZPLGtldInnl9ZJBjNy3zFQXNaUV2LkqE3BU42Box2XDfHEOpn8H/1RzBqou9FP0cHsYgOoQ6+ptBuEKquhpN8incf0ugsKkiXZa+/x5MVHx96kiy3F2qTZJ9g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 14:58:09.9210
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 760471d6-fc28-46e1-b2a1-08ded5eed5e3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000C6187.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4631
X-Authority-Analysis: v=2.4 cv=L7ktheT8 c=1 sm=1 tr=0 ts=6a428809 cx=c_pps
 a=VtjYC05bhoYYzE9JtrBllg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=E9iorufSxPKg0DWyflcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: 4IWRMYHltCYB2KPRwoHDeE31TCAEAcEc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEyMyBTYWx0ZWRfX13Pr+w0V2ySU
 +2EFSmPs5bkFqarDNKo6LX9F75DIq5EgvUlWoYZd934cunX9ZX34hKyKOoIqnevGpuizFb9vls6
 ImhxtlEuGHDEMR3WZuXVKwISB2f88rgomMS53oYOV14QoyVAxrjhsLywhJGcN59bAKhxAcQH5n2
 SWUvWd1Z7wvo4kWr28mqX/j+hUwU7q+SBQ0m23D8Q8vzqmxzVznAVxRKTcD7Z62lA9tMKdj+7cT
 clC16q6AxRqerj4D4dWk37BsSFn8sWMJZP8rgWOW2n5bsvz/Y2dda9Iv7GKWPnd2JVhUzAmaSXP
 zbNGPuiUWhTn3eVnPqVfRYln/k5Zlyq18rY21OUXfKoD0czOoxjNYvsb1I4aiAvnWmx+EsNRLuW
 GkNX/MbS/jq6io8Y0b16YVxQERM3aTR0o3S3UkJZrRgbI+j+CvKx2BaQw0Qy6Epruz5HOu7bmsS
 ZdL7BnEx55nXGGoVvfg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEyMyBTYWx0ZWRfX9BX9q+pXpitT
 DN/MeJfiPXCItCV2qxncicTyqvxiS4oIw2GcOgOVQMeHIqmu0sl2o8PQ9PG1X3NORQ4sCGIEZq3
 kN6vo1u3cxIYkNpchVPB7AEyuzCSQVg=
X-Proofpoint-ORIG-GUID: 4IWRMYHltCYB2KPRwoHDeE31TCAEAcEc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290123
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by m0380145.ppops.net id 65TAT3AK1834486
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 29 Jun 2026 14:58:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20103

On 6/29/26 9:50 AM, Antonios Christidis wrote:
>=20
> On 6/25/26 5:38 PM, Andrew Davis wrote:
>> On 6/25/26 3:09 PM, Antonios Christidis via lists.yoctoproject.org wro=
te:
>>> From: Antonios Christidis <a-christidis@ti.com>
>>>
>>> Set a runtime dependency on libsdl2 for the libsdl2-tests package.
>>>
>>
>> Any clue on why this isn't automatic? Do the application in the test
>> package not link to libsdl2?
>>
> This isn't automatic because a custom package is created using the PACK=
AGE_BEFORE_PN
> variable, so I need to explicitly set its dependencies.
>=20

Odd, wasn't aware that would mess up the automatic dependency tracking. S=
o side
question then, why use `PACKAGE_BEFORE_PN`? What is special about this re=
cipe
that the test package can't be a normally added sub-package?

> Currently, when SDL_TESTS is enabled, the test binaries have SDL2 libs =
statically
> compiled in. However, I'm sending a revision to add support for dynamic=
 linking instead.
> This is needed because customers using the sysroots to cross-compile th=
eir applications
> have the SDL2 libraries available in their build environment, but the b=
inaries can't run
> since those libraries don't exist in the target filesystem.

Sounds good. BTW, any idea why the tests statically linked with the libra=
ry before?
Even if the library includes both dynamic and static libs, I would expect=
 the default
to always be dynamic linking (saves space, upgradable, etc..)

Andrew

>=20
> |
>=20
> |
>=20
>> Andrew
>>
>>> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
>>> ---
>>> =C2=A0 meta-ti-test/recipes-graphics/libsdl2/libsdl2-ti.inc | 1 +
>>> =C2=A0 1 file changed, 1 insertion(+)
>>>
>>> diff --git a/meta-ti-test/recipes-graphics/libsdl2/libsdl2-ti.inc b/m=
eta-ti-test/recipes-graphics/libsdl2/libsdl2-ti.inc
>>> index 33ff0632..750a5603 100644
>>> --- a/meta-ti-test/recipes-graphics/libsdl2/libsdl2-ti.inc
>>> +++ b/meta-ti-test/recipes-graphics/libsdl2/libsdl2-ti.inc
>>> @@ -3,3 +3,4 @@ EXTRA_OECMAKE +=3D "-DSDL_TESTS=3DON \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
>>> =C2=A0 PACKAGE_BEFORE_PN =3D "${PN}-tests"
>>> =C2=A0 FILES:${PN}-tests +=3D "${libexecdir} ${datadir}/installed-tes=
ts/SDL2"
>>> +RDEPENDS:${PN}-tests +=3D "${PN}"
>>>
>>>
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#20098): https://lists.yoctoproject.org/g/meta-ti/=
message/20098
>>> Mute This Topic: https://lists.yoctoproject.org/mt/119980196/3619733
>>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.c=
om]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>
>>


