Return-Path: <r-monk@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A7E23E013A8
	for <meta-ti@yoctoproject.org>; Wed, 14 Dec 2011 04:29:47 -0800 (PST)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id pBECTfrj030451;
	Wed, 14 Dec 2011 06:29:41 -0600
Received: from DNCE72.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id pBECTe0Y029852;
	Wed, 14 Dec 2011 06:29:41 -0600 (CST)
Received: from DNCE02.ent.ti.com ([fe80::e5b6:a692:b14:3c86]) by
	DNCE72.ent.ti.com ([fe80::8e3:61e5:a5b9:593c%23]) with mapi id
	14.01.0323.003; Wed, 14 Dec 2011 13:29:40 +0100
From: "Monk, Roger" <r-monk@ti.com>
To: Rainer Koenig <Rainer.Koenig@ts.fujitsu.com>
Thread-Topic: [meta-ti] Questions about ti-syslink-module
Thread-Index: AQHMulWcogy+vlsZFkiao677qQjJm5XbQ24b
Date: Wed, 14 Dec 2011 12:29:40 +0000
Message-ID: <410B417B-8ECE-477C-967A-100DDCB6BAD6@ti.com>
References: <4EE88BCC.8070502@ts.fujitsu.com>
In-Reply-To: <4EE88BCC.8070502@ts.fujitsu.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Questions about ti-syslink-module
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Dec 2011 12:29:48 -0000
Content-Language: en-GB
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Unfortunately we haven't merged syslink support for dm81xx to meta-ti yet. =
 This is very likely the culprit.

~roger

On 14 Dec 2011, at 11:43, "Rainer Koenig" <Rainer.Koenig@ts.fujitsu.com> wr=
ote:

> Hi there,
>
> still playing around with my dm814x-evm board and at least now I
> successfully builded a systemd-gnome-image that runs if you add syslink
> from the TI EZSDK 5.02 and some firmware files. I tried to build those
> things, so I include ti-syslink-module in my build, and I also made a
> recipe to copy the firmware binaries to the /usr/share/ti/... direcotries=
.
>
> The problem is, that this image crashes as soon as I load the vpss
> firmware.
>
> At the moment I wonder if syslink is the cause of the problem. Looking
> at the recipe in meta-ti I see that it builds a version 2_00_00_78, but
> the EZSDK 5.02 uses 2_00_00_80.
>
> The other thing that puzzles me is that my kernel config has
> CONFIG_Sys_Link=3Dy
> CONFIG_SYSLINK_MULTIPROC=3Dy
> CONFIG_SYSLINK_NOTIFY=3Dy
>
> What part of syslink is that which is already in the kernel sources?
>
> At the moment it looks all confusing and I guess that the crashes come
> from version mixing, but I'm not sure.
>
> Best regards
> Rainer
> --
> Dipl.-Inf. (FH) Rainer Koenig
> Project Manager Linux Clients
> Dept. PDG WPS R&D SW OSE
>
> Fujitsu Technology Solutions
> B=FCrgermeister-Ullrich-Str. 100
> 86199 Augsburg
> Germany
>
> Telephone: +49-821-804-3321
> Telefax:   +49-821-804-2131
> Mail:      mailto:Rainer.Koenig@ts.fujitsu.com
>
> Internet         ts.fujtsu.com
> Company Details  ts.fujitsu.com/imprint.html
>
Texas Instruments Limited, 800 Pavilion Drive, Northampton, NN4 7YL. Regist=
ered in England & Wales under company number 00574102

_______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


