Return-Path: <ricardo@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9100C77B73
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 22:00:01 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.3311.1686002392615855505
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 05 Jun 2023 14:59:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@foundries.io header.s=google header.b=eVfs2gh1;
 spf=pass (domain: foundries.io, ip: 209.85.208.170, mailfrom: ricardo@foundries.io)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2b1b6865c7cso43437801fa.3
        for <meta-ti@lists.yoctoproject.org>; Mon, 05 Jun 2023 14:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1686002391; x=1688594391;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wv9DpsvIpcJgaOWiEONFLjRNKEl4oABKybveqO5xokQ=;
        b=eVfs2gh1cShKhWhA0ngmtQ+uisfDtWNyoRID3WvfKEyBMkIowpQn26BK1X/9tWh7RY
         CtHrZcw4OpTXWPHpTfiydd/etwCbBRgdWC43SfRjSinjESkKYATVDhzLAWuATSQ+nh2c
         n/GhzNRnEqOk5swW3db9i3UTLOOJuvQ9VlBAwJlVxHr7DJ3msutiV22xh4CP2L8D9eTr
         AQKhJ9Jhjbsk+9pdmGM/fY2t4lEyr2IQZ610fdhhhuSR96nxqonowYuNHzdHL9fUelmo
         fBoakinzdxHmm/06r5HnHDqCfhXx2iNUSdXRYLNFKoEV7IpY23LJAr3WuvuNJMP2UNVA
         Qsdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686002391; x=1688594391;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wv9DpsvIpcJgaOWiEONFLjRNKEl4oABKybveqO5xokQ=;
        b=BF+W4Kre75Ebu96ywInwOl2RuQH8tNr2Jvqgxl7L9blXOzI9wVSGTCuDCshBzDaZ4b
         i1o3com1oGqvl8eXgPrHU7qbSjMtpSzvxr7kmSfqZF7nG3IeZ8l9pmjes90CcAriUaaA
         EqOPdBABGzPXHCtXvg1/diJQEep1k1G2iRPtrVACvquddIysLreeMSuluX4XxdTV68hn
         sctBgeOSbf1/mVtOaYhNo+6YyW6N/FVGhtqE6+q/xd3UzMUq0xW5ET8ULfekrFU4aRt3
         Ykn39GvsVx+234dZCvx+QTpG6mvUZpCBy7gnFcGt563u3BwQnW6Y4htgd3k3mIx2Q4+T
         ktIg==
X-Gm-Message-State: AC+VfDz5xNu6mvuNifLJxOwNw+wZ5WZFyLhDXmVL8tDxpxdaaRYl/Gzu
	g75RWG+ZAwjTVIhoYPc23aPqoWgShM0EmRTv0cpI
X-Google-Smtp-Source: ACHHUZ6kle9HP2TYM6DerGYdGxaH03QsoxWvSZ5qVee6OG6US+BKdVmR9HdUPAGr45V8HTxc68R1JCgtm+Wfiwp8ts8=
X-Received: by 2002:a2e:98ca:0:b0:2af:2441:f709 with SMTP id
 s10-20020a2e98ca000000b002af2441f709mr282439ljj.29.1686002390708; Mon, 05 Jun
 2023 14:59:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230605131152.69991-1-p-bhagat@ti.com> <1765C66D190BA797.3349@lists.yoctoproject.org>
 <4a980318-4b35-f2a8-c7cd-242f5a99ef57@ti.com>
In-Reply-To: <4a980318-4b35-f2a8-c7cd-242f5a99ef57@ti.com>
From: Ricardo Salveti <ricardo@foundries.io>
Date: Mon, 5 Jun 2023 18:59:14 -0300
Message-ID: <CAAaKDhHS7dHPPQ7YpuzUg5ff7aNnntJdOavv2Q=wwes5GRG2qQ@mail.gmail.com>
Subject: Re: [meta-ti] [kirkstone][PATCH v2] meta-ti-bsp: Add recipe for
 u-boot-ti-jailhouse and linux-ti-jailhouse
To: reatmon@ti.com
Cc: Paresh Bhagat <p-bhagat@ti.com>, meta-ti@lists.yoctoproject.org, praneeth@ti.com, 
	c-shilwant@ti.com, s-adivi@ti.com, khasim@ti.com, g-gupta@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 05 Jun 2023 22:00:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16671

On Mon, Jun 5, 2023 at 5:25=E2=80=AFPM Ryan Eatmon via lists.yoctoproject.o=
rg
<reatmon=3Dti.com@lists.yoctoproject.org> wrote:
> On 6/5/2023 8:30 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
> > On 6/5/2023 8:11 AM, Paresh Bhagat wrote:
> >> Add new recipe for u-boot-ti-jailhouse and linux-ti-jailhouse which wi=
ll
> >> be used for jailhouse for am62xx-evm.
> >>
> >> Jailhouse support for am62xx-evm requires few patches for u-boot and
> >> linux
> >> which are hosted at processor-sdk/u-boot and processor/linux
> >> respectively.
> >> To build a image with jailhouse for am62xx-evm, these recipes
> >> will be used instead of u-boot-ti-staging and linux-ti-staging by
> >> changing
> >> the preferred_provider.
> >>
> >> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> >> ---
> >>   .../recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb    | 9 +++++++=
++
> >>   .../recipes-kernel/linux/linux-ti-jailhouse_6.1.bb       | 9 +++++++=
++
> >>   2 files changed, 18 insertions(+)
> >>   create mode 100644
> >> meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb
> >>   create mode 100644
> >> meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse_6.1.bb
> >>
> >> diff --git
> >> a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb
> >> b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb
> >> new file mode 100644
> >> index 00000000..079d55dd
> >> --- /dev/null
> >> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb
> >> @@ -0,0 +1,9 @@
> >> +require u-boot-ti-staging_2023.04.bb
> >> +
> >> +# This will have priority over generic uboot path
> >> +
> >> +BRANCH =3D "ti-u-boot-2023.04-jailhouse"
> >> +
> >> +UBOOT_GIT_URI =3D "git://git.ti.com/git/processor-sdk/u-boot.git"
> >
> > What is reasoning for not upstreaming these patches (both u-boot and
> > kernel) even just into the TI repositories?
> >
> > My concern is the CICD process.  This is adding another recipe with a
> > completely different linux/u-boot repository that we need to add suppor=
t
> > for to keep the recipes up to date.
> >
> > And you guys will to keep rebasing these patches on top of the latest
> > 6.1 prod branch when CICD promotes.
> >
> > This just feels like something that is going to turn into a lot of
> > maintenance work in the future.
>
>
> After discussing this with Praneeth, these recipes should not be called
> jailhouse, but rather something more generic (maybe experiments).  We do
> not want to explode the number of recipes in the directory with every
> experiment we want to run in the future...  We can then configure which
> branch under the experiments to pick based on something in the distro
> features or via machine features.
>
> And upon further reflection, do we want to create a new layer under the
> meta-ti repo to house all of these new changes and not host them in
> meta-ti-bsp?  Basically keep meta-ti-bsp as the production versions of
> code?  Any thoughs Andrew, Denys, Randolph?

For experiments I think it makes sense to have it hosted in another
layer, but in this case jailhouse is an official functionality that is
also supported by TI, isn't it?

My concern is that real customers might want to have jailhouse
enabled, which will force them to use this extra layer which might not
necessarily be aligned with the main bsp revision used (e.g. kernel
and u-boot), causing maintenance issues for product builders.

Maybe in this case it is just better to have the patches available in
the layer and enabled dynamically via machine features? It is still a
pain to maintain as it might have conflicts in the future and might
require patch updates, but if indeed a desired feature it might make
sense to be part of the main layer.

Cheers,
--=20
Ricardo Salveti

