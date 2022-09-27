Return-Path: <paul.barker@sancloud.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56FA3C54EE9
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 17:01:25 +0000 (UTC)
Received: from GBR01-LO2-obe.outbound.protection.outlook.com
 (GBR01-LO2-obe.outbound.protection.outlook.com [40.107.10.108])
 by mx.groups.io with SMTP id smtpd.web12.13808.1664298082866848549
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 27 Sep 2022 10:01:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sancloud.onmicrosoft.com
 header.s=selector2-sancloud-onmicrosoft-com header.b=GtUVjv+v;
 spf=pass (domain: sancloud.com, ip: 40.107.10.108,
 mailfrom: paul.barker@sancloud.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cA1mQQqqKLrQPLsQ9yWtNdedT+YJgXpPDqRfQxxC2Sv3+KxQTdwDTYJZS0I4pF8096rr0+p7ISFFpqUblU5hjSmXX6vzEwTHb6lB+wvoxt35wjG3LxTpUZ1c55WjJ/dOMxSPrO76v5ke45MZsHfb98KjY3CKsxzZrXBtwd19NoDlNArrKB+jG7Z3bmADJ6bNNcSOELeMdz5jReVRK908x3QXNedNSIgK5ZHPQ1kBO+yVjACaRE31abqzHjv/opOiocThpwqOa9x16ZgxqdMNUDdsnRenwZlcxSFNIrW4I8r4WhaRUaOXQ1/gC3SZF2WH/PjrEwabOy0tL+uGVsc/xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=88Po74C8qoIVJ3dRw2G3VJzWvGro0sW9GtjGYujRy70=;
 b=eTiknmk5+KMzsDa+g66BumH1ctrG+lOl+GxXS58yKY0myPe0uKt83S84+MOJiywccCIh1y1MN4ET02kpuSu69IZjJFX8Pv3GK5zuaP8y3V5cHU8z9h9QiV64pWoam7ddls29MioTh/Yp7Dhs7A+oTi2dkX/WP1mQnVzB3fivTjEmKEfGx5ZxPEL6aCab5e/GRoHnoPy/e/gp6GJT3IRd+AYczVkfIaCm1KlABpefK4E/6eBnHxkPGBUgN0Mu4gsUEbGZs5+KzFGh/Mp3C9t80cO/3tuJgZCpAby9zAfPxLsf3OxNeu03J6GtKVxals4p4FaYNq+C0zLbrwSi+Mo7/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sancloud.com; dmarc=pass action=none header.from=sancloud.com;
 dkim=pass header.d=sancloud.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sancloud.onmicrosoft.com; s=selector2-sancloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=88Po74C8qoIVJ3dRw2G3VJzWvGro0sW9GtjGYujRy70=;
 b=GtUVjv+vSfqgC5Dfw6mXR3v3x6EPQ6Y6oYC31eYLWU1Tq0BRg9AFL/xs4UOQgrN/Lf1XyENUxTfe665vLCHOUFVuLlc6YuG5AJmMUGYuHgsabwr9lAXred2JiTMT6zFh0/8517OphCcytQZHQ/T6fzSkOQzSlX+yYgEDZfSUjuU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sancloud.com;
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:61::19)
 by LOYP123MB3374.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:116::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.15; Tue, 27 Sep
 2022 17:01:19 +0000
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::11d5:40af:9060:6b08]) by CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::11d5:40af:9060:6b08%6]) with mapi id 15.20.5654.025; Tue, 27 Sep 2022
 17:01:19 +0000
Message-ID: <0ba3f29c-3e37-ab9d-93e1-82e9da6ccc9a@sancloud.com>
Date: Tue, 27 Sep 2022 18:01:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
From: Paul Barker <paul.barker@sancloud.com>
To: meta-ti@lists.yoctoproject.org, Ryan Eatmon <reatmon@ti.com>,
 Denys Dmytriyenko <denys@konsulko.com>
Subject: Build failure for beaglebone on kirkstone branch
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------tm2aBTTB2Sa0nDhhMygVH0tt"
X-ClientProxiedBy: LO2P265CA0433.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::13) To CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:401:61::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB2241:EE_|LOYP123MB3374:EE_
X-MS-Office365-Filtering-Correlation-Id: 3628514d-3347-4b12-8218-08daa0a9e5ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jwi63NASK0KoFoog0mtbGOMMDfa1ENUG3vdwqn+yDeYtoL/Po4VW45L3XlYBKSGjZuKgqU1bJVDq672MHPqvT5/BPEQgDFVNDKJ+lubbjm+m3lLKq8bvpxxY53NfJLH+ktpIwtQh/LEykYk3icFsDjhkKQGQEzlbqiGvU0yK/o9rCPymOHU/xNsA4bBi7X94whhC3zuqUhftLewrqVdTWYj+5fjgOnWJnq5RdXb39WOj3iNqhqbU2pzlAqgPNRAeBsConksAe9wrtbczSVelq2V7qqZpYYrbrmc6OBGY3+py2T0cNrYKlMLdCznAe2e/INOl09Jf392JRb/IJyrpihgpwAJzwvqMJt7mZoDHTPOFnL9RFG/hA72ULF86k2BzLfaTLdyuROJ1B8Uc3faap0+584vSw8wdSiqvti0ra0rQ6umIgP8fQwr3yNOxFpbPinDycfivo+vJoxvljWJeMxwq5AlLVfdn9pRXLWC3UITkHo8DNzCwOF9N6KzwP6mjFogYmQtZYfZ3JYFNJ4Z5li1KH8xe/dcVo9r1Zzs7NmWR2LsadTngMBvgeRO1efddWTC+xsR+WUV6V0D02YXSPx/jV6aQW5/5Ck+AnfpNrg0ZlBk4fvDcqi2cSe6CikCxJEAD0G8dQUhjVgI2QkjRCbXZXoWCOIsLLl2Bvwautqnm56si8sVRhH3M3QNFQC1xgPTcCyAYZhaZRzUhd3jtPhzBiFxJl3MvxvnU3/mfamTaom3eXRAwBTEL01UkX+nGTVhqh+kX+TInloTJxcQHiih0nXaRn1fpSubFzlikx17dz6clXOPkcZ1AC4V1sm1FbpHZDhrYFyTytq6i/ZJMKBPpucJTTUj/yTK0BKLqih1pood38rJd7wPTbmsySyg0
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(346002)(136003)(396003)(366004)(376002)(39830400003)(451199015)(44832011)(38100700002)(31696002)(110136005)(86362001)(2906002)(38350700002)(33964004)(316002)(52116002)(6506007)(26005)(6512007)(8936002)(41300700001)(478600001)(6486002)(966005)(66946007)(66556008)(66476007)(5660300002)(235185007)(2616005)(186003)(8676002)(83380400001)(21480400003)(31686004)(36756003)(175373001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?K0F2QTBnRGtPemNDc25OY1Rsb1pna1VtdW5UUXhIblA1T1RCNVRGZ3RaOEFI?=
 =?utf-8?B?ZjlTSlJDRVJ1S0x2MnRwQTNWN2Z3akVIcU1xbDYwZGo4KzErMXQyZDgxM1Bo?=
 =?utf-8?B?Qm1zYWozZTRTMnZBQzUzcHNYVHVVdGZoUm5scFJVdVpjYnRzbW1zT0tGdUJS?=
 =?utf-8?B?SlFXd0lGQkRUUlllbC90QVM5NlVuZi9BbEgyUzdQakJIOXBFVzVneHZNNnY5?=
 =?utf-8?B?aUY5bS9IOVFPUSt4aCtJaTdqRUZsRTk1N1FlMG13UWJMK3R3QjRENllLT2Iw?=
 =?utf-8?B?ZXUzK29ZdVlDdDViSjVUZFB0WCtTcFhjZlA1T2l2SWtacE9PV2hMSHp1dmJU?=
 =?utf-8?B?K2I5bEM2TWEvSlpLL253WmpaWWFiM1RJOHYrWTdDdFNXWCs5ZDVycWtKZVZo?=
 =?utf-8?B?K1ZQV21EU2N0K21pRnk2Umo3NWdHNHJ2Mk0zSXp2eHNxYTBjcXg5UXVnRjRJ?=
 =?utf-8?B?WlRNM0VyTXVWV0pXN2c0UThCYU1xd2NzakFCVytDSHh0enFkL2J4Q00zYm5R?=
 =?utf-8?B?VFFvVDZaK1FMU2J0cGQ1Q3hzRjgwQmZxeTh6Z0xib3lpUmVoSzdDTE1DdmQx?=
 =?utf-8?B?MnVxZVA5bmlqUDlwRjJUSWdEZnc2OENGQmZFSURmNk8wR3FYdGc3RWFpaHY5?=
 =?utf-8?B?N2tPdUtlckZxb1ZBMk54RVBPQzJsTG1Od1NNM0FNR3VWdHlWODNSWXZZMkxa?=
 =?utf-8?B?MU93Uzd6OU45U1FKNU0rZDF5L1JvYXVjaHdoaHpYTXdkbXJZZ05BNkU4T0Jj?=
 =?utf-8?B?TXczTS8vc0g3bDV2TXlQL3ROdzM5QktuSEJHYkpVSk44cjhQT01WU25FY211?=
 =?utf-8?B?RDBHMEY2V3JVdWw3VHI0SFpwTEpvNnFYaWxwNUkvNHBIMG13NjB2bVFaZEhu?=
 =?utf-8?B?b3IzQUt5MnRFeC94eXkvR05JU3k0ak1TRTZTUjQ1RVVMeEhQZ1dRMmxVK1Ez?=
 =?utf-8?B?M0xWWXAwY3l4Wmhmc2tjNHVNQ0daZS9uQzYrYy9YMU5uTkJ3YzlnejFLd1o0?=
 =?utf-8?B?dTJtMFZGZDExRWJVeUU0eERtVlRzMGl5Tk9HRmRKWVlOQ0tqY3NTUFN5aGtk?=
 =?utf-8?B?bWsxOVlrMWh0aEptZG9WTFk3bUxHVS8wYTJ3aGs4Q0NzYVlzZ0lkWnpNaUdj?=
 =?utf-8?B?U0p0MkhtSWRucDBOVW9uWWdVTHRSemEzNDUvRzcxYlFRaFZGYTFDSzUraVlD?=
 =?utf-8?B?TDZ2QkZQQkhRSml0QVJtWmpyQmZsYWMxQkZNRnRRWlRZSEVtNkgwdVNPMjdo?=
 =?utf-8?B?RSs0YzFDT0ZwNnVUelhIaHo2b2JYQkI1UWQ5clYzNVhKODl4a0huTjNOSDha?=
 =?utf-8?B?MHZhWHRHQ3ZqMDRKUTdwSWRZQUpsaTdqajZXV1M1eWJSbTB0NHlJUUdLN09l?=
 =?utf-8?B?VytJNW1zZEtoWk9vRm5NazlRcDk0QS94cUVnMzBCZFlyMTFGVWZ4c1dIRDJt?=
 =?utf-8?B?R3hQUktCL2E3cG9ZZ21XSUVTRlpyaVROKzJ3czVNK3FpcUZUVXhUblNrZVA1?=
 =?utf-8?B?WkVyaS9EY0gyckZTZkNCY09mcTBJbkQzMG9pWWJmN3NJQ1p6cDdxS2gyQk1N?=
 =?utf-8?B?WmpuRXZMbFFVYzV6TnVzcjZicHNRaTlLVWYxVW9xQUxieGNEWlhpNnYrVGxD?=
 =?utf-8?B?d2JLL0dZb05FWHVZZmF1RVNpZFc2eENkb2VXUE1OZCtrRWN6Ry80ZEJVNlk4?=
 =?utf-8?B?QWhsc0xiTEhqaWpiTHdJRlFWSlNLeWZRVUpCdlF6WGt3V2hxTUJXTGJoeXZY?=
 =?utf-8?B?TjhxNkRla0hHdGFJQmlpVHhYd3pESmx6NjFCZG5EaDR4ZUdjMGtGbXh3cFNB?=
 =?utf-8?B?QmpOUHh6OTBlWjBydTcvQnF5SUlxN24yeGl3aDBtcVRZZDdVaC96cVBvb1Fz?=
 =?utf-8?B?eDhYMklIKzVBQlYrMTkxS1Y1SUYyVG1tOFJUbTI0WmtNd2RIWXZDbisyNmlR?=
 =?utf-8?B?cXROd1JnYjlkeTVWRTcrRWE5cjR6NnNnUHk2aEU4VXJrR1p6dkJ3N0o4UUFE?=
 =?utf-8?B?RmJnWnNCMGtCVEdXTmFBQW9keTFISWluMWVzR3labE1IdnFHMGdmWEpackJE?=
 =?utf-8?B?UmoxYk9kZ3ZtbXNXYnlCYTMrMmwwalRNZXBkcThIYnBLbDYxZkRVUFpOc21M?=
 =?utf-8?B?NldVTFZYeS9ZaXMwSVRoaDlwSGs4eFVGRzRNNjQ4RWtOcEFyRHErYks2S0cy?=
 =?utf-8?B?cGc9PQ==?=
X-OriginatorOrg: sancloud.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3628514d-3347-4b12-8218-08daa0a9e5ad
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 17:01:19.8054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 840be37c-244a-450e-9bcc-2064862de1f4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 q4NwQ7utX6kAWoJ1gWu+s1EelFB8OIJwOG8m0xA9JJ5ZtLCM1jwBH/zMvbjbD23daqV0XVC6XwWgmNe5LFPFvCUXExagiOUnSpsUFdv2HWQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP123MB3374
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 27 Sep 2022 17:01:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15099

--------------tm2aBTTB2Sa0nDhhMygVH0tt
Content-Type: multipart/mixed; boundary="------------KNg0YYX1cmqEMd7TpzElQ1de";
 protected-headers="v1"
From: Paul Barker <paul.barker@sancloud.com>
To: meta-ti@lists.yoctoproject.org, Ryan Eatmon <reatmon@ti.com>,
 Denys Dmytriyenko <denys@konsulko.com>
Message-ID: <0ba3f29c-3e37-ab9d-93e1-82e9da6ccc9a@sancloud.com>
Subject: Build failure for beaglebone on kirkstone branch

--------------KNg0YYX1cmqEMd7TpzElQ1de
Content-Type: multipart/mixed; boundary="------------iiW4G0b06ySj0OrPoIA09MpQ"

--------------iiW4G0b06ySj0OrPoIA09MpQ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi folks,

I'm trying to add support for the Yocto Project kirkstone release to our
meta-sancloud BSP layer and I'm facing a build issue. I've reproduced the=

issue using just the meta-ti layer and its dependencies, targeting the
beaglebone machine. I've used the kirkstone-next branch of meta-ti as
the kirkstone branch has not been updated in 5 months and has the same
issue.

The build fails due to a lack of buildable providers for virtual/libgl.
Is this a known issue?

The commits of each layer used are as follows:

poky: d64bef1c7d713b92a51228e5ade945835e5a94a4 (kirkstone)
meta-arm: 0a5eba13d81f5c5722a13b816193ebf93c0fd198 (kirkstone)
meta-ti: b742ced380b23d5c57b4280bc3c10165176ec072 (kirkstone-next)

With these layers checked out, the console session is as follows:

$ . poky/oe-init-build-env
<output snipped>
$ bitbake-layers add-layer ../meta-arm/meta-arm ../meta-arm/meta-arm-tool=
chain ../meta-ti/meta-ti-bsp
NOTE: Starting bitbake server...
$ MACHINE=3Dbeaglebone bitbake core-image-base
Loading cache: 100% |#| Time: 0:00:00
Loaded 1770 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies
ERROR: Nothing PROVIDES 'virtual/libgl' (but /workdir/poky/meta/recipes-g=
raphics/cairo/cairo_1.16.0.bb DEPENDS on or otherwise requires it)
mesa PROVIDES virtual/libgl but was skipped: PREFERRED_PROVIDER_virtual/l=
ibgles1 set to ti-sgx-ddk-um, not mesa
mesa-gl PROVIDES virtual/libgl but was skipped: PREFERRED_PROVIDER_virtua=
l/libgl set to mesa, not mesa-gl
NOTE: Runtime target 'python3-pygobject' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-pygobject', 'cairo=
', 'virtual/libgl']
NOTE: Runtime target 'ofono' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['ofono', 'bluez5', 'python3=
-pygobject', 'cairo', 'virtual/libgl']
NOTE: Runtime target 'packagegroup-base-extended' is unbuildable, removin=
g...
Missing or unbuildable dependency chain was: ['packagegroup-base-extended=
', 'ofono', 'bluez5', 'python3-pygobject', 'cairo', 'virtual/libgl']
ERROR: Required build target 'core-image-base' has no buildable providers=
=2E
Missing or unbuildable dependency chain was: ['core-image-base', 'package=
group-base-extended', 'ofono', 'bluez5', 'python3-pygobject', 'cairo', 'v=
irtual/libgl']

Thanks,

--=20
Paul Barker
Principal Software Engineer
SanCloud Ltd

e: paul.barker@sancloud.com
w: https://sancloud.com/
--------------iiW4G0b06ySj0OrPoIA09MpQ
Content-Type: application/pgp-keys; name="OpenPGP_0xA67255DFCCE62ECD.asc"
Content-Disposition: attachment; filename="OpenPGP_0xA67255DFCCE62ECD.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
=3DsH2a
-----END PGP PUBLIC KEY BLOCK-----

--------------iiW4G0b06ySj0OrPoIA09MpQ--

--------------KNg0YYX1cmqEMd7TpzElQ1de--

--------------tm2aBTTB2Sa0nDhhMygVH0tt
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS7m7rT1+CktY3YG1PYN3IfEvob6gUCYzMsXgUDAAAAAAAKCRDYN3IfEvob6vyy
AP9cP+9DP+Lj3KFZImp0DckMvrGa2kzmjGv/t33XcH7b8gD/QOHbyddLlSyciR4mbZVoszH1oqd8
/qgznddgfch3QAs=
=RVW9
-----END PGP SIGNATURE-----

--------------tm2aBTTB2Sa0nDhhMygVH0tt--

