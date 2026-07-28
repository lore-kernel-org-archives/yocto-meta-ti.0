Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91831C54F4D
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 14:40:02 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12979.1785249593869825709
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 07:39:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B3D5A40C1C;
	Tue, 28 Jul 2026 14:39:52 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S9ppkHatC6Pk; Tue, 28 Jul 2026 14:39:52 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 61F3140A20;
	Tue, 28 Jul 2026 14:39:48 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 6F5161769EE; Tue, 28 Jul 2026 10:39:47 -0400 (EDT)
Date: Tue, 28 Jul 2026 10:39:47 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: prc@list.ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: =?iso-8859-1?Q?=5Bmeta-ti=5D=5Bmaster?=
	=?iso-8859-1?Q?=2Fwrynose=5D=5BPATCH_1=2F2=5D_packagegroup-ti-core-initra?=
	=?iso-8859-1?B?bWZzOqBNb3Zl?= the inclusion of
 initramfs-module-netsetup
Message-ID: <20260728143947.GB19759@denix.org>
References: <20260728141051.2851131-1-reatmon@ti.com>
 <20260728141608.3901647-1-prc@list.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20260728141608.3901647-1-prc@list.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 28 Jul 2026 14:40:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20200

On Tue, Jul 28, 2026 at 09:16:08AM -0500, PRC Automation via lists.yoctop=
roject.org wrote:
> meta-ti / na / 20260728141051.2851131-1-reatmon
>=20
> PRC Results: FAIL
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>   check-yocto-patches: FAIL
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> Patches
> ----------------------------------------
> FAIL - [meta-ti][master/wrynose][PATCH 1/2] packagegroup-ti-core-initra=
mfs:=A0Move the inclusion of initramfs-module-netsetup
>     ERROR: Commit message too long (> 80 chars): =3D?UTF-8?q?packagegro=
up-ti-co?=3D =3D?UTF-8?q?re-initramfs:=3DC2=3DA0Move=3D20the=3D20inclusio=
n=3D20of=3D20initramfs-modu?=3D =3D?UTF-8?q?le-netsetup?=3D. (COMMIT-MESS=
AGE-1)

Moreover, there's non-ASCII character right before "Move", hence UTF-8=20
encoding - instead of a regular =3D20 whitespace, it's =3DC2=3DA0 which i=
s a=20
non-breaking space.


>         patch:90
>             Subject: [meta-ti][master/wrynose][PATCH 1/2] =3D?UTF-8?q?p=
ackagegroup-ti-co?=3D =3D?UTF-8?q?re-initramfs:=3DC2=3DA0Move=3D20the=3D2=
0inclusion=3D20of=3D20initramfs-modu?=3D =3D?UTF-8?q?le-netsetup?=3D
>    =20
>     WARN: Commit message does not include file/recipe name: =3D?UTF-8?q=
?packagegroup-ti-co?=3D =3D?UTF-8?q?re-initramfs:=3DC2=3DA0Move=3D20the=3D=
20inclusion=3D20of=3D20initramfs-modu?=3D =3D?UTF-8?q?le-netsetup?=3D. (C=
OMMIT-MESSAGE-2)
>         patch
>    =20
>     For details on the above errors/warnings visit: https://lists.yocto=
project.org/g/meta-ti/wiki/40887

