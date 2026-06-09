Return-Path: <jm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F05D4CD8CA8
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 21:09:22 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6314.1781039361398626580
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 14:09:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=vtZ+xbU3;
 spf=pass (domain: ti.com, ip: 52.101.61.31, mailfrom: jm@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H6oSGjf011UrHceJHiw6GcweHwD3oTbchqRYm43LE9HQ1ZHQ+eM+AIjUUdsEbQPKdBdWzO/owRwMWZ9TH7YI2Aos4S+M+VnDPeOLw+uKIpUp9xyRsitN9NjI+FbjkazUnyGzDorric9FfoY5hzeqD/b6+vD+c2/2gN8ZUf6GnQtOwuuFMH+0yCABrDsywC+UEi1K14rzYEp+SE6F0yjF6GvHsBWC1De0DU7omH96TIVOjb8elTDNEaGmldv5v+ZCfWzmv0JPoqVeKdE6/F0Gc0yHgWmWPOwr/g+vwC8To7fixtsEI8RIz4t/r0e0sCmHTOeCnquqtklvGLe8LKYDAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZHQEPQDjte3US2C59EqdFvaF+OMOsV6SZWmzTWFjY4g=;
 b=ki/S0o6G/aPVq49TthYafdfASuxmb/FbG/6hFhWB4R9hooBJIRfOVTkpe94Te7y22FNBv3wHTcdRGIltDtUq3XOoOzLD6/Rx9pp8oJeg+PACJOZOWhU86EDmxWQAl75r3WqjMCocVwOAMIRU3Dx5tKFdlc0qF2xH62OPK3IG/OHSJaGGm522crZeiIZqYsDDHpi4TWpBjivnzoQgbQBMtnnI6yMf8zFZbgs1EfQqtXkmqNkU3ll/lNaYvXmC2LyyUiGmq22V/Aew00Ot8xMfRIi0McxQPoMa3WnyeJPyATmzSts78qTfJ9FrEhDdPx5Ng+a14fbz6eC77pkfygM9Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZHQEPQDjte3US2C59EqdFvaF+OMOsV6SZWmzTWFjY4g=;
 b=vtZ+xbU32UsY+Osm2uJiJPka9Ftfee37WwgiBTFft8YWa6kjaITfEowHHfjeQjuWtld60Vsrxrsvr3NsxlF/nErNj0UE/2Yloh8C0UdAl2mkwbA1L1eu/84UVEm0Tpuon4ucXFjcmcJo70c27TsHwf7Nf8dmU3GQSK2Pq88CxLA=
Received: from DS7PR06CA0049.namprd06.prod.outlook.com (2603:10b6:8:54::35) by
 IA1PR10MB8211.namprd10.prod.outlook.com (2603:10b6:208:463::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.13; Tue, 9 Jun 2026 21:09:18 +0000
Received: from CH3PEPF00000013.namprd21.prod.outlook.com
 (2603:10b6:8:54:cafe::7f) by DS7PR06CA0049.outlook.office365.com
 (2603:10b6:8:54::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.11 via Frontend Transport; Tue, 9
 Jun 2026 21:09:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH3PEPF00000013.mail.protection.outlook.com (10.167.244.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.1 via Frontend Transport; Tue, 9 Jun 2026 21:09:16 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 9 Jun
 2026 16:08:54 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 9 Jun
 2026 16:08:54 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 9 Jun 2026 16:08:54 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 659L8sJ42426521;
	Tue, 9 Jun 2026 16:08:54 -0500
Message-ID: <b1e91350-be44-42ea-988c-de7d5b5fbae4@ti.com>
Date: Tue, 9 Jun 2026 16:08:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH] conf: am62dxx-evm: Fixup packaged
 overlay list
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denis@denix.org>,
	<reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>,
	<denys@konsulko.com>
References: <20260609202801.18252-1-jm@ti.com>
 <2da95be9-31a6-4224-9706-323e5d51c2fb@ti.com>
 <20260609205307.GJ23325@denix.org>
 <af29fabd-905c-4ee3-a092-7635a413e8d1@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <af29fabd-905c-4ee3-a092-7635a413e8d1@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000013:EE_|IA1PR10MB8211:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b7240ce-a4d1-4c05-06e5-08dec66b5dd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700016|4022899009|82310400026|18002099003|22082099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: 
	jj/TDYtYNEdUKaVm8XojlV32QCSlqvWU/YW+iMyJRl5eoD8VZK0D9SWhslD/BLBnDhqrlv+w9BWAlvukShcAB0xc7Z0ZVkrJvu/jCZvWywusZMhGcQ5w517qEp2upL4ShbM7NB4jtPUT1aXGE4FWU+5W/mS+BnuGQXh/Qg7Q5m/eRF4ZfjpVZsH15M0IoUgBmp/EpaSBqNbAZONSl+mfJhjnaq2pU0ieK9YWA348tPHk4S8GUABsCnANjU1mnPCj558SrTa0QqSGpfvCUkrd9FO9PIBhN1YYMjV4VVDpiIVwdqeInMcGmSAKjKtaE0NKHzSDekbi6m4l6DiEKc7fTPgGJeaWJU9pSUBm0OM/EnInZKqaDwz6skL6HEFzo+TiPGa1dhl4TJwzatW8lNGuECZZOJ2TrlzIwiQHNgDu9uY1v6nFcw4VC2vO6vxRHmsSSi+eWRLGtU95cN6k8FuQa9OXkuFm27X4ffaDj8+Bn+Zh+R1FN7uCBjJS4FPJZc16Z6XjliKmljJ5ML8uHbHqI8TXnckS9XAg91NNIfd1HDj2+3qZuz7z87GJbqno+/7nN8HBK0vexqxGH+GnUtUMx5LUOyc+wXMVh6pCRLK4v09wtJiDL3tNtETe026RVAdVaRA6A+QkWGYCB1g98bwMFMBqF0yxolQ6awwNOuUaBSL17GvahEJG7Jf468RIyH+JcAObYobN2zcV9SDLvFomNBFc63AwMw/Mf7VF9DwqA+w=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(4022899009)(82310400026)(18002099003)(22082099003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	eRH4H3jQOa8wvXo6MAf+FSv5/4s3B0f04Dfh7iDw1ukJx2/XFoDcR6fDmnvWUuuzw52I436u35goqxyjpQZXBnJa0UQuatVVV0yQZYYrTEKTEWzglB00gCUn+0fENPt5BlyGLrLZAyuOFVCokoI52szzEn2VknshJFrWj4CNZHkVjqAT9/mh8rcnpjAW3xXyFYgnBOKPhnUmE+Sxip0RDCt2np53XOztD6SAytgYDbisH9ygdEQmx0YuWO6k+tDAKUMMiLafbcbXiH2PH3zNgxKdqXWxcWtsbBHz3iejVeRZA/CrS1HrqugMOybCr7UUkpdd2cGri9kk9irFz9qOHOL+mJBJBgKU4SWEPvw1AtuOofTCbiOt/XZeGUHJsjI/WSbkhJPPAOlqHvzM3tsWV5ifNUZ5Q2P6eAZkA76t8ZDUaJAG0zeqTmbWZKMzUm8P
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 21:09:16.9864
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b7240ce-a4d1-4c05-06e5-08dec66b5dd0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF00000013.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB8211
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 09 Jun 2026 21:09:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19999

Hi Andrew,

On 6/9/26 3:58 PM, Andrew Davis wrote:
> On 6/9/26 3:53 PM, Denys Dmytriyenko wrote:
>> On Tue, Jun 09, 2026 at 03:45:05PM -0500, Ryan Eatmon via=20
>> lists.yoctoproject.org wrote:
>>>
>>> I assume this is for wrynose as well?=C2=A0 If so, please make sure to
>>> add it on the subject going forward.
>>>
>>>
>>> On 6/9/2026 3:28 PM, Judith Mendez wrote:
>>>> Some k3-am62x-sk* overlays no longer apply to AM62A/AM62D boards,
>>>> update overlay list packaged for AM62D mostly to include the new
>>>> k3-am62a7-sk-mcan.dtbo without dropping applicable overlays.
>>>>
>>>> Signed-off-by: Judith Mendez <jm@ti.com>
>>>> ---
>>>> =C2=A0 meta-ti-bsp/conf/machine/am62dxx-evm.conf | 9 ++++++++-
>>>> =C2=A0 1 file changed, 8 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta-ti-bsp/conf/machine/am62dxx-evm.conf b/meta-ti-=20
>>>> bsp/conf/machine/am62dxx-evm.conf
>>>> index ef9df2f7..c776ffbf 100644
>>>> --- a/meta-ti-bsp/conf/machine/am62dxx-evm.conf
>>>> +++ b/meta-ti-bsp/conf/machine/am62dxx-evm.conf
>>>> @@ -7,7 +7,14 @@ require conf/machine/include/am62dxx.inc
>>>> =C2=A0 KERNEL_DEVICETREE_PREFIX =3D " \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am62d2 \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am62a7-sk-edgeai \
>>>> -=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk \
>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk-csi2 \
>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk-ecap-capture \
>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk-eqep \
>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk-hdmi \
>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk-lpm \
>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk-mcspi-loopback \
>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk-pwm \
>>
>> Why are these needed? Shouldn't the first removed more generic prefix=20
>> cover
>> them all?
>>
>>
>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62a7-sk-mcan.dtbo \
>=20
> Also this one isn't a prefix, it is just a full DTBO file, why not:
>=20
> ti/k3-am62a7-sk
>=20
> or some smaller prefix so we get all the future new overlays.
>=20

I was not sure if all ti/k3-am62a7-sk overlays applied to am62d, that
is why I did not carry out that change. but I can do that if there
are no objections

>=20
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am62a7-sk-rpi-hdr-ehrpwm \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am62a7-sk-e3-max-opp \
>>>> =C2=A0 "
>>>>
>>>>
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online (#19996): https://lists.yoctoproject.org/g/meta-=20
>>>> ti/message/19996
>>>> Mute This Topic: https://lists.yoctoproject.org/mt/119730108/3619733
>>>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>>>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub=20
>>>> [afd@ti.com]
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>
>=20


