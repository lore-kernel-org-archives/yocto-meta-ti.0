Return-Path: <chase.maupin@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6B086E00769; Fri, 11 Jul 2014 06:40:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1A77DE00736
	for <meta-ti@yoctoproject.org>; Fri, 11 Jul 2014 06:40:02 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6BDdvsB004728;
	Fri, 11 Jul 2014 08:39:57 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6BDduMB001298;
	Fri, 11 Jul 2014 08:39:56 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Fri, 11 Jul 2014 08:39:56 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Cliff Brake <cbrake@bec-systems.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [diasy] omap2plus_defconfig does not include systemd
	support
Thread-Index: AQHPnQqvB1yzO713Ek+iSRsa/PdaxJua4PPQ
Date: Fri, 11 Jul 2014 13:39:55 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015D131D4D@DLEE11.ent.ti.com>
References: <CAOd_LFxuEix6fEiRA8aA89OhR=tdPZTAp+NxfZAxA565Hirj_Q@mail.gmail.com>
In-Reply-To: <CAOd_LFxuEix6fEiRA8aA89OhR=tdPZTAp+NxfZAxA565Hirj_Q@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [diasy] omap2plus_defconfig does not include systemd	support
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
X-List-Received-Date: Fri, 11 Jul 2014 13:40:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable


>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>bounces@yoctoproject.org] On Behalf Of Cliff Brake
>Sent: Friday, July 11, 2014 8:19 AM
>To: meta-ti@yoctoproject.org
>Subject: [meta-ti] [diasy] omap2plus_defconfig does not include
>systemd support
>
>Hi,
>
>I'm trying to get a daisy build working on the beagleboard.  Its
>currently building the linux-ti-staging-3.14 kernel for the bb.
>However, this kernel appears to use the omap2plus_defconfig from
>the
>http://git.ti.com/ti-linux-kernel repo.  What is the best path to
>get
>omap2plus_defconfig modified to support systemd (its just a minor
>tweak for cgroups?  Ideally, we'd get omap2plus_defconfig modified
>in
>the upstream kernel.  Perhaps for now, we could have a config
>fragment
>in the recipe?

I would suggest sending a patch to linux-omap mailing list.

>
>NOTE: multiple providers are available for virtual/kernel
>(linux-ti-staging, linux-mainline, linux-dummy, linux)
>NOTE: consider defining a PREFERRED_PROVIDER entry to match
>virtual/kernel
>
>Should the meta-ti layer be defining a prefered provider for the
>beagleboard kernel?

This is usually set by the distro layer.

>
>Thanks,
>Cliff
>--
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti

