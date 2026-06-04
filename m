Return-Path: <jcormier@criticallink.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B6EBCD6E4A
	for <webhook@archiver.kernel.org>; Thu,  4 Jun 2026 14:29:34 +0000 (UTC)
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12959.1780583364870909009
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 04 Jun 2026 07:29:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticallink.com header.s=google header.b=aSpaQx/n;
 spf=pass (domain: criticallink.com, ip: 74.125.224.51, mailfrom: jcormier@criticallink.com)
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-6603246b66dso885584d50.1
        for <meta-ti@lists.yoctoproject.org>; Thu, 04 Jun 2026 07:29:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780583364; cv=none;
        d=google.com; s=arc-20240605;
        b=WYukFOwEtRMMYZonHw+WJm75kMEJAUNW11rjIChRvSyVY/t7X7paj8+kqchjHKXvc3
         OFVsrAVXQcLU47MB7iz9bbq8Fsj64SsI0gKlgaHJA7rcr5WpnZvtSdywTO+ZBKg4b3xl
         EmGKV3woLKWEfrq3dkUv8ZarAe472xchnjpd+Oh184ToVDgtolJqWORnUUra2T+GhXcL
         wUBm7o+i85wfpl7lftfNeIy9Bw6UyWqjYTVo2YFBT0BRy0a9TiSLwtPGH5xS8mubCxNW
         mMd0x2qY6iupwpzCr3YtA3RGCCGMax5FzBQd3eFlTzTxRLJ1fwJspHy1e9Eskzhn8QK/
         WVCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YRgvYKUVe9mNNy0Zg5OlAIpjbeuhZPRYa1wr/YccnIs=;
        fh=XLNXxAdmmzSqoaRqHN5Q7KZsOQuRqHNBBHGlntQ5+og=;
        b=iqHCkRj47g6VohB6T6A3B+es1ThXoJNoZWCYJ00B8OjwVT8qhs+MD0QhAVx95wgM6k
         SJkua+tfghwvsgCwvKetcqBiMSSBz3IVXbJ+kXRonVw/33zvc2XFxLzsi5eMIRwwNMcj
         5O7LTVdCptVg9VVpDBKdoM4mtydwJnwWHJVOSMG7unOg9jYo5wYeULK4Whe5y6QnYg7k
         UfZShJUkeJ3sXRSS+CTFgi1bxrwFGCKXFNU68fb6n6SbEu1Qt2fdnUoQDD49L8LRPneF
         ZsCqh63G/PmSmh1/5AscT5AP26UXoRQefGJC+FJJg6B36aVMvuZFHOZr6wk0OwGHzwBS
         syNA==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1780583364; x=1781188164; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YRgvYKUVe9mNNy0Zg5OlAIpjbeuhZPRYa1wr/YccnIs=;
        b=aSpaQx/nguVrHDMAoAaP3qocElALPS6YB6dKR3iDzFJby0vG5ALCvrd3Z6udTWQdWY
         yR/66eZN+o4dlu24u5I9h7YRQpcAk2daA3psjVLrMAZiNlGlt6Bq7Zrg6haybBfYRokQ
         5kiyWoXt/6jshVLLBvz4aP0mcetQGdUrG+02KfXsZFULl/qlblY8A9IVoTjHM71oZ934
         vtPgdV6zMuohbjcQpw15RNjkHNLlz9veK5tauV0mSmFliJ8zT8Xo7WwF3KUoXe3jM2Hp
         /S9k1E22CupEkpcKu24l3lUMSXK39nLxM8LHg+CAVZOF0DJKFPhA1DD7IKNk/YZBWtJO
         NxZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780583364; x=1781188164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YRgvYKUVe9mNNy0Zg5OlAIpjbeuhZPRYa1wr/YccnIs=;
        b=dw/n70Wi3Wf2MpolrXCG1I5qmOSZTeNxW3CzKV1AUy8sxJjwL3DxGmJQ3ROMF1a13/
         l1XpBn7vg+f+Aq3Fw8O0WeRyl7BphSRQnOoME4R+6bMCs+d3EhJu4d7z/SpWNnRPJ268
         T3vyYVxG6WmRogYoHg/C4uagBgjUYPv+3nhELh1tvmCx1wV852t6IV5ViW8i+t6geSj+
         j3hvD63vb/WMEwYmmNQlof2JMZa0fC/L1IYURDV8EW4UMjNRWIYgPERnbGVc4EiN78Bz
         xbz0vJzijsbmOnKQKTyQ5YFDeUjakRk4CsgSsw25l4ruVT3id8MGsdTrn0BV4qA/cbvJ
         kg6Q==
X-Gm-Message-State: AOJu0YxOPBH5RwRhIorzFBz9PYGQrLtlnEf1CPRTcoYSCD0221BaR3Nj
	fgSmvXKqCssnks4elfEmAb0Epi2ZBhWvJybHVZ1XWUaV26mwP9wNAfsxYx9yRQk+Xigri2hbfu9
	s/yXxDytz09tGkTRicyYeOMdVp3HfwfL6DuW7nHtE
X-Gm-Gg: Acq92OFHfArOE7adBocEGrRmFYuIIypk2+m1jmOauIcSKqGGMkdApruq37i++y+MQXp
	9nal2ihOf18YN20DiUibGaoejoAhaEivjS3l2Oav1wYFUW3Vvh+6+1L49zokveqnnDU9u5XTY0c
	XtZTFHD5HvC+W4b6GmQvAPafuGYj43yXWwZwBSWZg83De4BnwoZoygnHThuuAjySY6Fa1feWiQX
	PvIWfN2GjiFKBpNx0qON4m8O9mXil+NbeQO7fNa2Pg4x5Ocv3Lub6pn2dK/WiAFMM43haB0ugvH
	HGXHpWLwO2p75xwT
X-Received: by 2002:a53:ee87:0:b0:660:62e5:92ce with SMTP id
 956f58d0204a3-660dc5921b2mr5769663d50.47.1780583363801; Thu, 04 Jun 2026
 07:29:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260603072932.1273938-1-m-shah@ti.com> <20260603072932.1273938-2-m-shah@ti.com>
 <CADL8D3aFJLbtWr3wCNwsFCMj3UO9XNS5niZL+Uj7hPmHXbd6Yg@mail.gmail.com> <1febb3a5-4e8c-41b2-912d-a97a9571b567@ti.com>
In-Reply-To: <1febb3a5-4e8c-41b2-912d-a97a9571b567@ti.com>
From: Jon Cormier <jcormier@criticallink.com>
Date: Thu, 4 Jun 2026 10:29:12 -0400
X-Gm-Features: AVHnY4Iq8dSwBRjk5F4sloJc77yNKZI5Lo5it7DvoRHWdYnRwETWy9nbEy-8W-E
Message-ID: <CADL8D3ZFm86LVACdHAobFhRK6K2yNc=5Girm5RrCew6XqcJ93Q@mail.gmail.com>
Subject: Re: [meta-ti][master/wrynose][PATCH v2 1/2] k3.inc: Add CPSW modules
 to initramfs for bsp-next NFS boot
To: Moteen Shah <m-shah@ti.com>
Cc: meta-ti@lists.yoctoproject.org, reatmon@ti.com, nm@ti.com, u-kumar1@ti.com, 
	s-vadapalli@ti.com, a-limaye@ti.com, gehariprasath@ti.com, denys@konsulko.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 04 Jun 2026 14:29:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19973

On Thu, Jun 4, 2026 at 1:59=E2=80=AFAM Moteen Shah <m-shah@ti.com> wrote:
>
> Hey Jon,
>
> On 03/06/26 19:55, Jon Cormier wrote:
> >
> >
> > On Wed, Jun 3, 2026 at 3:30=E2=80=AFAM Moteen Shah via lists.yoctoproje=
ct.org
> > <http://lists.yoctoproject.org> <m-shah=3Dti.com@lists.yoctoproject.org=
>
> > wrote:
> >
> >     AM65_CPSW_NUSS and its dependencies changed from built-in to loadab=
le
> >     modules in linux-next. Add them to TI_CORE_INITRAMFS_KERNEL_MODULES=
 so
> >     NFS boot continues to work on K3 platforms with the bsp-next kernel=
.
> >
> >     Signed-off-by: Moteen Shah <m-shah@ti.com>
> >     ---
> >      meta-ti-bsp/conf/machine/include/k3.inc | 6 ++++++
> >      1 file changed, 6 insertions(+)
> >
> >     diff --git a/meta-ti-bsp/conf/machine/include/k3.inc
> >     b/meta-ti-bsp/conf/machine/include/k3.inc
> >     index 6833789c..726c071f 100644
> >     --- a/meta-ti-bsp/conf/machine/include/k3.inc
> >     +++ b/meta-ti-bsp/conf/machine/include/k3.inc
> >     @@ -61,3 +61,9 @@ FALCON_INCLUDE =3D ""
> >      FALCON_INCLUDE:ti-falcon =3D "conf/machine/include/ti-falcon.inc"
> >
> >      require ${FALCON_INCLUDE}
> >     +
> >     +# AM65_CPSW_NUSS and its direct Kconfig dependencies became
> >     loadable modules
> >     +# in linux-next (post 7.1). Include them in the initramfs so NFS
> >     boot works.
> >     +# TI staging kernels (6.6/6.12/6.18) still have CPSW built-in (=3D=
y).
> >     +
> >     +TI_CORE_INITRAMFS_KERNEL_MODULES:append:bsp-next =3D "
> >     kernel-module-ti-am65-cpsw-nuss kernel-module-k3-cppi-desc-pool
> >     kernel-module-davinci-mdio kernel-module-ti-cpsw-ale
> >     kernel-module-ti-cpsw-sl kernel-module-phylink
> >     kernel-module-mdio-bitbang kernel-module-phy-gmii-sel"
> >
> > Is there any way to link the inclusion of these kernel modules to the
> > inclusion of the net boot recipe?  If we don't need NFS boot support,
> > how much larger does this make the initramfs? Just a thought.
>
> I am seeing a size increase of 1MB in the uncompressed .cpio(88MBs ->
> 89MB's), I will look into the selective inclusion of the modules once,
> but I do thing it is necessary feature to have since the kernel is
> moving towards making those drivers m and we will need it as a part of
> base package.
Understood. At the least, knowing how much this increases the size is
helpful and might be worth putting in the commit message.
>
> Regards,
> Moteen
> >
> >     --
> >     2.34.1
> >
> >
> >     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >     Links: You receive all messages sent to this group.
> >     View/Reply Online (#19959):
> >     https://lists.yoctoproject.org/g/meta-ti/message/19959
> >     Mute This Topic: https://lists.yoctoproject.org/mt/119625158/790262=
1
> >     Group Owner: meta-ti+owner@lists.yoctoproject.org
> >     <mailto:meta-ti%2Bowner@lists.yoctoproject.org>
> >     Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub
> >     [jcormier@criticallink.com]
> >     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
> >
> >
> > --
> > Jonathan Cormier
> > Senior Software Engineer
> >
> > Office:  315.425.4045 x222
> >
> > http://www.CriticalLink.com <http://www.criticallink.com/>
> > 6712 Brooklawn Parkway, Syracuse, NY 13211
> >



--=20
Jonathan Cormier
Senior Software Engineer

Office:  315.425.4045 x222

http://www.CriticalLink.com
6712 Brooklawn Parkway, Syracuse, NY 13211

