Return-Path: <robertcnelson@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A837EE49B0
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 21:40:22 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web11.6915.1693518013892322110
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 31 Aug 2023 14:40:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=MhJFnUcV;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: robertcnelson@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-58fae4a5285so14702727b3.0
        for <meta-ti@lists.yoctoproject.org>; Thu, 31 Aug 2023 14:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693518013; x=1694122813; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BdeI6EruGLTnh5rtydFPoNrANBsQ+CTwJKiHopANyZ8=;
        b=MhJFnUcVZ1+2gHtD3YvQJIOakaiiczTDeBzeB8EwUCiBynf8UKkt24GQu+Fsvbd53V
         0CDvRYikspc4G/mJS2G9w2luSp907NckwCntt4pYYeJN0/llspKbJHtoJgCtnQhypQqV
         sHV1v86fy/VQTk8kjx6rdOUnwdj1umYu/1tpINt/RoCIYMOW7a6RmdSLgl/lrdFOneDc
         aSOW8pLjJQkrsc8OM51CinOA22FFH0ZPcYh5FJPdQ4nj68Rd54/9QT9iem/vpGoBrSQm
         PJb7Jf6sxfZpF3HjKIWa8zwdHHGBIBWEWH02lJH3moUnob74zDVbnN7kLnRpvvhLxrZl
         o3lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693518013; x=1694122813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BdeI6EruGLTnh5rtydFPoNrANBsQ+CTwJKiHopANyZ8=;
        b=lhJJsy/IhOAh5QweQEoYKNBvMvVBqf63yg6eYAohlJfZzd1Fnbqrbx9xG07zcUNfg/
         XleacJDUm783vRsvw4Dk+6kd0US7tCxhq2Zzn0j+xyegZi3JquereGKaAiK3qKeZ5GUd
         ZE06Kt3xFSGmqvdWXUhNNS8Q8yxLyUueJMGXnBN9S83V+3pcHpfTuD7SR4mWNFvQuU6Y
         0YEOwYNtCy/8m7lkAk1Mn4iHGF3RbSLiulpFktQD+jIQVD95VnipYVUnRY4l2SYuA5Jf
         3CYD8sRrcQNUkF04CsTk3zLgxG8QwTv/juk7xju14/zDj1M2KxhMX2qUhQl72rxrE4TG
         24QQ==
X-Gm-Message-State: AOJu0YzyAB5RcoQlUSABlR01B2N27I3elcX5iFEQljJlDqK0PGus48hF
	NCs4Za0YfcNy01720VhCHtjm0bEJqCHVYWAjBbc=
X-Google-Smtp-Source: AGHT+IEOKxtQw1qfUV6lKlQsGtToh6SNCp0YPkl9CYZuakozc1bONihf5srM/0RCQk9xg5/JariclPOwqNQXX0huOLs=
X-Received: by 2002:a81:94c4:0:b0:56d:2f9d:42cc with SMTP id
 l187-20020a8194c4000000b0056d2f9d42ccmr685144ywg.51.1693518011881; Thu, 31
 Aug 2023 14:40:11 -0700 (PDT)
MIME-Version: 1.0
References: <rfsd.1693418612952357533.5JKj@lists.yoctoproject.org> <17803C79E767D60F.1601@lists.yoctoproject.org>
In-Reply-To: <17803C79E767D60F.1601@lists.yoctoproject.org>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Thu, 31 Aug 2023 16:39:45 -0500
Message-ID: <CAOCHtYhsR-=ifPDqofyjHiN-tts+b6sumh5iVXV=C6LnC8TKiQ@mail.gmail.com>
Subject: Re: [meta-ti] poky [kirkstone] + systemd fails to mount /boot on
 beaglebone machine - missing nls_ascii?
To: robertcnelson@gmail.com
Cc: anthony@ajmartinez.com, meta-ti@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 31 Aug 2023 21:40:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16913

Okay , now pushed:

https://github.com/beagleboard/linux/tree/v5.10.168-ti-r70

config change for loading fat without initramfs..
https://git.beagleboard.org/RobertCNelson/ti-linux-kernel-dev/-/commit/5c43=
91852d7ebd91627b158fe35d6aa6a99bc649

On Wed, Aug 30, 2023 at 1:25=E2=80=AFPM Robert Nelson via
lists.yoctoproject.org
<robertcnelson=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> Thanks Anthony,
>
> From the BeagleBoard.org side, I'm sorry about this, we long moved
> away from using a fat boot partition, so I didn't catch this.. I'll
> push out a newer checkout later today.. Then you'll just need to bump
> the BRANCH in yocto..
>
> Regards,
>
> On Wed, Aug 30, 2023 at 1:14=E2=80=AFPM Anthony Martinez via
> lists.yoctoproject.org <anthony=3Dajmartinez.com@lists.yoctoproject.org>
> wrote:
> >
> > Hi All,
> >
> > I'm trying to get poky to run properly with systemd on a Beaglebone Bla=
ck, and I've hit a hitch I can't seem to resolve. What I've done is:
> >
> > - Clone `meta-arm` and `meta-ti` under `poky`
> > - Create and checkout a new `bbb-kirkstone` tracking `origin/kirkstone`=
 branches in `poky`, `meta-arm` and `meta-ti`
> > - Added the paths to `meta-arm/meta-arm`, `meta-arm/meta-arm-toolchain`=
, and `meta-ti/meta-ti-bsp` to `BBLAYERS` in `poky/build/conf/bblayers.conf=
`
> > - Set the following in `poky/build/conf/local.conf`
> >
> > ```
> > MACHINE ?=3D "beaglebone"
> > DISTRO_FEATURES:append =3D " systemd"
> > DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D "sysvinit"
> > INIT_MANAGER =3D "systemd"
> > VIRTUAL_RUNTIME_init_manager =3D "systemd"
> > VIRTUAL_RUNTIME_initscripts =3D "systemd-compat-units"
> > ```
> >
> > After I run `bitbake core-image-base`, and write the resulting image to=
 SD this is what I get on the console at boot:
> > ```
> > [   15.964307] FAT-fs (mmcblk0p1): IO charset ascii not found
> > [FAILED] Failed to mount /boot.
> > See 'systemctl status boot.mount' for details.
> > [DEPEND] Dependency failed for Local File Systems.
> >
> > ```
> >
> > From here, I've got a system in `maintenance` mode with no `/boot` moun=
ted.
> >
> > If I look in `poky/build/tmp/work/beaglebone-poky-linux-gnueabi/linux-b=
b.org/5.10.162+gitAUTOINC+982fde4eb3-r0/image/boot` I find the following op=
tions in the config:
> > ```
> > poky/build/tmp/work/beaglebone-poky-linux-gnueabi/linux-bb.org/5.10.162=
+gitAUTOINC+982fde4eb3-r0/image/boot$ grep FAT config-5.10.162+
> > # DOS/FAT/EXFAT/NT Filesystems
> > CONFIG_FAT_FS=3Dy
> > CONFIG_VFAT_FS=3Dy
> > CONFIG_FAT_DEFAULT_CODEPAGE=3D437
> > CONFIG_FAT_DEFAULT_IOCHARSET=3D"ascii"
> > CONFIG_FAT_DEFAULT_UTF8=3Dy
> > CONFIG_EXFAT_FS=3Dm
> > CONFIG_EXFAT_DEFAULT_IOCHARSET=3D"utf8"
> > # end of DOS/FAT/EXFAT/NT Filesystems
> >
> > poky/build/tmp/work/beaglebone-poky-linux-gnueabi/linux-bb.org/5.10.162=
+gitAUTOINC+982fde4eb3-r0/image/boot$ grep CONFIG_NLS config-5.10.162+
> > CONFIG_NLS=3Dy
> > CONFIG_NLS_DEFAULT=3D"utf8"
> > CONFIG_NLS_CODEPAGE_437=3Dm
> > CONFIG_NLS_CODEPAGE_737=3Dm
> > CONFIG_NLS_CODEPAGE_775=3Dm
> > CONFIG_NLS_CODEPAGE_850=3Dm
> > CONFIG_NLS_CODEPAGE_852=3Dm
> > CONFIG_NLS_CODEPAGE_855=3Dm
> > CONFIG_NLS_CODEPAGE_857=3Dm
> > CONFIG_NLS_CODEPAGE_860=3Dm
> > CONFIG_NLS_CODEPAGE_861=3Dm
> > CONFIG_NLS_CODEPAGE_862=3Dm
> > CONFIG_NLS_CODEPAGE_863=3Dm
> > CONFIG_NLS_CODEPAGE_864=3Dm
> > CONFIG_NLS_CODEPAGE_865=3Dm
> > CONFIG_NLS_CODEPAGE_866=3Dm
> > CONFIG_NLS_CODEPAGE_869=3Dm
> > CONFIG_NLS_CODEPAGE_936=3Dm
> > CONFIG_NLS_CODEPAGE_950=3Dm
> > CONFIG_NLS_CODEPAGE_932=3Dm
> > CONFIG_NLS_CODEPAGE_949=3Dm
> > CONFIG_NLS_CODEPAGE_874=3Dm
> > CONFIG_NLS_ISO8859_8=3Dm
> > CONFIG_NLS_CODEPAGE_1250=3Dm
> > CONFIG_NLS_CODEPAGE_1251=3Dm
> > CONFIG_NLS_ASCII=3Dm
> > CONFIG_NLS_ISO8859_1=3Dm
> > CONFIG_NLS_ISO8859_2=3Dm
> > CONFIG_NLS_ISO8859_3=3Dm
> > CONFIG_NLS_ISO8859_4=3Dm
> > CONFIG_NLS_ISO8859_5=3Dm
> > CONFIG_NLS_ISO8859_6=3Dm
> > CONFIG_NLS_ISO8859_7=3Dm
> > CONFIG_NLS_ISO8859_9=3Dm
> > CONFIG_NLS_ISO8859_13=3Dm
> > CONFIG_NLS_ISO8859_14=3Dm
> > CONFIG_NLS_ISO8859_15=3Dm
> > CONFIG_NLS_KOI8_R=3Dm
> > CONFIG_NLS_KOI8_U=3Dm
> > CONFIG_NLS_MAC_ROMAN=3Dm
> > CONFIG_NLS_MAC_CELTIC=3Dm
> > CONFIG_NLS_MAC_CENTEURO=3Dm
> > CONFIG_NLS_MAC_CROATIAN=3Dm
> > CONFIG_NLS_MAC_CYRILLIC=3Dm
> > CONFIG_NLS_MAC_GAELIC=3Dm
> > CONFIG_NLS_MAC_GREEK=3Dm
> > CONFIG_NLS_MAC_ICELAND=3Dm
> > CONFIG_NLS_MAC_INUIT=3Dm
> > CONFIG_NLS_MAC_ROMANIAN=3Dm
> > CONFIG_NLS_MAC_TURKISH=3Dm
> > CONFIG_NLS_UTF8=3Dm
> > ```
> >
> > The internet suggests that `CONFIG_NLS_ASCII=3Dy` may resolve the issue=
, but as I'm quite new to Yocto I'm not sure what the right way to do that =
would be. I attempted to start with `devtool modify linux-bb.org`, but was =
met with an immense traceback ending in:
> > ```
> > Exception: bb.fetch2.FetchError: Fetcher failure for URL: 'git://github=
.com/beagleboard/linux.git;protocol=3Dhttps;branch=3D${BRANCH}'. Please set=
 a valid SRCREV for url ['SRCREV_default:pn-linux-bb.org', 'SRCREV_default'=
, 'SRCREV:pn-linux-bb.org', 'SRCREV'] (possible key names are git://github.=
com/beagleboard/linux.git;protocol=3Dhttps;branch=3D${BRANCH}, or use a ;re=
v=3DX URL parameter)
> > ```
> >
> > Any suggestions as to how I might proceed and resolve this are greatly =
appreciated.
> >
> > Regards,
> > Anthony
> >
> >
> >
>
>
> --
> Robert Nelson
> https://rcn-ee.com/
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16910): https://lists.yoctoproject.org/g/meta-ti/mess=
age/16910
> Mute This Topic: https://lists.yoctoproject.org/mt/101058535/3619810
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [robertcnelso=
n@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Robert Nelson
https://rcn-ee.com/

