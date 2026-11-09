Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7393.1794235010228365170
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 Nov 2026 06:36:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticallink.com header.s=google header.b=RunNsfYU;
 spf=pass (domain: criticallink.com, ip: 209.85.128.180, mailfrom: jcormier@criticallink.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b308fca7c3so7618807b3.2
        for <meta-ti@lists.yoctoproject.org>; Mon, 09 Nov 2026 06:36:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794235009; cv=none;
        d=google.com; s=arc-20260327;
        b=A/Dul6+hR+M7U7WtJrfhD8oa8cGlYeVBDuPnyU8CQCRo11hbx4qZyJ8jSJTsPfq04S
         b+aEOX5MIISy+L4Z+MHVFlzvusR8OH7a6aQUtQSyOpS3TfyapCXlMTRWQg+u+QgHdhdK
         fVW8499wSdioncp2HKo6GMYwNo6b5NnjoPcC9MtYvURTil2Ik4lCH+A3H4+CNclxebp4
         FqkC1dF841dnpz4y8ioB/mP2K9VSR6Yp255w6JtqlH7A8XTJKJea05T9wKNwbiwuCOUj
         p1tcZrwba+QRFZv4qAjXMEAutYFxY+idmN5a5vH19zt2vwZpfJA4QMPLAiZcHnizTu2v
         d8ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iggmK/D0B4K9iCT+9opQ9L/UXi40t7VLurXDmS3aPJk=;
        fh=Suz7L95+mQStYD07YjnTxJ+U9Cm+iwpIHFYn6+QxTGE=;
        b=jNABjgZ1rCxZl5CKSrExR2EexEdlTPx/bDNOAs3z97t5c8I/8orH35cP3KAsP0qY7C
         FHiAxbcLSXVkcutQ36+DT5wGHSKIILYj+nYIsY52XMzEqX6G9ZIHxrva/Se6UKXC/mG2
         gWlOhZXlPMNxyituwust1KQnEUcoLlcIL73HsJpacQYwSLPBjzx9yyY7/14qm9zXMdOE
         KxnK8sNKIxNTMHVt8iCUMYwahZXmrJ4I5Nq3Ml1IzUfmuZktwpljwFQObd0fcZAmJguT
         3HsbPzfKnOH1gfkSdrqKTX3mRjbYqQagHquMGBvQF/OkyN02irlYeMjPBfN2TUXC115A
         uGZg==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1794235009; x=1794839809; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iggmK/D0B4K9iCT+9opQ9L/UXi40t7VLurXDmS3aPJk=;
        b=RunNsfYUgy7JH42PM47WcgKym7TON3e7KMt234PBBjCYp9HKaCUqBrEMHw86FKZtFl
         oxBKrxLqLA7OSpwdActZ08VNddjEdEhj4whn8Wab/YMSNGlslhnHDgxaZPE6h2ueKE5P
         7lgS3sMlvTI50VC9X8jLmBtcoK+CGfP4PG1CQ/qFt+9MCQBZGHNNczbFHFl8c15jXkNw
         CG6dWAtrcdBSBLjpMIcznpfulh8oStrVfzP8wYcX4R5bdG08N0XP6ibIL5Ms2hnt4Sx/
         /bq8ydZgxdJd/jMT/8r6EGcgCY41ImWxdF1m8xIKblsb5K+PJQcF2YmuXVUl7O/XF4Yr
         VBwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794235009; x=1794839809;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iggmK/D0B4K9iCT+9opQ9L/UXi40t7VLurXDmS3aPJk=;
        b=ize9fRn28+nMC0XVIADSvT45oOg/URDo6F3BLwdVhg3G41il5U+MNytb6PxqYaCoP+
         G/sKZ82e1HM7IIt2VYhWcY6TQxKXnyMUVNJpNjYiNJew+StXiGum4/afDIyakhBdReba
         2qMKghHZ6PpNoZq+jLb2o6dKLuInnrmGKcuEMm3ADAGb6ATOf/6pKVbT5kiJQf6a38zM
         RJDDX9nO38F1+gwJup0qGJw9ayCLPlEEn2YJmw6Rv7U+Z7dipO27XmbrCD5HplnGO0ox
         3VsIQ1PNvDiUfyTQ29EPI0l6M3VArasDNsiJpfh8QUobwEapfxh9HH9cDPoNBWZz8UbT
         BYZg==
X-Forwarded-Encrypted: i=1; AL+hErGlE9x0ZS2X6JhrWoLECJJy6lIjSThl6f1yVMvCCzRWpmEFGIkUl+d2B0YcKITb/4+BjMsZMZVV@lists.yoctoproject.org
X-Gm-Message-State: APuU4Z9RR3yDbpIXiD/FwI0waSI0ProfMQbpfN3qYuM0OETtdhruXnzm
	f5aWcRYKtu/IuF9v2fqFMrqKdMG9URmFVr/Lm7yX4dzokhlC/Hk2m0mUs7Jp4UEAPUvIzn3ALY7
	cLOAaey8ZBAgX94cIurygh7+uyi+Pj5HxyBYX647u
X-Gm-Gg: AYBFou34R6BVUmAUot9LJi/7iewJV3mc5wYNpFJ2eECOy74FZFsFVl5bM6J0lQc6eTZ
	Xqhm6ynVZ1wPOnMbMxvbiuzPFFaRW1sbaVxe7pdugPdjPDJzTFP1em6CRQa/ddQyFDrmldyOD1z
	4CMlyIAH1lWAKJel4f5HUz5jDxIHsin5Q07ByggjIC/w3n7JrgUzZ+GQYyOOSHnge642/vGayYC
	0g6DDbhubemge70RmPRz4giSOSdwshialZZKY++PGqsNexJXHyPvereBjVEN7bs9ryZT8cule/x
	TMry57Sp4i0D4AzNLy8YBTFwPOr9zQ/TNawWVF0PTmnV7AZ8TASy2xi7NTeaiFSEwB2Pqy6w2jF
	ct1KsqzleZkQ7ge6aZWA1MGbWpcGmGiv0sXw=
X-Received: by 2002:a05:690e:1489:b0:67c:1a5a:5760 with SMTP id
 956f58d0204a3-67c3d964cc7mr2662438d50.22.1794235008814; Mon, 09 Nov 2026
 06:36:48 -0800 (PST)
MIME-Version: 1.0
References: <CAFMvBt0wRnyFses6F3WNhSmxzNP-GvTi5tY3DgKCbVRTfMVcDA@mail.gmail.com>
 <20261105162117.GA4190@denix.org> <CAFMvBt1XU-uvKWzMN3o48BeqHZmUEGaXQNkquRzn=+GMa9PbEQ@mail.gmail.com>
In-Reply-To: <CAFMvBt1XU-uvKWzMN3o48BeqHZmUEGaXQNkquRzn=+GMa9PbEQ@mail.gmail.com>
From: Jon Cormier <jcormier@criticallink.com>
Date: Mon, 9 Nov 2026 09:36:34 -0500
X-Gm-Features: AclHuK8eZ3MFM6b5aGfhmyO4Gj9_R-jXvaPu3wl13CeB7AW4s1ImU8IjU_cBBAY
Message-ID: <CADL8D3Z4tjfUmWPBGTMip8w14HvG3yuobUCHQ2gh_nvgTpLPPg@mail.gmail.com>
Subject: Re: [meta-ti] Unable to clone or fetch from git.ti.com
To: troth@openavr.org
Cc: Denys Dmytriyenko <denis@denix.org>, meta-ti@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Mon, 09 Nov 2026 14:36:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20513

On Mon, Nov 9, 2026 at 9:00=E2=80=AFAM Theodore A. Roth via meta-ti
<troth=3Dopenavr.org@lists.yoctoproject.org> wrote:
>
> Thanks for the response Denys!
>
> On Thu, Nov 5, 2026 at 9:21=E2=80=AFAM Denys Dmytriyenko <denis@denix.org=
> wrote:
> >
> > Yes, git.ti.com is periodically under heavy AI bot crawlers attack and
> > sometimes goes down.
> >
> > But meta-ti-bsp already sets up MIRRORS to point to github, where TI co=
re
> > repos, like kernel and u-boot, are mirrored. This works for most users
> > automatically and doesn't break.
> >
> > The error you are seeing is because you heve your own PREMIRRORS (e.g. =
using
> > own-mirrors.bbclass), which contains an older clones of those repos and=
 hence
> > bitbake tries to use those, instead of falling back to MIRRORS, and can=
't find
> > the required SRCREV:
> >
> > | Error: UnpackError('No up to date source found: clone directory not a=
vailable or not up to date:
> > | /home/troth/Yocto/Downloads/git2/git.ti.com.git.ti-linux-kernel.ti-li=
nux-kernel.git
>
> I'm not using PREMIRRORS in this setup. That clone directory is in my
> DL_DIR which I share
> across multiple builds.
>
> I have found that the MIRRORS setup by meta-ti-bsp do not get used
> until I manually
> removed the primary git repo from my DL_DIR. Only then did bitbake
> fetch from the
> github mirror and created the following symlink:
>
>     git.ti.com.git.ti-linux-kernel.ti-linux-kernel.git ->
> ${DL_DIR}/git2/github.com.TexasInstruments.ti-linux-kernel.git/
>
> Doubt that this is a meta-ti issue though. Bug in bitbake? Don't know,
> have not dug into it yet.
>
> >
> >
> > You can disable your PREMIRRORS temporarily and re-fetch affected compo=
nents,
> > then you can re-enable it back.
>
> I agree in theory, but I'm finding it impossible to sync up my local
> DL_DIR cache because
> all fetches from https://git.ti.com/git/*/*.git fail for me
>
> I was able to clone ti-u-boot using
> 'https://git.ti.com/cgit/ti-u-boot/ti-u-boot', but that did not
> work for the kernel:
>
>     $ git clone https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel
>     Cloning into 'ti-linux-kernel'...
>     fatal: unable to access
> 'https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/': The
> requested URL returned error: 403
>
> >
> > Please note that there are a few other TI repos, mostly used in meta-ti=
-extras
> > and meta-ti-tests, which are not mirrored on github, but they haven't b=
een
> > updated in a while, so your existing copies from your PREMIRRORS should=
 be
> > fine.
>
> I'm seeing the same issues when bitbaking with the following repos
> from meta-ti-bsp
> (which do not have github mirrors; note that this is after I manually
> updated u-boot and kernel):
>
> Summary: 6 tasks failed:
>   $MYBUILDDIR/build-hs-prod/../oe/meta-ti/meta-ti-bsp/recipes-bsp/pruhsr-=
fw/pruhsr-fw_2.17.25.bb:do_unpack
>     log: $MYBUILDDIR/build-hs-prod/tmp/work/armv7at2hf-neon-trimble-linux=
-gnueabi/pruhsr-fw/2022.01/temp/log.do_unpack.1887083
>   $MYBUILDDIR/build-hs-prod/../oe/meta-ti/meta-ti-bsp/recipes-bsp/goodix-=
fw/goodix-fw_git.bb:do_unpack
>     log: $MYBUILDDIR/build-hs-prod/tmp/work/armv7at2hf-neon-trimble-linux=
-gnueabi/goodix-fw/1.0.0.0/temp/log.do_unpack.1887084
>   $MYBUILDDIR/build-hs-prod/../oe/meta-ti/meta-ti-bsp/recipes-bsp/prueth-=
fw/prueth-fw_5.6.15.bb:do_unpack
>     log: $MYBUILDDIR/build-hs-prod/tmp/work/armv7at2hf-neon-trimble-linux=
-gnueabi/prueth-fw/2022.01/temp/log.do_unpack.1887085
>   $MYBUILDDIR/build-hs-prod/../oe/meta-ti/meta-ti-bsp/recipes-bsp/pruprp-=
fw/pruprp-fw_2.17.25.bb:do_unpack
>     log: $MYBUILDDIR/build-hs-prod/tmp/work/armv7at2hf-neon-trimble-linux=
-gnueabi/pruprp-fw/2022.01/temp/log.do_unpack.1887086
>   $MYBUILDDIR/build-hs-prod/../oe/meta-ti/meta-ti-bsp/recipes-bsp/prusw-f=
w/prusw-fw_3.2.9.bb:do_unpack
>     log: $MYBUILDDIR/build-hs-prod/tmp/work/armv7at2hf-neon-trimble-linux=
-gnueabi/prusw-fw/2022.01/temp/log.do_unpack.1887087
>   $MYBUILDDIR/build-hs-prod/../oe/meta-ti/meta-ti-bsp/recipes-bsp/ti-rtos=
-fw/ti-rtos-messageq-test-fw_git.bb:do_unpack
>     log: $MYBUILDDIR/build-hs-prod/tmp/work/armv7at2hf-neon-trimble-linux=
-gnueabi/ti-rtos-messageq-test-fw/3.52.00.01/temp/log.do_unpack.1887124
> Summary: There were 6 ERROR messages, returning a non-zero exit code.
>
> Unfortunately, git.ti.com is unusable for me right now (and it sounds
> like it is for others too).
>
> Is this really an overloaded server (due to AI crawlers) or some
> problem on the server?
I agree, from my poking around it seems like they've changed  QOS
settings or similar to try and block the bots and have accidentally
broken git clones.

  - Listing branches works. git ls-remote returns all 2164 refs.
  - Full clone fails: error: RPC failed; HTTP 501 curl 22 / fatal:
expected 'packfile'.
  - Shallow clone works: --depth 1 -b master completes with both
protocol v0 and v2.
  - Compression seems to trip it up. Sending smal request with curl
with Content-Encoding: gzip gets 501. Uncompressed requests get 200,
even with 2000 wants (93 KB), and so do requests sent in chunks.

The full clone pulls a lot more data and git seems to auto gzip its
requests when they are over a certain size.


Via AI wizardry, Apparently you can limit the size of git requests,
which does let the clone complete, albeit slowly. Don't go below 65520
as that crashes git (BUG: remote-curl.c:1531)....

git -c http.postBuffer=3D65537 clone
https://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git

Note I really don't think this is a reasonable workaround, and I don't
understand why they would block gzip so either its unintentional or
the diagnosis is wrong. Adding this to a yocto config would presumably
disable gzip compression on all git fetches so not great.
>
> FYI: I'm trying to update our OS builds to the latest HEAD of wrynose,
> so I'm keen to
> find some solution that doesn't require manually tweaking things for
> every developer
> and our CI system.
Same
>
> Thanks.
>
> Ted Roth
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#20512): https://lists.yoctoproject.org/g/meta-ti/mess=
age/20512
> Mute This Topic: https://lists.yoctoproject.org/mt/122110829/7902621
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
