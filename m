Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53195EB8FBB
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 12:42:52 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.7326.1694004169561973954
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 06 Sep 2023 05:42:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=sLMyfzBg;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: max.oss.09@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-31c4d5bd69cso3197789f8f.3
        for <meta-ti@lists.yoctoproject.org>; Wed, 06 Sep 2023 05:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694004168; x=1694608968; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VIck7CI2Xop6N9yE8qBWPKdxY2kBVtwzrAvlR4LiYD4=;
        b=sLMyfzBg2SuhRUIJWh7AcImt/2Cp2QS9Hi9lUgWT8Ao5NrqEGEzOedL+3HxYPNkCiw
         LdoatprWrFASmyGH8KydBsMWG05sOkJwIXmMQ45cu8jPnGiq0sr3ln6KBVp9akrVrI48
         6FNo0LNoEfjUwDWLKa3mhgNX6W9ei/oKLccQbwOARfnFL/+IEbOTLLNZ/q4hA0RbXTmE
         UoFEZw/1Hw0sr6l0LcvaSm91jNtiMByrBxbh+LitYmQVXxBlUhA+Cu8h79Js8aSf5bDe
         ggT439T/Uot8M0sL4LHaP7UNF4uyLX+GynyK94DxgOVeBoykrce0yE7ZLA3kRn5DFj+L
         kMlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694004168; x=1694608968;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VIck7CI2Xop6N9yE8qBWPKdxY2kBVtwzrAvlR4LiYD4=;
        b=jtK1IVrovxxcZ7UGS4B+673mfVppyr75nIXzFmqQRjtuig9U+Mh6HGM/a9EVbhb1vq
         XwetAB+2aODQ0r6PXFyU+WPdwLd908ir/UIzvPG+ApiJrCzCGHactIsAK5cjG1bIC1Ka
         esUuUYW+8uQhcQh72XJO3yDjTDhBYElS0ckFDkbBhNGuJhCfGe3d3GQ3gFbJtf4TmFsW
         SOvLJD6gyChPKHan1CrNULxSbeoZUznuDDYggtqYT4bbwxwBG4xtvAZlyifZIRcaurIQ
         RsD3yTC/lgb4vHFyycvkDm0lKBWl88f42Sp/7+t2LIuYlRB3HWGDRsuULGUAjohNoOxG
         qyCw==
X-Gm-Message-State: AOJu0YyyO+EYi21ifHkRi3B7LHCeCkMydNpweLc7ocw3EDgIojJMOzii
	LYm5ZZDYjiTp+lyeBZQbbWfQiB1EyQSRFqj+Wmk=
X-Google-Smtp-Source: AGHT+IGGmEMw/mS/eEm5tmGOrivcl53N9ogKC1LNmAW1EjAM2aKbVIUb1Rrbqtd/XfOXvWqGgKHiFpHSa9BTNOfIDbc=
X-Received: by 2002:a5d:4c92:0:b0:319:89ce:da0b with SMTP id
 z18-20020a5d4c92000000b0031989ceda0bmr2277202wrs.68.1694004167587; Wed, 06
 Sep 2023 05:42:47 -0700 (PDT)
MIME-Version: 1.0
References: <178243D22841CBE5.5484@lists.yoctoproject.org>
In-Reply-To: <178243D22841CBE5.5484@lists.yoctoproject.org>
From: Max Krummenacher <max.oss.09@gmail.com>
Date: Wed, 6 Sep 2023 14:42:36 +0200
Message-ID: <CAEHkU3V56Ez2fETV9o+VBOSj3Aa_7C22-G8wHC902fArWLQA-g@mail.gmail.com>
Subject: Re: [meta-ti][PATCH] ti-img-rogue-umlibs: drop handling of usrmerge
To: max.oss.09@gmail.com
Cc: meta-ti@lists.yoctoproject.org, 
	Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 06 Sep 2023 12:42:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16921

Hi

On Wed, Sep 6, 2023 at 11:03=E2=80=AFAM Max Krummenacher via
lists.yoctoproject.org <max.oss.09=3Dgmail.com@lists.yoctoproject.org>
wrote:
>
> From: Max Krummenacher <max.krummenacher@toradex.com>
>
> If usrmerge is set the do_rootfs task creates symlinks for the base
> directories to their equivalent /usr/ directories and thus installs
> the files in /usr/{bin|lib|...} by following the symlinks.
> There is no need to do the move already here.
>
> This prevents a build error should a subsequent bitbake execution
> rerun do_install where the sources to 'mv' no longer exist.
> | mv: cannot stat 'ti-img-rogue-umlibs/23.1.6404501/git/targetfs/am62_lin=
ux/lws-generic/release/lib/firmware': No such file or directory
>
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> ---
>  .../powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb         | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-uml=
ibs_23.1.6404501.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-ro=
gue-umlibs_23.1.6404501.bb
> index 9b45a91f..8033322c 100644
> --- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.=
1.6404501.bb
> +++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.=
1.6404501.bb
> @@ -67,9 +67,6 @@ do_install:prepend() {
>              rm -rf ${file}
>          done
>      fi
> -    if ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'true', 'fals=
e', d)}; then
> -        mv ${S}/lib/firmware ${S}${nonarch_base_libdir}
> -    fi

While the described issue is real, this is not the fix. When building
from scratch I now get a QA error about usrmerge.
Will send a V2 with a better tested solution.
Sorry about the noise.

Max

>
>      # clean up any empty directories
>      find "${S}" -empty -type d -delete
> --
> 2.35.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16920): https://lists.yoctoproject.org/g/meta-ti/mess=
age/16920
> Mute This Topic: https://lists.yoctoproject.org/mt/101188984/3617484
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [max.oss.09@g=
mail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

