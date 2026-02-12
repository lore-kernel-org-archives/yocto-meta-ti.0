Return-Path: <jcormier@criticallink.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DD93EE3694
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 14:52:25 +0000 (UTC)
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46772.1770907943335968256
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 12 Feb 2026 06:52:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticallink.com header.s=google header.b=fwZCAQwy;
 spf=pass (domain: criticallink.com, ip: 74.125.224.42, mailfrom: jcormier@criticallink.com)
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-64aea64bf15so3370504d50.2
        for <meta-ti@lists.yoctoproject.org>; Thu, 12 Feb 2026 06:52:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770907942; cv=none;
        d=google.com; s=arc-20240605;
        b=E5x57nFACMw8Xiv0+ZiDzLcV6SWyu+LsFkFUQJoBwnwknYGA2zzZVI18qfqPHzuAPX
         f1fINlt9AGm1ibqLenTN+1TqP6YYMI8KsGZ9yWPngx8IVa/PVEmy9M23MMuzguVz4lbA
         G7B1MG6RTiUwZrQ04DekwsS5Qq1la/r7kg55hCnT6WEspknsVOaKkNzP6jY028yvoA+d
         XAf4stuDo/vfG/Pl2U1iggmVd6Ly7SDu+O0wj6ySKKPMSwutlR5xUFpxOc7OAlFtkqtV
         TJwfKm22UKWCDN74E3m5e+yRNFESzMUZBQZxBjtDHp/T3KLeBcF4y/yGRX36nghzh4kl
         c42g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=szxgbDfyIvpa8dCN5yAK54rhmK+rDfNfsiH9z/Pg/rQ=;
        fh=959eXkufwdK22WQlpVLcoCgV6cE4uduL0EUGYljt8ss=;
        b=Hb9VGqyCcPZ7CA2k0IoZv4hophvQYb9Whoh1MCBCbLNt+3psRM4ctpTD0b6Q1mEvcl
         HLovBN10lC7JyiBfjhp//gZQQxdvaNQcATbMsGzQK28H25ekj47F9Tt6ISB3WsKias1M
         lqIacu4qvrDaKUkNvbuCLT0ns4thupYmC1Msgek6bx8GRpcgjR32Z9O84ALSBTELk4Zv
         txF/xhM+fCajjLwy2y7gEAEJ0ItGP9jlhuTKSwxHj9DBR4RCNnhph4mPWybLQs50Lgkz
         mx5bBg8NaS2lMWNKhMyTDcf5lEIrEsclhDOyu64k5kg2GXcYPG+YVihY1GyK+cFUuvMc
         8xqg==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1770907942; x=1771512742; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=szxgbDfyIvpa8dCN5yAK54rhmK+rDfNfsiH9z/Pg/rQ=;
        b=fwZCAQwyN1ekrT0zl0/NqpCu6DbO6Ozb9DXTZ+XHMH14YbUXdCBjvKaGavMfV3kwAl
         k0CWXM/6Q2qnwYfGHat81cHPclyWCtQR5zvbFDf8vxnEuDxX3NrHLNNnhsCcJ4tEeIwc
         uDNRAktnhlYMFofjvolMrbaz/1CWzqiiDGs1zqg+AS5naWSjJcwla0+6ZnsMdJTzRjLE
         LKcG9KIhmaC6MZrr6VwqOoSvEywXCwkBnDd0clnsyxuVIjqFA03GsX67k7o9lzTFHWci
         W5kTOp5plscFsI46NAOBX6uJPILBMXvE3A12wBLGpAJslKXlf8GEbYygQcLp01nO1u74
         bLDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770907942; x=1771512742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=szxgbDfyIvpa8dCN5yAK54rhmK+rDfNfsiH9z/Pg/rQ=;
        b=SVj+qMk+jT+9MQWEaNTaOdjYYu/WyQHHAt0gq76yBvj13RaKXQAnyedmeNOlASi66m
         x6yQIDt6JhrTkzFstvo9K2XBClpnrJAuuUX/VGcdUO6y5b9seKPgDjnZFqN+IZlQsalY
         GuIhR7pJYtceUFfUmZGm03K5+AHxTligygFSvMRneYE/jzAS3UjOeaeyuOvg2xwmHgRe
         nbYoXM5aUG9eS6GwkNGNa2VBuZw1IUdTX7vESwlzkhi6RiEt5Z/Tvyl9yAcEyIFzupH5
         gLUnR5P8kqjQFATv8CHdlMZHpWvUcrW9o1GyfBEbrsHq3WltKEUw1nmjdxpWZNp5MXGc
         L3Sg==
X-Forwarded-Encrypted: i=1; AJvYcCXj7YR4qVyggb9H+D4vZcy3YH9M7/lLwQXw74B7XH/v4BrvBnSivhBDLZFFTxyrj6haFudtPKLe@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yz2RqWPSMzotYyFpbNy3/oN2KSRZxJbXXf7hO+ph2OLUTu+IiOo
	0HjpPLIHmAjaczfXcHpvxy7KTYyp0qHgK4493F4IGeK/mrAymbQEGRpbt3lB/xqk0Uco1yufDeG
	3ek76dm6kn067AfLPyvNE4ejapFVQ/awYFXmzXdFn
X-Gm-Gg: AZuq6aKLeCm6zXnZ4QqsKwzeo0XSYyQgyTOMNOFss84EC1NOCP5d5Fp9c8lWzPb5x/G
	/I1FPcIppfGkFo1MQUIFpEVD3hOtGaGrWL2xVD87rP76b3jOpmf8HZugzC8buF3RVRNmt5xvIDe
	XI8sOgitgVLeV5rZQ4cumcmOyRKN4LleAxxd+Oht5ITxnUF80TGMcJT0XMMplzUvrNbCU9dDLJS
	ToUOpB212kjexbuNEQBVe149rfmsFxdHUoOlOXuvf4ZKN8muB96nCCzcbf1U1wkLDWf4eFUhcEJ
	uUskzA==
X-Received: by 2002:a05:690c:6c0e:b0:794:ef94:1222 with SMTP id
 00721157ae682-797931dd700mr43307737b3.55.1770907942208; Thu, 12 Feb 2026
 06:52:22 -0800 (PST)
MIME-Version: 1.0
References: <20260211200414.1642061-1-reatmon@ti.com> <20260211202546.GJ11121@denix.org>
 <07050526-1409-40cf-9882-6233bbcebfbb@ti.com> <20260211220502.GK11121@denix.org>
In-Reply-To: <20260211220502.GK11121@denix.org>
From: Jon Cormier <jcormier@criticallink.com>
Date: Thu, 12 Feb 2026 09:52:10 -0500
X-Gm-Features: AZwV_QhhihsMk-tMV0sXTvkHKAcs45-TcUdqppEm-Ei7g39fIC5wdgxD5ialOSo
Message-ID: <CADL8D3bSMPw-GQ=7HMWGqW1axWoPSVV=PUbZvCsUKKKWjV2nfw@mail.gmail.com>
Subject: Re: [meta-ti][master][PATCH] ti-core-initramfs: Rework logic
To: denis@denix.org
Cc: reatmon@ti.com, Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denys@konsulko.com>, 
	meta-ti@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 12 Feb 2026 14:52:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19501

On Wed, Feb 11, 2026 at 5:05=E2=80=AFPM Denys Dmytriyenko via
lists.yoctoproject.org <denis=3Ddenix.org@lists.yoctoproject.org> wrote:
>
> On Wed, Feb 11, 2026 at 03:57:28PM -0600, Ryan Eatmon via lists.yoctoproj=
ect.org wrote:
> >
> >
> > On 2/11/2026 2:25 PM, Denys Dmytriyenko wrote:
> > >On Wed, Feb 11, 2026 at 02:04:14PM -0600, Ryan Eatmon via lists.yoctop=
roject.org wrote:
> > >>Clean up the logic of the new ti-core-initramfs to reduce the impact =
on
> > >>downstream layers.
> > >>
> > >>- Flip the logic in the machine .conf files to track the list of
> > >>   required kernel modules for that platform, but if the variable is =
set
> > >>   to "" then the ti-core-initramfs will not be created.
> > >>
> > >>- Redo the logic of when we require creation/usage of the initramfs t=
o
> > >>   just platforms that need it (ie that set TI_CORE_INITRAMFS_KERNEL_=
MODULES).
> > >>
> > >>- Add a big switch to disable the initramfs entirely.  In that case, =
the
> > >>   user is on their own to make sure that the kernel has everything i=
t
> > >>   needs to boot either via config fragments to turn on the needed
> > >>   modules, or by using the TI_CORE_INITRAMFS_KERNEL_MODULES
> > >>   variable to populate their own initramfs.
> > >
> > >In our discussion we agreed to use TI_CORE_INITRAMFS_KERNEL_MODULES to
> > >determine whether to enable initramfs or not. While I don't mind addin=
g
> > >a separate global TI_CORE_INITRAMFS_ENABLED switch, but I now wonder i=
f
> > >two checks are redundant and whether it makes sense to create initramf=
s
> > >even when the list of modules is empty, if it's enabled?
> >
> > I thought about this and went this way for a reason.  If you want to
> > turn off the initramfs, but you still want the list of what modules
> > are required say for your own initramfs, then the list is gone.
> > Because the list was the switch.
> >
> > By splitting them into two lists, we gain the fact that we don't
> > force the initramfs on platforms that don't need it, and you can
> > still turn it all off if you want but have all of the infrastructure
> > in place to use it in your own layer later.
>
> I think you missed my point - I'm not against the "enable" flag, but sinc=
e we
> now have it explicitly, does it make sense to also build the initramfs wi=
th an
> empty modules list when the "enable" flag is set to "1"?
Being able to create an initramfs without modules makes sense to me.
We've had to use initramfs before for mounting filesystems in a
particular order for example.  And didn't really need extra modules at
the time. Just a thought.
>
>
> > >Also see below for another comment.
> > >
> > >
> > >>+++ b/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
> > >>@@ -0,0 +1,29 @@
> > >>+#-------------------------------------------------------------------=
-----------
> > >>+#
> > >>+# To turn off the ti-core-initramfs.cpio creation just set:
> > >>+#
> > >>+#   TI_CORE_INITRAMFS_ENABLED =3D "0"
> > >>+#
> > >>+#-------------------------------------------------------------------=
-----------
> > >>+TI_CORE_INITRAMFS_ENABLED ?=3D "0"
> > >
> > >Did you mean to weakly set it to "1" here? :)
> >
> > Doh.  I did.  That was from testing.  I'll send a v2.  Good catch.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#19491): https://lists.yoctoproject.org/g/meta-ti/mess=
age/19491
> Mute This Topic: https://lists.yoctoproject.org/mt/117763070/7902621
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [jcormier@cri=
ticallink.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Jonathan Cormier
Senior Software Engineer

Office:  315.425.4045 x222

http://www.CriticalLink.com
6712 Brooklawn Parkway, Syracuse, NY 13211

