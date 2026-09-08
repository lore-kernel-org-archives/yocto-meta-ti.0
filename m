Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FED0C79FA1
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 21:22:59 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.299.1788902571326953613
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 08 Sep 2026 14:22:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=proofpoint-05-2026 header.b=kEdb7S4O;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=fmcJaeJo;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 688HNLVx2337132;
	Tue, 8 Sep 2026 16:22:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=m8d9uyvpssr1Xw5Gc1pfAcAeCcBXe2LL9Rl+faEZP
	WE=; b=kEdb7S4ONgKzkyvCFawMHGzeYGDiE+Z/9pvKmewuPcqHTpGRiUFNIHDaj
	wMQJ8QwhVCcyG4V7WQyHDRLuHXwr6SLuYtsgyE2Z+ERzv1CUoZg1YV7eTu2ae/dR
	H+LNsAJiUfmg7GalK0f0ZUyYM3MK9RMZSsIXFVcGKQjgx4LzZ84M4iMQgVpT68w6
	+7Ph8qX/OC1FArZ02ewrxaVxSwEDkOe2GdlTNxkDQjIZbYfuTwvRvzdb25u4LsxM
	x0iUGsFjTvOXrRbSP1tADwmyGKvbylfHpLssTfbfecH/3Vq/5dBZ9Mv/OjCd84XR
	VT+X4ivYPnFMZSfCfnreywOgqM1Kg==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011020.outbound.protection.outlook.com [52.101.52.20])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gjffmvew5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 08 Sep 2026 16:22:39 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=glIe/3vgikICCbF+qdolsCqw22pwhLEFrOiocZ1WpFAb7hvLZn5MJlETisUCYzhgg7l24fNFj5ksNu3rxrGEldEcmjIrpCHQ0gOajkZZZ1C4YmDrPyB/8+ES0b+Os8Toyl31ys2XrPCa3gJiQL8GrTszve2vjbo5JxYaZ7eE1QlL/QCjwlGzD2voF7wIYXvHUY7J2e7UiGRJB9QpH66WT6QKTG2aARd3XKEuoUmPlcJQ8gTDU2ML4/dMf9F6/vYcZsFsXgUDOtPK2wyPIMPfey5wzbnMNgkQZyrB7gx70WRcuVUdBZxBI3YpyNBK+nqPPoRbm5CVonWpJqvM3chT1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m8d9uyvpssr1Xw5Gc1pfAcAeCcBXe2LL9Rl+faEZPWE=;
 b=YLlfDUTCUb/zKlHnN57m0AwDy2cblqnLqLT8+YtGsqRo1AFgl+19Vt+qeLRVCm4V7otFxDoQN48jsIRaOPkhx9tzP7oOdTyk/ZnyDeCIEyhGFlbA2nDzVzUaX+N5OOvGlKO+JsPP9W5rqnaZKUY9fw8xARxJzM9mhuWa0LKtPat0WYDl+JHR5F1hoWAywhuqg/c+jnyMTNmyIblx671EiKm7CfP0mXZKXBV35oh4scnEvE3R6nawK/nod3IYwEk9C1nazLlk2rIGjmggH3ptGUKofW47QkwJQc9ivRXzoAEElH3IqScCS7WNJMsWpPjNsF+hu3BkSPfMv5tWZyp/kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=dolcini.it smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m8d9uyvpssr1Xw5Gc1pfAcAeCcBXe2LL9Rl+faEZPWE=;
 b=fmcJaeJoh+4hihGFq2c7kE94aZ1a7OJk7opCfZ/mQp3jNmr2wU0Z+SP2JeimyBHARKBLTjhCslL6IPgGf1YALRfkK3IVh8uHv7CVo8lySSy1TaMKExq30+tmB0OgKIeR9HmCZnV45ENpEd9giUXLNHQm48DXCFX3lwELLeq1hPg=
Received: from DSSP220CA0010.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:3d3::9) by
 DS7PR10MB5055.namprd10.prod.outlook.com (2603:10b6:5:3a9::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.10; Tue, 8 Sep 2026 21:22:34 +0000
Received: from CY4PEPF0000EDD0.namprd03.prod.outlook.com
 (2603:10b6:8:3d3:cafe::2) by DSSP220CA0010.outlook.office365.com
 (2603:10b6:8:3d3::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.7 via Frontend Transport; Tue, 8
 Sep 2026 21:22:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000EDD0.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Tue, 8 Sep 2026 21:22:33 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 8 Sep
 2026 16:21:56 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 8 Sep
 2026 16:21:41 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 8 Sep 2026 16:21:41 -0500
Received: from [10.249.66.148] ([10.249.66.148])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 688LLfPX3194217;
	Tue, 8 Sep 2026 16:21:41 -0500
Message-ID: <8bf2ea01-f43c-4017-beed-7e1f122e2033@ti.com>
Date: Tue, 8 Sep 2026 16:21:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master] mesa-pvr/libclc broken after LLVM 23.1.0
 upgrade in oe-core
To: Franz Schnyder <fra.schnyder@gmail.com>, <meta-ti@lists.yoctoproject.org>
CC: Francesco Dolcini <francesco@dolcini.it>
References: <pyqpmssd7hwfvotynswv3mhg5bqkaa3fdvctg2yvuydurvegvi@n2gbtvs6wn6h>
 <18D35D9BA431637C.108400@lists.yoctoproject.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <18D35D9BA431637C.108400@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD0:EE_|DS7PR10MB5055:EE_
X-MS-Office365-Filtering-Correlation-Id: 0647008c-3fa5-479d-b7d6-08df0def4be3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|4022899009|23010399003|13003099007|6133799003|3023799007|10067099003|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Cmj5Kh65vPIgQmz/7kUELdk+ePqY91AD3+cEioVr5z5AjVNxRDbu/xqvohV4vIQKZF6EOp0sjWix+WQ7Ux5wsNfA+wrJc/IM3BKh8hOAoweZA9rsWHK1cM3RmeVKbUuMxr3waLGtWcV5EJTq9VJIPG5I9p+aExl5jgPrFOyRRIcYJe6ouWCTOdhqch20+n2+d21T6moypHESN7+IkpvasRlWI54njTFfPJ3bvx8Om1JWlTGvKXRH50oUCZsz8C0J+wJ0PTWD8yt80S1+l1i7jD+QaJI15gV0cWWT6/dz6lPfJMrF9R3T1hj1H3rzLOQAx1t5mtzeCghH6w8afLkr5E55j04OcaQHgMMbPImgeTHQzB0X5PgPHvOvoebAPr9u0EadHw8+vADyyKBZWuEwmOJna+RRxDTiH3Y8mhxJEbQLHutN4Le9Z+nUqUfb6fOJ6TlwI8tqpaM+fQbho+k5rTGdkeLvlTFvVSiMHj3bgEllfH7SbxRSA/4sjq+8E7A7i1MsRPKTcMjLlPJ+/1TnfprXegWnfYqONQqZfodQqz48efHlAu1UnaUXjOXqtHCmUcXNYNhrMBwbh/1HchXvUDHgY/TjBd/tTMLGNcXd3+VgcKx9sMKk0Dc8D6wKkPgb39EVS2+lWgqZu8kcx+r2sw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(4022899009)(23010399003)(13003099007)(6133799003)(3023799007)(10067099003)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	49cG/x3vnMaum5DLmJ7w3ZOiKYDL2ZGRUS2HS+BuJLSXWsOJSCW6+vHXmLqIWa2NxrHHcfveFy27ZhhjtX0clE92mFBq/hGh5L/2iDIq3xsngU9+bW8iklx4iI5v7lSjmy0JU/z2H57+El92VMrfAYpSWOzeFnScjPSn6srnao6uIcJ/GKgxIkQRl+ENqbtVfb/K7vQhfNDvTh1ar9R9oRCueXuRxbAugNOHMsksNn4LgxlriwfTbeaVyTr1DaYc6sDp8geKzTkemNsa94sDH8Cyf3dhJae7E7XFlJReRw+AYfCuQ3UMr3aVbKlVTGVupRkbNdWTG+v0Cso+D2zNfF3WUVcdCoqGeTtfECbtDYSmhoLqlJzygpStElfZ0IPMXnjEnbuWBe+ubVaI81inLJgWma7uK7naux5ikSz4VV9psLriFUwEhxdRGRKejBIC
X-Exchange-RoutingPolicyChecked: 
	zLYOc6sEaTRCl+E++6/FDyCgDdiTNwc2ujeFAZFjf9Gu1G8ibwPB7bsupuxYQeCAuJ/Uy0gVgozuhWER5URfVzpFHwemghwHHrsiB7WN7wA3WBf1dls3ZEdT6ELe6uSs/ycMfAHmMZ/WxO4yvxgoHRh0PCQPA4ZzMzSZkWn72prK+fllr6WIHbiGSBHhSbiRntgdRT+biRHnNfpfpM0SvNpmzxk6Ktmz/1wFazET8taFSlbBqFA8gskyAd4W0UVtGoeLEq1ykyssXCNetdpteyvby3nvHdflxBAhzP8mddNgUBZTAed1gMoWFHmdOt4lkmGVIE0POukXUWWzEV6WAQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 21:22:33.0675
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0647008c-3fa5-479d-b7d6-08df0def4be3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EDD0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5055
X-Authority-Analysis: v=2.4 cv=FewHAp+6 c=1 sm=1 tr=0 ts=6aa07c9f cx=c_pps
 a=x0D8RYL8GqfJKF6oaN0fjw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=Q4-j1AaZAAAA:8
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=apwDnIta-VGMW5T1RTkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: kyAIBbpwTjBPoJ9WIcFDQtiA26k5YyEo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDIzMyBTYWx0ZWRfX6fZcz/Zvk/pw
 iv9a+U69d9w0EiRthgGKa/xzzMqS1V68a1vsmZw2VpLjz+Ig6pgBlqo/cibwoJHKZS2/GPNNxFf
 6q7M0LE0M21hsfJUE60uKamfDjSlHXE4ck6OYZS64vyiOnsjwiomawyut/uZyY5T4IWf5//5acU
 HiHcrw6nRrukkQiT2mPuy7at9F0RRn7yfeP9ocfJKj1NueYyrlNMQZ3zjYjJytAS9OPqXtVSFBb
 pNm34zGJQShfrvnUCXDqNG5H1nglzuzLBzdK/1O0e+p6OaO6Yny5cAqhIEz9za7ip15Jx3YSYke
 tsTlQg/o9f0eqyQbaxMYsCZXByje8CUR1EAY/PO5rSbeADNBUUcybBGUI59eqsSbxobGLS7QuMM
 I4AJKrfKjjFitvuiS4i90hTBsHN1QM3XkINouWVDYJWo825PLaDFhip9fH+3MP/4K9ePm6H+Yle
 RNYnBEOAZkE04FmmS2Q==
X-Proofpoint-GUID: kyAIBbpwTjBPoJ9WIcFDQtiA26k5YyEo
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDIzMyBTYWx0ZWRfX0Qeo9X7q5wO5
 Jzjxv3eOl5mt9c2+lwosNhOcd6RHOi2uEhMlMKWWVsEP5ReMoHbIToYoufasnNDhcGhgtsl79Vr
 74ssAEYFcoIwDH3sbSpbLtLRWjvxMQ0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 clxscore=1015 phishscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080233
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by m0380145.ppops.net id 688HNLVx2337132
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 08 Sep 2026 21:22:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20349



On 9/8/2026 9:05 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
>=20
>=20
> On 9/7/2026 10:48 AM, Franz Schnyder wrote:
>> Hello,
>>
>> In addition to the patch I sent earlier to remove the makedepend
>> dependency [1], we are experiencing issues with our builds targeting t=
he
>> master branches. There is a problem with the oe-core clang/LLVM upgrad=
e
>> to 23.1.0. libclc fails to build and therefore also mesa-pvr.
>>
>> | The no-dev option is deprecated.=C2=A0 Use -Wno-author instead.
>> | -- The CXX compiler identification is GNU 16.2.0
>> | -- The C compiler identification is GNU 16.2.0
>> | -- Detecting CXX compiler ABI info
>> | -- Detecting CXX compiler ABI info - done
>> | -- Check for working CXX compiler:=20
>> /var/home/scf/build/BSP8/bitbake-builds/tdxref-master/build/tmp/work/a=
arch64-tdx-linux/libclc/23.1.0/recipe-sysroot-native/usr/bin/aarch64-tdx-=
linux/aarch64-tdx-linux-g++ - skipped
>> | -- Detecting CXX compile features
>> | -- Detecting CXX compile features - done
>> | -- Detecting C compiler ABI info
>> | -- Detecting C compiler ABI info - done
>> | -- Check for working C compiler:=20
>> /var/home/scf/build/BSP8/bitbake-builds/tdxref-master/build/tmp/work/a=
arch64-tdx-linux/libclc/23.1.0/recipe-sysroot-native/usr/bin/aarch64-tdx-=
linux/aarch64-tdx-linux-gcc - skipped
>> | -- Detecting C compile features
>> | -- Detecting C compile features - done
>> | -- Check for working CLC compiler:=20
>> /var/home/scf/build/BSP8/bitbake-builds/tdxref-master/build/tmp/work/a=
arch64-tdx-linux/libclc/23.1.0/recipe-sysroot-native/usr/bin/aarch64-tdx-=
linux/aarch64-tdx-linux-gcc
>> | CMake Error at cmake/modules/CMakeTestCLCCompiler.cmake:29 (message)=
:
>> |=C2=A0=C2=A0 The CLC compiler
>> |
>> |    =20
>> /var/home/scf/build/BSP8/bitbake-builds/tdxref-master/build/tmp/work/a=
arch64-tdx-linux/libclc/23.1.0/recipe-sysroot-native/usr/bin/aarch64-tdx-=
linux/aarch64-tdx-linux-gcc
>> |
>> |=C2=A0=C2=A0 is not able to compile a simple OpenCL test program.
>> |
>> |=C2=A0=C2=A0 Output:
>> |
>> |=C2=A0=C2=A0 aarch64-tdx-linux-gcc: error: unrecognized command-line =
option
>> |=C2=A0=C2=A0 '--target=3Dspirv64-unknown-unknown'
>> |
>> | Call Stack (most recent call first):
>> |=C2=A0=C2=A0 CMakeLists.txt:20 (enable_language)
>> |
>> |
>> | -- Configuring incomplete, errors occurred!
>>
>> I tried to understand what is going on.
>> As oe-core removed libclc, a copy was introduced with
>> commit de61ea26 ("libclc: Import from removed oe-core recipe").
>> However, with the upgrade to 23.1.0, libclc changes how it detects the
>> build compiler.
>>
>> Due to the constantly introduced breaking changes from LLVM, mesa itse=
lf
>> moved to its own libclc fork with mesa-libclc [2].
>> I tried to follow a similar path for mesa-pvr-25.inc:
>>
>> =C2=A0=C2=A0 --- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.inc
>> =C2=A0=C2=A0 +++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.inc
>> =C2=A0=C2=A0 @@ -206 +206 @@
>> =C2=A0=C2=A0 -PACKAGECONFIG[libclc] =3D "...,,libclc spirv-tools=20
>> spirv-llvm-translator ${MESA_NATIVE}"
>> =C2=A0=C2=A0 +PACKAGECONFIG[libclc] =3D "...,,mesa-libclc spirv-tools=20
>> spirv-llvm-translator ${MESA_NATIVE}"
>> =C2=A0=C2=A0 @@ -239 +239 @@
>> =C2=A0=C2=A0 -RDEPENDS:libopencl-mesa +=3D "...'libclc'..."
>> =C2=A0=C2=A0 +RDEPENDS:libopencl-mesa +=3D "...'mesa-libclc'..."
>>
>> + dropping libclc_git.bb
>>
>> mesa-libclc builds correctly, but mesa-pvr do_configure then fails:
>>
>> =C2=A0=C2=A0 | Found CMake: NO
>> =C2=A0=C2=A0 | Run-time dependency libclc found: NO=C2=A0 (tried pkg-c=
onfig)
>> =C2=A0=C2=A0 | ../sources/mesa-pvr-25.2.8/meson.build:873:12: ERROR: D=
ependency
>> =C2=A0=C2=A0 |=C2=A0=C2=A0 "libclc" not found (tried pkg-config)
>>
>> I got a bit stuck on what the correct approach would be.
>> Adding a patch to change the dependency in powervr meson.build source?
>> Before spending more time on it, I wanted to report this here first.
>>
>> Any ideas how to proceed?
>=20
> You are basically at the same place I'm at with this.=C2=A0 Welcome to =
the=20
> quagmire. =3D)
>=20
> Now that I'm back from the holiday weekend this is my main focus on=20
> getting working.

I have a fix.  I updated the libclc recipe to detach from the clang=20
version and lock into the 22.1.8 version that was working before libclc=20
was removed in oe-core.

I have a few other fixes to also roll out for the openssl 4.0 change=20
that I'm also testing.  Once I get everything working I'll send out the=20
patch series and work on getting master updated with the fixes.


>> [1]=20
>> https://lore.kernel.org/yocto-meta-ti/20260907144642.3994088-1-fra.sch=
nyder@gmail.com/T/#u
>> [2]=20
>> https://git.openembedded.org/openembedded-core/commit/?id=3D2614dd44ed=
724844df13d44b7cb6f8971925b0a3
>>
>> Kind regards
>>
>> Franz
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#20348): https://lists.yoctoproject.org/g/meta-ti/me=
ssage/20348
> Mute This Topic: https://lists.yoctoproject.org/mt/121130603/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti=
.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

