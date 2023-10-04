Return-Path: <heiko.boettger@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCF25E7B5F5
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 11:31:09 +0000 (UTC)
Received: from mx08-0040c702.pphosted.com (mx08-0040c702.pphosted.com [185.183.31.154])
 by mx.groups.io with SMTP id smtpd.web11.15953.1696419065111745635
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 04 Oct 2023 04:31:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=E6hNYdDt;
 spf=pass (domain: karlstorz.com, ip: 185.183.31.154, mailfrom: heiko.boettger@karlstorz.com)
Received: from pps.filterd (m0267678.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3949j10u015763;
	Wed, 4 Oct 2023 11:30:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=from:to:cc:date:message-id:references:in-reply-to
	:content-type:mime-version:subject; s=S-DKIM-20210427; bh=QWKMP7
	xlO/SlF1CJ8HXAvND4mhwiHRAsxIfHz5T9WCQ=; b=E6hNYdDt+HizXs+9SXtOfd
	VvZkDIq0w5BP6IFWYkWtnvfZsEfCHG+XKGt5vywupIEzVokMAbqCKLHszOTbnloN
	K192P0jmClUwYEc5hb9RAgyNu9ZWbQepU9ejUWuJDVcegaHZo+mk6q1LABgjzPWp
	4cCJcUIZoqTxCfSC9cjLdR+4LyAh9qidjrNfATHWe58W277uI4nvofL1S9z+/NDT
	C3uHJ0GBmN+K83zJK7z+HlGr7H25iNDrWLXH/jfJnmXYN+jkDOYFeQMWTijgnXNg
	/3duLVUyDCPHROGeitisyscP6x2OSvpKmYnuGoDOwTO624S3oLQ0XK7C2URAlapA
	==
Received: from eur01-he1-obe.outbound.protection.outlook.com (mail-he1eur01lp2057.outbound.protection.outlook.com [104.47.0.57])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 3teakbvtn8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Oct 2023 11:30:57 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fVNUF9okmx4DDwbX8mkDaNhcKZabzgaFMT+HoXb30S5xPqAYSMNpYRhmeL91g/ZGXXyOJWM/P4skBmefv/GsUSKXXfVemSRoOenqCrleHDJdVO/Zk1KVrRaIjdYKlQ/daxu9Gq34ECIgnfuK+T3ul4p6lYTpJWpixX7P6WOghbqwWZeWpo+q+dJkI0ZTfgdrPFied2+hKazlaeYEO5vEBjZR1kFpEABfwNHlT6EnmCXqKjLQF1IxLRmWAr0TIkt/Xph+I09Z+rYipaLNC9As8URsOua81X8fuwG0r3BompQ7LGawvq3R/qWQLiolXvGS9hicc7czFMLOLNvy55gHMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QWKMP7xlO/SlF1CJ8HXAvND4mhwiHRAsxIfHz5T9WCQ=;
 b=emQs1dqT0fuJLw/g1+DUGvf9KLx71zE6d9QE06zoRmcPwyBARYabYripu14f29CCZ3UPWk79GxRU24e1pxjVUmKbSxnkdaA5RrJZTRAoq2Mny7a/JRuK9zUJc9lBK1ojGZrn6oSc2ES1X+SSB4AJV186Hws9eVHuLPfo2dFnwY9c8GEsKzED4ozb/py7sATNeJPXYq5wNknJ06V/HGpGPQjUcbbUCYLlpaGFzmiUqb5A4bX5D9f/iufWhQ1t9zyjptOaMQNZ394k96+6tf3FTisvpV+07hU2ZwAYPe8Z5MSOyZ3M3UtOoxWj1ejlROW5IBILfYzTBL1p6DPEX80Tig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=karlstorz.com; dmarc=pass action=none
 header.from=karlstorz.com; dkim=pass header.d=karlstorz.com; arc=none
Received: from AM9PR01MB8412.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:43f::14) by AS8PR01MB7478.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:25e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.10; Wed, 4 Oct
 2023 11:30:55 +0000
Received: from AM9PR01MB8412.eurprd01.prod.exchangelabs.com
 ([fe80::bd39:daa:27f3:b0a1]) by AM9PR01MB8412.eurprd01.prod.exchangelabs.com
 ([fe80::bd39:daa:27f3:b0a1%4]) with mapi id 15.20.6863.021; Wed, 4 Oct 2023
 11:30:55 +0000
From: "Boettger, Heiko" <Heiko.Boettger@karlstorz.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
Thread-Topic: [Ext] Re: [meta-ti] Unable to mirror meta-ti due to branch-name
 HEAD forbidden in git since Nov 2019
Thread-Index: AQHZ9dqy6JlPGjcHS0O+aUeLHMrcF7A4EnYAgAFtyp4=
Date: Wed, 4 Oct 2023 11:30:54 +0000
Message-ID: 
 <AM9PR01MB8412B2FB6744978623CA47D197CBA@AM9PR01MB8412.eurprd01.prod.exchangelabs.com>
References: 
 <AM9PR01MB841284A902CEE0B9B199666F97C4A@AM9PR01MB8412.eurprd01.prod.exchangelabs.com>
 <20231003133952.GB26382@denix.org>
In-Reply-To: <20231003133952.GB26382@denix.org>
Accept-Language: de-CH, en-US, en-CH, de-DE
Content-Language: de-CH
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR01MB8412:EE_|AS8PR01MB7478:EE_
x-ms-office365-filtering-correlation-id: 22c5dad9-b6a8-4571-0f89-08dbc4cd5f33
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 c+e72GYQdmAqGSquuhe/Y75w2Yda+AzzWw+1wjUvFV/xiV1HCRH9CDxi6e0QWYktvYnoMfnt8lgpGK+kL0tCiO/UwKBWeIXRcgekoxPA1DWq8JpzZxBliKYekBQWkCqUu8itHCUKBTCgKYvdEKYF7+KkHrQk4yxYNTM1PAdOEVOHt3xRQhTwbV5JVuV/6OaU2CiDV+UtEEsSw8sxJe5R/aJP9+vHMUmifyFFnu7suez8fP1b+fPvxh3yM5REGbifW5cjJ1yzZu7j7V9MOnc01gfbCPMfDWM24pABjoHLpm3u+cl7o8l2IFKkVGyK+UIjBY9bkTd98869Mfm8eDCn72j7bemqOT/Mwfr1cdh/NBqJJtZjAU+dOCNsN5oq4G5ql9Jgm69DlBqs+yx5WVtMkU1BNABPFfqx4mAPVY+SKqJjoFLCXrkiA97uJGwL/DyvlYvOdQ10cmZrAnjBBo9pNcfNYEUYAMYe8I0L73rx5VbtfGe36340Z3dpywDnQl8zUIMKZ2T6RWjqr+kCZmHzGiEIlMjAzxEapraJnqESgLws+AmYOi3dl5igKC52zr1y8cFG/LIPbJak95gn7oSphy/dvP8anuz4dQ74OTlNQ5+N8mupgbQlkk7yWknfwZeS
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR01MB8412.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(396003)(366004)(346002)(39860400002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(4326008)(55016003)(966005)(2906002)(41300700001)(122000001)(478600001)(83380400001)(38100700002)(166002)(38070700005)(91956017)(52536014)(9686003)(76116006)(66556008)(316002)(64756008)(66476007)(66946007)(71200400001)(6506007)(7696005)(66446008)(5660300002)(8676002)(6916009)(8936002)(26005)(86362001)(33656002)(19627405001)(21443003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?dQN/rTKlNSgjfiH9owmG5kJ+uG6rmcDc/DOlEcULUN+IKN8DPS+W+BManE84?=
 =?us-ascii?Q?IrdSWhLIeOsmOxcX5/aGXO/mXhNcBxfx7OUT9LFvIy2vqKhLouADSejHmJbq?=
 =?us-ascii?Q?WcF/GHUBwWrJbXrB1XcGneVaXMbuFKphOQ+3Crj7dg3Rf09foFzNtGJhlKJL?=
 =?us-ascii?Q?D6ewmD2oynW27pMFFcUvFVO2HWr7ItTeoffUTtaGCXkHWEky2+KljquySSuW?=
 =?us-ascii?Q?3NkQYImTz2famLf1xr0rBEt2/Rne0mRGtCOQfDIZo24b3ltoeF5eJZR+ffRD?=
 =?us-ascii?Q?CbVZqiuX+mu0yGoWqR/vmDy0KS6xh6AIcZxRLcHa6+FeXUzt5rrgFkwAD5RF?=
 =?us-ascii?Q?8wB0FmiMuJpczKrIkpggXvKlLAv6SdAFefBONeoOdE3qhqXD5Sqaok5unF0T?=
 =?us-ascii?Q?uprnxW/XWsv6y3hpowA+0sG+Ldu+fBjqpa2bpvq+5VMQcDopZ35YIwCEElpG?=
 =?us-ascii?Q?+GtpuKKRi7Bb3UNbYtOJFtpGW4+PZeOXYMlVIuSKDqdScKCMhmyL9s4FRlcw?=
 =?us-ascii?Q?Ol0jealXOfDaR4uUo/ZZbxMfPBDS9RaAm2ldqvX3p8AQRu7UsyOa2G+D0MXW?=
 =?us-ascii?Q?XH/U0RtzfuyVjdjelfvYjMsfFFYEzsX22Oj0bBYkZYl2sEQXVaBqAGpNgbjb?=
 =?us-ascii?Q?Fsuah7EAtjNSPiDTvOZU4d+sd80RD06kqE2vxHlS3s1vv+12pGi9Q3BWcsn0?=
 =?us-ascii?Q?8RcEfVxPaT3u4qiFZaO/k8/XIkxSKgjs2fZSR82pQzRJBAjZpnHiT6u8Q4j/?=
 =?us-ascii?Q?DouYI7ZD6Ecm8CKDpkyzqkCVmjLf8bsN2j2k5w/sj6VtP7DuDXajsX3uNQHv?=
 =?us-ascii?Q?14q8gxP5BeDvEV5ob4GAl/8a/mAAB1+iy4Bv3LT1VBIJ0lxrzmFxYSGNuM5o?=
 =?us-ascii?Q?ZwLXeaixRKUvhG/L8F8Ot5thZ8i4QfaCiIZE8TvW3vIOUkKiDxuBFoAFftv9?=
 =?us-ascii?Q?jdrORpAY4Kg6OxfMkSIl79WUJCqOsfhYNxRjzngG2i/HRCHPg57taJcavGDM?=
 =?us-ascii?Q?9K3cTzUtLE9aAFL3VSmaijgpnqJyAfOr0n/N/XX1VMvy5Cs5MFR7iRtuEw4k?=
 =?us-ascii?Q?IxTsvUEieOw8z+6j47k6aMBrlK0mv01jrlcAoAWIEXswr4HHEZALJscWJNGM?=
 =?us-ascii?Q?1eWUsJPui5Ih1Fi705f4iudEssflMAITvoNpGDZWRuQJk+hib8LqAnoaS/X7?=
 =?us-ascii?Q?8wW0Y6ciOWPpYYwOmvsP9PljEEtJFBYY4JfhyWhZgDb/jQO7yVJGMnwSMDf+?=
 =?us-ascii?Q?uYKIRG+sSWpvp9Ye6+fQCyXO5zn/sBW67qEf8BEfUwWO9uDXHJJSGd7pDJwQ?=
 =?us-ascii?Q?QtaswTcfsjQvEnr72IFLKwxTYW9J1Ms6N850gnHHotpg6P2+pjwOQY7CU7+E?=
 =?us-ascii?Q?CxCUjagwTyz1naxIxcIp2U5R3Jv38fj3yILLVxBGe957ZfLuha7F0q3q2jXt?=
 =?us-ascii?Q?xGaBiIBAnwgcOOFF0UrdzitSBNakPlIcUlI2Lq0+cndUyTVydiiT8+Oq0Mqg?=
 =?us-ascii?Q?03vazZSKBdx2xbOKWt8eujPca3ofDpBYrxM1w65/gmrQ0UXCM79BH8VeNLed?=
 =?us-ascii?Q?1QfQwboMZ6QkIKDQtXGyGMSTsyLwXVVumCtOy15KDRIpup1sbaJNoj3chJdP?=
 =?us-ascii?Q?6w=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_AM9PR01MB8412B2FB6744978623CA47D197CBAAM9PR01MB8412eurp_"
MIME-Version: 1.0
X-OriginatorOrg: karlstorz.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR01MB8412.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22c5dad9-b6a8-4571-0f89-08dbc4cd5f33
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2023 11:30:54.7317
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4a0b6f21-e6e1-4ed6-9dcf-e60e7190f648
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pg+HgZTiTWAP3maTFHw7uqjyoC9yhIouCMSMWHbKLiYnMVrEABMeOdeQk6HSaCVMKO2NpeahvVHvuEqpUD2weFz0uyox9AUX7WmA0oMH1Gc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR01MB7478
X-Proofpoint-GUID: oWQY4SmfNPYiu7hilyTVYUaMDCY9ZUvl
X-Proofpoint-ORIG-GUID: oWQY4SmfNPYiu7hilyTVYUaMDCY9ZUvl
Subject: AW:  Re: [meta-ti] Unable to mirror meta-ti due to branch-name HEAD
 forbidden in git since Nov 2019
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-04_03,2023-10-02_01,2023-05-22_02
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 04 Oct 2023 11:31:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17050

--_000_AM9PR01MB8412B2FB6744978623CA47D197CBAAM9PR01MB8412eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I don't get what you want to say about the repository being old, we are clo=
ning from git://git.yoctoproject.org/meta-ti.



________________________________
Von: meta-ti@lists.yoctoproject.org <meta-ti@lists.yoctoproject.org> im Auf=
trag von Denys Dmytriyenko <denis@denix.org>
Gesendet: Dienstag, 3. Oktober 2023 15:39
An: Boettger, Heiko <Heiko.Boettger@karlstorz.com>
Cc: meta-ti@lists.yoctoproject.org <meta-ti@lists.yoctoproject.org>
Betreff: [Ext] Re: [meta-ti] Unable to mirror meta-ti due to branch-name HE=
AD forbidden in git since Nov 2019

On Tue, Oct 03, 2023 at 09:23:13AM +0000, Boettger, Heiko wrote:
> Hi,
>
> there was a recent change in git that doesn't allow to use `HEAD` as a
> branch name . Is it possible to remove the branch? The ref HEAD should st=
ill
> be there. No other repository seems to have such a branch and we currentl=
y
> face issues mirroring the meta-ti repository where GitLab refuses to acce=
pt
> `HEAD` as a valid branch name.
>
> See also
> https://urldefense.com/v3/__https://docs.gitlab.com/ee/user/project/repos=
itory/branches/*error-ambiguous-head-branch-exists__;Iw!!Lw1uGqvHvtJ_psGG2E=
t-1voSwbo!cgQTL5gAfQDW2rjVe-STfnMn7ciE__hTinZmRKZOS0XG_vsvyKtq0jDMl4TUN4WQ0=
syNzTxUcVVfniHAMYrb$
> where GitLab states that this change was introduced in git 2.16.0 (around=
 4
> years ago).

meta-ti already has many official public and non-public mirrors - from
https://urldefense.com/v3/__http://git.yoctoproject.org__;!!Lw1uGqvHvtJ_psG=
G2Et-1voSwbo!cgQTL5gAfQDW2rjVe-STfnMn7ciE__hTinZmRKZOS0XG_vsvyKtq0jDMl4TUN4=
WQ0syNzTxUcVVfnp3ytjCP$ , to https://urldefense.com/v3/__http://git.ti.com_=
_;!!Lw1uGqvHvtJ_psGG2Et-1voSwbo!cgQTL5gAfQDW2rjVe-STfnMn7ciE__hTinZmRKZOS0X=
G_vsvyKtq0jDMl4TUN4WQ0syNzTxUcVVfnkZYHCwN$ , to internal bitbucket, etc.

What you are doing is a local clone or even a fork, even if you are using
it as a local mirror for your project. I would refrain from calling it a
mirror in public due to possible confusion.

The existing official mirrors are all push based and are always up-to-date.
Where your copy is pull based and depends on how often and for how long
you are going to update it.

This has happened in the past, where people would make claims in public
that meta-ti is dead and no longer maintained, as it hasn't been updated
in years, linking to some obscure fork on github or gitlab that they came
across somehow...

--
Denys

--_000_AM9PR01MB8412B2FB6744978623CA47D197CBAAM9PR01MB8412eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof ContentPasted0">
<span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService,=
 Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">I d=
on't get what you want to say about the repository being old, we are&nbsp;<=
/span><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSe=
rvice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0)=
;">cloning
 from&nbsp;</span><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: =
rgb(0, 0, 0);">git://git.yoctoproject.org/meta-ti.</span></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof ContentPasted0">
<span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService,=
 Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);"><br=
>
</span></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof ContentPasted0">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof ContentPasted0">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>Von:</b> meta-ti@lists.yoctopro=
ject.org &lt;meta-ti@lists.yoctoproject.org&gt; im Auftrag von Denys Dmytri=
yenko &lt;denis@denix.org&gt;<br>
<b>Gesendet:</b> Dienstag, 3. Oktober 2023 15:39<br>
<b>An:</b> Boettger, Heiko &lt;Heiko.Boettger@karlstorz.com&gt;<br>
<b>Cc:</b> meta-ti@lists.yoctoproject.org &lt;meta-ti@lists.yoctoproject.or=
g&gt;<br>
<b>Betreff:</b> [Ext] Re: [meta-ti] Unable to mirror meta-ti due to branch-=
name HEAD forbidden in git since Nov 2019</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Tue, Oct 03, 2023 at 09:23:13AM +0000, Boettger=
, Heiko wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; there was a recent change in git that doesn't allow to use `HEAD` as a=
 <br>
&gt; branch name . Is it possible to remove the branch? The ref HEAD should=
 still <br>
&gt; be there. No other repository seems to have such a branch and we curre=
ntly <br>
&gt; face issues mirroring the meta-ti repository where GitLab refuses to a=
ccept <br>
&gt; `HEAD` as a valid branch name.<br>
&gt; <br>
&gt; See also <br>
&gt; <a href=3D"https://urldefense.com/v3/__https://docs.gitlab.com/ee/user=
/project/repository/branches/*error-ambiguous-head-branch-exists__;Iw!!Lw1u=
GqvHvtJ_psGG2Et-1voSwbo!cgQTL5gAfQDW2rjVe-STfnMn7ciE__hTinZmRKZOS0XG_vsvyKt=
q0jDMl4TUN4WQ0syNzTxUcVVfniHAMYrb$">
https://urldefense.com/v3/__https://docs.gitlab.com/ee/user/project/reposit=
ory/branches/*error-ambiguous-head-branch-exists__;Iw!!Lw1uGqvHvtJ_psGG2Et-=
1voSwbo!cgQTL5gAfQDW2rjVe-STfnMn7ciE__hTinZmRKZOS0XG_vsvyKtq0jDMl4TUN4WQ0sy=
NzTxUcVVfniHAMYrb$</a>&nbsp;
<br>
&gt; where GitLab states that this change was introduced in git 2.16.0 (aro=
und 4 <br>
&gt; years ago).<br>
<br>
meta-ti already has many official public and non-public mirrors - from <br>
<a href=3D"https://urldefense.com/v3/__http://git.yoctoproject.org__;!!Lw1u=
GqvHvtJ_psGG2Et-1voSwbo!cgQTL5gAfQDW2rjVe-STfnMn7ciE__hTinZmRKZOS0XG_vsvyKt=
q0jDMl4TUN4WQ0syNzTxUcVVfnp3ytjCP$">https://urldefense.com/v3/__http://git.=
yoctoproject.org__;!!Lw1uGqvHvtJ_psGG2Et-1voSwbo!cgQTL5gAfQDW2rjVe-STfnMn7c=
iE__hTinZmRKZOS0XG_vsvyKtq0jDMl4TUN4WQ0syNzTxUcVVfnp3ytjCP$</a>
 , to <a href=3D"https://urldefense.com/v3/__http://git.ti.com__;!!Lw1uGqvH=
vtJ_psGG2Et-1voSwbo!cgQTL5gAfQDW2rjVe-STfnMn7ciE__hTinZmRKZOS0XG_vsvyKtq0jD=
Ml4TUN4WQ0syNzTxUcVVfnkZYHCwN$">
https://urldefense.com/v3/__http://git.ti.com__;!!Lw1uGqvHvtJ_psGG2Et-1voSw=
bo!cgQTL5gAfQDW2rjVe-STfnMn7ciE__hTinZmRKZOS0XG_vsvyKtq0jDMl4TUN4WQ0syNzTxU=
cVVfnkZYHCwN$</a> , to internal bitbucket, etc.<br>
<br>
What you are doing is a local clone or even a fork, even if you are using <=
br>
it as a local mirror for your project. I would refrain from calling it a <b=
r>
mirror in public due to possible confusion.<br>
<br>
The existing official mirrors are all push based and are always up-to-date.=
 <br>
Where your copy is pull based and depends on how often and for how long <br=
>
you are going to update it.<br>
<br>
This has happened in the past, where people would make claims in public <br=
>
that meta-ti is dead and no longer maintained, as it hasn't been updated <b=
r>
in years, linking to some obscure fork on github or gitlab that they came <=
br>
across somehow...<br>
<br>
-- <br>
Denys<br>
</div>
</span></font></div>
</body>
</html>

--_000_AM9PR01MB8412B2FB6744978623CA47D197CBAAM9PR01MB8412eurp_--

