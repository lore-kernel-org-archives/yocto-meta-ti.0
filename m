Return-Path: <perezmeyer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA189EE3F0C
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 19:18:23 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web10.3875.1694546301078220082
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 12 Sep 2023 12:18:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=HhbhjJVg;
 spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: perezmeyer@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6c0bbbbad81so3677990a34.3
        for <meta-ti@lists.yoctoproject.org>; Tue, 12 Sep 2023 12:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694546300; x=1695151100; darn=lists.yoctoproject.org;
        h=mime-version:message-id:date:subject:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=El3Dr0yuiGL8OGYPfQdUTWJYt70gVoMEl66+5HKUqf0=;
        b=HhbhjJVgFR3lggA1LjkEM0lFYc5/U3JHfOOfICMuU3z2ycOrc2qVgi9IjyDr7lwFbi
         h8iYTdNJUH+rk49iM0kcSJwZ73k0n54BACEeL9kFQxXB67kk7BSwMbMP3UIWpD53Mbyt
         y2H2Qs9ntMq7s2dp82J9Ej0Xhu5k456e/0hWr1PonElr8uwgrOW5J9Sv5NJpbuHzQlJc
         lgmP2d+Wj73oD4wz/eGpEA4i/d7vvEjxW8N3Oz9SpwlQv/87Q5O4AYYCFyWx5BKKon97
         ouIX+fa+moWVuvoOtEBPxFzdBsDEwZr3EnHxTYdbHnM6FPtPIzhAU6+KNmJkU6gPiSZZ
         1G5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694546300; x=1695151100;
        h=mime-version:message-id:date:subject:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=El3Dr0yuiGL8OGYPfQdUTWJYt70gVoMEl66+5HKUqf0=;
        b=KUkcGcF00Qg7He3IS81PyKeXFaZ7oqhwGfRLJleeT/TgCj4tk65HnfvgqZNZc4mzUx
         XV/+voz/QNBJ2mBWCuTcD1J8sBMm5GvJ8WLcLVP2puzsZCIQJai9nDkWAAH/crr8qfD/
         hRqnD6vC6NhnSTtLrvXc+C/GQ+6DY7W6CiqcNobdyJ+SKulsL0sn/2aiUm+cHxWPyZQI
         E5cmYAv+TyNVUHkuh92sFEgPtzVlvZIqdAmdEcaRyJVYNrlWDlY8tPli9g3hbLk4Hd7w
         KDZxgD4ys2EOJQUG5Or0/bcLANs8vIuE30f92kMx3yrhm3tUGOJ0sfihb9h/9YyhHyTL
         Df5Q==
X-Gm-Message-State: AOJu0Yx4ASFm0pBmZ0q0h6raCmnhtV9EsUp1OmBxD5yfGbntoJAJ3bF3
	pApUW3uNNCkT3yrepnxWXZfscpA5yOM=
X-Google-Smtp-Source: AGHT+IHw+jh394y1GouT37X2unjElVZ0EOdsFmIbmdQJywATRV67MTBzvXuc155xy9FkmkEVteXo5A==
X-Received: by 2002:a05:6830:16d3:b0:6b7:43eb:c1a with SMTP id l19-20020a05683016d300b006b743eb0c1amr721292otr.36.1694546299844;
        Tue, 12 Sep 2023 12:18:19 -0700 (PDT)
Received: from gryffindor.localnet ([181.197.222.104])
        by smtp.gmail.com with ESMTPSA id y21-20020a0568301d9500b006b9f26b9b94sm4355130oti.28.2023.09.12.12.18.17
        for <meta-ti@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 12:18:18 -0700 (PDT)
From: 
 Lisandro =?ISO-8859-1?Q?Dami=E1n_Nicanor_P=E9rez?= Meyer
 <perezmeyer@gmail.com>
To: meta-ti@lists.yoctoproject.org
Subject: linux-bb.org: depend upon the required firmware files
Date: Tue, 12 Sep 2023 16:18:10 -0300
Message-ID: <1932870.oLueN0jGR5@gryffindor>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2909460.z4fYimPihf";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 12 Sep 2023 19:18:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16956

--nextPart2909460.z4fYimPihf
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
To: meta-ti@lists.yoctoproject.org
Subject: linux-bb.org: depend upon the required firmware files
Date: Tue, 12 Sep 2023 16:18:10 -0300
Message-ID: <1932870.oLueN0jGR5@gryffindor>
MIME-Version: 1.0

=46rom 779324cc78d8a9f97718536d6ced6863c38e5f0f Mon Sep 17 00:00:00 2001
=46rom: =3D?UTF-8?q?Lisandro=3D20Dami=3DC3=3DA1n=3D20Nicanor=3D20P=3DC3=3DA=
9rez=3D20Meyer?=3D
 <perezmeyer@gmail.com>
Date: Tue, 12 Sep 2023 16:12:47 -0300
Subject: [PATCH] linux-bb.org: depend upon the required firmware files
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

Same as with linux-ti-[mainline staging].

Signed-off-by: Lisandro Dami=E1n Nicanor P=E9rez Meyer <perezmeyer@gmail.co=
m>
=2D--
 meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb b/meta-ti=
=2Dbsp/recipes-kernel/linux/linux-bb.org_git.bb
index e134fb84..ac258a64 100644
=2D-- a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
@@ -8,6 +8,7 @@ COMPATIBLE_MACHINE =3D "beagle.*"
 inherit kernel
=20
 require recipes-kernel/linux/setup-defconfig.inc
+require recipes-kernel/linux/kernel-rdepends.inc
 require recipes-kernel/linux/ti-kernel.inc
=20
 DEPENDS +=3D "gmp-native libmpc-native"
=2D-=20
2.40.1


--nextPart2909460.z4fYimPihf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEEt36hKwjsrvwSzE8q2RfQGKGp9AFAmUAuXIACgkQq2RfQGKG
p9D3dhAAnGh80fwdcwkAVJe2D2gsMEtrFd2e4wAM9rrm5GoABguDAC+N+CUEwtjO
0JvWoOYOMsvsMC35rxAGUAk/bWLMYhAaqYjoaM5JhK21mZOFsNJycxuIjmWE84vI
w2Ou3Cp6rVXibvwhbTEoEydMosyzWo0Is2fUjRPk1i01zIv5/0g8NqR/MKtVrCnd
dz8zEBiPkCkWXWtHQXS1TiXLwmh+1gv5w9nbEphRv32UwqQ4YDy3+jPyKNTCe4yB
Q6bHtRn8o7W790A1W/LuxiITvfTynZfJcc+0j9p9Zg9L7at23+CY67s3Wu0GfaFh
gowdfFC7oNjmMELh2qUrvXZzBmBtwkpd6f8eeXAufuZNmAwnc3jrx1BSFvLvrmMT
e29pvWqoghfLOHyfBRLraw0cn6iX/lBt8fl8Z94xd4eXwYID0lPk1tKmCTu9a1zm
NOEL9DkH610jh1WhM2QcBGCVFQSc+zMoczTPvZAaElwjMZb8LP6fz8hB45jhrwGc
Ddcv91HocMfRoevOC4BqksJ5wVmZvrP9MV+EVs/4wWxykq2aUQDwNLz5aoX8ar0D
qiA2Oa3GcMGzLpc20V+58PZSZYb8u+iXG6UzSLP+6Gp845RpJdnsB94TAR5WsMOy
mFkDtIhMMfxhMdMO8aivR7LpThrjayyrzrXQyIUl73yNCnrd2UE=
=VaaA
-----END PGP SIGNATURE-----

--nextPart2909460.z4fYimPihf--




