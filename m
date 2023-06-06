Return-Path: <ricardo@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A825CC77B73
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 16:28:06 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.1108.1686068880911080979
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 06 Jun 2023 09:28:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=XgdNxiSm;
 spf=pass (domain: foundries.io, ip: 209.85.208.175, mailfrom: ricardo@foundries.io)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2b1badb8f9bso45995291fa.1
        for <meta-ti@lists.yoctoproject.org>; Tue, 06 Jun 2023 09:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1686068879; x=1688660879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vy1Adx1ZQk5sWfT7JNtSB89lHdSS8Z4MZ/XDMnu0pHQ=;
        b=XgdNxiSmo9rDd1zzuwNUHJE4ocL7Zjb0j1idrVHsl4gogwlz7FEvzR6Ru5gnANsovx
         494YDJzTk7N9KnvQDEnSoOybo5BHXmJtarRQ/k48xd/F+B1RgShSYeONHcOIv5HU7AJQ
         TY2TxcKpXLLxVZ2MCeSy1uLpJwbiDWfIywHbK9OGRXFST7vFxWWkyVZjRx3Ef9TNe5s1
         zs5R+EFCmDC2nGcnOujvP5LHgdR2Lkxza0gDVKxguXnZGTAGlceIag5IqXgssvdaxk6n
         +i+JEydACH4etj3sOBfo9TdeRNfEBN198t7XDjeD2YO+nTD3cR6GrXmjfb3zW73WQnUa
         YMNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686068879; x=1688660879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vy1Adx1ZQk5sWfT7JNtSB89lHdSS8Z4MZ/XDMnu0pHQ=;
        b=DoyUo8Ra2EdeuyLRmijYXl8dLVDv9WabTXxJSll6xtc139COecsDXj/ZktP1UzHsHs
         aOb9lY77dKVJYOyEfOMmYF+PRw6rLB58mhoEbh7Vx+ynJHSqBSplEveUdkyyiUlrn3fp
         s+UAB3cBQs8EzALSjFG23qBxkIfWaqMSih4YDP0bMNIpzkXHhykZp6InFz/f9n26zRN8
         KHcNHGYCR8Zq+C08idA7W4gvoK+qL55IJiQhlk77h/25PxRIvKswRuIX+RgihP1Z3+e/
         hQP5T4uNfkmob0vn6zR4Gli8KzNn+jnUXjyn50LM800M8fEg0UCLxtzrEl4lWTmS9lWv
         GN9g==
X-Gm-Message-State: AC+VfDyDugXsCv3AwyBRyq332rvx2Tq88nIb/G7xHCobs7mbMWjiTBQy
	TVql5w70FtjHgouxazASHUu9uzRqNWVNB7mPZsl2
X-Google-Smtp-Source: ACHHUZ49M08RkrVJgx6dtW8vrKyHQ9tHg57LTaP57QNv3yvUo/D/0dwnC4tvpZ63DIvHD53sDv0hTNp2DHs98H+IaN0=
X-Received: by 2002:a2e:9f4d:0:b0:2b1:e5d7:633a with SMTP id
 v13-20020a2e9f4d000000b002b1e5d7633amr1464386ljk.1.1686068877069; Tue, 06 Jun
 2023 09:27:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230605131152.69991-1-p-bhagat@ti.com> <1765C66D190BA797.3349@lists.yoctoproject.org>
 <4a980318-4b35-f2a8-c7cd-242f5a99ef57@ti.com> <CAAaKDhHS7dHPPQ7YpuzUg5ff7aNnntJdOavv2Q=wwes5GRG2qQ@mail.gmail.com>
 <e218a5d7-dbcd-9afc-1cec-d10cef036870@ti.com>
In-Reply-To: <e218a5d7-dbcd-9afc-1cec-d10cef036870@ti.com>
From: Ricardo Salveti <ricardo@foundries.io>
Date: Tue, 6 Jun 2023 13:27:20 -0300
Message-ID: <CAAaKDhFuDVmKERbFHfsu1T+r5-hv=412wy=B9eb0WN=ufJzy9g@mail.gmail.com>
Subject: Re: [EXTERNAL] Re: [meta-ti] [kirkstone][PATCH v2] meta-ti-bsp: Add
 recipe for u-boot-ti-jailhouse and linux-ti-jailhouse
To: Paresh Bhagat <p-bhagat@ti.com>
Cc: meta-ti@lists.yoctoproject.org, praneeth@ti.com, c-shilwant@ti.com, 
	s-adivi@ti.com, khasim@ti.com, g-gupta@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 06 Jun 2023 16:28:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16676

On Tue, Jun 6, 2023 at 8:59=E2=80=AFAM Paresh Bhagat <p-bhagat@ti.com> wrot=
e:
>
> Hi,
>
> On 06/06/23 03:29, Ricardo Salveti wrote:
> > On Mon, Jun 5, 2023 at 5:25=E2=80=AFPM Ryan Eatmon via lists.yoctoproje=
ct.org
> > <reatmon=3Dti.com@lists.yoctoproject.org> wrote:
> >> On 6/5/2023 8:30 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
> >>> On 6/5/2023 8:11 AM, Paresh Bhagat wrote:
> >>>> Add new recipe for u-boot-ti-jailhouse and linux-ti-jailhouse which =
will
> >>>> be used for jailhouse for am62xx-evm.
> >>>>
> >>>> Jailhouse support for am62xx-evm requires few patches for u-boot and
> >>>> linux
> >>>> which are hosted at processor-sdk/u-boot and processor/linux
> >>>> respectively.
> >>>> To build a image with jailhouse for am62xx-evm, these recipes
> >>>> will be used instead of u-boot-ti-staging and linux-ti-staging by
> >>>> changing
> >>>> the preferred_provider.
> >>>>
> >>>> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> >>>> ---
> >>>>    .../recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb    | 9 ++++=
+++++
> >>>>    .../recipes-kernel/linux/linux-ti-jailhouse_6.1.bb       | 9 ++++=
+++++
> >>>>    2 files changed, 18 insertions(+)
> >>>>    create mode 100644
> >>>> meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb
> >>>>    create mode 100644
> >>>> meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse_6.1.bb
> >>>>
> >>>> diff --git
> >>>> a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb
> >>>> b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb
> >>>> new file mode 100644
> >>>> index 00000000..079d55dd
> >>>> --- /dev/null
> >>>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb
> >>>> @@ -0,0 +1,9 @@
> >>>> +require u-boot-ti-staging_2023.04.bb
> >>>> +
> >>>> +# This will have priority over generic uboot path
> >>>> +
> >>>> +BRANCH =3D "ti-u-boot-2023.04-jailhouse"
> >>>> +
> >>>> +UBOOT_GIT_URI =3D "git://git.ti.com/git/processor-sdk/u-boot.git"
> >>> What is reasoning for not upstreaming these patches (both u-boot and
> >>> kernel) even just into the TI repositories?
> >>>
> >>> My concern is the CICD process.  This is adding another recipe with a
> >>> completely different linux/u-boot repository that we need to add supp=
ort
> >>> for to keep the recipes up to date.
> >>>
> >>> And you guys will to keep rebasing these patches on top of the latest
> >>> 6.1 prod branch when CICD promotes.
> >>>
> >>> This just feels like something that is going to turn into a lot of
> >>> maintenance work in the future.
> >>
> >> After discussing this with Praneeth, these recipes should not be calle=
d
> >> jailhouse, but rather something more generic (maybe experiments).  We =
do
> >> not want to explode the number of recipes in the directory with every
> >> experiment we want to run in the future...  We can then configure whic=
h
> >> branch under the experiments to pick based on something in the distro
> >> features or via machine features.
> >>
> >> And upon further reflection, do we want to create a new layer under th=
e
> >> meta-ti repo to house all of these new changes and not host them in
> >> meta-ti-bsp?  Basically keep meta-ti-bsp as the production versions of
> >> code?  Any thoughs Andrew, Denys, Randolph?
> > For experiments I think it makes sense to have it hosted in another
> > layer, but in this case jailhouse is an official functionality that is
> > also supported by TI, isn't it?
> >
> > My concern is that real customers might want to have jailhouse
> > enabled, which will force them to use this extra layer which might not
> > necessarily be aligned with the main bsp revision used (e.g. kernel
> > and u-boot), causing maintenance issues for product builders.
> >
> > Maybe in this case it is just better to have the patches available in
> > the layer and enabled dynamically via machine features? It is still a
> > pain to maintain as it might have conflicts in the future and might
> > require patch updates, but if indeed a desired feature it might make
> > sense to be part of the main layer.
>
> We need to support various distros going forward, so it must not be tied
> to Yocto layers, hence the seperate repos. Additionally, users must be
> able to use git kernel tree without going to worry about applying
> patches. We want to carry these changes as maintainable branch instead
> of *.patch files in meta-ti-bsp.

Then how are you planning on updating these extra branches moving
forward? Rebases? Merges from the main branch?

Just trying to understand how to best align this with customers
wanting to use jailhouse, since they might end up being behind from
the main bsp tree if the branch ends up being behind.

In or out yocto the maintenance pain will exist.

Cheers,
--=20
Ricardo Salveti

