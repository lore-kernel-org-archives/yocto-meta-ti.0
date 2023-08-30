Return-Path: <robertcnelson@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43409C83F15
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 18:26:00 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web10.2348.1693419953946596855
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 30 Aug 2023 11:25:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Ge47jJ1g;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: robertcnelson@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-64f457c97a3so259586d6.2
        for <meta-ti@lists.yoctoproject.org>; Wed, 30 Aug 2023 11:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693419953; x=1694024753; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mKO539gk71S0X3FMVT3kCVdKDeikE4BCMDL2LJAM6Ac=;
        b=Ge47jJ1gFd2myTYhvRYaTNQUOuLJK2VIFcQy/eMD4IGGvM5Tdu34QorOLwF8etL4sp
         N9RF1OaG1uLpPs3vI3/nQLVbF5y9zzCeTXIcY2dJptI1W7KM6Oewe7MhK6c2d8rm/QDs
         Cj8u29NTrszFuZuVArTP4Tdi1Z73sBO1oHEdlduq06VpMXDhYWuqebF7UBa6HxdBdNrr
         Nw/yWaAJxhufUYPEGyY+4UbjlZYYvq0zcFUatugvNGOurY3wWnbe4/BHhvK+jYTE8/pZ
         r/XWjSbevHYWo5RWxg4Q/meHIOTVpOYA+1CRVIYaNwxYwqDtt74pz6+F1ksq9+Nau3hN
         raVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693419953; x=1694024753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mKO539gk71S0X3FMVT3kCVdKDeikE4BCMDL2LJAM6Ac=;
        b=XDD/BjrTMBTaklZw9YdTVm8oxZEZHOune5loc9QKGu9g7dCK04EcW8Zhl/QtyC9WgM
         uNOsazD0d9Rw9mH7mrkkk2RUqLdyxB5YNMj9Ohn5Km9xi4qTUGLG8GHq6rhqfa1s0Jq7
         qD2XcmAop5auEzbZ2rOpleHNgXyrQ7uODZzSdeTsSIYOqOlZyK48oQxv3n6LDq0cLYtC
         SQ0Ckboeb9yr/h+zysqS/zCeXYZy3RbyOEnN7N9mE/UWazsJPi6gzTXSpXVfjhYhfvt1
         gZe99puJGGCgRku987UXRcC53+0XOGNvWtFvBVpideqoD2p4CDYUvUayunRk82h1W8dP
         Ls0Q==
X-Gm-Message-State: AOJu0YxnRU1lhzK1vcXNeFrNryn0G+FlyGi2l9UFhCMYG4JyjVMg8hrN
	TC0pEQ4EqtOzg2wf1hHIrF3bcvwIDDTkOshtzmU=
X-Google-Smtp-Source: AGHT+IEl9rmqNgSlT1xn5LAMKeAna5u5YyLmabDwqt2nTIvZnE0yIFxtlXSimOYBGuSVxT9zN2EnQSR2rk8h4ISZSbI=
X-Received: by 2002:a0c:a989:0:b0:64f:460f:bd1c with SMTP id
 a9-20020a0ca989000000b0064f460fbd1cmr609855qvb.15.1693419952888; Wed, 30 Aug
 2023 11:25:52 -0700 (PDT)
MIME-Version: 1.0
References: <rfsd.1693418612952357533.5JKj@lists.yoctoproject.org>
In-Reply-To: <rfsd.1693418612952357533.5JKj@lists.yoctoproject.org>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Wed, 30 Aug 2023 13:25:26 -0500
Message-ID: <CAOCHtYiqWM8MKLF68mj=rP7smb71RwT2DBp0s3mKSs=o0ezS_w@mail.gmail.com>
Subject: Re: [meta-ti] poky [kirkstone] + systemd fails to mount /boot on
 beaglebone machine - missing nls_ascii?
To: anthony@ajmartinez.com
Cc: meta-ti@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 30 Aug 2023 18:26:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16910

Thanks Anthony,

From the BeagleBoard.org side, I'm sorry about this, we long moved
away from using a fat boot partition, so I didn't catch this.. I'll
push out a newer checkout later today.. Then you'll just need to bump
the BRANCH in yocto..

Regards,

On Wed, Aug 30, 2023 at 1:14=E2=80=AFPM Anthony Martinez via
lists.yoctoproject.org <anthony=3Dajmartinez.com@lists.yoctoproject.org>
wrote:
>
> Hi All,
>
> I'm trying to get poky to run properly with systemd on a Beaglebone Black=
, and I've hit a hitch I can't seem to resolve. What I've done is:
>
> - Clone `meta-arm` and `meta-ti` under `poky`
> - Create and checkout a new `bbb-kirkstone` tracking `origin/kirkstone` b=
ranches in `poky`, `meta-arm` and `meta-ti`
> - Added the paths to `meta-arm/meta-arm`, `meta-arm/meta-arm-toolchain`, =
and `meta-ti/meta-ti-bsp` to `BBLAYERS` in `poky/build/conf/bblayers.conf`
> - Set the following in `poky/build/conf/local.conf`
>
> ```
> MACHINE ?=3D "beaglebone"
> DISTRO_FEATURES:append =3D " systemd"
> DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D "sysvinit"
> INIT_MANAGER =3D "systemd"
> VIRTUAL_RUNTIME_init_manager =3D "systemd"
> VIRTUAL_RUNTIME_initscripts =3D "systemd-compat-units"
> ```
>
> After I run `bitbake core-image-base`, and write the resulting image to S=
D this is what I get on the console at boot:
> ```
> [   15.964307] FAT-fs (mmcblk0p1): IO charset ascii not found
> [FAILED] Failed to mount /boot.
> See 'systemctl status boot.mount' for details.
> [DEPEND] Dependency failed for Local File Systems.
>
> ```
>
> From here, I've got a system in `maintenance` mode with no `/boot` mounte=
d.
>
> If I look in `poky/build/tmp/work/beaglebone-poky-linux-gnueabi/linux-bb.=
org/5.10.162+gitAUTOINC+982fde4eb3-r0/image/boot` I find the following opti=
ons in the config:
> ```
> poky/build/tmp/work/beaglebone-poky-linux-gnueabi/linux-bb.org/5.10.162+g=
itAUTOINC+982fde4eb3-r0/image/boot$ grep FAT config-5.10.162+
> # DOS/FAT/EXFAT/NT Filesystems
> CONFIG_FAT_FS=3Dy
> CONFIG_VFAT_FS=3Dy
> CONFIG_FAT_DEFAULT_CODEPAGE=3D437
> CONFIG_FAT_DEFAULT_IOCHARSET=3D"ascii"
> CONFIG_FAT_DEFAULT_UTF8=3Dy
> CONFIG_EXFAT_FS=3Dm
> CONFIG_EXFAT_DEFAULT_IOCHARSET=3D"utf8"
> # end of DOS/FAT/EXFAT/NT Filesystems
>
> poky/build/tmp/work/beaglebone-poky-linux-gnueabi/linux-bb.org/5.10.162+g=
itAUTOINC+982fde4eb3-r0/image/boot$ grep CONFIG_NLS config-5.10.162+
> CONFIG_NLS=3Dy
> CONFIG_NLS_DEFAULT=3D"utf8"
> CONFIG_NLS_CODEPAGE_437=3Dm
> CONFIG_NLS_CODEPAGE_737=3Dm
> CONFIG_NLS_CODEPAGE_775=3Dm
> CONFIG_NLS_CODEPAGE_850=3Dm
> CONFIG_NLS_CODEPAGE_852=3Dm
> CONFIG_NLS_CODEPAGE_855=3Dm
> CONFIG_NLS_CODEPAGE_857=3Dm
> CONFIG_NLS_CODEPAGE_860=3Dm
> CONFIG_NLS_CODEPAGE_861=3Dm
> CONFIG_NLS_CODEPAGE_862=3Dm
> CONFIG_NLS_CODEPAGE_863=3Dm
> CONFIG_NLS_CODEPAGE_864=3Dm
> CONFIG_NLS_CODEPAGE_865=3Dm
> CONFIG_NLS_CODEPAGE_866=3Dm
> CONFIG_NLS_CODEPAGE_869=3Dm
> CONFIG_NLS_CODEPAGE_936=3Dm
> CONFIG_NLS_CODEPAGE_950=3Dm
> CONFIG_NLS_CODEPAGE_932=3Dm
> CONFIG_NLS_CODEPAGE_949=3Dm
> CONFIG_NLS_CODEPAGE_874=3Dm
> CONFIG_NLS_ISO8859_8=3Dm
> CONFIG_NLS_CODEPAGE_1250=3Dm
> CONFIG_NLS_CODEPAGE_1251=3Dm
> CONFIG_NLS_ASCII=3Dm
> CONFIG_NLS_ISO8859_1=3Dm
> CONFIG_NLS_ISO8859_2=3Dm
> CONFIG_NLS_ISO8859_3=3Dm
> CONFIG_NLS_ISO8859_4=3Dm
> CONFIG_NLS_ISO8859_5=3Dm
> CONFIG_NLS_ISO8859_6=3Dm
> CONFIG_NLS_ISO8859_7=3Dm
> CONFIG_NLS_ISO8859_9=3Dm
> CONFIG_NLS_ISO8859_13=3Dm
> CONFIG_NLS_ISO8859_14=3Dm
> CONFIG_NLS_ISO8859_15=3Dm
> CONFIG_NLS_KOI8_R=3Dm
> CONFIG_NLS_KOI8_U=3Dm
> CONFIG_NLS_MAC_ROMAN=3Dm
> CONFIG_NLS_MAC_CELTIC=3Dm
> CONFIG_NLS_MAC_CENTEURO=3Dm
> CONFIG_NLS_MAC_CROATIAN=3Dm
> CONFIG_NLS_MAC_CYRILLIC=3Dm
> CONFIG_NLS_MAC_GAELIC=3Dm
> CONFIG_NLS_MAC_GREEK=3Dm
> CONFIG_NLS_MAC_ICELAND=3Dm
> CONFIG_NLS_MAC_INUIT=3Dm
> CONFIG_NLS_MAC_ROMANIAN=3Dm
> CONFIG_NLS_MAC_TURKISH=3Dm
> CONFIG_NLS_UTF8=3Dm
> ```
>
> The internet suggests that `CONFIG_NLS_ASCII=3Dy` may resolve the issue, =
but as I'm quite new to Yocto I'm not sure what the right way to do that wo=
uld be. I attempted to start with `devtool modify linux-bb.org`, but was me=
t with an immense traceback ending in:
> ```
> Exception: bb.fetch2.FetchError: Fetcher failure for URL: 'git://github.c=
om/beagleboard/linux.git;protocol=3Dhttps;branch=3D${BRANCH}'. Please set a=
 valid SRCREV for url ['SRCREV_default:pn-linux-bb.org', 'SRCREV_default', =
'SRCREV:pn-linux-bb.org', 'SRCREV'] (possible key names are git://github.co=
m/beagleboard/linux.git;protocol=3Dhttps;branch=3D${BRANCH}, or use a ;rev=
=3DX URL parameter)
> ```
>
> Any suggestions as to how I might proceed and resolve this are greatly ap=
preciated.
>
> Regards,
> Anthony
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16908): https://lists.yoctoproject.org/g/meta-ti/mess=
age/16908
> Mute This Topic: https://lists.yoctoproject.org/mt/101058535/3619810
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [robertcnelso=
n@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Robert Nelson
https://rcn-ee.com/

