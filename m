Return-Path: <perezmeyer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FCE0EE3F11
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 19:40:54 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web10.4492.1694547648480281456
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 12 Sep 2023 12:40:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=TQdYm4Am;
 spf=pass (domain: gmail.com, ip: 209.85.161.41, mailfrom: perezmeyer@gmail.com)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-573912a7b14so3786245eaf.1
        for <meta-ti@lists.yoctoproject.org>; Tue, 12 Sep 2023 12:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694547647; x=1695152447; darn=lists.yoctoproject.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=vBLYbs4sSnXTyo+5KDkdbxTNQIxti23q6OIcQ1+Pnp8=;
        b=TQdYm4AmkraOlkENGudgQ4UL9rIbbGtzWdWNaHfmdy3D4SkQBoyuvLn2VQqXZ1xzwG
         cM4XEEcJz53tqVqM3n/sx5pHqrKsO5Dc6LPErxKTh+b8ZZjMTu3f61d/ufeXaVGFR2hl
         PqCSRrCKAWT5tH5UHEjKafjQQR5nzhR397AYarCl2J+P6cRIIulsdb6kdwn75RIRP68p
         ER4jOpGhIP1IbF/T2WI341DLXT74ByIbX515o2eooEGCYa5pabiO+ULRfVI58MOKF85K
         tO8Q0RTFWjND0cuFk3iA2fG89OHoNRMcq2EqzNDvVda7TmmQ8ZONuyg+cBvsJ/csqH1G
         YH2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694547647; x=1695152447;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vBLYbs4sSnXTyo+5KDkdbxTNQIxti23q6OIcQ1+Pnp8=;
        b=emWy5L8t0R+glPpVd6owNR7otCbMJToxgv5WD/vXiqAJNzpN1qGsHkJTILt792ufNU
         pJPzl9ApgVZnbrySk3BGdBpVRJp2dfJEsf9xKaElGNuCxfK6D31ZhUpLtr8RvamIbtpp
         7dXy5XeIuwN6jelJvZTylsQ4pJ262nxqKmFDGbZ7JpQlN0wMfYEOrsQ13zLlDvlW59fD
         nMHtwD7RJKU0FxsGvcTO2XzD4Xn1AfZaMO0ilpJqyRVuOh85YGH+WkpMVPHLvLKUQpGe
         Kv0/PFS9pzCJsWxMS+AQ/bzYPmM8MtOhopit87tWxgjicEwezhIb9XGuQ8PplX/YZq1e
         MWgQ==
X-Gm-Message-State: AOJu0YyVycUtnIRNFmLUt2RRP8RCbElb7ZFuK2Vg+96VsacE8HpkRtXK
	hT+bOBcfxp+bRaSQboltVbnD3owSuz0=
X-Google-Smtp-Source: AGHT+IFeAMTaD/IQt9pO8OVsv22hQ62+SUZLgnwltE5RGwGlVwgdzVL0IiG9S6+M8jruRsX1EMosFw==
X-Received: by 2002:a05:6871:8a9:b0:1c4:db12:8752 with SMTP id r41-20020a05687108a900b001c4db128752mr463038oaq.35.1694547647440;
        Tue, 12 Sep 2023 12:40:47 -0700 (PDT)
Received: from gryffindor.localnet ([181.197.222.104])
        by smtp.gmail.com with ESMTPSA id eb20-20020a056870a89400b001cce851c7basm5466112oab.11.2023.09.12.12.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 12:40:46 -0700 (PDT)
From: 
 Lisandro =?ISO-8859-1?Q?Dami=E1n_Nicanor_P=E9rez?= Meyer
 <perezmeyer@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: perezmeyer@gmail.com
Subject: 
 Re: [meta-ti] [PATCH] linux-bb.org: depend upon the required firmware files
Date: Tue, 12 Sep 2023 16:40:40 -0300
Message-ID: <4037500.L2J8S2p8Tj@gryffindor>
In-Reply-To: <17843DDD8C6E6A99.10919@lists.yoctoproject.org>
References: <17843DDD8C6E6A99.10919@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart6622189.0qCgKiprM3";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 12 Sep 2023 19:40:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16958

--nextPart6622189.0qCgKiprM3
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
To: meta-ti@lists.yoctoproject.org
Cc: perezmeyer@gmail.com
Date: Tue, 12 Sep 2023 16:40:40 -0300
Message-ID: <4037500.L2J8S2p8Tj@gryffindor>
In-Reply-To: <17843DDD8C6E6A99.10919@lists.yoctoproject.org>
References: <17843DDD8C6E6A99.10919@lists.yoctoproject.org>
MIME-Version: 1.0

Apologies for duplicates, first time sending patches via git-email :)
--nextPart6622189.0qCgKiprM3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEEt36hKwjsrvwSzE8q2RfQGKGp9AFAmUAvrgACgkQq2RfQGKG
p9DYBRAAsJTJRImkE5VygPHRZrR5lujheDiO92XuUjUr5mINH9AXGVTGIyf4L3Qn
tE861D4HVkbvrb03cwSJkZp+LeURU+o+RAZh6xs8vf4uv9gblw/635nrjqFPKsRb
KtnmJCQodrooAH2C3c8FPgDEP6RgS2lhi1/eTjMZfvpk1GS2lDf7a+KY5pEBE3Wq
oCOpLpOSv1Pswd7S7Faex6+mfdrLC+lkUVsCVZKWr/n6syXP8PvZ5/WEVkx7DjMB
SpSnxxTL6LercB+ulhDdGQPrAqO+tG5a2fmbkf7CIhfRXBfS8GFjzE0I3a3US7kY
WqYNsXm361peWwp41YBI2Gt1So4VKKhuHKh+gYw+T1XbTROjxZA2l1rRYfIAUCn4
6jvO699clBZ3t71XOo6oQhooJdqVY9gTeQzCbcNdJOX2WAvQC2pwHj5AZ1scmSEA
mhKaSuoUciMw+a9tak9IDT/sSoY7ngi0B1qKBHnQIpH72o3e4bcpsDzdJspXEOK8
rkjGBnBtJO381jZT6DHP/uWXJK++x5gDzkaCBfFE/yQntLVt0txB0qn+KbW31Bnr
ej+74jelUO0lgZCyzbTl3owciMa+0oSOAmbX3SAWy094PLFhgH5UqVTaqbsULwjJ
YMFp2/QXG3iVz8kgfiD7kF2j2YbQoyuxgfIN0duuduGH29narFc=
=4I6+
-----END PGP SIGNATURE-----

--nextPart6622189.0qCgKiprM3--




