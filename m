Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web10.282.1623879366634762226
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 16 Jun 2021 14:36:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=nhgrXt2+;
 spf=pass (domain: konsulko.com, ip: 209.85.160.179, mailfrom: trini@konsulko.com)
Received: by mail-qt1-f179.google.com with SMTP id v6so3076172qta.9
        for <meta-ti@lists.yoctoproject.org>; Wed, 16 Jun 2021 14:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=BcA5SQ1ytZuC+QO2bfRUOy3vhqjmX1I2+vatynvRfCw=;
        b=nhgrXt2+iu2n+EvfraL1qUSx242Ms+oWFtRDVHlJNVwIhfun+wFnReXpLcG/ZfUa/5
         MWgf13+Dg6+t3q6LEDsRXaI9ue6xvcwrNgcB3A0ghufhve4VjtCviMi/f2KL0KhrsoYV
         I+0C33F8+KueP+qnqwH+nnXIlG7E/rH0XKWBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BcA5SQ1ytZuC+QO2bfRUOy3vhqjmX1I2+vatynvRfCw=;
        b=OXXJxDUguaVHPzgoj8Tn743veAgF166eCXbPZ7D1hNvKurfHZGdmsjCngT+yNdUK+b
         wCZABtpQlz3k3xt9s4kuZEaY9wN2nvbZgEs8ejNCEN8ljryP/t0GfOptYT8KbV1MIq2H
         CMqvXdsYQ/mljcLuubwS/hULIq9kKgKVtAGIsoZDSm8vsfstuWxPeX7RRpP+LHavitFb
         iIdvAKyk2iKMDc4tX90n6SzrqNJNAvbIjkkCVf0NrTTf9uO+GSiI0tj3zu3hKzpzTnuE
         ziTYfgD3B0fIvtIVrWf9wwDOk9xrs5OAttGXy0aQmDKHk25tWLgEVQOzzJa7l8k2xf1y
         GcIw==
X-Gm-Message-State: AOAM533URid8PFGhv8UYR+ONUY59VE8EQQvCfS80CuKLWDlocDIrcXZW
	BcRcmGy60QALPIzs5xnHKatVf0SdP8NQ8Q==
X-Google-Smtp-Source: ABdhPJwu4Jz3Q7H+gvLOELxknSzGzNy4fVL3rd9bPxIYjKVMPDf9we6jZDmIUQY9iJzPk1biKkltCQ==
X-Received: by 2002:ac8:6f37:: with SMTP id i23mr1912117qtv.376.1623879365630;
        Wed, 16 Jun 2021 14:36:05 -0700 (PDT)
Return-Path: <trini@konsulko.com>
Received: from bill-the-cat (2603-6081-7b01-cbda-8009-22e2-67e2-281e.res6.spectrum.com. [2603:6081:7b01:cbda:8009:22e2:67e2:281e])
        by smtp.gmail.com with ESMTPSA id m6sm2101942qtu.11.2021.06.16.14.36.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Jun 2021 14:36:05 -0700 (PDT)
Date: Wed, 16 Jun 2021 17:36:03 -0400
From: "Tom Rini" <trini@konsulko.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [PATCH] conf/machine: k3: Enable grub-efi by default in wic images
Message-ID: <20210616213603.GC9516@bill-the-cat>
References: <20210616183718.25134-1-trini@konsulko.com>
 <20210616190925.GH1528@denix.org>
MIME-Version: 1.0
In-Reply-To: <20210616190925.GH1528@denix.org>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Groupsio-MsgNum: 13846
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0kOoSRP9h7WTOD7G"
Content-Disposition: inline

--0kOoSRP9h7WTOD7G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 16, 2021 at 03:09:26PM -0400, Denys Dmytriyenko wrote:
> On Wed, Jun 16, 2021 at 02:37:18PM -0400, Tom Rini wrote:
> > All of our platforms here support running EFI binaries.  We can have wic
> > generate a simple grub.cfg file for us that will find the root partition
> > via PARTUUID and utilize the device tree that is already discoverable
> > via the EFI configuration tables.  Assuming the EFI loader is U-Boot,
> > this device tree can be replaced at run-time by the normal mechanism of
> > loading in to memory and passing that address as an argument to bootefi.
> >=20
> > Signed-off-by: Tom Rini <trini@konsulko.com>
> > ---
> >  conf/machine/include/k3.inc | 5 ++++-
> >  wic/sdimage-2part-efi.wks   | 7 +++++++
> >  2 files changed, 11 insertions(+), 1 deletion(-)
> >  create mode 100644 wic/sdimage-2part-efi.wks
> >=20
> > diff --git a/conf/machine/include/k3.inc b/conf/machine/include/k3.inc
> > index e0970698b33d..61438abe8f19 100644
> > --- a/conf/machine/include/k3.inc
> > +++ b/conf/machine/include/k3.inc
> > @@ -45,7 +45,10 @@ IMAGE_BOOT_FILES_MULTI_CERT =3D "${SPL_BINARY} u-boo=
t.${UBOOT_SUFFIX} tiboot3.bin"
> > =20
> >  IMAGE_BOOT_FILES ?=3D "${IMAGE_BOOT_FILES_LEGACY}"
> > =20
> > -WKS_FILE ?=3D "sdimage-2part.wks"
> > +EFI_PROVIDER ?=3D "grub-efi"
> > +MACHINE_FEATURES +=3D "efi"
> > +
> > +WKS_FILE ?=3D "sdimage-2part-efi.wks"
> >  do_image_wic[depends] +=3D "virtual/bootloader:do_deploy"
> >  do_image_wic[mcdepends] +=3D "mc::k3r5:virtual/bootloader:do_deploy mc=
::k3r5:ti-sci-fw:do_deploy"
> >  do_image_tar[mcdepends] +=3D "mc::k3r5:virtual/bootloader:do_deploy mc=
::k3r5:ti-sci-fw:do_deploy"
> > diff --git a/wic/sdimage-2part-efi.wks b/wic/sdimage-2part-efi.wks
> > new file mode 100644
> > index 000000000000..6b03080eb5bf
> > --- /dev/null
> > +++ b/wic/sdimage-2part-efi.wks
> > @@ -0,0 +1,7 @@
> > +# short-description: Create SD card image with 2 partitions and EFI su=
pport
> > +# long-description: Creates a partitioned SD card image for TI platfor=
ms that
> > +# supports EFI.  Boot files are located in the first vfat partition wi=
th extra
> > +# reserved space.  We cannot use a GPT here.
>=20
> Was "extra reserved space" in the boot partition lost?
> Not sure if it's still needed - it was used for testing.

I removed it as it doesn't seem to function with bootimg-efi (I didn't
see an obvious "why" either in a quick check in wic internals).  I can
use --fixed-size 128M to bring back a bunch more extra space, if needed.

--=20
Tom

--0kOoSRP9h7WTOD7G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmDKbsAACgkQFHw5/5Y0
tyyXMgwAprQp3kWYnWNrVjNMjN2bHq6sMqp2pXBkN/fD2RGcTEIZ3tjjXuNETpD8
dxagg+hrglSZHTWPScQkJJcmiVsnEZ7/lbeamqR77V3+WsoF2wvFT6mmdzAgSgai
lONjV0x/um1fa3FMffNTLsy2ISAuvr43ecLvyp1eMtTYeQtosbyJRFs3XDPN95KH
b7106upRy9waa1U1DFSOpSvkCd2/dToQ+oAEsmNsLAhT7JRvZVcbej31ne9LApa1
hLNdrfuNkS9ZSz6OzHaXHG7FnDop7y+7dg3GttDKiRWF5kEx6po4bFf6K4oP0ODX
JvWJqPKFvY0jPYMVGpPsvSMspW/zNnyDPnn1ucdS3q1XiQ6OX09hNuDBm1HpH2Yb
TRKed7z8hf8ioZA4+fHUH1fmlXVFLRvbwHr2n3UkW9xMb/lPoyPUXFvSuUhFnGDJ
yHc225K7WLPKgsLfXFAKpKi1Max8zmZzJoGaMsrV4xSzPsUEQn/ibfifohtZj2iD
ZOpkoo5M
=ukng
-----END PGP SIGNATURE-----

--0kOoSRP9h7WTOD7G--
