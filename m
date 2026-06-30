Return-Path: <jm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D6B0C43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 15:21:14 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23682.1782832868840258404
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 30 Jun 2026 08:21:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=proofpoint-05-2026 header.b=D3XMrLne;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=KebNC6nM;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: jm@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65UEdRvA804590;
	Tue, 30 Jun 2026 10:21:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=5iWyCLv1jHmNlG7KyeiZHDiEoQMMO4ajVzFt/OkgA
	Bo=; b=D3XMrLne49QUQqkpLnMjAWqP62Xv5xf6HszHWsofktnT3p4MEGWYXS5Hr
	Q+iLezUIbG9/yGJoNrN9vOouJ8sGZBLGeqLHXbDcY6GF940zQP4VrTMYgCD4STN4
	J0PrdcDgUP3dV1ngzNKvvQRghkaArGuxLJj0dnoqgzE/ku/+WPhQta3RFfn6W+0o
	akHs12xWYKdiRDZk99xERk38uuy3Xq10LrzZpa1054w8VAWJVvCXrM+dybg8t1xi
	g7xSqzbc4DVY2YTQKkWiP+OOgNfaTb6U8t3XkW+asYdpNgfY9MBAxEM2RM9jtVIp
	XqNX80/S43wlIe89C0BU8oQHKytnw==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011042.outbound.protection.outlook.com [40.93.194.42])
	by m0384305.ppops.net (PPS) with ESMTPS id 4f4cqj9e4k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 10:21:07 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZuHlTTt378zZvAUnGw4NkEgvnFdpue8+e83Fk6aFyFT2IL4PDMB4udoTkaNv0uXYY/EP+YglT1hgXSatqEPEO59TEei1GEUe29C4Vz36I7j072JunNYyejJMBKh0AP5EVLtWGz+VmiXR2NyaIkXMM4dLefaF+kmcZYXMXrjr4zfO1PrDGbSw3JezkhPWAuxlDVWQYLGHNJgbKdoWvEPZ+f1PcsTbdKn3TUHKReHpSjCjIYrG/qQ1kCM82Qqvp+zjnt5wy/wbLBkPBoUBHrmQnD8+VAj7q3HIkYd/wIGoQGvv7i42KLiX8y+yBlfC1GGi8LWOhj37SPVxHdOz/coFiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5iWyCLv1jHmNlG7KyeiZHDiEoQMMO4ajVzFt/OkgABo=;
 b=RxJs0ONLGWMsNEKSbo9KyAhj8Nw8MF2wOONr0+LO0bX/j2nU0yxPpkRCU1wUl5SIMdmnjadW6h/mQUP1vtAjIq+fD5by/Ic10Y87NQ0goNtLRECO798PxEWGnxHbALr8Jlx+T/nEmY88LOQicMlrTGv+SCtJgtq4/xD2YiSsl+qf5T4ohSzcfE3EaLu/LrczewHo2NeitTTEQstHumnXDB/D2/FzwGLnBHWNnOqhTj/7UXeVizLF7+DhghwcNRuruESjcwC3tismKrbigH3XFQAbY1D38pfApuR1vn6vUp1WxZEUn892Pvfmfe5/hbOHWlLmJq4oyt/K/g3cnWvR2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5iWyCLv1jHmNlG7KyeiZHDiEoQMMO4ajVzFt/OkgABo=;
 b=KebNC6nMSPjCj7x7dacHxAD3KuqE4pBmTSl1nD/FEZmKcoaxw0pWWCqhP8+KhZjw57Z4/HmBW7tEDbTMAf3Uhucn73aVFM4ngC0OxYyjHQkh8dR+Xlvse5zbGzV7ZwTK0f54g16RuEFhLsJUHzcJB6IP7Q6813GV0HNXNVCyXEg=
Received: from SA1P222CA0048.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2d0::23)
 by BL3PR10MB6067.namprd10.prod.outlook.com (2603:10b6:208:3b6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.18; Tue, 30 Jun
 2026 15:21:01 +0000
Received: from SN1PEPF0002636B.namprd02.prod.outlook.com
 (2603:10b6:806:2d0:cafe::90) by SA1P222CA0048.outlook.office365.com
 (2603:10b6:806:2d0::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Tue, 30
 Jun 2026 15:21:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SN1PEPF0002636B.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 15:21:01 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 30 Jun
 2026 10:21:00 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 30 Jun
 2026 10:21:00 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 30 Jun 2026 10:21:00 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65UFL0Gk2785227;
	Tue, 30 Jun 2026 10:21:00 -0500
Message-ID: <1e545a9d-5fa4-47c0-bebd-cda6dc8bb38d@ti.com>
Date: Tue, 30 Jun 2026 10:21:00 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/wrynose][PATCH] meta-beagle: Fix BeagleBadge
 build
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <denys@konsulko.com>,
        Andrew Davis
	<afd@ti.com>
References: <20260629215512.88924-1-jm@ti.com>
 <afc801a6-385a-456c-9783-84f916d39026@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <afc801a6-385a-456c-9783-84f916d39026@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636B:EE_|BL3PR10MB6067:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a468d0b-faf0-40a8-3961-08ded6bb31e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|23010399003|376014|22082099003|18002099003|4143699003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: 
	DQOQXYqozY2lzQ9X3OLiOtj6giamNrNexiDJt9K2+zojivenah75v/jHUlKpWfxR6Fr/xW1MM7q3HIX57axgyvu0oXtWQyxupU+EyB/lJl0RsBzvmHV9SkB9tAPtxct6LbTCLxDAXHXnQpyDlA29lgL8uF3ymqVB9xOkDc38rDqzAXD+3iDZb9BADdQB2iMzb46bF6L4rPZa8nuFnYOyg8QytuNy6l1R1+apmxZyxU4n57a9x6ikgO2RwI8lnabSLenxo7VYYM4oWb1jehQQi+/8B0Jiurphs4ewyiyrVi5jg9/1iS+Hf8PrDPbo2zvAO/VDS0d/mXcysMfuo0b8tVaFPdUEVv8ZOgJasWbkJzL2BAb1S3v10Q2RdsgczL+nRUkoWl4vivWen0CQox8ufAGCA1PmnhZH5jTHFw4l+HJUpAnQmdIG0fYZySHEM6nNcHCCNh8WChRYhYytYi3a3gwGRqay/EHVoDJBtn+lNRwlStjpZIGGP+Lw+LBfLiG7+6A3mAFq0gyEWc0rHWuehMxC0IE8SQH2nQQIadd4J4Fjpf3VRYUubVjuw9OWzgOGp6ghu+/lvP/mEUZQyOq+yYcLyulM604CsfngTzEQ+4qOSVJyotfoSPQTFD1bciXA8OGcJsgSJMa0NEHIHJQnC4KuJyy4ikVW+m+vOQIJyO3YUXGV5XX8xJcL0yVFn3Gq+kQ4OzpQewv70FK/Fq6QpA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(23010399003)(376014)(22082099003)(18002099003)(4143699003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ExOT+bjehRPKed/oUCUdIrC29XCfGH53zJf3jihe/7zT3PzYV8WHio10pGG1CkoOBM3057G7gr+eskRT0Wx6oovbIDPrvcHxsoBk8qSv53NvKFTMJ+B6c8kGDfcL5CVI6jCH0m7vn1XO/9rgLLSLwwBW1ATu5JHEt8fL8Uqt+c+SfNha5NIvQkJ1nfZV4ca1SukLZy3SlUKXK7aNOZw63HYOWQ628gXmcqQhP+dkeSrcdy/8r4+8H+QFR72jglKgo6Zd0YidaHodltUvmTmAjr69iXwQ1FAr8SQcQm52UcwjvgelWZ7tTrRpsxwIcN8DyEg2yEnSZPH+tYd4Jy1OfLcJMjFKOVTRd8njQf9CdmwWOHYnzFjKYVFoUbpd+lVPlQKEgTbWFrngqLuf/BvKayXGXdgvptGB7fFY68BTdvyGqzCKOtQeWEHHkXvalqVy
X-Exchange-RoutingPolicyChecked: 
	OJYDxJgqEIzLD/VqSzrnFdHF9lRSUSkADqV3f6Nzuf0WsC354YJJnrKY9LuN3ZEro4eahTYM5rQyanqm/hrtSQSCwUmcn2TVdb/xEYgLDRbufE3hJtvc7biX74WXk/zwfHyiIJZg+o2G9zK4P2pdVA8dOFXMFhykA8/zfKJpKFW7Z/erOKp7LYipXXOs48bWjhvHzz6iHhU8yAR9R0mOikNcb47Xg1JVfbX2sQJjInwhEykaiwLhhh0EdZzmpAF3qmWBvzpNGoEx066V1+APNUfwTQtoTZKp3sQl7ycIpty833vsIY4nLW2VhpTj06wu8MIA56V4TvO+lvl2zQCdMg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 15:21:01.6535
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a468d0b-faf0-40a8-3961-08ded6bb31e1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002636B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6067
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE0NSBTYWx0ZWRfX7UP43vmq2j40
 nHCZGGo2Sx3ozDSiG2ueIRJMKGpOe7OkzdSRtMNtOZcQ71+ueIDD3El/M9htFSTwWcEJdER5sQC
 pqb+B+MtL3X8Soz9ll5SPq9TIDPyTOrRAKbpoqJP7aCPrmjxaymmINcldo++nkNBVcWVyL7jvet
 XjYGN/a58Xl/cTLAco+AfD3V96f/t/Y54Fi75TbSZc0Kil1TmtLIFvf2lTGbzhXFcL9MpvOD3RM
 Mw67EY8IV7y84sQXXOcvso49p6PdVUdlEegUmEO2diYYR3eYaDAyjjsXMOxd+QbeA3fDMxMqIUV
 pfVofU+DUkUYZqZFXo2cBx+ejRslrZFwLPmqf07AN0RqU9d4BmvchNPgyFLnckGpIOiPH6oeltC
 sUscK+gzb/vPzkxosHwMmSFOi99DfuqOixIu/ksdLc8CnpADhpW8zzktHdVWK8Gi5fPW8EnKAYd
 5CPyODkkA2Wvl2s1ILg==
X-Proofpoint-GUID: axycF5t8aQLjed8m-0ifdgCZcV37bgZx
X-Proofpoint-ORIG-GUID: axycF5t8aQLjed8m-0ifdgCZcV37bgZx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE0NSBTYWx0ZWRfX4bBNoJBoe1S2
 /odGc9epMSjVmu6wcfMj4HLfCDumiczNmjsqjiUwLoFwbb7NENp50yLVkBAQXLbjhy37qF9+WHI
 L4/WxMmUX09YoupmQQT56ph59g8dysw=
X-Authority-Analysis: v=2.4 cv=M5N97Sws c=1 sm=1 tr=0 ts=6a43dee3 cx=c_pps
 a=audpxvcsMtk9YILK9bmPfQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8
 a=dPPkPwT1txe6Oor-OtsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300145
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by m0384305.ppops.net id 65UEdRvA804590
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 30 Jun 2026 15:21:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20108

Hi  Ryan,

On 6/29/26 5:25 PM, Ryan Eatmon wrote:
>=20
> NAK.
>=20
> You are doing this a global level and not taking into account the BSP=20
> system.=C2=A0 You need to classify the setting for these variables usin=
g=20
> existing bsp overrides:
>=20
> KERNEL_DEVICETREE_PREFIX =3D " \
>  =C2=A0=C2=A0=C2=A0 ti/k3-am62l3-badge \
> "
>=20
> KERNEL_DEVICETREE_PREFIX:bsp-ti-6_18 =3D " \
>  =C2=A0=C2=A0=C2=A0 ti/k3-am62l3-beaglebadge \
> "
>=20
> UBOOT_MACHINE =3D "am62lx_badge_defconfig"
> UBOOT_MACHINE:bsp-ti-6_18 =3D "am62lx_beaglebadge_defconfig"
>=20
>=20
> At some point in the future we can flip the default and the override to=
=20
> be the older one, but that usually comes when next/mainline/current all=
=20
> agree.

Ok, that is fine. I can fix and respin.

~ Judith

>=20
>=20
> On 6/29/2026 4:55 PM, Judith Mendez wrote:
>> Fix BeagleBadge DT which is now k3-am62l3-beaglebadge and u-boot
>> build name which was updated alongside DT name change.
>>
>> Signed-off-by: Judith Mendez <jm@ti.com>
>> ---
>> =C2=A0 meta-beagle/conf/machine/beaglebadge-ti.conf | 4 ++--
>> =C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-beagle/conf/machine/beaglebadge-ti.conf b/meta-=20
>> beagle/conf/machine/beaglebadge-ti.conf
>> index 78525030..c29031eb 100644
>> --- a/meta-beagle/conf/machine/beaglebadge-ti.conf
>> +++ b/meta-beagle/conf/machine/beaglebadge-ti.conf
>> @@ -11,11 +11,11 @@ MKUBIFS_ARGS ?=3D "-F -m 4096 -e 258048 -c 8500"
>> =C2=A0 UBINIZE_ARGS ?=3D "-m 4096 -p 256KiB -s 1024 -O 1024"
>> =C2=A0 KERNEL_DEVICETREE_PREFIX =3D " \
>> -=C2=A0=C2=A0=C2=A0 ti/k3-am62l3-badge \
>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62l3-beaglebadge \
>> =C2=A0 "
>> =C2=A0 KERNEL_DEVICETREE =3D ""
>> -UBOOT_MACHINE =3D "am62lx_badge_defconfig"
>> +UBOOT_MACHINE =3D "am62lx_beaglebadge_defconfig"
>> =C2=A0 TFA_BOARD =3D "am62l3-badge"
>=20


