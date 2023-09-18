Return-Path: <perezmeyer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCF72C46CA1
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 20:16:36 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.web11.1703.1695068194073308504
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 18 Sep 2023 13:16:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ntVIP4VT;
 spf=pass (domain: gmail.com, ip: 209.85.161.43, mailfrom: perezmeyer@gmail.com)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-57129417cecso2638802eaf.1
        for <meta-ti@lists.yoctoproject.org>; Mon, 18 Sep 2023 13:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695068193; x=1695672993; darn=lists.yoctoproject.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3aVuWcPUpkZJ4LK/UZPbHJvzUc8yoS5fUe4TGsIvlpE=;
        b=ntVIP4VTudu3tdwnk45NgcW0dfOmcpDpqVh2daTcymtwZNLhLc7uSy/ztrFvcvbY0M
         B2dbKv//cxLqWGGAkgK/2NI5JV++xNSQ6Xt43FHeFq9R1v1vTQudV5HyOCShYna3PEng
         BcNlqWQ0AXUy9mIL9gkoeashEEexz3Fa16bc1BJonjRWGCGR1SBz1yf9Ivp1DeBWmMoZ
         DHaFhOcdcwPil0fzIvklGoY4367es91WlZ+Xa5bWzDoJvIyn4Yepic4J3p27U2qpywP1
         SpgNBjH1MxYobSBI8G+9Qm4auu0TXzAbFI5KPTEtGSO42Hp9upjWM2EGV+rfjzsZbvzf
         cKAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695068193; x=1695672993;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3aVuWcPUpkZJ4LK/UZPbHJvzUc8yoS5fUe4TGsIvlpE=;
        b=PspTVLMNrWb58wv7JkUeZreZVtDUYjt1r/uaSaXY5fwW9O5HpsyfLddWzf4XDpne3x
         gjmddZm5tFhv7rj4AWyd/dkqLEYfcyMCQMw5wvb/8JKJrhDx51Br1zZYXkKr+3mZ8z8A
         pb82kgBErsA2QCcjAaSQTte/xu6S6dKGw3qs5kGuLQXzprSmbcUJKFON68V7WdJ8HTYU
         M4kaIL2fWGnC9pM7sIG8zQvImVNssLe2nqc6ymJRvu795gIuEU77w8D8AzJ60gfBCM16
         7Royid4VczWDc6xJ675Z3hMxzISJD4f8uIdh7Qcfd0V7RyV+BS7aJeswzpEZADFYTUDT
         CPBw==
X-Gm-Message-State: AOJu0YzMm6PmFHf6ffT2/9Mbzejf1GS4hbFFKlBNLMoZ4NrDsEplEz0S
	tpIXQ+8fZtFVrXJyfLI8omB6yk7ulOI=
X-Google-Smtp-Source: AGHT+IHiQSxiP+Qrj2yqd9hE549g3aiIjsV8EvC5sQvU0f4ExEi1KRI9HZusugui5hbBmn5d1P6f/w==
X-Received: by 2002:a4a:314e:0:b0:571:1c44:c9c0 with SMTP id v14-20020a4a314e000000b005711c44c9c0mr524366oog.1.1695068192614;
        Mon, 18 Sep 2023 13:16:32 -0700 (PDT)
Received: from gryffindor.localnet ([181.197.222.104])
        by smtp.gmail.com with ESMTPSA id f139-20020a4a5891000000b00563155bd360sm5054579oob.17.2023.09.18.13.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 13:16:31 -0700 (PDT)
From: 
 Lisandro =?ISO-8859-1?Q?Dami=E1n_Nicanor_P=E9rez?= Meyer
 <perezmeyer@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: Joel Winarske <joel.winarske@gmail.com>
Subject: Re: [meta-ti] [kirkstone] beaglebone-ai64
Date: Mon, 18 Sep 2023 17:16:22 -0300
Message-ID: <4944740.qmqfjKhsMY@gryffindor>
In-Reply-To: <cJr9.1694721437908350278.lV3S@lists.yoctoproject.org>
References: <cJr9.1694721437908350278.lV3S@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3899559.U6EdRK5XkY";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 18 Sep 2023 20:16:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16989

--nextPart3899559.U6EdRK5XkY
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
To: meta-ti@lists.yoctoproject.org
Cc: Joel Winarske <joel.winarske@gmail.com>
Subject: Re: [meta-ti] [kirkstone] beaglebone-ai64
Date: Mon, 18 Sep 2023 17:16:22 -0300
Message-ID: <4944740.qmqfjKhsMY@gryffindor>
In-Reply-To: <cJr9.1694721437908350278.lV3S@lists.yoctoproject.org>
References: <cJr9.1694721437908350278.lV3S@lists.yoctoproject.org>
MIME-Version: 1.0

Hi!

El jueves, 14 de septiembre de 2023 16:57:17 -03 Joel Winarske escribi=F3:
> Hi folks,
>=20
> I've built core-image-weston for beaglebone-ai64.
>=20
> I'm imaging sdcard using:
>     sudo bmaptool copy ./core-image-weston-beaglebone-ai64.wic.xz /dev/sda
>=20
> The image is not booting.
>=20
> Are there any known issues with this layer on kirkstone tip of tree?
>=20
>=20
> (I'm looking into making flutter-auto (AGL) run on this device; I'm the a=
uthor of flutter-auto)

Yes, I could only run the image by booting from the SD card. I'm trying to =
add Balena support to it.

I've compared BeagleBone's and meta-ti's u-boot and they differ in a few pl=
aces which seem to be related to the eMMC, so my guess is that the issue ne=
eds to be solved there first.

--nextPart3899559.U6EdRK5XkY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEEt36hKwjsrvwSzE8q2RfQGKGp9AFAmUIsBYACgkQq2RfQGKG
p9DqMA//UJ4SoBNuRWpJ18WifOZmwKh7jCTzVfpyrJdkN1fR6SCd4jrQMrHB90Iz
ARzBU/IPnLv4LFPO83OgJ6ka26strijqy9u5ZoCO1O0Jm/Gg/yF8xTpPTedtrcNx
2oFxwK6o7r8N0+KlY8YHbXo1kUsp9RvI9hEo/YQH2ozbSqLWwT/C8PYAemV1WX0w
oyufFAVZQB+rRxBtjmR/XH4JL9Hlh0BPT5V7N6y1B+eXolCI5ukPTpGNGx6EDP1O
pQdQZkViSMUJvM192xvjhuQBmj2Z3YC8uKiBvgAX4z1HsLqHzskN1OS+n+/MO9t0
Tpl6TFVXF6kxrzqFiHB5sgbO1c9EA1He0aV6Jd5Pueweuyyo2htnd4zmoCQNVSaP
vrDiTl/AJlCzsEXJC8G96mN1oCngDHHhBzCl8gSNrOXPeDhNhA0iz7YQPOHe/Jte
ewplHq9q2V710R7ap/5STNDnQWUpRGERXOKuf1Fbwm3dXPTz6N6Dd/oKAURDq7sM
zmpkx2uN485vdD5szHOGtH92KktG3Zsl8WfJpP2+NO92OjjNiGRfX1i2EAJKcKKb
4ygrFLb/07cIRyTJcT4CmWLw15+gHEQWxd+V2HOt5ynVS6oIV6PRGNT4YlT+hYfe
YzLt45+v6EpLFdIipxoCFGmKxhm98FHuffGs/RM6j3sBgW1lXa0=
=MzsY
-----END PGP SIGNATURE-----

--nextPart3899559.U6EdRK5XkY--




