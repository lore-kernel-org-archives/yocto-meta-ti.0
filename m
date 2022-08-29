Return-Path: <gadiyar@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 387E9ECAAD3
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 18:23:59 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.1737.1661797434434527490
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 29 Aug 2022 11:23:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=HaB0xQ36;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: gadiyar@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 27TINkJ3038095;
	Mon, 29 Aug 2022 13:23:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1661797426;
	bh=gMe2W/ObELw8D0qnUF+KLxxRU7FHAWBsx8czXrQucwM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=HaB0xQ36rfb8qfHMJBymzYrJGLEhVoAjXZ7H0I3bZBLcmGBg6WQynZS3+BB/8+kXA
	 3kVfMQuSQzG5oWJ+8sN2GOIe9W5Ro9g2lzAuVRQty98bbCFeoYYT+oFTXkbHR2+udB
	 jPwtzvWKmOVr1VevaC1m00BJH0Ljcw98yhqY5OG8=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 27TINkWO066830
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 29 Aug 2022 13:23:46 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Mon, 29
 Aug 2022 13:23:46 -0500
Received: from DFLE111.ent.ti.com ([fe80::6c89:b1ca:ee8f:1a6f]) by
 DFLE111.ent.ti.com ([fe80::6c89:b1ca:ee8f:1a6f%17]) with mapi id
 15.01.2507.006; Mon, 29 Aug 2022 13:23:46 -0500
From: "Gadiyar, Anand" <gadiyar@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: "Eatmon, Ryan" <reatmon@ti.com>,
        "meta-ti@lists.yoctoproject.org"
	<meta-ti@lists.yoctoproject.org>,
        Denys Dmytriyenko <denys@konsulko.com>,
        "Nagalla, Hari" <hnagalla@ti.com>, "Davis, Andrew" <afd@ti.com>,
        "Bajjuri,
 Praneeth" <praneeth@ti.com>
Subject: RE: [meta-ti] [dunfell][PATCH] machine: add am62xx-lp-skevm
 configuration
Thread-Topic: [meta-ti] [dunfell][PATCH] machine: add am62xx-lp-skevm
 configuration
Thread-Index: AQHYuX2Vkt+vKa590ECFFQcXuOcfvq3B/FSAgAQfOeCAAGYPAP//rGlw
Date: Mon, 29 Aug 2022 18:23:46 +0000
Message-ID: <947f7d133a4c46098c826ac4d909fbd8@ti.com>
References: <20220826185638.1030640-1-gadiyar@ti.com>
 <c69f0615-a9a8-b4da-a006-62c68f66396f@ti.com>
 <45f59672c0db48988d35339976be43f6@ti.com> <20220829175430.GJ18429@denix.org>
In-Reply-To: <20220829175430.GJ18429@denix.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.247.23.90]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 29 Aug 2022 18:23:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14979

> From: Denys Dmytriyenko <denis@denix.org>
>=20
> On Mon, Aug 29, 2022 at 04:50:00PM +0000, Anand Gadiyar via
> lists.yoctoproject.org wrote:
> > > From: Eatmon, Ryan <reatmon@ti.com>
> > >
> > >
> > > On 8/26/2022 13:56, Anand Gadiyar wrote:
> > > > This platform is similar to the currently supported am62xx-evm, exc=
ept
> > > > that we currently need new defconfigs for u-boot and new dtbs in th=
e
> > > > filesystem.
> > > >
> > > > Signed-off-by: Anand Gadiyar <gadiyar@ti.com>
> > > > Cc: Hari Nagalla <hnagalla@ti.com>
> > > > Cc: Andrew Davis <afd@ti.com>
> > > > Cc: Praneeth Bajjuri <praneeth@ti.com>
> > > > Cc: Ryan Eatmon <reatmon@ti.com>
> > > > ---
> > > > For yocto purposes, this machine is nearly identical to the AM62x S=
K,
> > > > and we will have more similar machines in the future.
> > > >
> > > > Mainly, we just need to add more dtbs in the filesystem and to buil=
d
> > > > u-boot/spl/tiboot3.bin with different defconfigs than the AM62x SK.
> > > >
> > > > If there's a better way to add support for this, let me know. Now's=
 a
> > > > better time than later.
>=20
> Adding new DTBs to the existing am62xx-evm shouldn't be a problem:
> https://git.yoctoproject.org/meta-ti/tree/conf/machine/include/ti33x.inc?=
h=3Ddunfell#n29
>=20
> As of 2 different defconfigs in U-boot - it sounded like it is a temporar=
y
> situation. If the plan is to have the same defconfig and U-boot tiboot3.b=
in
> binary for both AM62 and AM62 LP at some point, it is probably better to =
go
> that route and keep a single am62xx-evm machine config, instead of duplic=
ating
> almost identical platforms...


Unfortunately, this turned out to be quite hard to do at this time.

The DTBs for the boards are vastly different because of one major contribut=
or - the DDR DTSI
file, which is currently the entire set of DDR registers. tiboot3.bin is cu=
rrently the one
responsible for configuring the DDR and includes this DTSI in entirity. The=
 DDR parts are different
on the two boards, so we need to embed two sets of this DTSI. I was unable =
to fit both sets of
DTSI in the binary at this time (the binary would boot up fully on the firs=
t board, but SPL doesn't
release memory when the device model is reinitialized if SPL detects it's r=
unning on a different board).

For tiboot3.bin, I would like to explore if we can start with a reduced DTB=
 without any DDR, identify
the board, and then switch to a full DTB unconditionally. Is there a better=
 approach?

I think the A53 SPL/u-boot would be able to get away with a single FIT imag=
e with both sets
of DTBs embedded.=20

Could we start by merging this patch for now, if I promise to explore getti=
ng a single image to work?






