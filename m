Return-Path: <robertcnelson@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81836C761A6
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 15:18:42 +0000 (UTC)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
 by mx.groups.io with SMTP id smtpd.web11.104740.1680621519748123432
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 04 Apr 2023 08:18:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=ZkXGPgw1;
 spf=pass (domain: gmail.com, ip: 209.85.222.54, mailfrom: robertcnelson@gmail.com)
Received: by mail-ua1-f54.google.com with SMTP id 89so23558476uao.0
        for <meta-ti@lists.yoctoproject.org>; Tue, 04 Apr 2023 08:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680621518; x=1683213518;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g6vGWbr5YhPR7WomwCQ9weMU4iS8ofXu3/zMVUAXavA=;
        b=ZkXGPgw11XSfwRBkFo630JdCHsK7W4Sf1IKrreSIyORHzH7rxyXjlCRjzxQWEJBffR
         w4XeG3nv+CR36t8G80kIkTc9+qfsnGKk72JEdaStgtlJUHxMJMMERVBYt/pnbul3kzBO
         ruNulhVLnOE3J7+OEMWcdISwi+zxv05a9zrcVgTgNJ0sPLKpuMray0uJe+uPlFqgmZnK
         t9naKlpCq4D4qg9DQUg4jBuPQ0LGnKhz3xWKSVyfr5Qo5Pt1xCKORFxBqJXkU5u8zPPO
         zwVX0ZzU/U4TgHlmocOKhxsTI9byUfEgLV5UMjszc2yWQyGC3AL773auIHl6drmfILhZ
         Wfaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680621518; x=1683213518;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g6vGWbr5YhPR7WomwCQ9weMU4iS8ofXu3/zMVUAXavA=;
        b=4g9YSeUxXyZYKNmRco96stJOWTRD89t7DqeTGqWeqMWnnVXPxhiNGBvkPJN0LPBqjU
         xuT7NdZpXS41a8Jh//PbniNZJ2Ka4Te58zqZ8aUhe2q49s5CNHUGSD9MXEoFRNhgxg26
         Uw/FeRDxItxrOt7Kv94/MN29JRwq5QaAtIlMGvbABGf2gH23Uar31vYQGbd1ftAw5CLm
         5fzezEvIBysRsg0UwhvDMTeXQpvnI7B2QjZ2o+VE9SssiknmA5hadaHY631ayX3LiPNO
         sAk4aL8PMPV5POibjVZ1Y1+GN2m+oeN4gmZI+uoFrfVZAOvfIbG4++QTwA8INJ7mnaN6
         Osdg==
X-Gm-Message-State: AAQBX9fe4vUIwnoHd7V1hGQ3AI/fCL4ZKAkCqz8pCssVt9IqZFoSpgbm
	/wdun30zgnsWNE8RpMBjaMctxEwX9MHEBppMBOQ=
X-Google-Smtp-Source: AKy350bciKKYOrko79xJArKynkrBJ7pMwOUmrFKsue2/yXZsiRkZ03b1feAc8mO88QarIFHCl0zly03qrZsVNmW99C0=
X-Received: by 2002:a1f:244e:0:b0:432:9a63:1696 with SMTP id
 k75-20020a1f244e000000b004329a631696mr2398715vkk.1.1680621518623; Tue, 04 Apr
 2023 08:18:38 -0700 (PDT)
MIME-Version: 1.0
References: <1752C446E30A0135.3977@lists.yoctoproject.org>
In-Reply-To: <1752C446E30A0135.3977@lists.yoctoproject.org>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Tue, 4 Apr 2023 10:18:12 -0500
Message-ID: <CAOCHtYiFjSoeJOVtknSPpQ54XDzon1hy=-jvu0+N3Y3R+BWwTA@mail.gmail.com>
Subject: Re: [meta-ti] [PATCH] meta-ti-bsp: BeagleBoard-u-boot switch to
 GitHub mirror
To: robertcnelson@gmail.com
Cc: meta-ti@lists.yoctoproject.org, denys@konsulko.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 04 Apr 2023 15:18:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16288

ps, internally on https://git.beagleboard.org/beagleboard/u-boot this
is setup to sync out to https://github.com/beagleboard/u-boot so it's
an exact copy..

On Tue, Apr 4, 2023 at 10:17=E2=80=AFAM Robert Nelson via
lists.yoctoproject.org
<robertcnelson=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> BeagleBoard.org use the new u-boot mirror on GitHub
> https://github.com/beagleboard/u-boot as
> https://git.beagleboard.org/ easily becomes overloaded
>
> Signed-off-by: Robert Nelson <robertcnelson@gmail.com>
> ---
>  meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb b/meta-t=
i-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb
> index 28a347be..bdc40c0f 100644
> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-bb.org_git.bb
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://Licenses/README;md5=3D5a7450=
c57ffe5ae63fd732446b988025"
>
>  PV =3D "2021.01"
>
> -UBOOT_GIT_URI =3D "git://git.beagleboard.org/beagleboard/u-boot.git"
> +UBOOT_GIT_URI =3D "git://github.com/beagleboard/u-boot.git"
>  UBOOT_GIT_PROTOCOL =3D "https"
>  BRANCH =3D "v2021.01-ti-08.05.00.005-SDK-8.5"
>  SRCREV =3D "46ff4982b41067e5c93369bddd49b1541856d80b"
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16287): https://lists.yoctoproject.org/g/meta-ti/mess=
age/16287
> Mute This Topic: https://lists.yoctoproject.org/mt/98062139/3619810
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [robertcnelso=
n@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Robert Nelson
https://rcn-ee.com/

