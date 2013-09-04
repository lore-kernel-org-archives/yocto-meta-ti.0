Return-Path: <prabu@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 608AEE013AB
	for <meta-ti@yoctoproject.org>; Tue,  3 Sep 2013 21:34:07 -0700 (PDT)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r844Y244011226;
	Tue, 3 Sep 2013 23:34:03 -0500
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id r844Y0Gn002500;
	Tue, 3 Sep 2013 23:34:00 -0500
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE72.ent.ti.com ([fe80::bd56:32bf:87fd:2763%27]) with mapi id
	14.02.0342.003; Wed, 4 Sep 2013 12:33:59 +0800
From: "Sundareson, Prabindh" <prabu@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, Tasslehoff Kjappfot
	<tasskjapp@gmail.com>
Thread-Topic: [meta-ti] [PATCH 5/5] libgles-omap3, omap3-sgx-modules: remove
	old 4.03.00.02 version
Thread-Index: AQHOpsFLEk5tzqQLTUGQeJ7GoCN7L5mvr2UAgAImvACAAeVngIABIKvA
Date: Wed, 4 Sep 2013 04:33:58 +0000
Message-ID: <321768C95D21724485BCE784F1BE98473EBBFAB9@DBDE04.ent.ti.com>
References: <1378005180-30928-1-git-send-email-denis@denix.org>
	<1378005180-30928-5-git-send-email-denis@denix.org>
	<20130901031528.GA18322@edge> <52247F4E.6030404@gmail.com>
	<20130903170356.GC22235@edge>
In-Reply-To: <20130903170356.GC22235@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 5/5] libgles-omap3, omap3-sgx-modules: remove old 4.03.00.02 version
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Sep 2013 04:34:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Version 1.0.3 cores have been deprecated a while ago. Is that what is being=
 referred to ?

regards,
Prabu

-----Original Message-----
From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject=
.org] On Behalf Of Dmytriyenko, Denys
Sent: Tuesday, September 03, 2013 10:34 PM
To: Tasslehoff Kjappfot
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [PATCH 5/5] libgles-omap3, omap3-sgx-modules: remove=
 old 4.03.00.02 version

On Mon, Sep 02, 2013 at 02:06:38PM +0200, Tasslehoff Kjappfot wrote:
> On 09/01/2013 05:15 AM, Denys Dmytriyenko wrote:
> >BTW, consider this an RFC for removing the next 4.05.00.03 version as=20
> >well - I know some people are still using it, so please speak up.
> >
>=20
> We're using 4.05.00.03 for our OMAP3530 board, because that is the=20
> latest one we've tried that actually works :)
>=20
> Last time I tried newer versions there were "instant lockup"
> problems. Are any of the newer versions compatible with OMAP3530 now?

Tasslehoff,

I don't think the support for OMAP3530 was specifically removed from latest=
 versions, although I'm not sure if it got broken by accident though. Prabu=
?

--
Denys
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti

