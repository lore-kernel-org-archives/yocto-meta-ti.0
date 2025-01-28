Return-Path: <matthias.schiffer@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0743AC02193
	for <webhook@archiver.kernel.org>; Tue, 28 Jan 2025 13:11:38 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by mx.groups.io with SMTP id smtpd.web11.16888.1738069887470526307
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 28 Jan 2025 05:11:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tq-group.com header.s=key1 header.b=esz0Ohlo;
 dkim=fail reason="dkim: no key for signature: lookup dkim._domainkey.ew.tq-group.com on 100.100.100.100:53: no such host" header.i=@ew.tq-group.com header.s=dkim header.b=VC7ssFmn;
 spf=pass (domain: ew.tq-group.com, ip: 93.104.207.81, mailfrom: matthias.schiffer@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1738069887; x=1769605887;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=8QyMErnzxrfVQuQH1mW/3tOQJa/2zOVPB5+CdLFwnx4=;
  b=esz0OhloDoSUxp5nGuYVqueO3GGPxjBlfPpROalF6f+xam56Af4yOHLV
   RYFh6hJNwFczD9NeFeduRMTXRRS+ZM1eBQROON8CH4WO+oW5fiuDih6PZ
   LOsF48nUFdem+rPTFi2CDvQd4/1M5wqwQYnUHzS1LJkv+YHJExFSW7J21
   8MaqLez15stwYnWhAZdYmlecaDkMNZowsV6ewIWyOhEIbedtkpr5rqC02
   1lKHIfqEJ6afIG2vU3Mz87K59ec9KlgC65ihePM97EU/AVtMX/IrHqyqH
   KBpQ9/CL+3iWuvkrrZz/aG/CVQxgLwQgO+By03hLj9S6v5HIQfW7pbDv0
   w==;
X-CSE-ConnectionGUID: I2JiGDkJR8Cps0pVCCuudg==
X-CSE-MsgGUID: lFNMQms/Q2q+DYaHJDujyw==
X-IronPort-AV: E=Sophos;i="6.13,241,1732575600"; 
   d="scan'208";a="41329352"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 28 Jan 2025 14:11:25 +0100
X-CheckPoint: {6798D77D-4-1CE016C0-E589DA3E}
X-MAIL-CPID: CC68A7BC08DE374836CD0FFE763C6FC9_1
X-Control-Analysis: str=0001.0A682F1B.6798D77D.002F,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 16A301647EF;
	Tue, 28 Jan 2025 14:11:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1738069880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8QyMErnzxrfVQuQH1mW/3tOQJa/2zOVPB5+CdLFwnx4=;
	b=VC7ssFmn6G4fHXXbyBxrplRwML3fUg0aeYj/U61JWZRiDjqfHiHbWzQ+HcVsKTxJZ6rTJz
	dIKUKMWlmFwCtJOYDIy6qBiVwgqi4sdqAWQUEXP/PdJqWk/LnBwwDA7AvFoPlHC8CLMjP6
	+Y7m/4JlONRaF6p7FRmaGwGv/61bsTtZyXc6PnL8Le0K9e3scSzCMm7Jp7ULjMFXmBiiTE
	MZpb6vGF5D/1fdlCblcpKdPtLEYXaChtI+agmqmDqFMtP1d0r2STB8v0izRHehyc3wFVVz
	UVrFyjzweHgMXozR33X5yln2ifFDe7HBfQNUG9iTieHsTDgxmFQmN2gyv8UG5g==
Message-ID: <db355fb8383904073d0b975cdb6df6353d675e4c.camel@ew.tq-group.com>
Subject: Re: [meta-ti][scarthgap/master][PATCH 2/2] conf: machine:
 omap-a15.inc: include ipu1 firmware in the boot partition
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: a-limaye@ti.com, meta-ti@lists.yoctoproject.org
Cc: reatmon@ti.com, b-padhi@ti.com, u-kumar1@ti.com, oss@ew.tq-group.com
Date: Tue, 28 Jan 2025 14:11:18 +0100
In-Reply-To: <20241209101330.1893700-3-a-limaye@ti.com>
References: <20241209101330.1893700-1-a-limaye@ti.com>
	 <20241209101330.1893700-3-a-limaye@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 28 Jan 2025 13:11:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18236

On Mon, 2024-12-09 at 15:40 +0530, Aniket Limaye via lists.yoctoproject.org
wrote:
>=20
> Early Boot of remote processors is supported at the SPL stage of the
> bootloader. Currently, SPL looks for the remoteproc firmwares in the
> boot partition.
>=20
> Therefore, add the rproc firmware to the boot partition of wic images.
>=20
> Signed-off-by: Aniket Limaye <a-limaye@ti.com>

This patch introduces a dependency of meta-ti-bsp on meta-ti-extras, breaki=
ng
builds of omap-a15 platforms without meta-ti-extras.

Best regards,
Matthias


> ---
>  meta-ti-bsp/conf/machine/include/omap-a15.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-ti-bsp/conf/machine/include/omap-a15.inc b/meta-ti-bsp/=
conf/machine/include/omap-a15.inc
> index be086936..a258decd 100644
> --- a/meta-ti-bsp/conf/machine/include/omap-a15.inc
> +++ b/meta-ti-bsp/conf/machine/include/omap-a15.inc
> @@ -48,5 +48,6 @@ MACHINE_FEATURES =3D "apm usbgadget usbhost vfat ext2 s=
creen alsa gpu mmip dsp gc3
> =20
>  IMAGE_FSTYPES +=3D "tar.xz wic.xz wic.bmap"
>  WKS_FILE ?=3D "sdimage-2part.wks"
> -IMAGE_BOOT_FILES ?=3D "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTL=
INUX_BOOT_FILES}"
> +IMAGE_BOOT_FILES ?=3D "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTL=
INUX_BOOT_FILES} ipc/dra7-ipu1-fw.xem4;dra7-ipu1-fw.xem4"
>  do_image_wic[depends] +=3D "virtual/bootloader:do_deploy"
> +do_image_wic[depends] +=3D "ti-ipc-rtos:do_deploy"
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18098): https://lists.yoctoproject.org/g/meta-ti/mess=
age/18098
> Mute This Topic: https://lists.yoctoproject.org/mt/110003435/4454427
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [matthias.sch=
iffer@ew.tq-group.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/

