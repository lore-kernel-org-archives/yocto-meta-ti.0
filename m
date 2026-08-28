Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 316FBC61DCB
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 15:13:35 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3039.1787930012241214593
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 28 Aug 2026 08:13:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=proofpoint-05-2026 header.b=naUOVW5W;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=ipI+10zg;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SDOvR81782656;
	Fri, 28 Aug 2026 10:13:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=QRy3hTeriCppzylrAbpdgWhBgIymNEu3T8Jqt3i89
	b8=; b=naUOVW5WZjvZl/w5w/BMcKq+AJTBnR0VPAaaHwa0rgjIhoyQKU5mHNDMj
	ymOjqU2pXUTf94ZrfGPxBBUDAePWMfKlKsRey6UD3Mh4nKzpDBVQ5C8PNr2d45S0
	n7XzYAL1g7T/YrU/1MFTlI4Zt+BSA1vnK0Dl5KYOjpKNq9kc524h3vNkHR2tHOVO
	ucefHZBMBpDIDWxxl/5JQJupbOBYUa4fZ4oqqyLoKZFCo8EQY+PX+vdpBehhcl91
	cNFRycgv3on83pnrEay0hIWpbfU/SIusxhF1SNJk+VgET/PYj4+AQwgemdq1xAfV
	VXz4AJyeJydyUk2VIg1+FbsZdYULQ==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010032.outbound.protection.outlook.com [52.101.193.32])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gb24q3yqq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 28 Aug 2026 10:13:30 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CaRbfvlFFl4+BCV+MuJcKAL7grSSyBUNRdHxONFTMUUd3H+ilbloqjwFack/VCt+nat/vMytdZImbY6+QmTtbKVyo9uGEUWeIIA+ahCedqRA63G97WBW1SFCSRX+X0s6FurnObvhpVOl2+iqDFj2AxrGtHmyAs5e6eTQfhntUIHXdPYPlpFg1GzQ1i4HkLSa0NBNN9VGYAzMdss7dj0O4EClXWed43wFRnRdofg/EfsXVN/X0Oq/GNYmfAPUBBPEq4wUSEPdUEFOs9XHM+sdHSxLvN0+cXEcjHkJmSUMmJ6RjwVFidGIm8sEuJILPNVLEgWsM7sM3oZixnhD+w7eKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QRy3hTeriCppzylrAbpdgWhBgIymNEu3T8Jqt3i89b8=;
 b=PC/dUVBqfnXs4RZw3xxPIAdIh5n4hGraQb1OeBe/LBrrkLw7/0IK+5/15UVev1CX7b/O7CbrqtcOeV8FAAHbiMWfrJi+drgR3dsX9EODEBqkXoD85aioza/v8ZljvnpSvqURB2lgYKjmiguvxVBj7J+494IXuK9kexqZFqnwQhX+69aHHVznNhgYSbU6kE+zRw5p5QPy9N89zF+MUUT6FQ9MAM0d/yChk6cacySct2+O6EMNLWqBzQ+nIR76DePUIUlVwelVhHAuy/ucPWV4I88LxHd33rt6iEdOQiQzqXQ5r9WsPoGpCyrmdShd6+ouZu8zphqNHBHwjebRTrhn2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QRy3hTeriCppzylrAbpdgWhBgIymNEu3T8Jqt3i89b8=;
 b=ipI+10zgL7O48WxyHeRSQ/QcjMUWL42bnwAYjOdwcl30EKI9SCyhS3AbKj6KBmfM1W/gcrJ3qR+slkSYYJrOk174dORiGaefhuNiUTFhTEid/bA4e/Io+MtfkEq0C5MtQ3CVUlk+EOqbi476LHEnnnoVOuW8cFfS5bXL8+gGi+U=
Received: from BN9PR03CA0193.namprd03.prod.outlook.com (2603:10b6:408:f9::18)
 by LV3PR10MB8035.namprd10.prod.outlook.com (2603:10b6:408:281::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.8; Fri, 28 Aug
 2026 15:13:26 +0000
Received: from BL6PEPF0001AB52.namprd02.prod.outlook.com
 (2603:10b6:408:f9:cafe::5a) by BN9PR03CA0193.outlook.office365.com
 (2603:10b6:408:f9::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.11 via Frontend Transport; Fri,
 28 Aug 2026 15:13:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL6PEPF0001AB52.mail.protection.outlook.com (10.167.241.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 28 Aug 2026 15:13:26 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 10:12:56 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 10:12:56 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 28 Aug 2026 10:12:56 -0500
Received: from [10.249.64.139] ([10.249.64.139])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67SFCuPT4044484;
	Fri, 28 Aug 2026 10:12:56 -0500
Message-ID: <b8e5976f-8830-42d3-bbfd-ee6a9b30a929@ti.com>
Date: Fri, 28 Aug 2026 10:12:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap][PATCH] ti-vendor-kernel-headers: add recipe
 for TI-only dma-heap.h ioctl
To: Andrew Davis <afd@ti.com>,
        Hari Prasath Gujulan Elango
	<gehariprasath@ti.com>
CC: <praneeth@ti.com>, <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>,
        <s-kapoor@ti.com>, <p-gupta5@ti.com>, <u-kumar1@ti.com>
References: <20260828080757.1160553-1-gehariprasath@ti.com>
 <ce24a4bc-5100-471f-8ef1-09e8d879d3d8@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <ce24a4bc-5100-471f-8ef1-09e8d879d3d8@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB52:EE_|LV3PR10MB8035:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b957565-513c-46b8-d777-08df0516e8ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|23010399003|18002099003|22082099003|56012099006|3023799007|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info: 
	nRc/tJWCapn7Dt4ZP8N4Efk04kPHQk+FijNA7DjY006uKH30KlCgPQUTDIKgnyi3t06cFU2wzMtpJcUgmyGInMqgB06UH+RmVLeCT6pJReN/vSxRouY3ri0avapx1/Yk0C6oWqKJ1oV0RMI3QfiGupf7s6DySBX5CJj/yYbycJUFU8Mk49mQvWeOIYSjMwM5aHJMDvZWIyxlMLybEbvcKPE91Lha8FYfkomm/RR1FTZv3CYT1DIyYNBxKr/T8e9b3+MI1kv2mmp3D2d3V1QuxLqbbAkvf5TepVNikKkDK5SwjbzpYYmeG3Xgwrw2wIWOjLBBV8zUpxNmQv8Sg9QAOhSNj6Tka6N+ztFrAIsD8OxoFXsdVx/Rj/GZ+M77q6OBQVu8hN8coea1HfdMP5+oe38DPOUOTfTCs+aVPbMU9r4FUzBUntrWfNF6TKqmR3HZk9RpzCUsTzDNwt5NBCUKb7I8v7ofpS3ZZ/OrSMaOv0r+EjRQarOm30sQNWI1DHwbC6CX3t9dONwYvv+f9MmlPYGvoIiT5bERw/QH4wNuoNvvjlnFWj32I8Lx+T4BurE1JMBrtyGqsWN/yQqTSQ7G1MWOsvnIGQqc8XnzSE2im6Z+Gewn/N7IMHO9Sz0DzppRO5gOiQndBsluINYuc/Rl0gxBQDicrvIvdv5VjMnIFK8Oqu83WLuSoh/jhXOpE6Uqk15Ve8Zz0WSGNp5Spz+jmw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(3023799007)(10067099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	I4/1LK33TOJtI8EU6lceOgWHCM+v743UxnfcFH4vqIxsFTSE5PT+VKv7b/LGVijNgGMAnt5CZBypzc/eFjx0aUFN14FU7PgaugDJGl6JYbyvY9FsKhbIE4ifa4SRRAbfxIAdFMxstEu3gbakF7xpD/6R7nOBWkxamqqclbaIBoBTGARfR9hTdafIwPvGGUFBPknBn0P6XhmridmG6Z3DW1VzFzqm881kik+UFAP9Tsg1oZOV+qkKqYy/MS3FIn6DzjY7B/dVJPvzGVg2ie44VPmqyB5SInAEFiMw8nF851yZh9ue9HHi8gSYAmiGwtcsZNhMg5PwtPPAXWDK+Ip9L9guPZ6g/TyZMhReQyVI9kd5eLHt/GRgJtVIexTOZBkMxlGYYnLGdK+gN0dr8jm2MnPFTihsrOejxgUQDb/WAsQ0x05kktGKMeV6Z4GwNArh
X-Exchange-RoutingPolicyChecked: 
	i5gUW6RzrjXDHHk8u2F/oFynmE+wxj68Co8xNrFRUgk/u62PC15/6LHuVgBl2CF8JZErUl1TwF8Fhew58X9cxX+F+GLKfbSMm1QtSBON/r5EjshQeDVgDBVvBysKxIIN+ph8XEbfCrw6dkiuk7zLHaffh9prIBvY+ksk6NxALXum5O2Uc27Bb9A5//VVDPg6GCpVsP+gGbRrC5tQJNqA99aWLxJB4fzfnoHFYvGFoJSvYOVuOEbm/Y+ZkFxb9pxNh4vPTwmUqTzaKTkHqBGsXk0Pl8dBaecllRAL5ziO+KpbTLQl8H5Xavenv9UPVX06NLeXJ2XaP8wWzaeRdcZYIg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 15:13:26.1826
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b957565-513c-46b8-d777-08df0516e8ce
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB52.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8035
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEzMiBTYWx0ZWRfXw5JoLM37mJsy
 N6Q6nz5M6XW/lprxKMHdOXF9UnW/bPtcrSXWIkbCek1sSj6JDS6yL8eN6oqS6MmGN0YU3qZMDm5
 bfiP4sSdE2cUvB0L4qTauAOH8znKPey9QeLyGkgx1nqwx7Cst8uwWZtbl03wE9k/HV6GGlTjTTf
 NTNdLMZcD+imVEefGsLO0fkMcenZzbSzWUtvcrp8Dm00GbMP04DXePxw3PboNo7+ezKCyU0p8p4
 5Vjw/yl59sWzIRgp3WLcz8CjEG0KQHcfk5Ri995xtpRo092l222Z15VSF5pZ8wTJvj71n71r3nu
 VUaSocAjbxZ9r8PBIrlSV/7UTYpGpLeH+NCyWFK6uuTn3KlgbzS+QihfMcBRmvmKU23nain5n+V
 d/ARFn2iBRC90+mP7pfhnLbTU5pXGT8Pk2yT0swhP0AQ1GvWDwAwFZcS2SWzFDMqjbJXd5gRy8u
 vUamF/2hsEX8Bxgc2pg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEzMiBTYWx0ZWRfX1bOqAeMOpuCR
 y5f5I1yCGq1mSfDy9t2AVM9CaaCzNCkv4nZ4+k2HaK9G44JPsDnRNANNxE57kFfDpenfv8n4W2Y
 sb8OPS93zQOxTPyiMVJnQyIbT8h/dOM=
X-Proofpoint-ORIG-GUID: K15TRHHYEZhwYkNlMw3CnZ0jem0x_Uzh
X-Proofpoint-GUID: K15TRHHYEZhwYkNlMw3CnZ0jem0x_Uzh
X-Authority-Analysis: v=2.4 cv=S+jpBosP c=1 sm=1 tr=0 ts=6a91a59a cx=c_pps
 a=eJMC1fB0Wmzbl6MXJ2sZyA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8
 a=6K0azUs6z0cAZvrEI-UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280132
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0b-0002e601.pphosted.com id 67SDOvR81782656
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 28 Aug 2026 15:13:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20303



On 8/28/2026 9:42 AM, Andrew Davis wrote:
> On 8/28/26 3:07 AM, Hari Prasath Gujulan Elango wrote:
>> The TI vendor kernel's dma-heap.h carries DMA_HEAP_IOCTL_EXPORT in
>> downstream.The standard header provided by linux-libc-headers' wouldn'=
t
>=20
> Add a space after end of sentences "."
>=20
>> have the custom changes.Copy it straight from the kernel's staged
>> source tree (STAGING_KERNEL_DIR)into a separate /usr/include/ti/linux
>> path instead, for userspace code that needs it.
>>
>> Signed-off-by: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
>> ---
>> =C2=A0 .../ti-vendor-kernel-headers_1.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 17 +++++++++++++++++
>> =C2=A0 1 file changed, 17 insertions(+)
>> =C2=A0 create mode 100644=20
>> meta-ti-bsp/recipes-kernel/ti-vendor-kernel-headers/ti-vendor-kernel-h=
eaders_1.0.bb
>>
>> diff --git=20
>> a/meta-ti-bsp/recipes-kernel/ti-vendor-kernel-headers/ti-vendor-kernel=
-headers_1.0.bb b/meta-ti-bsp/recipes-kernel/ti-vendor-kernel-headers/ti-=
vendor-kernel-headers_1.0.bb
>> new file mode 100644
>> index 000000000..bf7dcc3a5
>> --- /dev/null
>> +++=20
>> b/meta-ti-bsp/recipes-kernel/ti-vendor-kernel-headers/ti-vendor-kernel=
-headers_1.0.bb
>> @@ -0,0 +1,17 @@
>> +SUMMARY =3D "TI vendor kernel uapi headers not present in mainline=20
>> linux-libc-headers"
>> +DESCRIPTION =3D "Copies select uapi headers straight from the TI vend=
or=20
>> kernel source \
>=20
> s/uapi/UAPI as it is acronym (Userspace Application Programing Interfac=
e)
>=20
>> +tree into a TI-specific include path (/usr/include/ti/linux), for=20
>> userspace code \
>> +that needs them but can't rely on linux-libc-headers carrying TI-only=
=20
>> additions."
>> +LICENSE =3D "GPL-2.0-only"
>> +LIC_FILES_CHKSUM =3D=20
>> "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=3D801f80980d171dd642561=
0833a22dbe6"
>> +
>> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>> +
>> +do_configure[depends] +=3D "virtual/kernel:do_shared_workdir"
>> +do_install[depends] +=3D "virtual/kernel:do_shared_workdir"
>> +
>> +do_install() {
>> +=C2=A0=C2=A0=C2=A0 install -d ${D}${includedir}/ti/linux
>> +=C2=A0=C2=A0=C2=A0 install -m 0644=20
>> ${STAGING_KERNEL_DIR}/include/uapi/linux/dma-heap.h=20
>> ${D}${includedir}/ti/linux/dma-heap.h
>> +}
>> +
>=20
> I don't have an huge issue with this series, but let's make sure we kno=
w=20
> the alternatives
> first. If only a couple applications need this header, they can bundle =
a=20
> copy of the
> DMA_HEAP_IOCTL_EXPORT definition inside their own source.

Hari, is this an acceptable solution?  Have the app bundle the header=20
instead of trying to do this copying?


> That does have the downside of if the definition in kernel changes the=20
> application will not
> get the update automatically when rebuilt against the new kernel. But=20
> this is already the big
> issue with using custom UAPI like this in the first place, if the kerne=
l=20
> gets updated the
> applications can stop working. The upstream kernel never breaks existin=
g=20
> UAPI, but our
> downstream can and does.
>=20
> As said, this patch looks fine as-is, just something to think about.
>=20
> Andrew

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

