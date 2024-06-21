Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9C37C27C4F
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 22:42:03 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.86851.1719009715354373655
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 21 Jun 2024 15:41:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wrs3KFy9;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: max.oss.09@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a6ef8bf500dso268210566b.0
        for <meta-ti@lists.yoctoproject.org>; Fri, 21 Jun 2024 15:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719009714; x=1719614514; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xJ/+8wDyZXzej0txbjaYCSx0lKkVAGUWZZDB3ggODXk=;
        b=Wrs3KFy9FEh8Um9ZqI4aKl3I0wHBKdGx3UjG0UHHqVRJaqw0U3USZ78h0Edj1j9TyF
         v8Hs+3syPkRB2rzybPzGZhI2BmyF7yLByo+DSwBdb2Nqehkfn7f2QdWzth5oeIVPxWfZ
         vJAP3EaK2q0It3bgOGaOL2rlNURsyweSHYFH8MJgxY7UIijzKtmb48FlFMj70hk7vQd1
         BHFPlxAgNE8787oS5JO/Gqoa4pfQpoVFXcu78qVXolrQuu4U/qP782BSrInDRtL8wkSO
         e5e+MCFgU6zKZ65e5YdMJyIMkh7mRFM1pOT43+cMzIffmnJiNPTPpRoUWKlOcpajCY+q
         h9qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719009714; x=1719614514;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xJ/+8wDyZXzej0txbjaYCSx0lKkVAGUWZZDB3ggODXk=;
        b=T0UXVqHOLE3c7hAMMz4c/K8Kjf74aVRHmRnjAhbgal6ysNBWkRadqP+c3cgz0HRZFU
         1oK5TAUPBv4VmArfUbGSqczJNUt5ygv1b8W4kA5JlBFfTJGCwyozn7eaTbkenn51qISq
         8EXGwVKzxVmh5+Qt+cwZFw4WCpmwJFlf10BubTehLka0bhOC4sh8BhJPWZD+yke0IK7w
         xkFe012KY4LKRLzmVLpJRaDNw0cAxZjqfi1i3rVHF+MZqoyDaZENWQjBmNhocWm6Tjb7
         6WQ4Eu8xgy8ufcyyZWSyIZ3EsGePRwUg3FbnIGoIKTxDlkGFxaTYMPWBsHbXJ4hF0Dvk
         5tow==
X-Gm-Message-State: AOJu0YwTJyNnutyFLDmj0R13iZS7CQK0jMAhDCQyU7ZJ97wHWivi9kUf
	9jf8jd/sSfKZxI8DZBiWpYe1x848T09rmfBfmBNkNsZRJy157BqL
X-Google-Smtp-Source: AGHT+IEE4SFV/8r05p5w5DL0tAMGxJrLvTzYOLvSyQb6SbHkFOm6RzPNOJnxLRmq/PKG5qlOmOTDCQ==
X-Received: by 2002:a17:907:a607:b0:a6f:e508:1e4c with SMTP id a640c23a62f3a-a6fe5081f39mr11474866b.75.1719009713397;
        Fri, 21 Jun 2024 15:41:53 -0700 (PDT)
Received: from [192.168.0.7] ([194.191.226.159])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a6fcf428c02sm126992866b.6.2024.06.21.15.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 15:41:53 -0700 (PDT)
Message-ID: <7b58709f8ab387300f300e9d2dab96b81639d5cf.camel@gmail.com>
Subject: Re: [meta-ti][master/scarthgap][PATCH]
 ti-img-rogue-driver_23.3.6512818: gcc 14 compat
From: Max Krummenacher <max.oss.09@gmail.com>
To: rs@ti.com, denis@denix.org, reatmon@ti.com
Cc: meta-ti@lists.yoctoproject.org
Date: Sat, 22 Jun 2024 00:41:52 +0200
In-Reply-To: <20240621201533.1531567-2-rs@ti.com>
References: <20240621201533.1531567-2-rs@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 
MIME-Version: 1.0
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 21 Jun 2024 22:42:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17798

Hello Randolph

Am Freitag, dem 21.06.2024 um 15:15 -0500 schrieb rs@ti.com:
> From: Randolph Sapp <rs@ti.com>
>=20
> Bump this recipe to add a change to help with GCC 14 compatibility in
> the check-cc script used to check compiler flags before use.
>=20
> Also ports some of the patches that were added to the kirkstone branch
> post creation of what was supposed to be a temporary scarthgap branch.
>=20
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>=20
> Sorry for the delay. Needed to run some tests since there were some other
> patches that had not been ported to the intermediary branch.
>=20
>  .../powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb         | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_=
23.3.6512818.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driv=
er_23.3.6512818.bb
> index 34c22cb2..7fbb0524 100644
> --- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.65=
12818.bb
> +++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.65=
12818.bb
> @@ -19,7 +19,7 @@ SRC_URI =3D "git://git.ti.com/git/graphics/ti-img-rogue=
-driver.git;protocol=3Dhttps;
> =20
>  S =3D "${WORKDIR}/git"
> =20
> -SRCREV =3D "2f409b4dd2540e896b54bff02219d4fc51129b81"
> +SRCREV =3D "97727f8606ca984527a470252c0bc3ada1bb3f92"

This SHA is not (yet ?) in the repository.
I tried with latest HEAD, i.e. 7b04fd4a24fe. That builds fine in my setup. =
Thanks for the quick fix.

Max

> =20
>  TARGET_PRODUCT:j721e =3D "j721e_linux"
>  TARGET_PRODUCT:j721s2 =3D "j721s2_linux"


