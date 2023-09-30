Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CDC7E7735F
	for <webhook@archiver.kernel.org>; Sat, 30 Sep 2023 08:44:19 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.37589.1696063456817790037
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 30 Sep 2023 01:44:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ajQ3nOTg;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: max.oss.09@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-99c136ee106so2014080166b.1
        for <meta-ti@lists.yoctoproject.org>; Sat, 30 Sep 2023 01:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696063455; x=1696668255; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eSB81bvZhASOaUvAFE5PGp9jnxEGK46xJzWhP+28jcs=;
        b=ajQ3nOTgbt8nHsHBMHz3BN0RlwCqpsWC37+CAQkm7GhFF0l9P5xHWYJWGULOF+Z7Ps
         UWQFg35WxXuGim4coJ8Ut7Kf7Q6X55MEFxjKTCeTlGK63nYUkFs1ZgfjSrmXwvxUwJv8
         7gk6jDwuUMRwnQRwNkm1Z5S1CO9LCRwHPwpVFerxgjEPRAGr6uCh27GV/FAA7n6/OENR
         kdOzGTX7vFXYNuxU/deRHRNf7Q/iIUF1812i9S7iQK0wEmA3UM0+k1BI6ZnWAr2Q7/06
         lyf+8tpiQsnzI/iiVnOjkWr24MaTNzAOsJxIGYfrkCuvSU3tbvIqWYcaz4x7rRhRTrj+
         vLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696063455; x=1696668255;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eSB81bvZhASOaUvAFE5PGp9jnxEGK46xJzWhP+28jcs=;
        b=iP3jd+jLx8Ivg1lBEG7+0XM7qSK7vRZLa0FMw7b2bLhsmlO88OetUN+JJ4L9aqxp7N
         4XX3XwGFyx3U1S2exSDX7lxsQq8cF6SgLPBBUqya/xV/WxyK8lKhDW0t4ixvL/XOsPDF
         ly7T07XRB1nSz63v1tih5SouDJTBsXXXCBWffCgBqcbuNo5kSTyfLN8sQxzlLE5NHtDJ
         kfUDyWZV+T4EWdx5Qb+zosWL8sXtvRz2pIfX3kKFPcz9znrhwgYOGFXSN7NKcjcmVYRo
         GxjdXHoBeE+l4YnJJNzqqg6YsubmjjFjOijJdYagGfT4M+dNhJam5WqN7Wpa+vI+4a8u
         pjGg==
X-Gm-Message-State: AOJu0YzllR8COHKUBJg75nEVZuDsmOBO9aYlBSTQLBG0twfUqjMStSWt
	WGXlLpvvvTaHGOH8h75d0I8=
X-Google-Smtp-Source: AGHT+IGkwYvtG5K/WAHqDb1RNFLoChc5URRHVHu4W74Uxe4idPYQcocPkWy7lUYyy6gltUSl9lUyoQ==
X-Received: by 2002:a17:906:2b54:b0:9a6:1446:852c with SMTP id b20-20020a1709062b5400b009a61446852cmr6330430ejg.27.1696063455042;
        Sat, 30 Sep 2023 01:44:15 -0700 (PDT)
Received: from [192.168.0.7] ([81.221.234.235])
        by smtp.googlemail.com with ESMTPSA id fr33-20020a170906892100b009b2d46425absm2182239ejc.85.2023.09.30.01.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Sep 2023 01:44:14 -0700 (PDT)
Message-ID: <5c9cab72a378985f701ee349040e89e674d23317.camel@gmail.com>
Subject: Re: [meta-ti][PATCH v2] ti-img-rogue-umlibs: harden handling of
 usrmerge
From: Max <max.oss.09@gmail.com>
To: Ryan Eatmon <reatmon@ti.com>, meta-ti@lists.yoctoproject.org
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Date: Sat, 30 Sep 2023 10:44:13 +0200
In-Reply-To: <62a04ee3-dcf7-4d6b-b5cc-6637ae23871b@ti.com>
References: <20230906150551.2362062-1-max.oss.09@gmail.com>
	 <178969A6B3E88B51.9230@lists.yoctoproject.org>
	 <62a04ee3-dcf7-4d6b-b5cc-6637ae23871b@ti.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 30 Sep 2023 08:44:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17038

Hi Ryan

Am Freitag, dem 29.09.2023 um 11:15 -0500 schrieb Ryan Eatmon:
> 
> On 9/29/2023 10:54 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
> > 
> > 
> > On 9/6/2023 10:05 AM, Max Krummenacher wrote:
> > > From: Max Krummenacher <max.krummenacher@toradex.com>
> > > 
> > > Only move directories which haven't already been moved.
> > > This prevents a build error should a subsequent bitbake execution
> > > rerun do_install where the sources to 'mv' no longer exist.
> > > > mv: cannot stat 
> > > 'ti-img-rogue-umlibs/23.1.6404501/git/targetfs/am62_linux/lws-generic/release/lib/firmware': No such file or directory
> > > 
> > > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> > > ---
> > >   .../powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb        | 4 +++-
> > >   1 file changed, 3 insertions(+), 1 deletion(-)
> > > 
> > > diff --git 
> > > a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
> > > index 9b45a91f..2cf13c60 100644
> > > --- 
> > > a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
> > > +++ 
> > > b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
> > > @@ -68,7 +68,9 @@ do_install:prepend() {
> > >           done
> > >       fi
> > >       if ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'true', 
> > > 'false', d)}; then
> > > -        mv ${S}/lib/firmware ${S}${nonarch_base_libdir}
> > > +        if [ -e ${S}/lib/firmware ]; then
> > > +            mv ${S}/lib/firmware ${S}${nonarch_base_libdir}
> > > +        fi
> > 
> > Sorry it has taken so long to get back to this.  Busy times over here.
> > 
> > I think the better plan is to not move the directory, but use some other 
> > command to copy the files.  That way there should be no need to put a 
> > guard around the command.  I'll work the Randoplh to get this updated 
> > the correct way.
> > 
> > Thank you for pointing out the issue.
> 
> Spoke with Randolph and he agrees with you that this patch is good 
> enough.  I will apply it and test now.

When I did it I checked if mv has an option to not fail if the source
does not exist and didn't find any.
I guess it is anyway a real corner case to be able to hit the issue.
Thanks for pulling it in.

Regards
Max
> 
> 
> 
> > 
> > 
> > >       fi
> > >       # clean up any empty directories
> > > 
> > > 
> > > 
> > > 
> > > 
> > 
> > 
> > 
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#17036): https://lists.yoctoproject.org/g/meta-ti/message/17036
> > Mute This Topic: https://lists.yoctoproject.org/mt/101194647/6551054
> > Group Owner: meta-ti+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/leave/10828724/6551054/1815494134/xyzzy [reatmon@ti.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> > 
> 


